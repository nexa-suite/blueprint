#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
export ROOT_DIR

python3 "$ROOT_DIR/tooling/scripts/generate-target-database-diagrams.py" --check

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

expected_aggregate_roots = {
    "BC-01": {"Tenant", "HumanIdentity", "CompanyOnboardingRequest", "WorkforceMembership", "RoleDefinition"},
    "BC-02": {"CustomerAccount", "BuyerRelationship"},
    "BC-03": {"Product", "Sku", "PriceList", "CustomerTerms", "Promotion"},
    "BC-04": {"RequestDraft", "PurchaseRequest", "CommercialCommitment", "SalesOrder"},
    "BC-05": {"Warehouse", "InventoryLot", "InventoryPosition", "InventoryReservation", "PhysicalAllocation", "WarehouseTransfer"},
    "BC-06": {"Fulfillment", "Delivery", "ProofOfDelivery", "TemperatureEvidence"},
    "BC-07": {"CreditAccount", "CreditReservation", "Receivable", "FinancialAdjustment"},
    "BC-08": {"Payment", "PaymentReconciliationCase"},
    "BC-09": {"DocumentNumberSeries", "BusinessDocument"},
    "BC-10": {"NotificationTemplate", "Notification", "NotificationPreference"},
    "BC-11": {"BusinessTraceabilityRecord"},
}

def sql_tables(path: Path) -> list[str]:
    return re.findall(r"(?im)^\s*CREATE\s+TABLE\s+([a-z][a-z0-9_]*)\s*\(", path.read_text())

def frontmatter(path: Path) -> dict[str, str]:
    match = re.match(r"\A---\n(.*?)\n---(?:\n|\Z)", path.read_text(), re.DOTALL)
    if not match:
        return {}
    return dict(re.findall(r"(?m)^([A-Za-z][A-Za-z0-9_-]*):\s*(.+?)\s*$", match.group(1)))

def require_lifecycle(path: Path) -> None:
    metadata = frontmatter(path)
    if metadata.get("status") != "accepted":
        failures.append(f"{path.relative_to(root)} frontmatter status must be 'accepted'")
    if metadata.get("maturity") != "BASELINED":
        failures.append(f"{path.relative_to(root)} frontmatter maturity must be 'BASELINED'")

all_target: list[str] = []
for bc in bc_dirs:
    code = bc.name[:5]
    tactical = bc / "tactical-model.md"
    diagram = bc / "diagrams/domain-model.puml"
    data_doc = bc / "data/data-model.md"
    sql = bc / "data/target-relational-model.sql"
    db_diagram = bc / "data/database-diagram.puml"
    readme = bc / "README.md"
    for required in (tactical, diagram, data_doc, sql, db_diagram):
        if not required.is_file():
            failures.append(f"missing {required.relative_to(root)}")
    if code not in expected:
        failures.append(f"unexpected BC code {code}")
        continue
    if tactical.is_file():
        text = tactical.read_text()
        require_lifecycle(tactical)
        for marker in ("scope: v1", "Aggregate boundaries", "AS-IS", "TARGET"):
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
        actual_roots = set(re.findall(r"(?m)^class\s+(\w+)\s+<<Aggregate Root>>", text))
        expected_roots = expected_aggregate_roots.get(code, set())
        if actual_roots != expected_roots:
            failures.append(f"{diagram.relative_to(root)} Aggregate Root set differs: {sorted(actual_roots)}")
        for relation in re.finditer(r"(?m)^\s*(\w+).*?\*--.*?\b(\w+)\s*(?::|$)", text):
            source, target = relation.groups()
            if source in actual_roots and target in actual_roots:
                failures.append(f"{diagram.relative_to(root)} composes Aggregate Root {source} into Aggregate Root {target}")
    if readme.is_file() and tactical.is_file():
        readme_text = readme.read_text().lower()
        tactical_text = tactical.read_text().lower()
        for aggregate_root in expected_aggregate_roots.get(code, set()):
            marker = aggregate_root.lower()
            if marker not in readme_text:
                failures.append(f"{readme.relative_to(root)} does not classify {aggregate_root} as an Aggregate Root")
            if not re.search(rf"\|\s*`?{re.escape(aggregate_root)}s?`?\s*\|\s*Aggregate Root", tactical.read_text(), re.IGNORECASE):
                failures.append(f"{tactical.relative_to(root)} does not classify {aggregate_root} as an Aggregate Root")
    if data_doc.is_file():
        text = data_doc.read_text()
        require_lifecycle(data_doc)
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

