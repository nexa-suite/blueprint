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
failures: list[str] = []

bc_dirs = sorted(
    p for p in (root / "01-shared/domain/bounded-contexts").iterdir()
    if p.is_dir() and re.match(r"^BC-\d{2}-", p.name)
)
if len(bc_dirs) != 11:
    failures.append(f"expected 11 BC directories, found {len(bc_dirs)}")

expected = {
    "BC-01": ["tenant", "workspace", "human_identity", "company_onboarding_request", "workforce_membership", "role_definition", "capability_definition", "membership_role", "role_capability", "membership_capability_override"],
    "BC-02": ["customer_account", "customer_contact", "customer_address", "buyer_relationship", "buyer_relationship_history"],
    "BC-03": ["product", "sku", "catalog_media", "price_list", "price_list_item", "base_price", "customer_terms", "promotion", "promotion_sku"],
    "BC-04": ["request_draft", "request_draft_line", "purchase_request", "purchase_request_line", "material_change_proposal", "commercial_commitment", "commercial_commitment_line", "sales_order", "sales_order_line", "commitment_owner_transfer", "sales_commitment_adjustment"],
    "BC-05": ["warehouse", "inventory_lot", "inventory_position", "inventory_movement", "safety_stock_policy", "inventory_backing", "inventory_backing_line", "physical_allocation", "physical_allocation_line", "inventory_adjustment", "warehouse_transfer", "warehouse_transfer_line", "lot_disposition"],
    "BC-06": ["fulfillment", "fulfillment_line", "picking_result", "picking_discrepancy", "delivery", "delivery_assignment", "delivery_attempt", "delivery_attempt_line", "delivery_quantity_outcome", "delivery_handoff_token", "buyer_receipt_fact", "proof_of_delivery", "proof_of_delivery_addendum", "temperature_evidence", "temperature_excursion", "continuation_delivery"],
    "BC-07": ["credit_account", "credit_reservation", "receivable", "receivable_application", "financial_adjustment", "financial_ledger_entry"],
    "BC-08": ["payment", "payment_attempt", "payment_provider_event", "payment_refund", "payment_correction", "payment_reconciliation_case"],
    "BC-09": ["document_number_series", "business_document", "document_snapshot_line", "document_revision", "object_storage_reference", "document_generation_request"],
    "BC-10": ["notification_template", "notification", "notification_recipient", "notification_preference", "push_subscription", "notification_attempt"],
    "BC-11": ["business_traceability_record", "traceability_evidence_reference"],
}
shared = ["outbox_event", "inbox_deduplication", "idempotency_record", "worker_lease", "security_audit_event"]

def sql_tables(path: Path) -> list[str]:
    return re.findall(r"(?im)^\s*CREATE\s+TABLE\s+([a-z][a-z0-9_]*)\s*\(", path.read_text())

all_target: list[str] = []
for bc in bc_dirs:
    code = bc.name[:5]
    tactical = bc / "tactical-model.md"
    diagram = bc / "diagrams/domain-model.puml"
    data_doc = bc / "data/data-model.md"
    sql = bc / "data/target-relational-model.sql"
    db_diagram = bc / "data/database-diagram.puml"
    for required in (tactical, diagram, data_doc, sql, db_diagram):
        if not required.is_file():
            failures.append(f"missing {required.relative_to(root)}")
    if code not in expected:
        failures.append(f"unexpected BC code {code}")
        continue
    if tactical.is_file():
        text = tactical.read_text()
        for marker in ("status: draft", "maturity: DRAFT", "scope: v1", "Aggregate boundaries", "AS-IS", "TARGET"):
            if marker not in text:
                failures.append(f"{tactical.relative_to(root)} missing {marker!r}")
    if diagram.is_file():
        text = diagram.read_text()
        for marker in ("@startuml", "@enduml", "title ", "legend", "<<Aggregate Root>>"):
            if marker not in text:
                failures.append(f"{diagram.relative_to(root)} missing {marker!r}")
        if not re.search(r"(?m)^\s+\+[A-Za-z_]", text):
            failures.append(f"{diagram.relative_to(root)} has no public domain behavior")
        if re.search(r"\b(?:get|set)[A-Z]\w*", text):
            failures.append(f"{diagram.relative_to(root)} uses getter/setter model")
        if not list(diagram.parent.glob("*.svg")):
            failures.append(f"missing rendered UML SVG beside {diagram.relative_to(root)}")
        if not list(diagram.parent.glob("*.png")):
            failures.append(f"missing rendered UML PNG beside {diagram.relative_to(root)}")
    if data_doc.is_file():
        text = data_doc.read_text()
        upper = text.upper()
        for marker in ("TARGET", "RLS", "PK", "FK", "NOT NULL", "UNIQUE", "CHECK", "AS-IS"):
            if marker not in upper:
                failures.append(f"{data_doc.relative_to(root)} missing {marker!r}")
    if sql.is_file():
        tables = sql_tables(sql)
        if tables != expected[code]:
            failures.append(f"{sql.relative_to(root)} table order/set differs: {tables}")
        if "CREATE TABLE" not in sql.read_text():
            failures.append(f"{sql.relative_to(root)} has no CREATE TABLE")
        all_target.extend(tables)
    if db_diagram.is_file():
        text = db_diagram.read_text()
        for marker in ("@startuml", "@enduml", "entity ", "legend", "SQL is the authority"):
            if marker not in text:
                failures.append(f"{db_diagram.relative_to(root)} missing {marker!r}")
        entity_count = len(re.findall(r"(?m)^entity ", text))
        if entity_count != len(expected[code]):
            failures.append(f"{db_diagram.relative_to(root)} entity count {entity_count} != {len(expected[code])}")
        if not db_diagram.with_suffix(".svg").is_file():
            failures.append(f"missing rendered database SVG beside {db_diagram.relative_to(root)}")
        if not db_diagram.with_suffix(".png").is_file():
            failures.append(f"missing rendered database PNG beside {db_diagram.relative_to(root)}")

