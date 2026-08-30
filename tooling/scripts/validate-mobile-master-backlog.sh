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
failures: list[str] = []

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
historical_ids = {f"MOB-US-{i:03d}" for i in range(1, 50)}
release_values = {"V1", "V2", "V3", "V4_FUTURE"}
all_ids: set[str] = set()
release_ids: dict[str, set[str]] = {release: set() for release in release_values}

accepted_bc_ids = {f"BC-{i:02d}" for i in range(1, 12)}
accepted_cap_ids = {f"CAP-{i:02d}" for i in range(1, 17)}
capability_map = {}
for line in capability_path.read_text(encoding="utf-8").splitlines():
    match = re.match(r"^\| (CAP-\d{2}) \| (.*?) \|", line)
    if match:
        capability_map[match.group(1)] = match.group(2).strip()
status_values = {
    "PLANNED", "READY", "IN_PROGRESS", "IMPLEMENTED", "VERIFIED",
    "PRODUCT_ACCEPTED", "DEFERRED", "SUPERSEDED", "RETIRED",
}
backend_values = {"SUPPORTED", "PARTIAL", "OPEN", "NOT_REQUIRED"}
client_values = {"NOT_STARTED", "IN_PROGRESS", "IMPLEMENTED", "VERIFIED"}
research_values = {"NOT_REQUIRED", "PENDING", "RESEARCHING", "VALIDATED"}

def blocks(text: str):
    return list(re.finditer(
        r"^## (MOB-US-\d{3}) — (.*?)\n(.*?)(?=^## MOB-US-|\Z)",
        text,
        re.MULTILINE | re.DOTALL,
    ))

def field(block: str, name: str) -> str:
    match = re.search(rf"^\| {re.escape(name)} \|\s*(.*?)\s*\|$", block, re.MULTILINE)
    return match.group(1).strip() if match else ""

def ids(value: str) -> set[str]:
    result: set[str] = set()
    for match in re.finditer(r"MOB-US-(\d{3})(?:\.\.(\d{3}))?", value):
        start = int(match.group(1))
        end = int(match.group(2) or match.group(1))
        result.update(f"MOB-US-{number:03d}" for number in range(start, end + 1))
    return result

catalog = catalog_path.read_text(encoding="utf-8")
catalog_matches = blocks(catalog)
catalog_ids = [match.group(1) for match in catalog_matches]
catalog_blocks = {match.group(1): match.group(0) for match in catalog_matches}
if len(catalog_ids) != len(set(catalog_ids)):
    failures.append("canonical catalog contains duplicate story headings")
all_ids = set(catalog_ids)
catalog_numbers = sorted(int(story_id[-3:]) for story_id in catalog_ids)
if not catalog_numbers or catalog_numbers[0] != 1 or catalog_numbers != list(range(1, catalog_numbers[-1] + 1)):
    failures.append("canonical catalog story IDs must start at MOB-US-001 and remain contiguous")
if not historical_ids <= all_ids:
    failures.append("canonical catalog must retain historical MOB-US-001..049")

master = master_path.read_text(encoding="utf-8")
master_rows = []
for line in master.splitlines():
    if re.match(r"^\| MOB-US-\d{3} \|", line):
        master_rows.append([cell.strip() for cell in line.strip("|").split("|")])
master_by_id = {row[0]: row for row in master_rows if row}
master_target_by_id = {row[0]: row[4] for row in master_rows if len(row) > 4}
release_ids = {
    release: {story_id for story_id, target in master_target_by_id.items() if target == release}
    for release in release_values
}
v2_ids = release_ids["V2"]
v3_ids = release_ids["V3"]
if len(master_rows) != len(master_by_id) or set(master_by_id) != all_ids:
    failures.append(f"master lifecycle table must match canonical catalog IDs exactly; found {len(master_rows)}")
