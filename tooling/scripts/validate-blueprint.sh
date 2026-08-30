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
existing_paths = [p for p in paths if (root / p).exists()]

academic_source_pattern = re.compile(
    r"(?:enunciado|original[-_]?rubric|course[-_]?source|source[-_]?statement)",
    re.IGNORECASE,
)
academic_paths = set(path for path in paths if path.startswith("90-academic/"))
academic_paths.update(
    str(path.relative_to(root))
    for path in (root / "90-academic").rglob("*")
    if path.is_file()
)
for path in sorted(academic_paths):
    name = Path(path).name
    if academic_source_pattern.search(name) and Path(path).suffix.lower() not in {".pdf", ".epub"}:
        failures.append(f"academic source-like artifact must remain local-only: {path}")
    if path in paths and Path(path).suffix.lower() in {".pdf", ".epub"}:
        failures.append(f"academic source/rubric binary must not be present: {path}")
try:
    origin_main = subprocess.run(
        ["git", "rev-parse", "--verify", "origin/main"],
        cwd=root,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    if origin_main.returncode == 0 and subprocess.run(
        ["git", "diff", "--quiet", "origin/main...HEAD", "--", "AGENTS.md"],
        cwd=root,
    ).returncode != 0:
        failures.append("AGENTS.md has a committed PR diff; owner-local guidance must remain uncommitted")
    elif origin_main.returncode != 0:
        warnings.append("origin/main is unavailable in this checkout; committed AGENTS.md diff check skipped")
except Exception as exc:
    failures.append(f"could not verify committed AGENTS.md diff: {exc}")

required_roots = {"00-start-here", "01-shared", "02-web", "03-mobile", "04-delivery", "90-academic", "91-reference", "tooling"}
missing_roots = sorted(name for name in required_roots if not (root / name).is_dir())
if missing_roots:
    failures.append(f"missing canonical roots: {missing_roots}")
for stale_root in ("01-product", "02-domain", "03-system", "04-web", "05-mobile", "06-delivery", "07-engineering", "08-operations"):
    if (root / stale_root).exists():
        failures.append(f"stale conceptual root remains: {stale_root}")

tracked_dirs = {str(Path(rel).parent) for rel in existing_paths if "/" in rel}
for directory in sorted(tracked_dirs):
    if directory.startswith((".git", "10-repositories", "11-reference")):
        continue
    if not any(rel.startswith(directory + "/") for rel in existing_paths):
        failures.append(f"empty canonical directory: {directory}")

for directory in root.rglob("*"):
    if directory.is_dir() and ".git" not in directory.parts and not any(directory.iterdir()):
        if directory.relative_to(root).parts and directory.relative_to(root).parts[0] == ".tmp":
            continue
        failures.append(f"empty filesystem directory: {directory.relative_to(root)}")

for duplicate in (
    "01-shared/domain/strategic-ddd-index.md",
    "01-shared/domain/bounded-contexts/canonical-catalog.md",
    "01-shared/domain/bounded-contexts/canonical-canvases.md",
    "01-shared/architecture/c4/level-1-system-context.md",
    "01-shared/architecture/c4/level-2-containers.md",
):
    if (root / duplicate).exists():
        failures.append(f"duplicate or generated canonical path remains: {duplicate}")

expected_c4_files = [
    "01-shared/architecture/c4/structurizr/workspace.dsl",
    "01-shared/architecture/c4/structurizr/model/people.dsl",
    "01-shared/architecture/c4/structurizr/model/systems.dsl",
    "01-shared/architecture/c4/structurizr/model/containers.dsl",
    "01-shared/architecture/c4/structurizr/model/components.dsl",
    "01-shared/architecture/c4/structurizr/model/relationships.dsl",
    "01-shared/architecture/c4/structurizr/model/deployment.dsl",
    "01-shared/architecture/c4/structurizr/l1/l1.dsl",
    "01-shared/architecture/c4/structurizr/l2/l2.dsl",
    "01-shared/architecture/c4/structurizr/l3/api.dsl",
    "01-shared/architecture/c4/structurizr/l3/platform.dsl",
    "01-shared/architecture/c4/structurizr/l3/portal.dsl",
    "01-shared/architecture/c4/structurizr/l3/website.dsl",
    "01-shared/architecture/c4/structurizr/l3/operations-mobile.dsl",
    "01-shared/architecture/c4/structurizr/l3/buyer-mobile.dsl",
    "01-shared/architecture/c4/structurizr/deployment/deployment.dsl",
    "01-shared/architecture/c4/structurizr/styles/styles.dsl",
    "01-shared/architecture/c4/structurizr/generated/workspace.json",
]
for expected in expected_c4_files:
    if not (root / expected).is_file():
        failures.append(f"missing canonical C4 file: {expected}")

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

c4 = root / "01-shared/architecture/c4/structurizr/generated/workspace.json"
try:
    workspace = json.loads(c4.read_text(encoding="utf-8"))
    manual_workspace = root / "01-shared/architecture/c4/structurizr/workspace.json"
    if manual_workspace.exists():
        manual = json.loads(manual_workspace.read_text(encoding="utf-8"))
        if manual != workspace:
            failures.append("manual C4 workspace mirror differs from generated canonical representation")
    views = workspace["views"]
    actual_views = sorted(
        [v["key"] for v in views.get("systemContextViews", [])]
        + [v["key"] for v in views.get("containerViews", [])]
        + [v["key"] for v in views.get("componentViews", [])]
        + [v["key"] for v in views.get("deploymentViews", [])]
    )
    expected_views = sorted([
        "Nexa-SystemContext-ASIS", "Nexa-SystemContext-V1-TARGET",
        "Nexa-SystemContext-Future-Runway",
        "Nexa-Containers-ASIS", "Nexa-Containers-V1-TARGET",
        "Nexa-Deployment-Local-ASIS", "Nexa-Deployment-V1-TARGET",
        "Nexa-API-Overall-ASIS", "Nexa-API-IdentityTenantCustomer-TARGET",
        "Nexa-API-CommercialInventory-TARGET", "Nexa-API-FulfillmentDelivery-TARGET",
        "Nexa-API-CreditPaymentDocuments-TARGET", "Nexa-API-IntegrationReliability-ASIS",
        "Nexa-Platform-Frontend-TARGET", "Nexa-Portal-Frontend-TARGET",
        "Nexa-Website-Frontend-ASIS", "Nexa-Operations-Mobile-TARGET",
        "Nexa-Buyer-Mobile-TARGET",
    ])
    if actual_views != expected_views:
        failures.append(f"unexpected C4 views: {actual_views}")
    system = next(s for s in workspace["model"]["softwareSystems"] if s["name"] == "Nexa")
    as_is = {c["name"] for c in system["containers"] if "PLANNED" not in c.get("tags", "") and "PROPOSED" not in c.get("tags", "")}
    expected_as_is = {
        "Nexa Website", "Nexa Platform", "Nexa Buyer Portal",
        "Nexa API", "PostgreSQL", "Object Storage",
    }
    if as_is != expected_as_is:
        failures.append(f"unexpected AS-IS C4 containers: {sorted(as_is)}")
    target = {c["name"] for c in system["containers"]}
    expected_target = expected_as_is | {"Nexa Operations Mobile", "Nexa Buyer Mobile"}
    if target != expected_target:
        failures.append(f"unexpected V1 TARGET C4 containers: {sorted(target)}")
    planned_mobile = {
        c["name"] for c in system["containers"]
        if "TARGET V1" in c.get("tags", "")
        and "PLANNED" in c.get("tags", "")
        and "PROPOSED" in c.get("tags", "")
    }
    if planned_mobile != {"Nexa Operations Mobile", "Nexa Buyer Mobile"}:
        failures.append(f"Mobile TARGET containers must remain planned projections: {sorted(planned_mobile)}")
except Exception as exc:
    failures.append(f"workspace.json inspection failed: {exc}")

bc_root = root / "01-shared/domain/bounded-contexts"
bc_dirs = sorted(p.name for p in bc_root.iterdir() if p.is_dir() and p.name.startswith("BC-"))
if len(bc_dirs) != 11:
    failures.append(f"expected exactly 11 Bounded Context directories, found {len(bc_dirs)}")

event_file = root / "01-shared/domain/events/published-events.md"
published_events = re.findall(r"^\| `[^`]+\.v1` \|", event_file.read_text(encoding="utf-8"), re.MULTILINE)
if len(published_events) != 14:
    failures.append(f"expected 14 Published Integration Events, found {len(published_events)}")

adr_count = len(list((root / "01-shared/architecture/decisions/adr").glob("adr-*.md")))
if adr_count != 17:
    failures.append(f"expected 17 ADRs, found {adr_count}")

web_requirements = "\n".join(
    p.read_text(encoding="utf-8")
    for p in (root / "02-web/requirements/user-stories").glob("*.md")
)
web_story_ids = re.findall(r"^## (WEB-US-\d{3}) —", web_requirements, re.MULTILINE)
expected_web_story_ids = [f"WEB-US-{i:03d}" for i in range(1, 134)]
if len(web_story_ids) != len(set(web_story_ids)):
    failures.append("Web catalog contains duplicated User Story IDs")
if sorted(web_story_ids, key=lambda item: int(item[-3:])) != expected_web_story_ids:
    failures.append(f"Web catalog is not the contiguous WEB-US-001..WEB-US-133 set: {web_story_ids}")

web_epic_ids = re.findall(r"^# (WEB-EPIC-\d{2}) —", web_requirements, re.MULTILINE)
expected_web_epic_ids = [f"WEB-EPIC-{i:02d}" for i in range(1, 16)]
if sorted(web_epic_ids, key=lambda item: int(item[-2:])) != expected_web_epic_ids:
    failures.append(f"Web catalog is not the contiguous 15-Epic set: {web_epic_ids}")

mobile_requirements = "\n".join(
    p.read_text(encoding="utf-8") for p in (root / "03-mobile/requirements").rglob("*.md")
)
mobile_story_ids = re.findall(r"^## (MOB-US-\d{3}) —", mobile_requirements, re.MULTILINE)
expected_mobile_story_ids = [f"MOB-US-{i:03d}" for i in range(1, 74)]
if len(mobile_story_ids) != len(set(mobile_story_ids)):
    failures.append("Mobile catalog contains duplicated User Story IDs")
if sorted(mobile_story_ids, key=lambda item: int(item[-3:])) != expected_mobile_story_ids:
    failures.append(f"Mobile catalog is not the contiguous MOB-US-001..MOB-US-073 set: {mobile_story_ids}")

mobile_epic_index = (root / "03-mobile/requirements/epics/README.md").read_text(encoding="utf-8")
mobile_epic_ids = re.findall(r"^\| (MOBILE-EPIC-\d{2}) \|", mobile_epic_index, re.MULTILINE)
expected_mobile_epic_ids = [f"MOBILE-EPIC-{i:02d}" for i in range(1, 13)]
if sorted(mobile_epic_ids, key=lambda item: int(item[-2:])) != expected_mobile_epic_ids:
    failures.append(f"Mobile catalog is not the contiguous 12-Epic set: {mobile_epic_ids}")

mobile_catalog_path = root / "03-mobile/requirements/mobile-v1-catalog.md"
mobile_catalog = mobile_catalog_path.read_text(encoding="utf-8")
mobile_catalog_blocks = {
    match.group(1): match.group(0)
    for match in re.finditer(
        r"^## (MOB-US-\d{3}) — .*?(?=^## MOB-US-|\Z)",
        mobile_catalog,
        re.MULTILINE | re.DOTALL,
    )
}
mobile_v1_ids = {
    "MOB-US-001", "MOB-US-002", "MOB-US-003",
    "MOB-US-011", "MOB-US-012", "MOB-US-013", "MOB-US-014",
    "MOB-US-015", "MOB-US-016", "MOB-US-017", "MOB-US-019",
    "MOB-US-020", "MOB-US-021", "MOB-US-022", "MOB-US-023",
    "MOB-US-024", "MOB-US-025", "MOB-US-026", "MOB-US-027",
    "MOB-US-028", "MOB-US-031", "MOB-US-032", "MOB-US-033",
    "MOB-US-034", "MOB-US-044", "MOB-US-047", "MOB-US-048",
    "MOB-US-049",
}
mobile_all_ids = {f"MOB-US-{i:03d}" for i in range(1, 74)}
if set(mobile_catalog_blocks) != mobile_all_ids:
    failures.append(f"Mobile canonical catalog must contain exactly MOB-US-001..073: found {len(mobile_catalog_blocks)}")
for story_id, block in mobile_catalog_blocks.items():
    status = re.search(r"^\| Status \|\s*([^|]+?)\s*\|$", block, re.MULTILINE)
    status_value = status.group(1).strip() if status else ""
    if story_id in mobile_v1_ids and status_value != "PLANNED":
        failures.append(f"Mobile V1 story must remain PLANNED: {story_id}")
    if story_id not in mobile_v1_ids and status_value not in {"DEFERRED", "PLANNED"}:
        failures.append(f"Mobile non-V1 story has invalid baseline status: {story_id}")
mobile_epic_map = {
    "MOBILE-EPIC-01": {"MOB-US-001", "MOB-US-002", "MOB-US-003"},
    "MOBILE-EPIC-02": {"MOB-US-011", "MOB-US-012", "MOB-US-013", "MOB-US-014", "MOB-US-015", "MOB-US-016", "MOB-US-017", "MOB-US-019"},
    "MOBILE-EPIC-03": {"MOB-US-020", "MOB-US-021", "MOB-US-022", "MOB-US-023", "MOB-US-024", "MOB-US-025"},
    "MOBILE-EPIC-04": {"MOB-US-026", "MOB-US-027", "MOB-US-028", "MOB-US-031", "MOB-US-032", "MOB-US-033", "MOB-US-034"},
    "MOBILE-EPIC-05": {"MOB-US-044", "MOB-US-047", "MOB-US-048", "MOB-US-049"},
    "MOBILE-EPIC-06": {"MOB-US-004", "MOB-US-005", "MOB-US-006", "MOB-US-007", "MOB-US-008", "MOB-US-009", "MOB-US-010", "MOB-US-036", "MOB-US-037", "MOB-US-038", "MOB-US-039", "MOB-US-040", "MOB-US-041", "MOB-US-042", "MOB-US-043"},
    "MOBILE-EPIC-07": {"MOB-US-018", "MOB-US-029", "MOB-US-030", "MOB-US-035", "MOB-US-045", "MOB-US-046"},
    "MOBILE-EPIC-08": {"MOB-US-050", "MOB-US-051", "MOB-US-052", "MOB-US-053", "MOB-US-054", "MOB-US-055", "MOB-US-056"},
    "MOBILE-EPIC-09": {"MOB-US-057", "MOB-US-058", "MOB-US-059", "MOB-US-060", "MOB-US-061", "MOB-US-062", "MOB-US-063", "MOB-US-064", "MOB-US-065", "MOB-US-066"},
    "MOBILE-EPIC-10": {"MOB-US-067", "MOB-US-068", "MOB-US-069"},
    "MOBILE-EPIC-11": {"MOB-US-070", "MOB-US-071", "MOB-US-072"},
    "MOBILE-EPIC-12": {"MOB-US-073"},
}
for story_id, block in mobile_catalog_blocks.items():
    epic_match = re.search(r"^\| Epic \|\s*(MOBILE-EPIC-\d{2})", block, re.MULTILINE)
    epic_id = epic_match.group(1) if epic_match else ""
    if story_id not in mobile_epic_map.get(epic_id, set()):
        failures.append(f"Mobile {story_id} has incorrect outcome Epic mapping")
    if story_id in mobile_v1_ids:
        functional = " ".join(
            value.group(1) for value in re.finditer(
                r"^\| (?:Title|Goal / Outcome) \|\s*(.*?)\s*\|$", block, re.MULTILINE
            )
        )
        if re.search(r"\b(?:api|http|endpoint|database|table|schema|ui|ux|screen|component|client|server|idempotenc\w*|synchron\w*|sync)\b", functional, re.IGNORECASE):
            failures.append(f"Mobile {story_id} functional fields contain engineering language")
    if story_id == "MOB-US-044" and "Push Subscription" in block:
        failures.append("MOB-US-044 must expose a human delivery-attention need, not Push Subscription")

def validate_story_blocks(label, text, prefix, mobile=False):
    blocks = list(re.finditer(
        rf"^## ({prefix}-\d{{3}}) — .*?(?=^## {prefix}-|\Z)",
        text,
        re.MULTILINE | re.DOTALL,
    ))
    required_fields = (
        "ID", "Status", "Product", "Surface", "Actor", "Epic",
        "Priority", "Title", "Owning Bounded Context",
    )
    internal_only_actors = {
        "Nexa Commercial & Onboarding Staff",
        "Company Owner",
        "Business Operations Manager",
        "Tenant Administrator",
        "Sales Representative",
        "Warehouse Operator",
        "Dispatch Coordinator",
        "Authorized Workforce Actor",
        "Authorized Commercial Actor",
        "Authorized Financial Actor",
        "Authorized Payment Actor",
        "Authorized Actor",
        "Privileged Actor",
    }
    for match in blocks:
        story_id, block = match.group(1), match.group(0)
        for field in required_fields:
            field_match = re.search(
                rf"^\| {re.escape(field)} \|\s*(.*?)\s*\|$",
                block,
                re.MULTILINE,
            )
            if not field_match or not field_match.group(1).strip():
                failures.append(f"{label} {story_id} missing required field: {field}")

        statement = re.search(
            r"^### User Story\s*\n\s*"
            r"As (?:a|an) .+?,\s*\n"
            r"I want .+?,\s*\n"
            r"so that .+?\s*$",
            block,
            re.MULTILINE,
        )
        if not statement:
            failures.append(f"{label} {story_id} missing complete User Story statement")
        if re.search(r"^As a Authorized\b", block, re.MULTILINE):
            failures.append(f"{label} {story_id} has invalid grammatical prefix: As a Authorized")

        if mobile:
            acceptance = re.search(
                r"^### Acceptance Criteria\s*\n(?P<criteria>.*?)(?=^## MOB-US-|\Z)",
                block,
                re.MULTILINE | re.DOTALL,
            )
            criteria_count = (
                len(re.findall(r"^- ", acceptance.group("criteria"), re.MULTILINE))
                if acceptance
                else 0
            )
            if story_id in mobile_v1_ids:
                if not acceptance or criteria_count < 4:
                    failures.append(f"Mobile V1 story requires four acceptance criteria: {story_id}")
            elif story_id == "MOB-US-073":
                if not re.search(r"^### Outcome Conditions\s*$", block, re.MULTILINE):
                    failures.append(f"Mobile V4/Future story requires outcome conditions: {story_id}")
            elif not acceptance or criteria_count < 2:
                failures.append(f"Mobile roadmap story requires at least two acceptance criteria: {story_id}")

        surface_match = re.search(r"^\| Surface \|\s*(.*?)\s*\|$", block, re.MULTILINE)
        actor_match = re.search(r"^\| Actor \|\s*(.*?)\s*\|$", block, re.MULTILINE)
        if surface_match and actor_match:
            surface = surface_match.group(1).strip()
            actor = actor_match.group(1).strip()
            if (
                not mobile
                and "Buyer Portal" in surface
                and actor in internal_only_actors
            ):
                failures.append(
                    f"{label} {story_id} assigns Buyer Portal to internal-only actor: {actor}"
                )

        if mobile and not re.search(
            r"^\| Research status \|\s*(?:NOT_REQUIRED|PENDING|RESEARCHING|VALIDATED)\s*\|$",
            block,
            re.MULTILINE,
        ):
            failures.append(f"Mobile story lacks a controlled research status: {story_id}")

validate_story_blocks("Web", web_requirements, "WEB")
validate_story_blocks("Mobile", mobile_requirements, "MOB-US", mobile=True)

technical_text = (root / "01-shared/product/requirements/technical-stories.md").read_text(encoding="utf-8")
technical_ids = re.findall(r"^## (TS-\d{3}) —", technical_text, re.MULTILINE)
expected_technical_ids = [f"TS-{i:03d}" for i in range(1, 21)]
if technical_ids != expected_technical_ids:
    failures.append(f"Technical catalog is not the contiguous TS-001..TS-020 set: {technical_ids}")

spike_text = (root / "01-shared/product/requirements/spike-stories.md").read_text(encoding="utf-8")
spike_ids = re.findall(r"^## (SPIKE-\d{3}) —", spike_text, re.MULTILINE)
expected_spike_ids = [f"SPIKE-{i:03d}" for i in range(1, 7)]
if spike_ids != expected_spike_ids:
    failures.append(f"Spike catalog is not the contiguous SPIKE-001..SPIKE-006 set: {spike_ids}")

total_items = len(web_story_ids) + len(mobile_story_ids) + len(technical_ids) + len(spike_ids)
if total_items <= 0:
    failures.append("requirement inventory is empty")

accepted_contexts = {
    "BC-01 — Tenant & Access Governance",
    "BC-02 — Customer & Buyer Relationships",
    "BC-03 — Catalog & Commercial Policy",
    "BC-04 — Sales Commitment",
    "BC-05 — Inventory Availability",
    "BC-06 — Fulfillment & Delivery",
    "BC-07 — Credit & Receivables",
    "BC-08 — Payments",
    "BC-09 — Business Documents",
    "BC-10 — Notifications",
    "BC-11 — Business Traceability",
}
context_values = re.findall(
    r"^\| (?:Owning Bounded Context|Relevant Bounded Contexts) \| (.+?) \|$",
    web_requirements + "\n" + mobile_requirements,
    re.MULTILINE,
)
for value in context_values:
    for context in value.split(";"):
        context = context.strip()
        if context not in accepted_contexts:
            failures.append(f"requirement references non-canonical Bounded Context: {context}")

if failures:
    print("BLUEPRINT VALIDATION: FAIL")
    for item in failures:
        print(f"- {item}")
    sys.exit(1)
print("BLUEPRINT VALIDATION: PASS")
print(f"- candidate files inspected: {len(paths)}")
print("- links, metadata, publication boundary, secret heuristics and C4 workspace: PASS")
for warning in warnings:
    print(f"- WARNING: {warning}")
PY

bash tooling/scripts/validate-mobile-master-backlog.sh

bash tooling/scripts/validate-academic-mobile.sh

docker run --rm \
  -v "$ROOT/01-shared/architecture/c4/structurizr:/usr/local/structurizr:ro" \
  structurizr/structurizr:2026.06.28 validate \
  -workspace /usr/local/structurizr/workspace.dsl

echo "STRUCTURIZR DSL VALIDATION: PASS"

GENERATED_DIR="$(mktemp -d)"
# Docker image writes generated JSON as its container user; grant access only to
# this ephemeral validation directory.
chmod 777 "$GENERATED_DIR"
docker run --rm \
  -v "$ROOT/01-shared/architecture/c4/structurizr:/usr/local/structurizr:ro" \
  -v "$GENERATED_DIR:/generated" \
  structurizr/structurizr:2026.06.28 export \
  -workspace /usr/local/structurizr/workspace.dsl \
  -format json \
  -output /generated

python3 tooling/scripts/compare-structurizr-semantic.py \
  "$GENERATED_DIR/workspace.json" \
  "$ROOT/01-shared/architecture/c4/structurizr/generated/workspace.json"

bash tooling/scripts/validate-tactical-data-model.sh