classification = root / "01-shared/data/target-isolation-classification.md"
if not classification.is_file():
    failures.append(f"missing {classification.relative_to(root)}")
else:
    classification_text = classification.read_text()
    for table in all_target + shared:
        if not re.search(rf"(?<![a-z0-9_]){re.escape(table)}(?![a-z0-9_])", classification_text):
            failures.append(f"RLS classification missing table: {table}")

target_documents = [
    root / "01-shared/data/as-is-to-target-mapping.md",
    root / "01-shared/data/master-data-model.md",
    root / "01-shared/data/master-database-diagram-source.md",
    root / "01-shared/data/product-data-participation.md",
    root / "01-shared/data/tactical-traceability-matrix.md",
    root / "01-shared/data/target-isolation-classification.md",
]
for path in target_documents:
    if not path.is_file():
        continue
    text = path.read_text()
    require_lifecycle(path)

master = root / "01-shared/data/master-target-relational-model.sql"
if not master.is_file():
    failures.append(f"missing {master.relative_to(root)}")
else:
    master_text = master.read_text()
    master_tables = sql_tables(master)
    expected_master = all_target + shared
    if master_tables != expected_master:
        failures.append(f"master table order/set differs: expected {len(expected_master)}, found {len(master_tables)}")
    if re.search(r"(?im)^\s*CREATE\s+SCHEMA\b", master_text):
        failures.append("master SQL creates schema-per-BC structures")

inventory_sql = root / "01-shared/domain/bounded-contexts/BC-05-inventory-availability/data/target-relational-model.sql"
for path in (inventory_sql, master):
    if not path.is_file():
        continue
    text = path.read_text()
    required_fragments = (
        "CREATE TABLE inventory_backing_line (",
        "warehouse_id uuid NOT NULL REFERENCES warehouse (warehouse_id)",
        "UNIQUE (backing_id, warehouse_id, sku_id)",
    )
    if not all(fragment in text for fragment in required_fragments):
        failures.append(f"{path.relative_to(root)} must preserve deterministic SKU + Warehouse Backing")

if inventory_sql.is_file():
    inventory_text = inventory_sql.read_text()
    for fragment in (
        "CHECK (reserved_quantity + held_quantity <= on_hand_quantity)",
        "Projection of active InventoryReservation protection",
        "do not subtract both",
    ):
        if fragment not in inventory_text:
            failures.append(f"{inventory_sql.relative_to(root)} missing reserved-quantity single-subtraction guard: {fragment}")
    inventory_docs = [
        root / "01-shared/domain/bounded-contexts/BC-05-inventory-availability/README.md",
        root / "01-shared/domain/bounded-contexts/BC-05-inventory-availability/tactical-model.md",
        root / "01-shared/domain/bounded-contexts/BC-05-inventory-availability/data/data-model.md",
    ]
    if any("second subtraction" not in path.read_text().lower() and "subtracted twice" not in path.read_text().lower() for path in inventory_docs):
        failures.append("BC-05 README, tactical model and data model must state Warehouse Backing is not a second subtraction")

delivery_sql = root / "01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/data/target-relational-model.sql"
delivery_states = (
    "PLANNED", "SCHEDULED", "DISPATCHED", "IN_TRANSIT", "ATTEMPTED",
    "DELIVERED", "PARTIALLY_DELIVERED", "ATTEMPT_FAILED", "RESCHEDULED",
    "CANCELLED", "FAILED_FINAL",
)
if delivery_sql.is_file():
    delivery_text = delivery_sql.read_text()
    for state in delivery_states:
        if state not in delivery_text:
            failures.append(f"Delivery SQL missing canonical state {state}")
    for ambiguous in ("'PARTIAL'", "'FAILED'", "'ASSIGNED'"):
        if ambiguous in delivery_text:
            failures.append(f"Delivery SQL retains ambiguous lifecycle value {ambiguous}")
    for fragment in (
        "CREATE UNIQUE INDEX uq_delivery_assignment_active",
        "WHERE unassigned_at IS NULL",
        "buyer_relationship_id uuid NOT NULL",
        "child_delivery_id uuid NOT NULL",
        "UNIQUE (parent_delivery_id)",
        "UNIQUE (child_delivery_id)",
        "UNIQUE (tenant_id, workspace_id, idempotency_key)",
    ):
        if fragment not in delivery_text:
            failures.append(f"Delivery SQL missing required lifecycle/integrity fragment {fragment}")
    if "buyer_membership_id" in delivery_text:
        failures.append("Delivery SQL must use Buyer Relationship, not buyer_membership_id")
    for relative in (
        "01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md",
        "01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/tactical-model.md",
        "01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/data/data-model.md",
        "01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/diagrams/domain-model.puml",
    ):
        text = (root / relative).read_text()
        for state in delivery_states:
            if state not in text:
                failures.append(f"{relative} missing canonical Delivery state {state}")

