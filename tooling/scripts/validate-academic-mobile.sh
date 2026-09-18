#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
export ROOT_DIR

python3 - <<'PY'
from pathlib import Path
from collections import Counter
import os
import re
import subprocess
import sys

root = Path(os.environ["ROOT_DIR"])
course = root / "90-academic/mobile/course-1acc0238"
catalog_path = root / "03-mobile/requirements/mobile-v1-catalog.md"
master_path = root / "03-mobile/requirements/master-mobile-backlog.md"
boundary_path = root / "03-mobile/requirements/academic-backlog-boundary.md"
epic_index_path = root / "03-mobile/requirements/epics/README.md"
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
        continue
    front = text[4:text.find("\n---\n", 4)]
    values = dict(re.findall(r"(?m)^([A-Za-z][A-Za-z0-9_-]*):\s*(.+?)\s*$", front))
    for key in ("status", "maturity", "scope", "owner", "last-reviewed"):
        if key not in values:
            failures.append(f"academic document missing {key}: {path.relative_to(root)}")
    if values.get("scope") != "runway":
        failures.append(f"academic document must remain scope runway: {path.relative_to(root)}")

def expand_ids(text: str, prefix: str, width: int = 3) -> set[str]:
    result: set[str] = set()
    pattern = rf"{re.escape(prefix)}(\d{{{width}}})(?:\.\.(\d{{{width}}}))?"
    for match in re.finditer(pattern, text):
        start = int(match.group(1))
        end = int(match.group(2) or match.group(1))
        result.update(f"{prefix}{number:0{width}d}" for number in range(start, end + 1))
    return result

def story_blocks(text: str):
    return list(re.finditer(
        r"^## (MOB-US-\d{3}) — (.*?)\n(.*?)(?=^## MOB-US-|\Z)",
        text,
        re.MULTILINE | re.DOTALL,
    ))

catalog = catalog_path.read_text(encoding="utf-8")
catalog_matches = story_blocks(catalog)
catalog_ids = {match.group(1) for match in catalog_matches}
expected_mobile = {f"MOB-US-{i:03d}" for i in range(1, 74)}
if catalog_ids != expected_mobile or len(catalog_matches) != 73:
    failures.append(f"canonical Mobile catalog must contain exactly MOB-US-001..073; found {len(catalog_ids)}")

master = master_path.read_text(encoding="utf-8")
header = next((line for line in master.splitlines() if line.startswith("| ID |")), "")
expected_headers = [
    "ID", "Title", "Actor", "Epic", "Target Product Generation",
    "Historical Planning Band", "Priority", "Academic Story Points",
    "Academic Sprint", "Status", "Primary BC", "Secondary BCs", "Capability",
    "Backend Support", "Research Status", "Client Status", "Introduced In",
    "Sprint Implemented", "Implemented In", "Verified In", "Product Accepted In",
    "Description", "Mobile App", "Mobile Justification", "Dependencies",
]
header_cells = [cell.strip() for cell in header.strip("|").split("|")] if header else []
if header_cells != expected_headers:
    failures.append("master backlog does not expose the final 25-column schema")

master_rows = []
for line in master.splitlines():
    if re.match(r"^\| MOB-US-\d{3} \|", line):
        master_rows.append([cell.strip() for cell in line.strip("|").split("|")])
master_by_id = {row[0]: row for row in master_rows if row}
if set(master_by_id) != expected_mobile or len(master_rows) != 73:
    failures.append(f"master backlog must contain exactly 73 Mobile rows; found {len(master_rows)}")
if any(len(row) != len(expected_headers) for row in master_rows):
    failures.append("master backlog rows must match the final 25-column schema")

bands = Counter(row[5] for row in master_rows if len(row) == len(expected_headers))
if bands != Counter({"V1": 28, "V2": 35, "V3": 9, "V4_FUTURE": 1}):
    failures.append(f"historical planning band distribution is incorrect: {dict(bands)}")
generations = Counter(row[4] for row in master_rows if len(row) == len(expected_headers))
if generations != Counter({"V1": 73}):
    failures.append(f"Product Generation distribution is incorrect: {dict(generations)}")
sprints = Counter(row[8] for row in master_rows if len(row) == len(expected_headers))
if sprints != Counter({"Sprint 1": 4, "Sprint 2": 21, "Sprint 3": 24, "Sprint 4": 24}):
    failures.append(f"academic Sprint distribution is incorrect: {dict(sprints)}")

