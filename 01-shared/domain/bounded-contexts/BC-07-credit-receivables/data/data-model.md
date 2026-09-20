---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-09-20
---

# BC-07 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Table | PK / local FK | Boundary rules |
|---|---|---|
| `credit_account` | `credit_account_id` | customer ID external; one account per tenant/customer |
| `credit_reservation` | `reservation_id`; credit account FK | commitment ID external; unique active decision key |
| `receivable` | `receivable_id` | confirmed SalesOrder ID required and unique per scope; BusinessDocument ID secondary/optional; outstanding bounded by original |
| `receivable_application` | `application_id`; receivable FK | payment ID external; reversal preserves history |
| `financial_adjustment` | `adjustment_id`; receivable FK | approval/posting lifecycle; positive amount |
| `financial_ledger_entry` | `entry_id`; receivable/adjustment/application FK | append-only ledger fact |

SQL defines money precision/currency, PK/FK, NOT NULL, amount/status checks,
uniques and due/ledger indexes. RLS scopes tenant/workspace. Available credit
is a domain calculation, not a denormalized authority column. A Receivable is
posted from confirmed `sales_order_id`; `business_document_id` is a secondary,
optional reference and neither delivery completion nor document issuance is a
universal posting trigger.

`customer_account_id`, `commercial_commitment_id`, `payment_id`,
`sales_order_id` and `business_document_id` are stable IDs across BCs. AS-IS anchors:
`payments.credit_account`, `credit_reservation`, `receivable` and allocation
tables; mapping remains explicit in [AS-IS-to-TARGET](../../../../data/as-is-to-target-mapping.md).