receivable_sql = root / "01-shared/domain/bounded-contexts/BC-07-credit-receivables/data/target-relational-model.sql"
if receivable_sql.is_file():
    receivable_text = receivable_sql.read_text()
    for fragment in (
        "sales_order_id uuid NOT NULL",
        "business_document_id uuid,",
        "UNIQUE (tenant_id, workspace_id, sales_order_id)",
    ):
        if fragment not in receivable_text:
            failures.append(f"Receivable SQL missing canonical SalesOrder source fragment {fragment}")

state_sources = {
    "purchase-request-state": ("SUBMITTED", "CHANGES_PROPOSED", "CONVERTED", "REJECTED", "WITHDRAWN", "EXPIRED"),
    "fulfillment-state": ("PLANNED", "ALLOCATED", "PICKING", "PICKED", "PACKED", "STAGED", "READY_FOR_DISPATCH", "HANDED_OVER", "COMPLETED", "SHORTAGE", "HOLD", "CANCELLED"),
    "delivery-state": delivery_states,
    "warehouse-transfer-state": ("REQUESTED", "IN_TRANSIT", "RECEIVED"),
    "credit-reservation-state": ("ACTIVE", "RELEASED", "CONSUMED", "EXPIRED"),
    "payment-state": ("INITIATED", "AUTHORIZED", "CONFIRMED", "FAILED", "CANCELLED", "REFUNDED", "PARTIALLY_REFUNDED"),
}
for name, states in state_sources.items():
    source = root / "01-shared/domain/state-machines" / f"{name}.puml"
    if not source.is_file():
        failures.append(f"missing canonical state-machine source {source.relative_to(root)}")
        continue
    text = source.read_text()
    if "@startuml" not in text or "@enduml" not in text:
        failures.append(f"invalid PlantUML state-machine source {source.relative_to(root)}")
    for state in states:
        if state not in text:
            failures.append(f"{source.relative_to(root)} missing canonical state {state}")
    for suffix in (".svg", ".png"):
        if not source.with_suffix(suffix).is_file():
            failures.append(f"missing rendered state-machine artifact {source.with_suffix(suffix).relative_to(root)}")

domain_story_sources = (
    "01-buyer-commercial-intent", "02-controlled-pr-change", "03-stock-becoming-sellable",
    "04-partial-delivery-continuation", "05-independent-tenant-relationships",
    "06-payment-reconciliation", "07-security-audit-buyer-timeline",
)
for name in domain_story_sources:
    source = root / "01-shared/domain/processes/domain-storytelling" / f"{name}.puml"
    if not source.is_file():
        failures.append(f"missing current domain-storytelling source {source.relative_to(root)}")
        continue
    if "@startuml" not in source.read_text() or "@enduml" not in source.read_text():
        failures.append(f"invalid domain-storytelling PlantUML source {source.relative_to(root)}")
    for suffix in (".svg", ".png"):
        if not source.with_suffix(suffix).is_file():
            failures.append(f"missing rendered domain-storytelling artifact {source.with_suffix(suffix).relative_to(root)}")

