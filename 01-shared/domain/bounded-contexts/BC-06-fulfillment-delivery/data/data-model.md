---
status: draft
maturity: DRAFT
scope: v1
owner: data
last-reviewed: 2026-08-29
---

# BC-06 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Aggregate/group | Tables | Integrity |
|---|---|---|
| Fulfillment | `fulfillment`, `fulfillment_line`, `picking_result`, `picking_discrepancy` | local FKs; pick/discrepancy quantities bounded |
| Delivery | `delivery`, `delivery_assignment`, `delivery_attempt`, `delivery_attempt_line`, `delivery_quantity_outcome` | attempt number unique; partial outcomes preserved |
| Handoff and Buyer outcome | `delivery_handoff_token`, `buyer_receipt_fact` | one-time bounded token; immutable Buyer accepted/disputed quantities and reason |
| POD | `proof_of_delivery`, `proof_of_delivery_addendum` | one POD/delivery; addendum append-only |
| Temperature | `temperature_evidence`, `temperature_excursion` | evidence/exception FKs; HOLD/disposition lifecycle |
| Continuation | `continuation_delivery` | parent delivery FK; remaining snapshot immutable |

Tenant/workspace scope, PK/FK, NOT NULL and status/quantity checks are in SQL.
Indexes cover execution queues, attempts and time evidence. Destination and
continuation snapshots use JSONB because they freeze variable evidence, not
because they replace delivery relations. RLS remains a deployment obligation.

`sales_order_id`, `physical_allocation_id`, SKU and operator IDs are stable
non-owning references. Handoff token is hashed, expiring, one-time and bound to
Delivery/Attempt/Customer; Buyer receipt is append-only and distinct from
Driver outcome/POD. POD success, temperature disposition and completion are
server-authoritative. AS-IS anchors: logistics dispatch, attempts, handoff/
receipt V93/V95, POD, temperature and continuation tables; tracking view is a
projection only. QR resolution is not acceptance.
