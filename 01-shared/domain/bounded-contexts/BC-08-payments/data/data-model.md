---
status: draft
maturity: DRAFT
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# BC-08 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Table | PK / local FK | Integrity and evidence |
|---|---|---|
| `payment` | `payment_id` | tenant/workspace scope; money/status checks; version |
| `payment_attempt` | `attempt_id`; payment FK | provider attempt history |
| `payment_provider_event` | `event_id`; optional payment FK | provider/event ID unique; payload hash; immutable JSONB |
| `payment_refund` | `refund_id`; payment FK | positive amount; refund lifecycle |
| `payment_correction` | `correction_id`; payment FK | approved/posting lifecycle |
| `payment_reconciliation_case` | `case_id`; payment FK | scoped mismatch workflow |

SQL carries PK, local FK, NOT NULL, money/status checks, idempotent provider
uniqueness and operational indexes. RLS scopes tenant/workspace. Provider
payload JSONB is explicitly immutable evidence; no secret or credential is
stored by this model.

Commitment, receivable, customer and actor IDs are stable non-owning refs.
Payment confirmation is server-authoritative; offline mobile state cannot
prove success. AS-IS anchors: payment, attempt, event, reconciliation and
Stripe inbox tables.