semantic_markers = {
    "01-shared/domain/bounded-contexts/BC-03-catalog-commercial-policy/tactical-model.md": (
        "ResolvedOfferSnapshot",
        "Published Language",
        "`skuId`",
        "`unitPrice`",
        "`termsSnapshot`",
        "`promotionId` [0..1]",
        "`effectiveAt`",
        "not a Published Integration Event",
    ),
    "01-shared/domain/bounded-contexts/BC-04-sales-commitment/tactical-model.md": (
        "RequestSubmissionData",
        "PurchaseRequestFactory",
        "ResolvedOfferSnapshot",
        "Published Language / external contract",
        "`skuId`",
        "`unitPrice`",
        "`termsSnapshot`",
        "`promotionId` [0..1]",
        "`effectiveAt`",
        "does not own or recompute pricing policy",
        "not a Published Integration Event",
    ),
    "01-shared/domain/bounded-contexts/BC-05-inventory-availability/tactical-model.md": ("InventoryReservation", "WarehouseBacking"),
    "01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/tactical-model.md": ("Driver Outcome", "Buyer Receipt", "DeliveryHandoffToken", "BuyerReceiptFact", "Photo/signature evidence is required only when policy says so.", "external navigation handoff"),
    "01-shared/domain/bounded-contexts/BC-09-business-documents/tactical-model.md": ("Application Work Item", "ObjectStorageReference"),
    "01-shared/domain/bounded-contexts/BC-10-notifications/tactical-model.md": ("PushSubscription", "FUTURE/OPEN", "internal", "not a business Aggregate Root"),
}
for relative, markers in semantic_markers.items():
    path = root / relative
    if not path.is_file():
        failures.append(f"missing semantic tactical source {relative}")
        continue
    text = path.read_text()
    for marker in markers:
        if marker not in text:
            failures.append(f"{relative} missing reconciled semantic marker {marker!r}")

uml_semantic_markers = {
    "01-shared/domain/bounded-contexts/BC-03-catalog-commercial-policy/diagrams/domain-model.puml": (
        "class ResolvedOfferSnapshot",
        "-skuId: SkuId",
        "-unitPrice: Money",
        "-termsSnapshot: TermsSnapshot",
        "-promotionId: PromotionId [0..1]",
        "-effectiveAt: Instant",
        "Published Language contract",
        "not a Published Integration Event",
    ),
    "01-shared/domain/bounded-contexts/BC-04-sales-commitment/diagrams/domain-model.puml": (
        "class ResolvedOfferSnapshot",
        "-skuId: SkuId",
        "-unitPrice: Money",
        "-termsSnapshot: TermsSnapshot",
        "-promotionId: PromotionId [0..1]",
        "-effectiveAt: Instant",
        "Published Language contract",
        "does not recompute pricing policy",
        "not a Published Integration Event",
    ),
}
for relative, markers in uml_semantic_markers.items():
    path = root / relative
    if not path.is_file():
        failures.append(f"missing reconciled UML source {relative}")
        continue
    text = path.read_text()
    for marker in markers:
        if marker not in text:
            failures.append(f"{relative} missing reconciled UML marker {marker!r}")

delivery_flow = root / "01-shared/domain/processes/message-flows.md"
if not delivery_flow.is_file():
    failures.append(f"missing delivery flow source {delivery_flow.relative_to(root)}")
else:
    delivery_flow_text = delivery_flow.read_text()
    if "mandatory photographic evidence" in delivery_flow_text.lower():
        failures.append("Delivery flow must not make photographic evidence universally mandatory")
    if "optional policy-authorized evidence" not in delivery_flow_text:
        failures.append("Delivery flow must preserve optional policy-authorized evidence")
    if "external navigation handoff only; it does not persist Driver location" not in delivery_flow_text:
        failures.append("Delivery flow must preserve external navigation-only location boundary")
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

def table_body(sql_text: str, table: str) -> str:
    match = re.search(
        rf"(?ims)^\s*CREATE\s+TABLE\s+{re.escape(table)}\s*\((.*?)^\s*\);",
        sql_text,
    )
    return match.group(1) if match else ""