if release_ids["V1"] != v1_ids:
    failures.append("V1 must remain the exact frozen 28-story set")

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
    status = field(block, "Status")
    if status not in status_values:
        failures.append(f"{story_id} has uncontrolled Status: {status}")
    research = field(block, "Research status")
    if research not in research_values:
        failures.append(f"{story_id} has uncontrolled Research status: {research}")
    if not re.search(r"^### User Story\s*$", block, re.MULTILINE):
        failures.append(f"{story_id} lacks a human User Story section")
    statement = re.search(
        r"^### User Story\s*\n\s*As (?:a|an) .+?,\s*\n"
        r"I want .+?,\s*\nso that .+?\s*$",
        block,
        re.MULTILINE,
    )
    if not statement:
        failures.append(f"{story_id} lacks the actor/goal/value User Story form")
    story_text = statement.group(0) if statement else ""
    if re.search(
        r"\b(?:api|http|endpoint|database|table|schema|ui|ux|screen|component|"
        r"client|server|idempotenc\w*|synchron\w*|sync|framework|backend)\b",
        field(block, "Title") + " " + story_text,
        re.IGNORECASE,
    ):
        failures.append(f"{story_id} functional title/description contains engineering language")
    owning_bc = re.search(r"\bBC-\d{2}\b", field(block, "Owning Bounded Context"))
    if not owning_bc or owning_bc.group(0) not in accepted_bc_ids:
        failures.append(f"{story_id} maps to a non-canonical owning BC")
    capability_value = field(block, "Shared Capability")
    capability_pairs = re.findall(r"(CAP-\d{2})\s+—\s+([^;|]+)", capability_value)
    capability_ids = {capability_id for capability_id, _ in capability_pairs}
    if not capability_ids or not capability_ids <= accepted_cap_ids:
        failures.append(f"{story_id} maps to a non-canonical capability")
    for capability_id, capability_name in capability_pairs:
        if capability_name.strip() != capability_map.get(capability_id):
            failures.append(f"{story_id} capability name diverges from canonical map: {capability_id}")

    acceptance = re.search(
        r"^### Acceptance Criteria\s*\n(?P<body>.*?)(?=^## MOB-US-|^### Outcome Conditions|\Z)",
        block,
        re.MULTILINE | re.DOTALL,
    )
    scenarios = re.findall(r"^- Scenario: .*?$", acceptance.group("body"), re.MULTILINE) if acceptance else []
    condition_match = re.search(
        r"^### Outcome Conditions\s*\n(?P<body>.*?)(?=^## MOB-US-|\Z)",
        block,
        re.MULTILINE | re.DOTALL,
    )
    outcome_conditions = re.findall(r"^- .+?$", condition_match.group("body"), re.MULTILINE) if condition_match else []
    target = master_target_by_id.get(story_id, "")
    limits = {"V1": (3, 6), "V2": (2, 4), "V3": (1, 3)}
    if target in limits:
        low, high = limits[target]
        if not low <= len(scenarios) <= high:
            failures.append(f"{story_id} {target} requires {low}..{high} scenarios, found {len(scenarios)}")
        for scenario in scenarios:
            if not all(re.search(rf"\b{word}\b", scenario, re.IGNORECASE) for word in ("Given", "when", "then")):
                failures.append(f"{story_id} has a non-Gherkin scenario")
    elif target == "V4_FUTURE" and not outcome_conditions:
        failures.append(f"{story_id} V4/Future requires high-level Outcome Conditions")
    elif target not in release_values:
        failures.append(f"{story_id} has no valid Target Release in master lifecycle index")
    if target == "V4_FUTURE" and field(block, "Status") in {"READY", "IMPLEMENTED", "VERIFIED", "PRODUCT_ACCEPTED"}:
        failures.append(f"{story_id} cannot claim V4/Future delivery readiness or implementation")
    if story_id == "MOB-US-044" and "Push Subscription" in block:
        failures.append("MOB-US-044 exposes technical Push Subscription language")

expected_headers = [
    "ID", "Title", "Actor", "Epic", "Target Release", "Priority",
    "Story Points", "Sprint Planned", "Status", "Primary BC", "Secondary BCs",
    "Capability", "Backend Support", "Research Status", "Client Status",
    "Introduced In", "Sprint Implemented", "Implemented In", "Verified In",
    "Product Accepted In", "Description", "Mobile App", "Mobile Justification",
    "Dependencies",
]
header_line = next((line for line in master.splitlines() if line.startswith("| ID |")), "")
header_cells = [cell.strip() for cell in header_line.strip("|").split("|")] if header_line else []
if header_cells != expected_headers:
    failures.append("master lifecycle table headers do not expose the complete canonical field set")
