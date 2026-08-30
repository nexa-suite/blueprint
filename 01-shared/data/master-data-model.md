---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-08-29
---

# Nexa Target PostgreSQL Master Data Model

## Scope and ownership

This is the complete V1 relational landscape for accepted shared PostgreSQL.
Logical owner is strategic Bounded Context authority; physical table placement
remains an implementation/migration gate. Cross-BC references use stable IDs,
snapshots or contracts. Same-owner foreign keys protect local lifecycle
integrity.

| Owner | Target table inventory |
|---|---|
| BC-01 | `tenant`, `workspace`, `human_identity`, `company_onboarding_request`, `workforce_membership`, `role_definition`, `capability_definition`, `membership_role`, `role_capability`, `membership_capability_override` |
| BC-02 | `customer_account`, `customer_contact`, `customer_address`, `buyer_relationship`, `buyer_relationship_history` |
| BC-03 | `product`, `sku` (optional GTIN), `catalog_media`, `price_list`, `price_list_item`, `base_price`, `customer_terms`, `promotion`, `promotion_sku` |
| BC-04 | `request_draft`, `request_draft_line`, `purchase_request`, `purchase_request_line`, `material_change_proposal`, `commercial_commitment`, `commercial_commitment_line`, `sales_order`, `sales_order_line`, `commitment_owner_transfer`, `sales_commitment_adjustment` |
| BC-05 | `warehouse`, `inventory_lot`, `inventory_position`, `inventory_movement`, `safety_stock_policy`, `inventory_backing`, `inventory_backing_line`, `physical_allocation`, `physical_allocation_line`, `inventory_adjustment`, `warehouse_transfer`, `warehouse_transfer_line`, `lot_disposition` |
| BC-06 | `fulfillment`, `fulfillment_line`, `picking_result`, `picking_discrepancy`, `delivery`, `delivery_assignment`, `delivery_attempt`, `delivery_attempt_line`, `delivery_quantity_outcome`, `delivery_handoff_token`, `buyer_receipt_fact`, `proof_of_delivery`, `proof_of_delivery_addendum`, `temperature_evidence`, `temperature_excursion`, `continuation_delivery` |
| BC-07 | `credit_account`, `credit_reservation`, `receivable`, `receivable_application`, `financial_adjustment`, `financial_ledger_entry` |
| BC-08 | `payment`, `payment_attempt`, `payment_provider_event`, `payment_refund`, `payment_correction`, `payment_reconciliation_case` |
| BC-09 | `document_number_series`, `business_document`, `document_snapshot_line`, `document_revision`, `object_storage_reference`, `document_generation_request` |
| BC-10 | `notification_template`, `notification`, `notification_recipient`, `notification_preference`, `push_subscription`, `notification_attempt` |
| BC-11 | `business_traceability_record`, `traceability_evidence_reference` |
| Shared Technical Infrastructure | `outbox_event`, `inbox_deduplication`, `idempotency_record`, `worker_lease`, `security_audit_event` |

## Cross-BC reference policy

BC-04 stores `customer_account_id`, `buyer_relationship_id` and `sku_id` as
references, but does not own those records. BC-05 stores
`commercial_commitment_id` and `sku_id`, but owns Warehouse backing and
Physical Allocation. BC-06 stores `sales_order_id` and
`physical_allocation_id`, but owns execution and Delivery. BC-07 stores
`payment_id` on financial application records without owning Payment.

BC-04 `commercial_commitment.origin_type` is either `PURCHASE_REQUEST` or
`DIRECT_ORDER`. Only the approval-required origin carries the nullable
`purchase_request_id` FK, constrained to be present for that origin and absent
for Direct Order. Direct Order persists its confirmed `sales_order` through the
same Commitment boundary; no polymorphic FK or synthetic Purchase Request is
needed.

## Shared relational rules

- Tenant-owned tables carry `tenant_id NOT NULL`; Workspace-owned tables carry
  both `tenant_id` and `workspace_id NOT NULL`.
- Global `human_identity` and `capability_definition` are deliberate
  exceptions. Membership rows provide their tenant relationships.
- Mutable roots use `version` only where concurrent mutation is meaningful.
- Immutable facts use `occurred_at`, `created_at` or `issued_at`; no meaningless
  update timestamp is added to append-only records.
- `jsonb` appears only for immutable snapshots, provider payload preservation or
  variable evidence metadata, documented in per-BC models.
- Object Storage bytes never become PostgreSQL BLOBs. PostgreSQL stores object
  key, content type, size and hash metadata.

## Shared technical reliability invariants

- `outbox_event_id` is durable event identity. Repeated occurrences of same
  aggregate lifecycle event use new UUIDs; timestamp-based uniqueness does not
  suppress legitimate occurrences.
- `inbox_deduplication` stores consumer/message uniqueness, tenant/workspace
  reconstruction, claim lease, attempt, retry and dead-letter state. Consumers
  assume at-least-once delivery and remain idempotent.
- `idempotency_record` stores deterministic scope, operation, key, request
  fingerprint, state, replayable result, expiry and safe failure metadata.
- `worker_lease` is item claim with queue identity, tenant/workspace scope,
  lease token and fencing version. Queue workers reject stale completion.

## Current API v0.17 reconciliation

API v0.17.0 adds additive evidence for existing target ownership: optional GTIN
resolution on BC-03 SKU; FEFO and physical-allocation-aware picking in BC-05;
ephemeral handoff tokens plus immutable Buyer receipt/discrepancy facts in
BC-06; provider-neutral Push Subscription lifecycle in BC-10; and retry/claim/
dead-letter hardening in shared technical delivery. These are refinements of
accepted contexts, not new Bounded Contexts or Published Integration Events.

Full import-ready SQL: [master-target-relational-model.sql](master-target-relational-model.sql).
Visual ERD projection: [PlantUML](master-database-diagram.puml) · [SVG](master-database-diagram.svg) · [PNG](master-database-diagram.png).