scope_integrity_contracts = {
    "BC-01-tenant-access-governance": (
        "UNIQUE (membership_id, workspace_id)",
        "UNIQUE (role_id, workspace_id)",
        "FOREIGN KEY (membership_id, workspace_id) REFERENCES workforce_membership (membership_id, workspace_id)",
        "FOREIGN KEY (role_id, workspace_id) REFERENCES role_definition (role_id, workspace_id)",
    ),
    "BC-02-customer-buyer-relationships": (
        "UNIQUE (customer_account_id, tenant_id, workspace_id)",
        "FOREIGN KEY (customer_account_id, tenant_id, workspace_id) REFERENCES customer_account (customer_account_id, tenant_id, workspace_id)",
    ),
    "BC-03-catalog-commercial-policy": (
        "UNIQUE (sku_id, tenant_id, workspace_id)",
        "FOREIGN KEY (price_list_id, tenant_id, workspace_id) REFERENCES price_list (price_list_id, tenant_id, workspace_id)",
        "FOREIGN KEY (promotion_id, tenant_id, workspace_id) REFERENCES promotion (promotion_id, tenant_id, workspace_id)",
        "FOREIGN KEY (sku_id, tenant_id, workspace_id) REFERENCES sku (sku_id, tenant_id, workspace_id)",
    ),
    "BC-04-sales-commitment": (
        "UNIQUE (purchase_request_id, tenant_id, workspace_id)",
        "UNIQUE (commitment_id, tenant_id, workspace_id)",
        "FOREIGN KEY (purchase_request_id, tenant_id, workspace_id) REFERENCES purchase_request (purchase_request_id, tenant_id, workspace_id)",
        "FOREIGN KEY (commitment_id, tenant_id, workspace_id) REFERENCES commercial_commitment (commitment_id, tenant_id, workspace_id)",
    ),
    "BC-05-inventory-availability": (
        "UNIQUE (warehouse_id, tenant_id, workspace_id)",
        "UNIQUE (backing_id, tenant_id, workspace_id)",
        "UNIQUE (allocation_id, tenant_id, workspace_id)",
        "FOREIGN KEY (backing_id, tenant_id, workspace_id) REFERENCES inventory_backing (backing_id, tenant_id, workspace_id)",
        "FOREIGN KEY (allocation_id, tenant_id, workspace_id) REFERENCES physical_allocation (allocation_id, tenant_id, workspace_id)",
        "FOREIGN KEY (lot_id, tenant_id, workspace_id) REFERENCES inventory_lot (lot_id, tenant_id, workspace_id)",
        "FOREIGN KEY (source_warehouse_id, tenant_id, workspace_id) REFERENCES warehouse (warehouse_id, tenant_id, workspace_id)",
        "FOREIGN KEY (destination_warehouse_id, tenant_id, workspace_id) REFERENCES warehouse (warehouse_id, tenant_id, workspace_id)",
    ),
    "BC-09-business-documents": (
        "UNIQUE (series_id, tenant_id, workspace_id)",
        "FOREIGN KEY (series_id, tenant_id, workspace_id) REFERENCES document_number_series (series_id, tenant_id, workspace_id)",
    ),
    "BC-10-notifications": (
        "UNIQUE (template_id, tenant_id, workspace_id)",
        "FOREIGN KEY (template_id, tenant_id, workspace_id) REFERENCES notification_template (template_id, tenant_id, workspace_id)",
    ),
}
for bc_name, fragments in scope_integrity_contracts.items():
    relative = f"01-shared/domain/bounded-contexts/{bc_name}/data/target-relational-model.sql"
    source = root / relative
    if not source.is_file():
        failures.append(f"missing scope-integrity source {relative}")
        continue
    normalized = re.sub(r"\s+", " ", source.read_text())
    for fragment in fragments:
        if fragment not in normalized:
            failures.append(f"{relative} missing required same-scope guard: {fragment}")

bc01_tactical = root / "01-shared/domain/bounded-contexts/BC-01-tenant-access-governance/tactical-model.md"
bc01_uml = root / "01-shared/domain/bounded-contexts/BC-01-tenant-access-governance/diagrams/domain-model.puml"
bc01_data = root / "01-shared/domain/bounded-contexts/BC-01-tenant-access-governance/data/data-model.md"
for path, markers in {
    bc01_tactical: ("Workspace-scoped role lifecycle", "`WorkspaceId`", "CapabilityDefinition` stays global"),
    bc01_uml: ("class RoleDefinition <<Aggregate Root>>", "-workspaceId: WorkspaceId", "RoleDefinition --> Workspace : scoped by identity"),
    bc01_data: ("`role_definition` is a Workspace-scoped Aggregate Root", "no global role template"),
}.items():
    if not path.is_file():
        failures.append(f"missing BC-01 role-scope source {path.relative_to(root)}")
        continue
    text = path.read_text()
    for marker in markers:
        if marker not in text:
            failures.append(f"{path.relative_to(root)} missing RoleDefinition workspace-scope marker: {marker}")
if bc01_tactical.is_file() and re.search(r"global templates|optional `tenantId`", bc01_tactical.read_text(), re.IGNORECASE):
    failures.append("BC-01 RoleDefinition must not reopen global template or optional-tenant scope")

bc10_sql = root / "01-shared/domain/bounded-contexts/BC-10-notifications/data/target-relational-model.sql"
bc10_tactical = root / "01-shared/domain/bounded-contexts/BC-10-notifications/tactical-model.md"
bc10_uml = root / "01-shared/domain/bounded-contexts/BC-10-notifications/diagrams/domain-model.puml"
bc10_data = root / "01-shared/domain/bounded-contexts/BC-10-notifications/data/data-model.md"
if bc10_sql.is_file():
    bc10_sql_text = bc10_sql.read_text()
    if "provider_token_hash" not in bc10_sql_text or "provider_endpoint_reference" in bc10_sql_text:
        failures.append("BC-10 current PostgreSQL TARGET must persist provider_token_hash only")
