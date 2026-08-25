---
status: draft
maturity: DRAFT
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# BC-02 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Table | PK / local FK | Scope and integrity |
|---|---|---|
| `customer_account` | `customer_account_id` | `tenant_id, workspace_id` NOT NULL; tax identifier scoped unique |
| `customer_contact` | `contact_id`; `customer_account_id` | account FK; identity is non-owning BC-01 ID; role pair unique |
| `customer_address` | `address_id`; `customer_account_id` | account FK; address kind and default semantics |
| `buyer_relationship` | `relationship_id`; `customer_account_id` | tenant/workspace scope; customer + human identity unique |
| `buyer_relationship_history` | `history_id`; `relationship_id` | append transition fact; changed actor is stable identity ID |

SQL defines required columns, status/kind checks, positive/monotonic fields,
unique constraints and scope/status indexes. RLS is required at deployment for
`tenant_id` and `workspace_id`; no policy is fabricated in the import source.

`human_identity_id` and actor IDs are cross-BC stable references. Customer
account, contact, address and relationship lifecycle is BC-02-owned; history
is append-only. AS-IS: `sales.client_account`, `client_account_address`,
`client_account_membership`, plus verified identity references. Mapping is
[AS-IS-to-TARGET](../../../../data/as-is-to-target-mapping.md).