expected_columns = len(expected_headers)
v1_s1 = {
    "MOB-US-001", "MOB-US-002", "MOB-US-003", "MOB-US-011", "MOB-US-012",
    "MOB-US-013", "MOB-US-014", "MOB-US-015", "MOB-US-016", "MOB-US-017", "MOB-US-019",
}
v1_s2 = {
    "MOB-US-020", "MOB-US-021", "MOB-US-022", "MOB-US-023", "MOB-US-024", "MOB-US-025",
    "MOB-US-026", "MOB-US-027", "MOB-US-028", "MOB-US-031", "MOB-US-032", "MOB-US-033", "MOB-US-034",
}
v1_s3 = {"MOB-US-044", "MOB-US-047", "MOB-US-048", "MOB-US-049"}
for row in master_rows:
    if len(row) != expected_columns:
        failures.append(f"{row[0] if row else 'unknown'} lifecycle row must have {expected_columns} columns, found {len(row)}")
        continue
    story_id = row[0]
    if any(not row[index] for index in range(20, expected_columns)):
        failures.append(f"{story_id} missing lifecycle projection field")
    target, status, backend, research, client = row[4], row[8], row[12], row[13], row[14]
    if target not in release_ids:
        failures.append(f"{story_id} has uncontrolled Target Release: {target}")
        continue
    if story_id not in release_ids[target]:
        failures.append(f"{story_id} is in the wrong Target Release: {target}")
    if status not in status_values:
        failures.append(f"{story_id} has uncontrolled master Status: {status}")
    if backend not in backend_values:
        failures.append(f"{story_id} has uncontrolled Backend Support: {backend}")
    if research not in research_values:
        failures.append(f"{story_id} has uncontrolled master Research Status: {research}")
    if client not in client_values:
        failures.append(f"{story_id} has uncontrolled Client Status: {client}")
    expected_sprint = (
        "S1" if story_id in v1_s1 else
        "S2" if story_id in v1_s2 else
        "S3" if story_id in v1_s3 else
        "UNASSIGNED"
    )
    if row[7] != expected_sprint:
        failures.append(f"{story_id} has an invalid Sprint Planned value")
    if target == "V1":
        if status != "PLANNED" or not row[6].isdigit() or int(row[6]) not in {1, 2, 3, 5, 8}:
            failures.append(f"{story_id} V1 lifecycle is not implementation-ready")
    elif target in {"V2", "V3"}:
        if status != "DEFERRED" or (not row[6].isdigit() and row[6] != "UNESTIMATED"):
            failures.append(f"{story_id} roadmap lifecycle is not coherent")
    else:
        if status != "PLANNED" or row[6] != "UNESTIMATED" or row[7] != "UNASSIGNED":
            failures.append(f"{story_id} V4/Future lifecycle is falsely ready")
    if row[16:20] != ["NOT_IMPLEMENTED", "NOT_IMPLEMENTED", "NOT_VERIFIED", "NOT_ACCEPTED"]:
        failures.append(f"{story_id} claims implementation, verification or Product Acceptance without evidence")
    if story_id in catalog_blocks:
        title_match = re.search(r"^## " + re.escape(story_id) + r" — (.*?)$", catalog_blocks[story_id], re.MULTILINE)
        epic_match = re.search(r"\bMOBILE-EPIC-\d{2}\b", field(catalog_blocks[story_id], "Epic"))
        bc_match = re.search(r"\bBC-\d{2}\b", field(catalog_blocks[story_id], "Owning Bounded Context"))
        cap_match = sorted(re.findall(r"\bCAP-\d{2}\b", field(catalog_blocks[story_id], "Shared Capability")))
        if not title_match or row[1] != title_match.group(1):
            failures.append(f"{story_id} title diverges between catalog and master lifecycle index")
        if row[2] != field(catalog_blocks[story_id], "Actor"):
            failures.append(f"{story_id} actor diverges between catalog and master lifecycle index")
        if not epic_match or row[3] != epic_match.group(0):
            failures.append(f"{story_id} Epic diverges between catalog and master lifecycle index")
        if not bc_match or row[9] != bc_match.group(0):
            failures.append(f"{story_id} primary BC diverges between catalog and master lifecycle index")
        if not cap_match or row[11] != cap_match[0]:
            failures.append(f"{story_id} capability diverges between catalog and master lifecycle index")

counts = Counter(row[4] for row in master_rows if len(row) >= expected_columns)
if set(counts) != release_values or sum(counts.values()) != len(all_ids):
    failures.append(f"release distribution does not cover canonical IDs: {dict(counts)}")

epic_text = epic_path.read_text(encoding="utf-8")
epic_map: dict[str, set[str]] = {}
for line in epic_text.splitlines():
    if line.startswith("| MOBILE-EPIC-"):
        cells = [cell.strip() for cell in line.strip("|").split("|")]
        if len(cells) >= 8:
            epic_map[cells[0]] = ids(cells[7])
expected_epics = {f"MOBILE-EPIC-{i:02d}" for i in range(1, 13)}
if set(epic_map) != expected_epics:
    failures.append(f"Epic index must contain MOBILE-EPIC-01..12: {sorted(epic_map)}")