for path, markers in {
    bc10_tactical: ("`provider_token_hash`", "FUTURE / PROVIDER-ADAPTER INPUT", "NOT PERSISTED IN CURRENT POSTGRESQL TARGET"),
    bc10_uml: ("-providerTokenHash: ProviderTokenHash", "FUTURE / PROVIDER-ADAPTER INPUT", "NOT PERSISTED IN CURRENT POSTGRESQL TARGET"),
    bc10_data: ("persists only `provider_token_hash`", "has no\n`provider_endpoint_reference`", "NOT PERSISTED IN CURRENT POSTGRESQL TARGET"),
}.items():
    if not path.is_file():
        failures.append(f"missing BC-10 PushSubscription source {path.relative_to(root)}")
        continue
    text = path.read_text()
    for marker in markers:
        if marker not in text:
            failures.append(f"{path.relative_to(root)} missing PushSubscription persistence marker: {marker}")
if bc10_uml.is_file() and "SecureEndpointReference" in bc10_uml.read_text():
    failures.append("BC-10 UML must not model SecureEndpointReference as current PostgreSQL TARGET state")

root_guard_contracts = {
    "BC-01": {
        "Tenant": ("tenant", "version", None),
        "HumanIdentity": ("human_identity", "version", None),
        "CompanyOnboardingRequest": ("company_onboarding_request", "version", None),
        "WorkforceMembership": ("workforce_membership", "version", None),
        "RoleDefinition": ("role_definition", "version", None),
    },
    "BC-02": {
        "CustomerAccount": ("customer_account", "version", None),
        "BuyerRelationship": ("buyer_relationship", "version", None),
    },
    "BC-03": {
        "Product": ("product", "version", None),
        "Sku": ("sku", "version", None),
        "PriceList": ("price_list", "version", None),
        "CustomerTerms": ("customer_terms", "version", None),
        "Promotion": ("promotion", "version", None),
    },
    "BC-04": {
        "RequestDraft": ("request_draft", "version", None),
        "PurchaseRequest": ("purchase_request", "revision", None),
        "CommercialCommitment": ("commercial_commitment", "revision", None),
        "SalesOrder": ("sales_order", "revision", None),
    },
    "BC-05": {
        "Warehouse": ("warehouse", "version", None),
        "InventoryLot": ("inventory_lot", "version", None),
        "InventoryPosition": ("inventory_position", "version", None),
        "InventoryReservation": ("inventory_backing", "version", None),
        "PhysicalAllocation": ("physical_allocation", "version", None),
        "WarehouseTransfer": ("warehouse_transfer", "version", None),
    },
    "BC-06": {
        "Fulfillment": ("fulfillment", "version", None),
        "Delivery": ("delivery", "version", None),
        "ProofOfDelivery": ("proof_of_delivery", "expected-state", "WHERE pod_id = :id AND status = :expectedStatus"),
        "TemperatureEvidence": ("temperature_evidence", "append-only", None),
    },
    "BC-07": {
        "CreditAccount": ("credit_account", "version", None),
        "CreditReservation": ("credit_reservation", "version", None),
        "Receivable": ("receivable", "version", None),
        "FinancialAdjustment": ("financial_adjustment", "expected-state", "WHERE adjustment_id = :id AND status = :expectedStatus"),
    },
    "BC-08": {
        "Payment": ("payment", "version", None),
        "PaymentReconciliationCase": ("payment_reconciliation_case", "expected-state", "WHERE case_id = :id AND status = :expectedStatus"),
    },
    "BC-09": {
        "DocumentNumberSeries": ("document_number_series", "version", None),
        "BusinessDocument": ("business_document", "version", None),
    },
    "BC-10": {
        "NotificationTemplate": ("notification_template", "expected-state", "WHERE template_id = :id AND status = :expectedStatus"),
        "Notification": ("notification", "version", None),
        "NotificationPreference": ("notification_preference", "version", None),
    },
    "BC-11": {
        "BusinessTraceabilityRecord": ("business_traceability_record", "append-only", None),
    },
}
for code, contracts in root_guard_contracts.items():
    if set(contracts) != expected_aggregate_roots[code]:
        failures.append(f"validator concurrency contract differs from Aggregate Root set: {code}")
        continue
    bc = next((item for item in bc_dirs if item.name.startswith(code)), None)
    if not bc:
        failures.append(f"missing concurrency BC directory: {code}")
        continue
    tactical = (bc / "tactical-model.md").read_text()
    sql_text = (bc / "data/target-relational-model.sql").read_text()
    if "## Persistence concurrency guards" not in tactical:
        failures.append(f"{(bc / 'tactical-model.md').relative_to(root)} missing persistence concurrency guards")
        continue
    guard_section = tactical.split("## Persistence concurrency guards", 1)[1].split("\n## ", 1)[0]
    for aggregate, (table, mode, documented_predicate) in contracts.items():
        row = re.search(
            rf"(?im)^\|\s*`{re.escape(aggregate)}`\s*\|\s*Aggregate Root(?:\s*/[^|]+)?\s*\|.*$",
            tactical,
        )
        if not row:
            failures.append(f"{(bc / 'tactical-model.md').relative_to(root)} missing Aggregate Root row for concurrency contract: {aggregate}")
        body = table_body(sql_text, table)
        if not body:
            failures.append(f"{(bc / 'data/target-relational-model.sql').relative_to(root)} missing concurrency table: {table}")
            continue
        if table not in guard_section:
            failures.append(f"{(bc / 'tactical-model.md').relative_to(root)} does not document persistence guard for {aggregate}")
        if mode in {"version", "revision"}:
            if not re.search(rf"\b{mode}\s+(?:integer|bigint)\s+NOT NULL", body, re.IGNORECASE):
                failures.append(f"{(bc / 'data/target-relational-model.sql').relative_to(root)} missing {mode} guard for {aggregate}")
            if "CAS" not in guard_section or f"AND {mode} = :expected{mode.title()}" not in guard_section:
                failures.append(f"{(bc / 'tactical-model.md').relative_to(root)} lacks documented {mode} CAS predicate for {aggregate}")
        elif mode == "expected-state":
            if "status varchar" not in body or not documented_predicate or documented_predicate not in guard_section:
                failures.append(f"{(bc / 'tactical-model.md').relative_to(root)} lacks documented expected-state persistence guard for {aggregate}")
            if aggregate == "FinancialAdjustment" and "UNIQUE (adjustment_id)" not in sql_text:
                failures.append("BC-07 FinancialAdjustment must retain its unique ledger transition key")
        elif mode == "append-only" and "append-only" not in guard_section.lower():
            failures.append(f"{(bc / 'tactical-model.md').relative_to(root)} lacks append-only persistence classification for {aggregate}")

