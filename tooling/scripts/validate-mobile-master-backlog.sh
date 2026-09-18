#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
export ROOT_DIR

python3 - <<'PY'
from collections import Counter
from pathlib import Path
import os
import re
import subprocess
import sys

root = Path(os.environ["ROOT_DIR"])
catalog_path = root / "03-mobile/requirements/mobile-v1-catalog.md"
master_path = root / "03-mobile/requirements/master-mobile-backlog.md"
capability_path = root / "01-shared/product/capability-map.md"
epic_path = root / "03-mobile/requirements/epics/README.md"
roadmap_path = root / "03-mobile/requirements/release-roadmap.md"
sprint_path = root / "03-mobile/requirements/sprint-plan.md"
reconciliation_path = root / "03-mobile/requirements/reconciliation.md"
readiness_path = root / "03-mobile/requirements/story-to-design-readiness.md"
failures = []

all_expected = {f"MOB-US-{i:03d}" for i in range(1, 74)}
historical_expected = {f"MOB-US-{i:03d}" for i in range(1, 50)}
band_values = {"V1", "V2", "V3", "V4_FUTURE"}
status_values = {
    "PLANNED", "READY", "IN_PROGRESS", "IMPLEMENTED", "VERIFIED",
    "PRODUCT_ACCEPTED", "DEFERRED", "SUPERSEDED", "RETIRED",
}
backend_values = {"SUPPORTED", "PARTIAL", "OPEN", "NOT_REQUIRED"}
client_values = {"NOT_STARTED", "IN_PROGRESS", "IMPLEMENTED", "VERIFIED"}
research_values = {"NOT_REQUIRED", "PENDING", "RESEARCHING", "RESEARCH EVIDENCE AVAILABLE"}
accepted_bc_ids = {f"BC-{i:02d}" for i in range(1, 12)}
accepted_cap_ids = {f"CAP-{i:02d}" for i in range(1, 17)}

def blocks(text):
    return list(re.finditer(
        r"^## (MOB-US-\d{3}) — (.*?)\n(.*?)(?=^## MOB-US-|\Z)",
        text, re.MULTILINE | re.DOTALL,
    ))

def field(block, name):
    match = re.search(rf"^\| {re.escape(name)} \|\s*(.*?)\s*\|$", block, re.MULTILINE)
    return match.group(1).strip() if match else ""

def ids(value):
    result = set()
    for match in re.finditer(r"MOB-US-(\d{3})(?:\.\.(\d{3}))?", value):
        start = int(match.group(1))
        end = int(match.group(2) or match.group(1))
        result.update(f"MOB-US-{number:03d}" for number in range(start, end + 1))
    return result

capability_map = {}
for line in capability_path.read_text(encoding="utf-8").splitlines():
    match = re.match(r"^\| (CAP-\d{2}) \| (.*?) \|", line)
    if match:
        capability_map[match.group(1)] = match.group(2).strip()

catalog = catalog_path.read_text(encoding="utf-8")
catalog_matches = blocks(catalog)
catalog_ids = [match.group(1) for match in catalog_matches]
catalog_blocks = {match.group(1): match.group(0) for match in catalog_matches}
if len(catalog_ids) != len(set(catalog_ids)) or set(catalog_ids) != all_expected:
    failures.append("canonical Mobile catalog must contain exactly MOB-US-001..073")

master = master_path.read_text(encoding="utf-8")
expected_headers = [
    "ID", "Title", "Actor", "Epic", "Target Product Generation",
    "Historical Planning Band", "Priority", "Academic Story Points",
    "Academic Sprint", "Status", "Primary BC", "Secondary BCs", "Capability",
    "Backend Support", "Research Status", "Client Status", "Introduced In",
    "Sprint Implemented", "Implemented In", "Verified In", "Product Accepted In",
    "Description", "Mobile App", "Mobile Justification", "Dependencies",
]
header_line = next((line for line in master.splitlines() if line.startswith("| ID |")), "")
header_cells = [cell.strip() for cell in header_line.strip("|").split("|")] if header_line else []
if header_cells != expected_headers:
    failures.append("master backlog headers do not expose the final 25-column schema")

master_rows = [
    [cell.strip() for cell in line.strip("|").split("|")]
    for line in master.splitlines()
    if re.match(r"^\| MOB-US-\d{3} \|", line)
]
master_by_id = {row[0]: row for row in master_rows if row}
if len(master_rows) != 73 or set(master_by_id) != all_expected:
    failures.append("master lifecycle table must contain exactly MOB-US-001..073")