epic_membership = [story_id for members in epic_map.values() for story_id in members]
if len(epic_membership) != len(set(epic_membership)) or set(epic_membership) != all_ids:
    failures.append("Epic index must assign every story exactly once")
for story_id, block in catalog_blocks.items():
    epic_match = re.search(r"\bMOBILE-EPIC-\d{2}\b", field(block, "Epic"))
    if not epic_match or story_id not in epic_map.get(epic_match.group(0), set()):
        failures.append(f"{story_id} has incorrect Epic index membership")

def ids_in_section(text: str, start: str, end=None) -> set[str]:
    section = text.split(start, 1)[1] if start in text else ""
    if end and end in section:
        section = section.split(end, 1)[0]
    return ids(section)

roadmap = roadmap_path.read_text(encoding="utf-8")
roadmap_sections = {
    "V1": ("## V1 — current course and Product commitment", "## V2 — refinement-ready"),
    "V2": ("## V2 — refinement-ready", "## V3 — roadmap-ready"),
    "V3": ("## V3 — roadmap-ready", "## V4/Future — hypothesis"),
    "V4_FUTURE": ("## V4/Future — hypothesis", "## Release gates"),
}
for release, expected in release_ids.items():
    start, end = roadmap_sections[release]
    if ids_in_section(roadmap, start, end) != expected:
        failures.append(f"release roadmap does not enumerate exactly the {release} stories")
if re.search(r"^### User Story\s*$", roadmap, re.MULTILINE):
    failures.append("release roadmap duplicates canonical story bodies")

sprint = sprint_path.read_text(encoding="utf-8")
v1_sprint_ids = ids_in_section(sprint, "## V1 planned slices", "## V2 candidate sequencing")
if v1_sprint_ids != v1_ids:
    failures.append("V1 sprint projection must contain exactly the 28 V1 stories")
v2_projection_ids = ids_in_section(sprint, "## V2 candidate sequencing", "## V3 and V4 runway")
if v2_projection_ids != v2_ids:
    failures.append("V2 sprint projection must contain exactly the 35 V2 stories")
if re.search(r"^### User Story\s*$", sprint, re.MULTILINE):
    failures.append("sprint projection duplicates canonical story bodies")
for sprint_name, points in (("S1", 37), ("S2", 46), ("S3", 16)):
    match = re.search(rf"^\| {sprint_name} \|.*\| (\d+) \|$", sprint, re.MULTILINE)
    if not match or int(match.group(1)) != points:
        failures.append(f"{sprint_name} planned points must equal {points}")

reconciliation = reconciliation_path.read_text(encoding="utf-8")
historical_matrix = reconciliation.split("## New independent story inventory", 1)[0]
historical_rows = [line for line in historical_matrix.splitlines() if re.match(r"^\| MOB-US-\d{3} \|", line)]
historical_matrix_ids = [re.match(r"^\| (MOB-US-\d{3}) \|", line).group(1) for line in historical_rows]
if set(historical_matrix_ids) != historical_ids or len(historical_matrix_ids) != len(historical_ids):
    failures.append("reconciliation must cover historical MOB-US-001..049 exactly once")
new_section = reconciliation.split("## New independent story inventory", 1)[1] if "## New independent story inventory" in reconciliation else ""
new_ids = [match.group(1) for match in re.finditer(r"^\| (MOB-US-\d{3}) \|", new_section, re.MULTILINE)]
if set(new_ids) != all_ids - historical_ids or len(new_ids) != len(all_ids - historical_ids):
    failures.append("reconciliation must explain every non-historical canonical story exactly once")

if readiness_path.is_file():
    readiness_ids = set(re.findall(r"^\|\s*(MOB-US-\d{3})\s*\|", readiness_path.read_text(encoding="utf-8"), re.MULTILINE))
    if readiness_ids != v1_ids:
        failures.append("story-to-design readiness must remain exactly the 28-story V1 set")
else:
    failures.append("missing V1 story-to-design readiness artifact")

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
new_count = len(all_ids - historical_ids)
counts_text = ", ".join(f"{release} {counts.get(release, 0)}" for release in ("V1", "V2", "V3", "V4_FUTURE"))
print(f"- canonical functional stories: {len(all_ids)} ({len(all_ids & historical_ids)} historical + {new_count} independent)")
print(f"- release distribution: {counts_text}")
print("- Epic membership, lifecycle fields, AC maturity, reconciliation and publication boundary: PASS")
PY