dynamic_source = root / "01-shared/architecture/c4/structurizr/l3/dynamic.dsl"
relationships_source = root / "01-shared/architecture/c4/structurizr/model/relationships.dsl"
if not dynamic_source.is_file() or not relationships_source.is_file():
    failures.append("missing canonical Dynamic View source or relationship source")
else:
    dynamic_blocks = re.findall(
        r'(?ms)^dynamic\s+\S+\s+"([^"]+)"[^\{]*\{\n(.*?)^\}',
        dynamic_source.read_text(),
    )
    expected_dynamic_keys = {
        "Nexa-Workflow-SubmitPurchaseRequest",
        "Nexa-Workflow-ConfirmDirectOrder",
        "Nexa-Workflow-ConvertPurchaseRequestToSalesOrder",
        "Nexa-Workflow-FulfillmentPickDispatchHandoff",
        "Nexa-Workflow-DeliveryPartialOutcomeContinuation",
        "Nexa-Workflow-BuyerHandoffReceiptDiscrepancy",
        "Nexa-Workflow-PaymentConfirmationReceivableApplication",
    }
    if {key for key, _ in dynamic_blocks} != expected_dynamic_keys:
        failures.append("Dynamic View source must retain exactly seven canonical workflows")
    required_outbox_sequence = (
        "BEGIN local transaction",
        "outbox",
        "COMMIT authoritative state and outbox atomically",
        "Later publisher reads committed outbox",
        "Publish at-least-once after commit",
    )
    for key, body in dynamic_blocks:
        positions = [body.find(marker) for marker in required_outbox_sequence]
        if -1 in positions or positions != sorted(positions):
            failures.append(f"{key} must persist outbox inside the local transaction before commit and publish only after commit")
    if "Later publishes committed outbox facts at-least-once after transaction" not in relationships_source.read_text():
        failures.append("C4 relationship source missing committed-outbox publisher relation")

