#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
export ROOT_DIR

python3 - <<'PY'
from pathlib import Path
import os
import re
import subprocess
import sys

root = Path(os.environ["ROOT_DIR"])
course = root / "90-academic/mobile/course-1acc0238"
catalog_path = root / "03-mobile/requirements/mobile-v1-catalog.md"
readiness_path = root / "03-mobile/requirements/story-to-design-readiness.md"
failures: list[str] = []

required_docs = [
    "README.md", "rubric-compliance.md", "milestone-plan.md",
    "requirements-projection.md", "epic-projection.md",
    "architecture-projection.md", "ux-evidence-plan.md",
    "implementation-evidence-plan.md", "validation-evidence-plan.md",
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

catalog = catalog_path.read_text(encoding="utf-8")
catalog_matches = list(re.finditer(
    r"^## (MOB-US-\d{3}) — (.*?)\n(.*?)(?=^## MOB-US-|\Z)",
    catalog,
    re.MULTILINE | re.DOTALL,
))
canonical = {m.group(1): m.group(0) for m in catalog_matches}
v1_ids = {
    "MOB-US-001", "MOB-US-002", "MOB-US-003",
    "MOB-US-011", "MOB-US-012", "MOB-US-013", "MOB-US-014",
    "MOB-US-015", "MOB-US-016", "MOB-US-017", "MOB-US-019",
    "MOB-US-020", "MOB-US-021", "MOB-US-022", "MOB-US-023",
    "MOB-US-024", "MOB-US-025", "MOB-US-026", "MOB-US-027",
    "MOB-US-028", "MOB-US-031", "MOB-US-032", "MOB-US-033",
    "MOB-US-034", "MOB-US-044", "MOB-US-047", "MOB-US-048",
    "MOB-US-049",
}
deferred_ids = {f"MOB-US-{i:03d}" for i in range(1, 50)} - v1_ids
all_ids = set(canonical)
canonical_numbers = sorted(int(sid[-3:]) for sid in all_ids)
historical_ids = {f"MOB-US-{i:03d}" for i in range(1, 50)}
if (
    not canonical_numbers
    or canonical_numbers[0] != 1
    or canonical_numbers != list(range(1, canonical_numbers[-1] + 1))
    or not historical_ids <= all_ids
):
    failures.append(f"canonical Mobile inventory must retain contiguous historical IDs from MOB-US-001; found {len(canonical)}")
master = (root / "03-mobile/requirements/master-mobile-backlog.md").read_text(encoding="utf-8")
master_rows = {}
for line in master.splitlines():
    if re.match(r"^\| MOB-US-\d{3} \|", line):
        cells = [cell.strip() for cell in line.strip("|").split("|")]
        if cells:
            master_rows[cells[0]] = cells
future_ids = {
    sid for sid, cells in master_rows.items()
    if len(cells) > 4 and cells[4] == "V4_FUTURE"
}
actual_v1 = {
    sid for sid in canonical if sid in v1_ids
}
if actual_v1 != v1_ids:
    failures.append(f"canonical V1 IDs differ: expected {sorted(v1_ids)}, found {sorted(actual_v1)}")
if (set(canonical) & {f"MOB-US-{i:03d}" for i in range(1, 50)}) - actual_v1 != deferred_ids:
    failures.append("historical canonical deferred IDs do not equal the required 21-story set")

epic_index = (root / "03-mobile/requirements/epics/README.md").read_text(encoding="utf-8")
epic_map = {}
for line in epic_index.splitlines():
    if line.startswith("| MOBILE-EPIC-"):
        cells = [cell.strip() for cell in line.strip("|").split("|")]
        if len(cells) >= 8:
            epic_map[cells[0]] = set(re.findall(r"MOB-US-\d{3}", cells[7]))
required_fields = [
    "ID", "Product", "App", "Surface", "User / Actor", "Epic", "Priority",
    "Title", "Owning Bounded Context", "Secondary Bounded Contexts",
    "Shared Capability", "Business Goal / Impact", "Research status", "Scope",
    "Mobile justification", "Backend Support", "Implementation Evidence",
    "Client Status", "Dependencies", "Description / User Story",
    "Acceptance Criteria", "Story Points", "Sprint", "Academic Milestone",
]

for sid, block in canonical.items():
    for field in ("ID", "Status", "Product", "Surface", "Actor", "Epic", "Priority", "Title", "Owning Bounded Context"):
        if not re.search(rf"^\| {re.escape(field)} \|\s*[^|]+\|$", block, re.MULTILINE):
            failures.append(f"{sid} missing required canonical field: {field}")
    epic_value = re.search(r"^\| Epic \|\s*(.*?)\s*\|$", block, re.MULTILINE)
    epic_id = next((eid for eid in epic_map if epic_value and eid in epic_value.group(1)), None)
    if not epic_id:
        failures.append(f"{sid} has no recognized canonical Epic")
    elif sid not in epic_map[epic_id]:
        failures.append(f"{sid} is assigned to the wrong canonical Epic")
    statement = re.search(
        r"^### User Story\s*\n\s*As (?:a|an) .+?,\s*\n"
        r"I want .+?,\s*\nso that .+?\s*$",
        block,
        re.MULTILINE,
    )
    if not statement:
        failures.append(f"{sid} lacks a complete human User Story statement")
    acceptance = re.search(
        r"^### Acceptance Criteria\s*\n(?P<criteria>.*?)(?=^## MOB-US-|^### Outcome Conditions|\Z)",
        block,
        re.MULTILINE | re.DOTALL,
    )
    criteria = acceptance.group("criteria") if acceptance else ""
    scenarios = re.findall(r"^- Scenario: .*?(?=\n|\Z)", criteria, re.MULTILINE)
    if sid in v1_ids and len(scenarios) < 4:
        failures.append(f"{sid} requires at least four Scenario criteria")
    if sid not in v1_ids and sid not in future_ids and not 2 <= len(scenarios) <= 4:
        failures.append(f"{sid} requires two to four roadmap Scenario criteria")
    if sid in future_ids and not re.search(r"^### Outcome Conditions\s*$", block, re.MULTILINE):
        failures.append(f"{sid} requires high-level Outcome Conditions")
    for scenario in scenarios:
        if not all(re.search(rf"\b{word}\b", scenario, re.IGNORECASE) for word in ("Given", "when", "then")):
            failures.append(f"{sid} has non-Gherkin Scenario criterion: {scenario[:80]}")
    if sid in v1_ids:
        title = re.search(r"^\| Title \|\s*(.*?)\s*\|$", block, re.MULTILINE).group(1)
        functional_text = title + " " + (statement.group(0) if statement else "")
        forbidden = re.compile(
            r"\b(?:api|http|endpoint|database|table|schema|ui|ux|screen|component|"
            r"client|server|idempotenc\w*|synchron\w*|sync)\b",
            re.IGNORECASE,
        )
        if forbidden.search(functional_text):
            failures.append(f"{sid} functional title/description contains engineering language")
        if forbidden.search(" ".join(scenarios)):
            failures.append(f"{sid} acceptance criteria contains UI/API/database or sync jargon")
    if sid in {"MOB-US-029", "MOB-US-035", "MOB-US-045", "MOB-US-046"} and sid in v1_ids:
        failures.append(f"{sid} is forbidden in V1")
    if sid == "MOB-US-044" and "Push Subscription" in block:
        failures.append("MOB-US-044 functional story must not expose Push Subscription wording")

projection = (course / "requirements-projection.md").read_text(encoding="utf-8")
if "GENERATED ACADEMIC PROJECTION — DO NOT EDIT DIRECTLY" not in projection:
    failures.append("academic requirements projection must be marked generated and non-editable")
rows = re.findall(r"^\|\s*(\d+)\s*\|\s*(MOB-US-\d{3})\s*\|.*$", projection, re.MULTILINE)
if len(rows) != 28:
    failures.append(f"academic backlog expected exactly 28 rows, found {len(rows)}")
row_ids = [sid for _, sid in rows]
if len(row_ids) != len(set(row_ids)) or set(row_ids) != v1_ids:
    failures.append("academic backlog must contain each canonical V1 ID exactly once")
if [int(order) for order, _ in rows] != list(range(1, 29)):
    failures.append("academic backlog order must be contiguous 1..28")
registry_blocks = {
    m.group(1): m.group(0)
    for m in re.finditer(
        r"^### (MOB-US-\d{3}) - .*?(?=^### MOB-US-|^## Academic boundary|\Z)",
        projection,
        re.MULTILINE | re.DOTALL,
    )
}
if set(registry_blocks) != v1_ids:
    failures.append("academic V1 field registry must contain exactly the 28 V1 IDs")
for sid in v1_ids:
    block = registry_blocks.get(sid, "")
    for field in required_fields:
        if not re.search(rf"^- \*\*{re.escape(field)}:\*\*\s*.+$", block, re.MULTILINE):
            failures.append(f"{sid} missing visible academic field: {field}")
    points = re.search(r"^- \*\*Story Points:\*\*\s*(\d+)$", block, re.MULTILINE)
    if not points or int(points.group(1)) not in {1, 2, 3, 5, 8}:
        failures.append(f"{sid} has invalid Story Points")
    sprint = re.search(r"^- \*\*Sprint:\*\*\s*(S[1-3])$", block, re.MULTILINE)
    if not sprint:
        failures.append(f"{sid} has invalid Sprint")
    if "Client Status:** NOT STARTED" not in block:
        failures.append(f"{sid} must keep Client Status NOT STARTED")
    if not re.search(r"^- \*\*Description / User Story:\*\*\s*As .+ I want .+ so that .+$", block, re.MULTILINE):
        failures.append(f"{sid} academic Description / User Story is not visibly human-centered")
    if len(re.findall(r"^\s+- Scenario: .*?(?=\n|\Z)", block, re.MULTILINE)) < 4:
        failures.append(f"{sid} academic Acceptance Criteria are not visible as four scenarios")
    title_match = re.search(r"^- \*\*Title:\*\*\s*(.+)$", block, re.MULTILINE)
    epic_match = re.search(r"^- \*\*Epic:\*\*\s*(MOBILE-EPIC-\d{2})", block, re.MULTILINE)
    canonical_title_match = re.search(r"^## " + re.escape(sid) + r" — (.*?)$", canonical[sid], re.MULTILINE)
    if not title_match or not canonical_title_match or title_match.group(1).strip() != canonical_title_match.group(1).strip():
        failures.append(f"{sid} academic title diverges from canonical catalog")
    if not epic_match or sid not in epic_map.get(epic_match.group(1), set()):
        failures.append(f"{sid} academic Epic diverges from canonical outcome mapping")

if not readiness_path.is_file():
    failures.append("missing Mobile V1 story-to-design readiness artifact")
else:
    readiness = readiness_path.read_text(encoding="utf-8")
    readiness_ids = set(re.findall(r"^\|\s*(MOB-US-\d{3})\s*\|", readiness, re.MULTILINE))
    if readiness_ids != v1_ids:
        failures.append("story-to-design readiness must map exactly the 28 V1 IDs")
    header = next((line for line in readiness.splitlines() if line.startswith("| Story |")), "")
    for label in (
        "Actor", "Goal", "Trigger", "Information needed", "Primary action",
        "Success", "Alternate", "Error", "Stale / connectivity / device",
        "Related stories", "Task-flow and screen responsibility",
    ):
        if label not in header:
            failures.append(f"story-to-design readiness missing column: {label}")

epics = (course / "epic-projection.md").read_text(encoding="utf-8")
if "GENERATED ACADEMIC PROJECTION — DO NOT EDIT DIRECTLY" not in epics:
    failures.append("academic Epic projection must be marked generated and non-editable")
epic_ids = re.findall(r"^## (MOBILE-EPIC-\d{2}) - .+$", epics, re.MULTILINE)
if epic_ids != [f"MOBILE-EPIC-{i:02d}" for i in range(1, 8)]:
    failures.append(f"academic Epic projection must contain MOBILE-EPIC-01..07 exactly once: {epic_ids}")
epic_blocks = {
    m.group(1): m.group(0)
    for m in re.finditer(
        r"^## (MOBILE-EPIC-\d{2}) - .*?(?=^## MOBILE-EPIC-|^## Academic boundary|\Z)",
        epics,
        re.MULTILINE | re.DOTALL,
    )
}
epic_fields = (
    "ID / Title", "Purpose / Outcome", "Actors", "Apps", "Capabilities",
    "Bounded Contexts", "Business Goal / Impact", "V1 Stories",
    "V2 / Deferred Stories", "Future / Runway", "Out of Scope",
    "Success Criteria", "Implementation Evidence", "Academic Traceability",
)
for eid, block in epic_blocks.items():
    for field in epic_fields:
        if not re.search(rf"^- \*\*{re.escape(field)}:\*\*\s*.+$", block, re.MULTILINE):
            failures.append(f"{eid} missing Epic field: {field}")
    v1_match = re.search(r"^- \*\*V1 Stories:\*\*\s*(.+)$", block, re.MULTILINE)
    deferred_match = re.search(r"^- \*\*V2 / Deferred Stories:\*\*\s*(.+)$", block, re.MULTILINE)
    listed_v1 = set(re.findall(r"MOB-US-\d{3}", v1_match.group(1))) if v1_match else set()
    listed_deferred = set(re.findall(r"MOB-US-\d{3}", deferred_match.group(1))) if deferred_match else set()
    if eid in {"MOBILE-EPIC-01", "MOBILE-EPIC-02", "MOBILE-EPIC-03", "MOBILE-EPIC-04", "MOBILE-EPIC-05"} and listed_v1 != epic_map[eid]:
        failures.append(f"{eid} V1 story mapping is incorrect")
    if eid in {"MOBILE-EPIC-06", "MOBILE-EPIC-07"} and listed_deferred != epic_map[eid]:
        failures.append(f"{eid} deferred story mapping is incorrect")
if not all(f"WEB-US-{i:03d}" in epics for i in range(1, 6)) or "Sprint 1" not in epics:
    failures.append("academic Epic projection must retain WEB-US-001..005 Landing Page dependency in Sprint 1")

spikes = (root / "01-shared/product/requirements/spike-stories.md").read_text(encoding="utf-8")
for field in ("Context", "Question", "Investigation Goal", "Alternatives", "Evidence Required", "Acceptance Criteria", "Expected Output", "Decision Produced", "Timebox"):
    if field not in spikes:
        failures.append(f"shared Spike contract missing field: {field}")
for i in range(1, 7):
    if f"| SPIKE-{i:03d} |" not in spikes:
        failures.append(f"SPIKE-{i:03d} missing academic evidence-contract row")

architecture = (course / "architecture-projection.md").read_text(encoding="utf-8")
for view in (
    "Nexa-SystemContext-ASIS", "Nexa-SystemContext-V1-TARGET",
    "Nexa-Containers-ASIS", "Nexa-Containers-V1-TARGET",
    "Nexa-Deployment-Local-ASIS", "Nexa-Deployment-V1-TARGET",
):
    if view not in architecture:
        failures.append(f"academic architecture projection missing C4 view: {view}")

tracked = subprocess.check_output(["git", "ls-files"], cwd=root, text=True).splitlines()
source_rel = "90-academic/mobile/enunciado-trabajo-final.md"
if source_rel in tracked or (root / source_rel).exists():
    failures.append("academic source transcription must be absent from the publishable tree")
if any(path.endswith("mobile-applications-final-rubric.pdf") for path in tracked):
    failures.append("academic rubric PDF must not be tracked")
source_pattern = re.compile(
    r"(?:enunciado|original[-_]?rubric|course[-_]?source|source[-_]?statement)",
    re.IGNORECASE,
)
academic_paths = set(path for path in tracked if path.startswith("90-academic/"))
academic_paths.update(
    str(path.relative_to(root))
    for path in (root / "90-academic").rglob("*")
    if path.is_file()
)
for path in academic_paths:
    if (source_pattern.search(Path(path).name) and Path(path).suffix.lower() not in {".pdf", ".epub"}) or (path in tracked and Path(path).suffix.lower() in {".pdf", ".epub"}):
        failures.append(f"academic source-like artifact must remain local-only: {path}")
    if Path(path).suffix.lower() == ".md" and path != source_rel:
        body = (root / path).read_text(encoding="utf-8")
        if "enunciado-trabajo-final.md" in body:
            failures.append(f"publishable academic document still links excluded source: {path}")

if failures:
    print("ACADEMIC MOBILE VALIDATION: FAIL")
    for failure in failures:
        print(f"- {failure}")
    sys.exit(1)

print("ACADEMIC MOBILE VALIDATION: PASS")
print("- canonical Mobile inventory: 73 IDs (49 historical + 24 independent; 28 course V1)")
print("- academic backlog: 28 visible V1 rows with human Description/AC, points, sprints and milestones")
print("- Epic mapping, design readiness, Spike contract, C4 projection and publication boundary: PASS")
PY