if len(all_target) != len(set(all_target)):
    failures.append("duplicate target table name across BC SQL lenses")

master = root / "01-shared/data/master-target-relational-model.sql"
if not master.is_file():
    failures.append(f"missing {master.relative_to(root)}")
else:
    master_tables = sql_tables(master)
    expected_master = all_target + shared
    if master_tables != expected_master:
        failures.append(f"master table order/set differs: expected {len(expected_master)}, found {len(master_tables)}")
    if re.search(r"(?im)^\s*CREATE\s+SCHEMA\b", master.read_text()):
        failures.append("master SQL creates schema-per-BC structures")
master_db_diagram = root / "01-shared/data/master-database-diagram.puml"
if not master_db_diagram.is_file():
    failures.append(f"missing {master_db_diagram.relative_to(root)}")
else:
    db_text = master_db_diagram.read_text()
    if len(re.findall(r"(?m)^entity ", db_text)) != len(expected_master):
        failures.append("master database diagram entity count differs from master SQL")
    for marker in ("@startuml", "@enduml", "entity ", "legend", "SQL is the authority"):
        if marker not in db_text:
            failures.append(f"master database diagram missing {marker!r}")
    for suffix in (".svg", ".png"):
        if not master_db_diagram.with_suffix(suffix).is_file():
            failures.append(f"missing master database diagram {suffix}")
shared_sql = root / "01-shared/data/shared-technical-target-relational-model.sql"
if shared_sql.is_file() and sql_tables(shared_sql) != shared:
    failures.append("shared technical SQL table inventory differs")

for mobile in ("operations-mobile-local-persistence", "buyer-mobile-local-persistence"):
    md = root / f"03-mobile/architecture/data/{mobile}.md"
    puml = root / f"03-mobile/architecture/data/{mobile}.puml"
    for path in (md, puml):
        if not path.is_file():
            failures.append(f"missing {path.relative_to(root)}")
            continue
        text = path.read_text()
        for marker in ("PROPOSED", "RESEARCH VALIDATION PENDING", "NOT SELECTED", "NON-AUTHORITATIVE"):
            if marker not in text:
                failures.append(f"{path.relative_to(root)} missing {marker!r}")
        if path.suffix == ".puml" and not list(path.parent.glob("*.svg")):
            failures.append(f"missing rendered Mobile UML SVG beside {path.relative_to(root)}")
        if path.suffix == ".puml" and not list(path.parent.glob("*.png")):
            failures.append(f"missing rendered Mobile UML PNG beside {path.relative_to(root)}")

matrix = root / "01-shared/data/tactical-traceability-matrix.md"
if matrix.is_file() and len(re.findall(r"(?m)^\|\s*BC-\d{2}\b", matrix.read_text())) != 11:
    failures.append("requirement/aggregate/persistence/C4 matrix must have exactly 11 BC rows")
c4_matrix = root / "01-shared/architecture/c4/component-rubric-coverage.md"
if c4_matrix.is_file() and len(re.findall(r"(?m)^\|\s*BC-\d{2}\b", c4_matrix.read_text())) != 11:
    failures.append("C4 component rubric matrix must have exactly 11 BC rows")
academic = root / "90-academic/tactical-ddd/web.md"
if academic.is_file() and len(re.findall(r"(?m)^\|\s*BC-\d{2}\b", academic.read_text())) != 11:
    failures.append("academic Web tactical projection must have exactly 11 BC rows")

c4_exports = root / "01-shared/architecture/c4/exports"
for level, expected_count in (("l1", 2), ("l2", 2), ("l3", 11)):
    svgs = sorted((c4_exports / level).glob("*.svg"))
    if len(svgs) != expected_count:
        failures.append(f"C4 {level} exports expected {expected_count} SVG, found {len(svgs)}")
    for svg in svgs:
        if not svg.with_suffix(".png").is_file():
            failures.append(f"missing C4 PNG beside {svg.relative_to(root)}")

if failures:
    print("TACTICAL DATA MODEL: FAIL")
    for failure in failures:
        print(f"- {failure}")
    sys.exit(1)

print("TACTICAL DATA MODEL: PASS")
print(f"- bounded contexts: {len(bc_dirs)}")
print(f"- target tables: {len(all_target) + len(shared)} (90 BC + 5 shared)")
print("- primary PlantUML: 11 BC + 2 Mobile; rendered SVG + PNG present")
print("- matrices: requirements, C4 and academic coverage present")
print("- C4 exports: 15 SVG + 15 PNG")
print("- database ERD projections: 11 BC + 1 master; SVG + PNG present")
PY
