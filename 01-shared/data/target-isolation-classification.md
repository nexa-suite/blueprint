---
status: draft
maturity: DRAFT
scope: v1
owner: security
last-reviewed: 2026-08-25
---

# TARGET tenant and workspace isolation classification

This is canonical TARGET input for API RLS implementation. It classifies every
table in master-target-relational-model.sql. It does not add PostgreSQL
policies or authorize migrations.

## Policy vocabulary

| Classification | Policy intent |
|---|---|
| TENANT_SCOPED_RLS | Direct tenant predicate; workspace may be nullable for tenant-wide facts. |
| WORKSPACE_SCOPED_RLS | Direct tenant and workspace predicates. |
| TENANT_SYSTEM_QUEUE | Technical queue may contain system work; scoped rows retain tenant/workspace and workers reconstruct scope explicitly. |
| GLOBAL_IDENTITY | Deliberately global identity authority; tenant membership is stored elsewhere. |
| GLOBAL_REFERENCE | Shared immutable reference data; no tenant ownership. |
| TECHNICAL_GLOBAL | Cross-tenant technical metadata with no business ownership; privileged access is explicit and audited. |
| NOT_APPLICABLE | No tenant policy because table is outside business persistence. |

## Exhaustive table classification

| Classification | Tables |
|---|---|
| TENANT_SCOPED_RLS | tenant, company_onboarding_request, business_traceability_record, security_audit_event |
| WORKSPACE_SCOPED_RLS | workspace, role_definition, customer_account, buyer_relationship, product, price_list, customer_terms, promotion, request_draft, purchase_request, commercial_commitment, sales_order, warehouse, inventory_backing, warehouse_transfer, fulfillment, delivery, credit_account, receivable, payment, payment_reconciliation_case, document_number_series, business_document, notification_template, notification, notification_preference |
| WORKSPACE_SCOPED_RLS (parent-derived) | workforce_membership, membership_role, role_capability, membership_capability_override, customer_contact, customer_address, buyer_relationship_history, sku, catalog_media, price_list_item, base_price, promotion_sku, request_draft_line, purchase_request_line, material_change_proposal, commercial_commitment_line, commitment_owner_transfer, sales_commitment_adjustment, sales_order_line, inventory_lot, inventory_position, inventory_movement, safety_stock_policy, inventory_backing_line, physical_allocation, physical_allocation_line, inventory_adjustment, warehouse_transfer_line, lot_disposition, fulfillment_line, picking_result, picking_discrepancy, delivery_assignment, delivery_attempt, delivery_attempt_line, delivery_quantity_outcome, proof_of_delivery, proof_of_delivery_addendum, temperature_evidence, temperature_excursion, continuation_delivery, credit_reservation, receivable_application, financial_adjustment, financial_ledger_entry, payment_attempt, payment_provider_event, payment_refund, payment_correction, document_snapshot_line, document_revision, object_storage_reference, document_generation_request, notification_recipient, notification_attempt, traceability_evidence_reference |
| TENANT_SYSTEM_QUEUE | outbox_event, inbox_deduplication, idempotency_record, worker_lease |
| GLOBAL_IDENTITY | human_identity, capability_definition |
| GLOBAL_REFERENCE | None in this TARGET model; API reference tables remain AS-IS evidence until explicitly modeled. |
| TECHNICAL_GLOBAL | None; technical rows above retain scope or queue identity. |
| NOT_APPLICABLE | None. |

## Parent-derived policy

Child tables without direct scope columns are not unprotected. Their policy
uses an EXISTS relationship to nearest scoped owner, or implementation may
denormalize immutable tenant/workspace keys when required for PostgreSQL policy
performance. API implementation must preserve owner and child scope consistency
with USING and WITH CHECK.

human_identity is global identity only. It never grants tenant access without
an active scoped membership or buyer relationship. capability_definition is
global reference-like policy metadata; grants remain scoped through BC-01 rows.

System queues allow explicit system processing, never implicit cross-tenant
business reads. Worker paths set transaction-local scope for tenant work, clear
it on connection return and use separately audited maintenance access only for
queue inspection or repair.