if any(len(row) != len(expected_headers) for row in master_rows):
    failures.append("master lifecycle rows must have exactly 25 columns")

band_by_id = {row[0]: row[5] for row in master_rows if len(row) > 5}
target_by_id = {row[0]: row[4] for row in master_rows if len(row) > 4}
sprint_by_id = {row[0]: row[8] for row in master_rows if len(row) > 8}
if Counter(band_by_id.values()) != Counter({"V1": 28, "V2": 35, "V3": 9, "V4_FUTURE": 1}):
    failures.append(f"historical planning band distribution is incorrect: {dict(Counter(band_by_id.values()))}")
if Counter(target_by_id.values()) != Counter({"V1": 73}):
    failures.append(f"Product Generation distribution is incorrect: {dict(Counter(target_by_id.values()))}")
if Counter(sprint_by_id.values()) != Counter({"Sprint 1": 4, "Sprint 2": 21, "Sprint 3": 24, "Sprint 4": 24}):
    failures.append(f"academic Sprint distribution is incorrect: {dict(Counter(sprint_by_id.values()))}")
band_ids = {band: {story_id for story_id, value in band_by_id.items() if value == band} for band in band_values}

for story_id, block in catalog_blocks.items():
    required = (
        "ID", "Status", "Product", "Surface", "Actor", "Epic", "Priority",
        "Title", "Owning Bounded Context", "Relevant Bounded Contexts",
        "Shared Capability", "Goal / Outcome", "Research status",
        "Connectivity and authority",
    )
    for name in required:
        if not field(block, name):
            failures.append(f"{story_id} missing canonical field: {name}")
    if field(block, "ID") != story_id:
        failures.append(f"{story_id} ID field does not match heading")
    if field(block, "Status") not in status_values:
        failures.append(f"{story_id} has uncontrolled Status")
    if field(block, "Research status") not in research_values:
        failures.append(f"{story_id} has uncontrolled Research status")
    statement = re.search(
        r"^### User Story\s*\n\s*As (?:a|an) .+?,\s*\n"
        r"I want .+?,\s*\nso that .+?\s*$", block, re.MULTILINE,
    )
    if not statement:
        failures.append(f"{story_id} lacks the actor/goal/value User Story form")
    if re.search(
        r"\b(?:api|http|endpoint|database|table|schema|ui|ux|screen|component|"
        r"client|server|idempotenc\w*|synchron\w*|sync|framework|backend)\b",
        field(block, "Title") + " " + (statement.group(0) if statement else ""),
        re.IGNORECASE,
    ):
        failures.append(f"{story_id} functional title/description contains engineering language")
    owning_bc = re.search(r"\bBC-\d{2}\b", field(block, "Owning Bounded Context"))
    if not owning_bc or owning_bc.group(0) not in accepted_bc_ids:
        failures.append(f"{story_id} maps to a non-canonical owning BC")
    capability_pairs = re.findall(r"(CAP-\d{2})\s+—\s+([^;|]+)", field(block, "Shared Capability"))
    if not capability_pairs or {item[0] for item in capability_pairs} - accepted_cap_ids:
        failures.append(f"{story_id} maps to a non-canonical capability")
    for capability_id, capability_name in capability_pairs:
        if capability_name.strip() != capability_map.get(capability_id):
            failures.append(f"{story_id} capability name diverges from canonical map: {capability_id}")

    acceptance = re.search(
        r"^### Acceptance Criteria\s*\n(?P<body>.*?)(?=^## MOB-US-|^### Outcome Conditions|\Z)",
        block, re.MULTILINE | re.DOTALL,
    )
    scenarios = re.findall(r"^- Scenario: .*?$", acceptance.group("body"), re.MULTILINE) if acceptance else []
    outcome = re.search(
        r"^### Outcome Conditions\s*\n(?P<body>.*?)(?=^## MOB-US-|\Z)",
        block, re.MULTILINE | re.DOTALL,
    )
    outcome_conditions = re.findall(r"^- .+?$", outcome.group("body"), re.MULTILINE) if outcome else []
    band = band_by_id.get(story_id, "")
    limits = {"V1": (3, 6), "V2": (2, 4), "V3": (1, 3)}
    if band in limits:
        low, high = limits[band]
        if not low <= len(scenarios) <= high:
            failures.append(f"{story_id} historical band {band} has invalid AC depth")
        for scenario in scenarios:
            if not all(re.search(rf"\b{word}\b", scenario, re.IGNORECASE) for word in ("Given", "when", "then")):
                failures.append(f"{story_id} has a non-Gherkin scenario")
    elif band == "V4_FUTURE" and not outcome_conditions:
        failures.append(f"{story_id} historical V4/Future band requires Outcome Conditions")
    elif band not in band_values:
        failures.append(f"{story_id} has no valid Historical Planning Band")
    if story_id == "MOB-US-044" and "Push Subscription" in block:
        failures.append("MOB-US-044 exposes technical Push Subscription language")

