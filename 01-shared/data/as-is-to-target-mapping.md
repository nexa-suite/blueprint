---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# AS-IS to TARGET persistence mapping

## Evidence boundary

AS-IS was reconstructed from the API `origin/develop` at
`a19c6bfb4229549f91597f69c09aa6955517dfda`, using migration chain V1–V86 in
an ephemeral PostgreSQL 18.4 instance. Result: 12 database schemas, 129 base
tables, one view, 1,448 columns, 400 indexes and 56 RLS policies. No production
database was inspected. This is evidence, not permission to rename or migrate
the application. TARGET is governed by the accepted 11 Bounded Contexts.

Classification: `KEEP` preserves a concept; `REFINE` moves it into a target
aggregate/boundary; `REWORK` replaces a coupled implementation with a target
snapshot/aggregate; `TECHNICAL` belongs to shared reliability/security;
`PROJECTION` is read-only; `REVIEW` needs an explicit future decision.

## Mapping by current schema

### `audit`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `event` | REFINE | BC-11 `business_traceability_record`; retain append-only semantics and evidence links |

### `business_documents`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `business_document` | REFINE | BC-09 `business_document` |
| `document_generation_request` | REFINE | BC-09 generation lifecycle |
| `evidence_object` | REWORK | BC-09 `object_storage_reference` plus BC-11 evidence reference |
| `object_storage_object` | REFINE | BC-09 storage metadata; bytes remain outside PostgreSQL |

### `catalog_management`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `brand`, `category` | REFINE | BC-03 catalog classification; target model may extend Product metadata |
| `product`, `product_family` | REWORK | BC-03 `product`; Product is not SKU |
| `product_variant`, `sellable_sku` | REWORK | BC-03 `sku`; preserve sellable identity |
| `product_presentation` | REFINE | BC-03 SKU presentation attributes |
| `product_asset_reference` | REFINE | BC-03 `catalog_media` |
| `product_price`, `sku_price` | REWORK | BC-03 `base_price`, `price_list_item`, `customer_terms` |
| `product_visibility` | REFINE | BC-03 catalog policy/read model |
| `promotion`, `promotion_rule`, `promotion_sku` | REFINE | BC-03 promotion aggregate and SKU scope |
| `promotion_category`, `promotion_client_account`, `promotion_product` | REFINE | BC-03 targeting relations; customer IDs remain non-owning |
| `command_idempotency` | TECHNICAL | Shared `idempotency_record` |
| `seed_import_history` | TECHNICAL | operational seed evidence; not a domain aggregate |

### `iam`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `user_account`, `password_credential`, `refresh_session` | REFINE | BC-01 `human_identity`, `workforce_membership`; credential/session remains infrastructure |
| `authentication_failure`, `password_reset_request`, `password_reset_throttle_bucket` | TECHNICAL | security/identity implementation under BC-01 governance |
| `security_audit_event`, `security_notification_outbox` | TECHNICAL | Shared `security_audit_event` / outbox |
| `public_contact_request` | REVIEW | public Website intake; no target BC invented |
| `public_contact_throttle_bucket`, `system_operator_throttle_bucket`, `workspace_preview_throttle_bucket` | TECHNICAL | rate-limit evidence; shared security/runtime concern |

### `integration`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `outbox_event` | REFINE | Shared `outbox_event`; published event contracts remain governed |
| `inbox_event` | REFINE | Shared `inbox_deduplication` |
| `change_event` | PROJECTION | Shared trace/integration feed; BC-11 may consume, not own source aggregate |

### `logistics`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `dispatch_order`, `dispatch_number_counter` | REFINE | BC-06 `delivery`/numbering |
| `continuation_delivery`, `continuation_delivery_line` | REFINE | BC-06 `continuation_delivery` remaining snapshot |
| `delivery_attempt`, `delivery_attempt_line` | KEEP/REFINE | BC-06 delivery attempt and lines |
| `delivery_incident` | REFINE | BC-06 attempt/temperature exception workflow |
| `dispatch_event` | PROJECTION | Shared outbox/BC-11 trace; immutable event fact |
| `proof_of_delivery` | REFINE | BC-06 immutable POD |
| `operational_handoff_note` | REFINE | BC-06 delivery evidence/addendum candidate |
| `temperature_reading` | REFINE | BC-06 `temperature_evidence` / excursion |
| `command_idempotency` | TECHNICAL | Shared `idempotency_record` |
| `buyer_delivery_tracking` (view) | PROJECTION | BC-06 read projection; no target table |

### `notifications`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `inbox_item` | REFINE | BC-10 `notification`, recipient and attempts |

