#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
export ROOT_DIR

python3 - <<'PY'
from pathlib import Path
import os
import re
import sys

root = Path(os.environ["ROOT_DIR"])
course = root / "90-academic/mobile/course-1acc0238"
failures: list[str] = []

required_docs = [
    "README.md",
    "rubric-compliance.md",
    "milestone-plan.md",
    "requirements-projection.md",
    "epic-projection.md",
    "architecture-projection.md",
    "ux-evidence-plan.md",
    "implementation-evidence-plan.md",
    "validation-evidence-plan.md",
    "bibliography-evidence-plan.md",
]
for name in required_docs:
    path = course / name
    if not path.is_file():
        failures.append(f"missing academic Mobile document: {path.relative_to(root)}")
        continue
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---\n") or "\n---\n" not in text[4:]:
        failures.append(f"academic document lacks frontmatter: {path.relative_to(root)}")
    else:
        front = text[4:text.find("\n---\n", 4)]
        values = dict(re.findall(r"(?m)^([A-Za-z][A-Za-z0-9_-]*):\s*(.+?)\s*$", front))
        for key in ("status", "maturity", "scope", "owner", "last-reviewed"):
            if key not in values:
                failures.append(f"academic document missing {key}: {path.relative_to(root)}")
        if values.get("scope") != "runway":
            failures.append(f"academic document must remain scope runway: {path.relative_to(root)}")

catalog = (root / "03-mobile/requirements/mobile-v1-catalog.md").read_text(encoding="utf-8")
canonical = {}
for match in re.finditer(r"^## (MOB-US-\d{3}) — .*?(?=^## MOB-US-|\Z)", catalog, re.MULTILINE | re.DOTALL):
    canonical[match.group(1)] = match.group(0)
v1 = [sid for sid, block in canonical.items() if "DEFERRED" not in block.split("### User Story", 1)[0]]
deferred = [sid for sid, block in canonical.items() if sid not in v1]
if len(canonical) != 49 or len(v1) != 42 or len(deferred) != 7:
    failures.append(f"canonical Mobile inventory expected 49/42/7, found {len(canonical)}/{len(v1)}/{len(deferred)}")

projection = (course / "requirements-projection.md").read_text(encoding="utf-8")
rows = re.findall(r"^\|\s*(\d+)\s*\|\s*(MOB-US-\d{3})\s*\|.*$", projection, re.MULTILINE)
if len(rows) != 42:
    failures.append(f"academic backlog expected 42 rows, found {len(rows)}")
row_ids = [sid for _, sid in rows]
if len(row_ids) != len(set(row_ids)):
    failures.append("academic backlog contains duplicate Mobile IDs")
if set(row_ids) != set(v1):
    failures.append("academic backlog rows must match the canonical V1 ID set exactly once")
if [int(order) for order, _ in rows] != list(range(1, 43)):
    failures.append("academic backlog order must be contiguous 1..42")

headings = re.findall(r"^### (MOB-US-\d{3}) - .+$", projection, re.MULTILINE)
if len(headings) != len(set(headings)) or set(headings) != set(v1):
    failures.append("academic V1 field registry must contain each canonical V1 ID exactly once")

required_fields = [
    "ID", "Product", "App", "Surface", "User / Actor", "Epic", "Priority", "Title",
    "Owning Bounded Context", "Secondary Bounded Contexts", "Shared Capability",
    "Business Goal / Impact", "Research status", "Scope", "Mobile justification",
    "Backend Support", "Implementation Evidence", "Client Status", "Dependencies",
    "Description / User Story", "Acceptance Criteria", "Story Points", "Sprint",
    "Academic Milestone",
]
registry_blocks = [
    match.group(0)
    for match in re.finditer(
        r"^### (MOB-US-\d{3}) - .*?(?=^### MOB-US-|^<!-- REGISTRY|\Z)",
        projection,
        re.MULTILINE | re.DOTALL,
    )
]
for block in registry_blocks:
    sid = re.match(r"^### (MOB-US-\d{3})", block).group(1)
    for field in required_fields:
        value = re.search(rf"^- \*\*{re.escape(field)}:\*\*\s*(.+)$", block, re.MULTILINE)
        if not value or not value.group(1).strip():
            failures.append(f"{sid} missing academic field: {field}")
    points = re.search(r"^- \*\*Story Points:\*\*\s*(\d+)$", block, re.MULTILINE)
    if not points or int(points.group(1)) not in {1, 2, 3, 5, 8}:
        failures.append(f"{sid} has invalid Story Points")
    sprint = re.search(r"^- \*\*Sprint:\*\*\s*(S[1-3])$", block, re.MULTILINE)
    if not sprint:
        failures.append(f"{sid} has invalid Sprint")
    if "Client Status:** NOT STARTED" not in block:
        failures.append(f"{sid} must keep Client Status NOT STARTED")
    if "../../../03-mobile/requirements/mobile-v1-catalog.md" not in block:
        failures.append(f"{sid} must link canonical story and acceptance criteria")