expected_sprints = {
    "Sprint 1": {"MOB-US-001", "MOB-US-002", "MOB-US-003", "MOB-US-011"},
    "Sprint 2": {f"MOB-US-{i:03d}" for i in range(4, 11)} | {f"MOB-US-{i:03d}" for i in range(12, 26)},
    "Sprint 3": {f"MOB-US-{i:03d}" for i in range(26, 50)},
    "Sprint 4": {f"MOB-US-{i:03d}" for i in range(50, 74)},
}
for row in master_rows:
    if len(row) != len(expected_headers):
        continue
    story_id = row[0]
    if any(not row[index] for index in range(21, len(expected_headers))):
        failures.append(f"{story_id} missing lifecycle projection field")
    if row[4] != "V1" or row[5] not in band_values:
        failures.append(f"{story_id} has uncontrolled Product Generation or Historical Planning Band")
    if row[6] not in {"P1", "P2", "P3"}:
        failures.append(f"{story_id} has uncontrolled Priority")
    if not row[7].isdigit() or int(row[7]) not in {1, 2, 3, 5, 8}:
        failures.append(f"{story_id} has invalid Academic Story Points")
    if row[8] not in expected_sprints or story_id not in expected_sprints[row[8]]:
        failures.append(f"{story_id} has an invalid Academic Sprint value")
    if row[9] not in status_values:
        failures.append(f"{story_id} has uncontrolled master Status")
    if row[13] not in backend_values:
        failures.append(f"{story_id} has uncontrolled Backend Support")
    if row[14] not in research_values:
        failures.append(f"{story_id} has uncontrolled Research Status")
    if row[15] not in client_values:
        failures.append(f"{story_id} has uncontrolled Client Status")
    if row[17:21] != ["NOT_IMPLEMENTED", "NOT_IMPLEMENTED", "NOT_VERIFIED", "NOT_ACCEPTED"]:
        failures.append(f"{story_id} claims implementation, verification or Product Acceptance")
    block = catalog_blocks.get(story_id, "")
    title_match = re.search(r"^## " + re.escape(story_id) + r" — (.*?)$", block, re.MULTILINE)
    epic_match = re.search(r"\bMOBILE-EPIC-\d{2}\b", field(block, "Epic"))
    bc_match = re.search(r"\bBC-\d{2}\b", field(block, "Owning Bounded Context"))
    cap_match = sorted(re.findall(r"\bCAP-\d{2}\b", field(block, "Shared Capability")))
    if not title_match or row[1] != title_match.group(1):
        failures.append(f"{story_id} title diverges between catalog and master lifecycle index")
    if row[2] != field(block, "Actor"):
        failures.append(f"{story_id} actor diverges between catalog and master lifecycle index")
    if not epic_match or row[3] != epic_match.group(0):
        failures.append(f"{story_id} Epic diverges between catalog and master lifecycle index")
    if not bc_match or row[10] != bc_match.group(0):
        failures.append(f"{story_id} primary BC diverges between catalog and master lifecycle index")
    if not cap_match or row[12] != cap_match[0]:
        failures.append(f"{story_id} capability diverges between catalog and master lifecycle index")

epic_text = epic_path.read_text(encoding="utf-8")
epic_map = {}
for line in epic_text.splitlines():
    if line.startswith("| MOBILE-EPIC-"):
        cells = [cell.strip() for cell in line.strip("|").split("|")]
        if len(cells) >= 8:
            epic_map[cells[0]] = ids(cells[7])
expected_epics = {f"MOBILE-EPIC-{i:02d}" for i in range(1, 13)}
if set(epic_map) != expected_epics:
    failures.append("Epic index must contain MOBILE-EPIC-01..12")
epic_membership = [story_id for members in epic_map.values() for story_id in members]
if len(epic_membership) != len(set(epic_membership)) or set(epic_membership) != all_expected:
    failures.append("Epic index must assign every story exactly once")
