#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

python3 - "$ROOT" <<'PY'
import json
import re
import subprocess
import sys
from pathlib import Path

root = Path(sys.argv[1])
paths = subprocess.check_output(
    ["git", "ls-files", "-co", "--exclude-standard"], text=True
).splitlines()
files = [root / p for p in paths]
failures = []
warnings = []

for rel in paths:
    if not (root / rel).exists():
        continue
    parts = Path(rel).parts
    if any(part == ".git" for part in parts):
        failures.append(f"nested Git metadata: {rel}")
    if parts[:2] in [("10-repositories", "active"), ("10-repositories", "runway"), ("10-repositories", "legacy")]:
        failures.append(f"excluded repository tree: {rel}")
    if Path(rel).suffix.lower() in {".pdf", ".epub", ".pem", ".key", ".p12", ".pfx", ".sqlite", ".sqlite3", ".db", ".dump", ".bak", ".zip"}:
        failures.append(f"prohibited candidate file type: {rel}")
    if any(token in Path(rel).name.lower() for token in ("credential", "secret", "private-key")):
        failures.append(f"secret-sensitive filename: {rel}")

    if not rel.endswith((".md", ".dsl", ".yml", ".yaml", ".json", ".sh", ".gitignore", "AGENTS.md")):
        continue
    try:
        text = (root / rel).read_text(encoding="utf-8")
    except UnicodeDecodeError:
        failures.append(f"non-text authored file requires review: {rel}")
        continue

    for bad in ("/" + "Users/", "/" + "Volumes/", "/" + "private/", "file:" + "//"):
        if bad in text:
            failures.append(f"machine-local path {bad!r}: {rel}")
    if "structurizr/structurizr:" + "latest" in text:
        failures.append(f"unpinned Structurizr image: {rel}")

    secret_patterns = [
        r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----",
        r"\bAKIA[0-9A-Z]{16}\b",
        r"\bgh[pousr]_[A-Za-z0-9_]{ twenty,}\b".replace("{ twenty,}", "{20,}"),
        r"\b(?:xox[baprs]-)[A-Za-z0-9-]{20,}\b",
        r"(?i)\b(?:password|passwd|secret|api[_-]?key|access[_-]?token)\s*[:=]\s*[\"'][^\"']{12,}[\"']",
    ]
    for pattern in secret_patterns:
        if re.search(pattern, text):
            failures.append(f"secret-like content: {rel}")
            break

    if rel.endswith(".md") and text.startswith("---\n"):
        end = text.find("\n---\n", 4)
        if end < 0:
            failures.append(f"unterminated frontmatter: {rel}")
        else:
            front = text[4:end]
            values = {}
            for line in front.splitlines():
                if ":" in line and not line.startswith(" "):
                    key, value = line.split(":", 1)
                    values[key.strip()] = value.strip()
            required = {"status", "scope", "owner", "last-reviewed"}
            missing = required - values.keys()
            if missing:
                failures.append(f"frontmatter missing {sorted(missing)}: {rel}")
            if "status" in values and values["status"] not in {"accepted", "draft", "planned", "reference", "deprecated"}:
                failures.append(f"invalid status {values['status']!r}: {rel}")
            if "scope" in values and values["scope"] not in {"v1", "runway", "v2", "cross-cutting"}:
                failures.append(f"invalid scope {values['scope']!r}: {rel}")
            if "maturity" in values and values["maturity"] not in {
                "NOT STARTED", "DISCOVERY", "DRAFT", "BASELINED", "FROZEN", "BLOCKED",
                "SUPERSEDED", "HISTORICAL", "VERIFIED", "CLOSED WITH CAVEAT", "NOT DEFINED",
            }:
                failures.append(f"invalid maturity {values['maturity']!r}: {rel}")

    if rel.endswith(".md"):
        for match in re.finditer(r"\[[^\]]+\]\(([^)]+)\)", text):
            target = match.group(1).strip().strip("<>")
            if not target or target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            target = target.split("#", 1)[0].split("?", 1)[0]
            candidate = (root / Path(rel).parent / target).resolve()
            if not candidate.exists() or (root not in candidate.parents and candidate != root):
                failures.append(f"broken relative Markdown link {target!r}: {rel}")

c4 = root / "03-system/c4/structurizr/workspace.json"
try:
    workspace = json.loads(c4.read_text(encoding="utf-8"))
    views = workspace["views"]
    actual_views = sorted(
        [v["key"] for v in views.get("systemContextViews", [])]
        + [v["key"] for v in views.get("containerViews", [])]
        + [v["key"] for v in views.get("componentViews", [])]
    )
    expected_views = sorted([
        "Nexa-SystemContext-V1", "Nexa-Containers-V1",
        "Nexa-SystemContext-Runway", "Nexa-Containers-Runway",
        "Nexa-API-Overall-ASIS", "Nexa-API-IdentityTenantCustomer-TARGET",
        "Nexa-API-CommercialInventory-TARGET", "Nexa-API-FulfillmentDelivery-TARGET",
        "Nexa-API-CreditPaymentDocuments-TARGET", "Nexa-API-IntegrationReliability-ASIS",
        "Nexa-Platform-Frontend-TARGET", "Nexa-Portal-Frontend-TARGET",
    ])
    if actual_views != expected_views:
        failures.append(f"unexpected C4 views: {actual_views}")
    if any(k.lower().startswith("deployment") for k in views):
        failures.append("C4 deployment views present")
    system = next(s for s in workspace["model"]["softwareSystems"] if s["name"] == "Nexa")
    v1 = {c["name"] for c in system["containers"] if "Future" not in c.get("tags", "") and "V2/Future" not in c.get("tags", "")}
    expected_containers = {
        "Public Website", "Internal Web Platform", "Buyer Portal",
        "Nexa Application API", "PostgreSQL Database", "Object Storage",
    }
    if v1 != expected_containers:
        failures.append(f"unexpected V1 C4 containers: {sorted(v1)}")
except Exception as exc:
    failures.append(f"workspace.json inspection failed: {exc}")

if failures:
    print("BLUEPRINT VALIDATION: FAIL")
    for item in failures:
        print(f"- {item}")
    sys.exit(1)
print("BLUEPRINT VALIDATION: PASS")
print(f"- candidate files inspected: {len(paths)}")
print("- links, metadata, publication boundary, secret heuristics and C4 workspace: PASS")
PY

docker run --rm \
  -v "$ROOT/03-system/c4/structurizr:/usr/local/structurizr:ro" \
  structurizr/structurizr:2026.06.28 validate \
  -workspace /usr/local/structurizr/workspace.dsl

echo "STRUCTURIZR DSL VALIDATION: PASS"

GENERATED_DIR="$(mktemp -d)"
# Docker image writes generated JSON as its container user; grant access only to
# this ephemeral validation directory.
chmod 777 "$GENERATED_DIR"
docker run --rm \
  -v "$ROOT/03-system/c4/structurizr:/usr/local/structurizr:ro" \
  -v "$GENERATED_DIR:/generated" \
  structurizr/structurizr:2026.06.28 export \
  -workspace /usr/local/structurizr/workspace.dsl \
  -format json \
  -output /generated

python3 tooling/scripts/compare-structurizr-semantic.py \
  "$GENERATED_DIR/workspace.json" \
  "$ROOT/03-system/c4/structurizr/workspace.json"