### `payments`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `payment`, `payment_attempt`, `payment_event` | REFINE | BC-08 payment aggregate, attempts and provider evidence |
| `stripe_event_inbox` | TECHNICAL/REFINE | BC-08 provider event idempotency; shared inbox semantics |
| `payment_reconciliation_case` | REFINE | BC-08 reconciliation aggregate |
| `credit_account`, `credit_reservation` | REFINE | BC-07 credit aggregate and reservation |
| `receivable`, `receivable_allocation` | REWORK | BC-07 receivable, application and append-only ledger |

### `reference_data`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `department`, `province`, `district`, `road_type` | KEEP/SHARED | global reference data; referenced by snapshots, not BC-owned aggregates |

### `sales`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `client_account`, `client_account_address`, `client_account_membership` | REFINE | BC-02 customer account, address and buyer relationship |
| `purchase_request`, `purchase_request_line`, `purchase_request_event` | REFINE | BC-04 Purchase Request; events go through shared outbox/BC-11 |
| `purchase_request_draft`, `purchase_request_draft_line`, `purchase_request_draft_destination`, `purchase_request_draft_route`, `purchase_request_draft_warehouse_selection` | REWORK | BC-04 request draft; destination/route become bounded snapshots or fulfillment input |
| `purchase_request_draft_idempotency`, `manual_order_idempotency`, `manual_sales_order_draft_idempotency`, `idempotency_record` | TECHNICAL | Shared `idempotency_record` |
| `commercial_commitment`, `commercial_commitment_line` | REFINE | BC-04 commitment aggregate |
| `sales_order`, `sales_order_line`, `sales_order_event`, `sales_order_sequence` | REFINE | BC-04 Sales Order, events and numbering |
| `manual_sales_order_draft`, `manual_sales_order_draft_line` | REWORK | BC-04 draft; manual channel is a command, not another BC |

### `tenant_management`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `tenant`, `workspace`, `organization_settings`, `tenant_security_settings`, `regional_settings`, `unit_preferences`, `operational_settings` | REFINE | BC-01 tenant/workspace governance and settings |
| `organization_registration`, `organization_registration_draft_idempotency` | REFINE | BC-01 `company_onboarding_request` plus shared idempotency |
| `organization_invitation`, `organization_invitation_idempotency`, `organization_invitation_role` | REFINE | BC-01 onboarding/membership invitation |
| `workspace_membership`, `membership_role_assignment`, `membership_role_definition` | REFINE | BC-01 workforce membership, role and role history |
| `role_definition`, `permission_definition`, `role_permission` | REFINE | BC-01 role/capability definitions and grants |
| `membership_authorization_state`, `membership_admin_event` | REFINE/TECHNICAL | BC-01 authorization projection and audit |
| `reference_plan_assignment` | REFINE | BC-01 plan/capability assignment; product plan semantics remain accepted decision |
| `custom_field_definition` | REVIEW | tenant governance extension; not promoted into a domain aggregate without decision |
| `notification_preference` | REFINE | BC-10 preference, with tenant governance scope |

### `warehouse`

| AS-IS object | Classification | TARGET owner / note |
|---|---|---|
| `warehouse`, `storage_zone` | REFINE | BC-05 warehouse and storage location |
| `inventory_lot`, `inventory_lot_disposition` | REFINE | BC-05 lot and disposition |
| `inventory_event`, `stock_movement` | REFINE | BC-05 append-only movement and event |
| `inventory_reservation`, `inventory_reservation_line`, `inventory_reservation_allocation` | REWORK | BC-05 backing and physical allocation |
| `inventory_transfer` | REFINE | BC-05 warehouse transfer |
| `inventory_temperature_evaluation` | REFINE | BC-05 lot/warehouse quality evidence; delivery temperature remains BC-06 |
| `safety_stock_policy` | REFINE | BC-05 safety policy |
| `selection_snapshot` | REWORK | BC-05 FEFO/backing snapshot |
| `command_idempotency` | TECHNICAL | Shared `idempotency_record` |
| `warehouse_service_configuration` | REFINE | BC-05 operational warehouse configuration |

## Evolution notes and non-actions

- V1–V86 are the AS-IS migration chain. V40/V48/V54/V65 show product and SKU
  evolution; V41 draft requests; V42 documents; V43 finance; V75 commitments;
  V79 delivery attempts; V80 safety stock/transfers; V86 onboarding drafts.
- Existing table names are not silently treated as TARGET names. The target
  model is a design projection with explicit KEEP/REFINE/REWORK classification.
- No Flyway migration, application code, API contract or production schema was
  changed by this wave. Physical placement and rollout remain later gates.
- Cross-BC links in the target SQL are stable IDs/snapshots. Same-owner FKs are
  the only referential constraints in per-BC models.

See [master data model](master-data-model.md), [tactical traceability](tactical-traceability-matrix.md)
and [C4 coverage](../architecture/c4/component-rubric-coverage.md).