allowed_status = {"PLANNED", "READY", "IN_PROGRESS", "IMPLEMENTED", "VERIFIED", "PRODUCT_ACCEPTED", "DEFERRED", "SUPERSEDED", "RETIRED"}
allowed_backend = {"SUPPORTED", "PARTIAL", "OPEN", "NOT_REQUIRED"}
allowed_research = {"NOT_REQUIRED", "PENDING", "RESEARCHING", "RESEARCH EVIDENCE AVAILABLE"}
allowed_client = {"NOT_STARTED", "IN_PROGRESS", "IMPLEMENTED", "VERIFIED"}
for row in master_rows:
    if len(row) != len(expected_headers):
        continue
    story_id = row[0]
    if row[4] != "V1":
        failures.append(f"{story_id} must target Product Generation V1")
    if row[9] not in allowed_status:
        failures.append(f"{story_id} has uncontrolled Status: {row[9]}")
    if row[13] not in allowed_backend:
        failures.append(f"{story_id} has uncontrolled Backend Support: {row[13]}")
    if row[14] not in allowed_research:
        failures.append(f"{story_id} has uncontrolled Research Status: {row[14]}")
    if row[15] not in allowed_client:
        failures.append(f"{story_id} has uncontrolled Client Status: {row[15]}")
    if row[17:21] != ["NOT_IMPLEMENTED", "NOT_IMPLEMENTED", "NOT_VERIFIED", "NOT_ACCEPTED"]:
        failures.append(f"{story_id} claims implementation, verification or Product Acceptance")

boundary = boundary_path.read_text(encoding="utf-8")
if "77895a8950676ccdaec520a61c41107852268606" not in boundary:
    failures.append("academic boundary does not cite Mobile Report v1.0.1 target commit")
if expand_ids(boundary, "MOB-US-") != expected_mobile:
    failures.append("academic boundary must cover every MOB-US-001..073 story")
if expand_ids(boundary, "LAND-US-") != {f"LAND-US-{i:03d}" for i in range(1, 7)}:
    failures.append("academic boundary must cover LAND-US-001..006")
if expand_ids(boundary, "TS-MOB-") != {f"TS-MOB-{i:03d}" for i in range(1, 13)}:
    failures.append("academic boundary must cover TS-MOB-001..012")
if expand_ids(boundary, "SPIKE-") != {f"SPIKE-{i:03d}" for i in range(1, 7)}:
    failures.append("academic boundary must cover SPIKE-001..006")
if not re.search(r"Academic total\s*\|\s*97", boundary):
    failures.append("academic boundary must declare total 97")
if "426 SP" not in boundary:
    failures.append("academic boundary must declare 426 SP")

projection = (course / "requirements-projection.md").read_text(encoding="utf-8")
if "GENERATED ACADEMIC PROJECTION — DO NOT EDIT DIRECTLY" not in projection:
    failures.append("academic requirements projection must be marked generated and non-editable")
if "97" not in projection or "426" not in projection or "Sprint 4" not in projection:
    failures.append("academic requirements projection lacks final AV1 totals/four-Sprint plan")
if "### User Story" in projection:
    failures.append("academic requirements projection must remain an index, not a second story-body source")
expected_sprint_ids = {
    "Sprint 1": {"MOB-US-001", "MOB-US-002", "MOB-US-003", "MOB-US-011"},
    "Sprint 2": {f"MOB-US-{i:03d}" for i in range(4, 11)} | {f"MOB-US-{i:03d}" for i in range(12, 26)},
    "Sprint 3": {f"MOB-US-{i:03d}" for i in range(26, 50)},
    "Sprint 4": {f"MOB-US-{i:03d}" for i in range(50, 74)},
}
for sprint_name, expected in expected_sprint_ids.items():
    match = re.search(rf"^\| {re.escape(sprint_name)} \|(?P<body>.*?)\| \d+ \| \d+ \| \d+ \|$", projection, re.MULTILINE)
    if not match or expand_ids(match.group("body"), "MOB-US-") != expected:
        failures.append(f"academic requirements projection has incorrect {sprint_name} mapping")

epic_index = epic_index_path.read_text(encoding="utf-8")
expected_epics = {f"MOBILE-EPIC-{i:02d}" for i in range(1, 13)}
if set(re.findall(r"^\| (MOBILE-EPIC-\d{2}) \|", epic_index, re.MULTILINE)) != expected_epics:
    failures.append("canonical Mobile Epic index must contain exactly 12 Epics")