for story_id, block in catalog_blocks.items():
    epic_match = re.search(r"\bMOBILE-EPIC-\d{2}\b", field(block, "Epic"))
    if not epic_match or story_id not in epic_map.get(epic_match.group(0), set()):
        failures.append(f"{story_id} has incorrect Epic index membership")

roadmap = roadmap_path.read_text(encoding="utf-8")
if "## Current Product Generation" not in roadmap or "## Historical Planning Bands" not in roadmap:
    failures.append("release roadmap must expose current Product Generation and historical provenance")
if "SUPERSEDED AS CURRENT PRODUCT RELEASE NOMENCLATURE" not in roadmap:
    failures.append("release roadmap must mark old bands as superseded nomenclature")
if re.search(r"^### User Story\s*$", roadmap, re.MULTILINE):
    failures.append("release roadmap duplicates canonical story bodies")

def row_ids_from_sprint(text, sprint_name):
    match = re.search(
        rf"^\| {re.escape(sprint_name)} \|(?P<body>.*?)\| \d+ \| \d+ \| \d+ \|$",
        text, re.MULTILINE,
    )
    return ids(match.group("body")) if match else set()

sprint_text = sprint_path.read_text(encoding="utf-8")
for sprint_name, expected in expected_sprints.items():
    if row_ids_from_sprint(sprint_text, sprint_name) != expected:
        failures.append(f"academic sprint projection has incorrect {sprint_name} mapping")
if "Academic Sprint != Product Generation !=" not in sprint_text:
    failures.append("academic Sprint projection must keep dimensions separate")

reconciliation = reconciliation_path.read_text(encoding="utf-8")
historical_matrix = reconciliation.split("## New independent story inventory", 1)[0]
historical_rows = [line for line in historical_matrix.splitlines() if re.match(r"^\| MOB-US-\d{3} \|", line)]
historical_matrix_ids = [re.match(r"^\| (MOB-US-\d{3}) \|", line).group(1) for line in historical_rows]
if set(historical_matrix_ids) != historical_expected or len(historical_matrix_ids) != len(historical_expected):
    failures.append("reconciliation must cover historical MOB-US-001..049 exactly once")
new_section = reconciliation.split("## New independent story inventory", 1)[1] if "## New independent story inventory" in reconciliation else ""
new_ids = [match.group(1) for match in re.finditer(r"^\| (MOB-US-\d{3}) \|", new_section, re.MULTILINE)]
if set(new_ids) != all_expected - historical_expected or len(new_ids) != len(all_expected - historical_expected):
    failures.append("reconciliation must explain every non-historical canonical story exactly once")

if readiness_path.is_file():
    readiness_ids = set(re.findall(r"^\|\s*(MOB-US-\d{3})\s*\|", readiness_path.read_text(encoding="utf-8"), re.MULTILINE))
    if readiness_ids != band_ids.get("V1", set()):
        failures.append("story-to-design readiness must remain exactly the 28-story assessed historical subset")
else:
    failures.append("missing Mobile design-readiness subset")

tracked = subprocess.check_output(["git", "ls-files"], cwd=root, text=True).splitlines()
source_pattern = re.compile(r"(?:enunciado|original[-_]?rubric|course[-_]?source|source[-_]?statement)", re.IGNORECASE)
for path in tracked:
    if path.startswith("90-academic/") and (source_pattern.search(Path(path).name) or Path(path).suffix.lower() in {".pdf", ".epub"}):
        failures.append(f"academic source-like artifact is publishable/tracked: {path}")
for path in (root / "90-academic").rglob("*"):
    if path.is_file() and source_pattern.search(path.name) and path.suffix.lower() not in {".pdf", ".epub"}:
        failures.append(f"academic source-like artifact is present: {path.relative_to(root)}")

if failures:
    print("MOBILE MASTER BACKLOG VALIDATION: FAIL")
    for failure in failures:
        print(f"- {failure}")
    sys.exit(1)

print("MOBILE MASTER BACKLOG VALIDATION: PASS")
print("- canonical functional stories: 73; Product Generation V1: 73")
print("- historical planning bands: V1 28, V2 35, V3 9, V4_FUTURE 1")
print("- academic Sprints: Sprint 1 4, Sprint 2 21, Sprint 3 24, Sprint 4 24")
print("- Epic membership, lifecycle fields, AC maturity, reconciliation and publication boundary: PASS")
PY
