---
status: draft
maturity: DRAFT
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# BC-04 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Aggregate | Tables | PK/FK and boundary |
|---|---|---|
| Request draft | `request_draft`, `request_draft_line` | draft line FK; buyer relationship/SKU are stable IDs |
| Purchase Request | `purchase_request`, `purchase_request_line`, `material_change_proposal` | request-owned lines/proposals; request FK; snapshots immutable |
| Commitment | `commercial_commitment`, `commercial_commitment_line`, `commitment_owner_transfer`, `sales_commitment_adjustment` | commitment-owned lines/transfers/adjustments; request FK |
| Sales Order | `sales_order`, `sales_order_line` | commitment FK; SO is born `CONFIRMED`; order line pair unique |

SQL defines tenant/workspace scope, PK/FK, NOT NULL columns, positive quantities, money and
revision/status checks, unique aggregate pairs and scope/status indexes.
`price_snapshot`, `terms_snapshot` and material change JSON are immutable
decision snapshots; no arbitrary JSON model replaces relational ownership.
RLS is required by tenant/workspace deployment policy.

`buyer_relationship_id`, `sku_id`, identity IDs and downstream decision IDs
are stable non-owning references. Transaction boundary: submit PR,
commitment, inventory backing and applicable credit reservation must be one
logical decision. AS-IS anchors: sales drafts, purchase requests, commitments,
sales orders, events and sequences; see [mapping](../../../../data/as-is-to-target-mapping.md).
Sales Order status preserves `CONFIRMED`, `IN_FULFILLMENT`,
`PARTIALLY_FULFILLED`, `FULFILLED`, `PARTIALLY_DELIVERED`,
`COMPLETED` and `CANCELLED`; `COMPLETED` means no unresolved
commercial/fulfillment quantity, not financial settlement.