for sid in v1:
    block = canonical[sid]
    acceptance = re.search(r"^### Acceptance Criteria\s*\n(?P<criteria>.*?)(?=^## MOB-US-|\Z)", block, re.MULTILINE | re.DOTALL)
    criteria = acceptance.group("criteria") if acceptance else ""
    lines = re.findall(r"^- (.+)$", criteria, re.MULTILINE)
    gwt = [line for line in lines if all(re.search(rf"\b{word}\b", line, re.IGNORECASE) for word in ("Given", "when", "then"))]
    if len(lines) < 4 or len(gwt) < 3:
        failures.append(f"{sid} needs four AC bullets and at least three Gherkin scenarios")

spikes = (root / "01-shared/product/requirements/spike-stories.md").read_text(encoding="utf-8")
for field in ("Context", "Question", "Investigation Goal", "Alternatives", "Evidence Required", "Acceptance Criteria", "Expected Output", "Decision Produced", "Timebox"):
    if field not in spikes:
        failures.append(f"shared Spike contract missing field: {field}")
for i in range(1, 7):
    if f"| SPIKE-{i:03d} |" not in spikes:
        failures.append(f"SPIKE-{i:03d} missing academic evidence-contract row")

architecture = (course / "architecture-projection.md").read_text(encoding="utf-8")
for view in ("Nexa-SystemContext-ASIS", "Nexa-SystemContext-V1-TARGET", "Nexa-Containers-ASIS", "Nexa-Containers-V1-TARGET", "Nexa-Deployment-Local-ASIS", "Nexa-Deployment-V1-TARGET"):
    if view not in architecture:
        failures.append(f"academic architecture projection missing C4 view: {view}")

epics = (course / "epic-projection.md").read_text(encoding="utf-8")
epic_ids = re.findall(r"^## (MOBILE-EPIC-\d{2}) - .+$", epics, re.MULTILINE)
if epic_ids != [f"MOBILE-EPIC-{i:02d}" for i in range(1, 8)]:
    failures.append(f"academic Epic projection must contain MOBILE-EPIC-01..07: {epic_ids}")
epic_blocks = [
    match.group(0)
    for match in re.finditer(r"^## MOBILE-EPIC-\d{2} - .*?(?=^## MOBILE-EPIC-|\Z)", epics, re.MULTILINE | re.DOTALL)
]
for block in epic_blocks:
    epic_id = re.match(r"^## (MOBILE-EPIC-\d{2})", block).group(1)
    for field in ("ID / Title", "Purpose / Outcome", "Actors", "Apps", "Capabilities", "Bounded Contexts", "Business Goal / Impact", "V1 Stories", "V2 / Deferred Stories", "Future / Runway", "Out of Scope", "Success Criteria", "Implementation Evidence", "Academic Traceability"):
        value = re.search(rf"^- \*\*{re.escape(field)}:\*\*\s*(.+)$", block, re.MULTILINE)
        if not value or not value.group(1).strip():
            failures.append(f"{epic_id} missing Epic field: {field}")
if not all(f"WEB-US-{i:03d}" in epics for i in range(1, 6)) or "Sprint 1" not in epics:
    failures.append("academic Epic projection must retain WEB-US-001..005 Landing Page dependency in Sprint 1")

if failures:
    print("ACADEMIC MOBILE VALIDATION: FAIL")
    for failure in failures:
        print(f"- {failure}")
    sys.exit(1)

print("ACADEMIC MOBILE VALIDATION: PASS")
print("- canonical Mobile inventory: 49 IDs (42 V1, 7 deferred)")
print("- rubric backlog: 42 rows with field registry, points, sprints and milestone joins")
print("- Gherkin AC, canonical links, Spike contract and C4 projection checks: PASS")
PY
