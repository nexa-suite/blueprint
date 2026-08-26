---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# BC-11 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Table | PK / local FK | Integrity |
|---|---|---|
| `business_traceability_record` | `traceability_id` | tenant scope; event/aggregate uniqueness; append-only |
| `traceability_evidence_reference` | `evidence_reference_id`; traceability FK | evidence type/hash; append-only |

SQL defines PK/FK, NOT NULL required event/aggregate/payload fields, evidence checks,
hash uniqueness and aggregate/time indexes. Workspace is nullable only for
tenant-wide traceability. RLS must protect tenant scope. Payload JSONB is an
immutable event snapshot; it is not a replacement for aggregate tables.

Aggregate IDs, actors, object references and source events are stable
non-owning IDs. No update/delete domain operation exists for records or
evidence. AS-IS anchors: `audit.event` and trace-oriented integration/change
events; see [AS-IS reconstruction](../../../../data/as-is-reconstruction.md).