epics = (course / "epic-projection.md").read_text(encoding="utf-8")
if "GENERATED ACADEMIC PROJECTION — DO NOT EDIT DIRECTLY" not in epics:
    failures.append("academic Epic projection must be marked generated and non-editable")
if set(re.findall(r"^\| (MOBILE-EPIC-\d{2}) \|", epics, re.MULTILINE)) != expected_epics:
    failures.append("academic Epic projection must reflect MOBILE-EPIC-01..12")
if "LAND-US-001..006" not in epics or "not a thirteenth Mobile Product Epic" not in epics:
    failures.append("academic Epic projection must keep Landing Page separate from Mobile Epics")

if not readiness_path.is_file():
    failures.append("missing Mobile design-readiness subset")
else:
    readiness = readiness_path.read_text(encoding="utf-8")
    readiness_ids = set(re.findall(r"^\|\s*(MOB-US-\d{3})\s*\|", readiness, re.MULTILINE))
    historical_v1 = {sid for sid, row in master_by_id.items() if len(row) > 5 and row[5] == "V1"}
    if len(readiness_ids) != 28 or readiness_ids != historical_v1:
        failures.append("story-to-design readiness must remain the explicit 28-story assessed historical subset")
    if "does not define the\ncurrent Nexa Mobile V1 Product Generation" not in readiness:
        failures.append("story-to-design readiness must state that it does not define Product Generation V1")

milestones = (course / "milestone-plan.md").read_text(encoding="utf-8")
for required in ("AV1 COMPLETE", "97 PBIs / 426 SP", "Sprint 4", "No Sprint result", "TB1"):
    if required not in milestones:
        failures.append(f"milestone plan missing AV1 evidence boundary: {required}")
rubric = (course / "rubric-compliance.md").read_text(encoding="utf-8")
if "Sprint 1 / Sprint 2 / Sprint 3 / Sprint 4 evidence" not in rubric:
    failures.append("rubric compliance must cover evidence templates for all four academic Sprints")
architecture = (course / "architecture-projection.md").read_text(encoding="utf-8")
for required in ("shared Blueprint C4 DSL remains the authority", "derived academic", "unmerged feature branches", "Wave 2"):
    if required not in architecture:
        failures.append(f"academic architecture projection missing boundary: {required}")
ux = (course / "ux-evidence-plan.md").read_text(encoding="utf-8")
for required in ("9/9", "RESEARCH EVIDENCE AVAILABLE", "solution prototype validation", "Product/UX Acceptance"):
    if required not in ux:
        failures.append(f"academic UX evidence plan missing boundary: {required}")
implementation = (course / "implementation-evidence-plan.md").read_text(encoding="utf-8")
for required in ("Operations Android", "PARTIAL IMPLEMENTATION EVIDENCE", "Buyer Mobile", "NOT VERIFIED"):
    if required not in implementation:
        failures.append(f"academic implementation plan missing dimension: {required}")
validation = (course / "validation-evidence-plan.md").read_text(encoding="utf-8")
for required in ("V1 = 73", "Sprint 1 = 4", "Sprint 4 = 24", "Needfinding interviews are COMPLETE", "Validation interviews are NOT COMPLETED"):
    if required not in validation:
        failures.append(f"academic validation plan missing dimension: {required}")

tracked = subprocess.check_output(["git", "ls-files"], cwd=root, text=True).splitlines()
source_rel = "90-academic/mobile/enunciado-trabajo-final.md"
if source_rel in tracked or (root / source_rel).exists():
    failures.append("academic source transcription must be absent from the publishable tree")
if any(path.endswith("mobile-applications-final-rubric.pdf") for path in tracked):
    failures.append("academic rubric PDF must not be tracked")
source_pattern = re.compile(r"(?:enunciado|original[-_]?rubric|course[-_]?source|source[-_]?statement)", re.IGNORECASE)
academic_paths = set(path for path in tracked if path.startswith("90-academic/"))
academic_paths.update(str(path.relative_to(root)) for path in (root / "90-academic").rglob("*") if path.is_file())
for path in academic_paths:
    if source_pattern.search(Path(path).name) and Path(path).suffix.lower() not in {".pdf", ".epub"}:
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
print("- academic boundary: 73 MOB + 6 LAND + 12 Technical + 6 Spikes = 97 PBIs / 426 SP")
print("- final academic Sprints: Mobile 4 / 21 / 24 / 24")
print("- derived projection, Epic mapping, assessed subset and publication boundary: PASS")
PY