for mobile in ("operations-mobile-local-persistence", "buyer-mobile-local-persistence"):
    md = root / f"03-mobile/architecture/data/{mobile}.md"
    puml = root / f"03-mobile/architecture/data/{mobile}.puml"
    for path in (md, puml):
        if not path.is_file():
            failures.append(f"missing {path.relative_to(root)}")
            continue
        text = path.read_text()
        for marker in ("ACCEPTED TARGET", "RESEARCH VALIDATION PENDING", "LOCAL", "NON-AUTHORITATIVE"):
            if marker not in text:
                failures.append(f"{path.relative_to(root)} missing {marker!r}")
        if path.suffix == ".puml" and not list(path.parent.glob("*.svg")):
            failures.append(f"missing rendered Mobile UML SVG beside {path.relative_to(root)}")
        if path.suffix == ".puml" and not list(path.parent.glob("*.png")):
            failures.append(f"missing rendered Mobile UML PNG beside {path.relative_to(root)}")

matrix = root / "01-shared/data/tactical-traceability-matrix.md"
backlog = root / "03-mobile/requirements/master-mobile-backlog.md"
if matrix.is_file():
    matrix_text = matrix.read_text()
    matrix_rows = [
        [cell.strip() for cell in line.strip().strip("|").split("|")]
        for line in matrix_text.splitlines()
        if re.match(r"^\|\s*BC-\d{2}\b", line)
    ]
    if len(matrix_rows) != 11:
        failures.append("requirement/aggregate/persistence/C4 matrix must have exactly 11 BC rows")
    if "V2+" in matrix_text:
        failures.append("tactical traceability matrix must not use obsolete V2+ Product-release semantics")
    def normalized_mobile_epics(cell: str) -> set[str]:
        return {
            f"MOBILE-EPIC-{number}"
            for number in re.findall(r"(?:MOBILE-EPIC-)?(\d{2})", cell)
        }

    actual_epics_by_bc = {
        row[0]: normalized_mobile_epics(row[2])
        for row in matrix_rows
        if len(row) >= 3
    }
    if set(actual_epics_by_bc) != set(expected):
        failures.append("tactical traceability matrix BC set differs from canonical data ownership")
    if backlog.is_file():
        expected_epics_by_bc = {code: set() for code in expected}
        for line in backlog.read_text().splitlines():
            if not line.startswith("| MOB-US-"):
                continue
            cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
            if len(cells) != 25:
                failures.append(f"master Mobile backlog row has unexpected column count: {cells[0] if cells else line}")
                continue
            epic = cells[3]
            context_ids = set(re.findall(r"BC-\d{2}", f"{cells[10]}, {cells[11]}"))
            for context_id in context_ids:
                if context_id not in expected_epics_by_bc:
                    failures.append(f"master Mobile backlog references non-canonical BC in trace derivation: {context_id}")
                else:
                    expected_epics_by_bc[context_id].add(epic)
        if actual_epics_by_bc != expected_epics_by_bc:
            failures.append("tactical traceability Mobile epics must derive from master backlog Primary/Secondary BC participation")
        all_epics = {f"MOBILE-EPIC-{number:02d}" for number in range(1, 13)}
        if set().union(*actual_epics_by_bc.values()) != all_epics:
            failures.append("tactical traceability Mobile epics must cover exactly MOBILE-EPIC-01..12")
else:
    failures.append(f"missing {matrix.relative_to(root)}")
c4_matrix = root / "01-shared/architecture/c4/component-rubric-coverage.md"
if c4_matrix.is_file() and len(re.findall(r"(?m)^\|\s*BC-\d{2}\b", c4_matrix.read_text())) != 11:
    failures.append("C4 component rubric matrix must have exactly 11 BC rows")
academic = root / "90-academic/tactical-ddd/web.md"
if academic.is_file() and len(re.findall(r"(?m)^\|\s*BC-\d{2}\b", academic.read_text())) != 11:
    failures.append("academic Web tactical projection must have exactly 11 BC rows")

c4_exports = root / "01-shared/architecture/c4/exports"
for level, expected_count in (("l1", 3), ("l2", 2), ("l3", 13), ("dynamic", 7), ("deployment", 2)):
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
print("- C4 exports: 27 SVG + 27 PNG (including 7 dynamic and 2 deployment views)")
print("- database ERD projections: 11 BC + 1 master; SVG + PNG present")
PY
