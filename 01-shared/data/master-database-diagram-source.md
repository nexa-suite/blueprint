---
status: draft
maturity: DRAFT
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# Master database-diagram source and academic handoff

## Canonical source

Import [master-target-relational-model.sql](master-target-relational-model.sql)
into Vertabelo (preferred) or LucidChart. SQL is PostgreSQL-oriented but avoids
extensions, functions and schema-per-BC assumptions so academic import remains
portable. Per-BC SQL files are readable grading lenses; this master is the
system poster.

For local visual review, use the generated [PlantUML projection](master-database-diagram.puml),
[SVG](master-database-diagram.svg) or [PNG](master-database-diagram.png).
SQL remains the authority; the PlantUML ERD is generated from the reviewed SQL
and is not a second schema definition.

## Diagram organization

Group tables by `BC-01` through `BC-11` logical owner labels in
[master-data-model.md], plus `Shared Technical Infrastructure`. Use crow's-foot
relationships generated from same-owner foreign keys. Keep cross-BC ID
references as annotated non-owning links; never draw composition across
contexts.

## Required annotations

1. Add note: `TARGET / shared PostgreSQL / logical BC ownership; not eleven databases.`
2. Mark every `tenant_id` and `workspace_id` scope column.
3. Mark PK, FK, required and unique columns from SQL.
4. Add notes for immutable documents, POD/addenda, traceability, Object Storage
   references, RLS expectation and Mobile-local separation.
5. Export one Master diagram and one readable diagram per BC in the
   instructor-approved format. Do not export credentials, sessions or dumps.

## External render gate

No authenticated Vertabelo/LucidChart workspace is available in this local
execution context. The local PlantUML SVG/PNG is a review projection, not an
authenticated external-tool export. No external artifact is claimed.

**ACADEMIC DATABASE RENDER: HANDOFF REQUIRED.**

Minimal human action: import SQL, apply grouping above, render Master plus
eleven BC diagrams, inspect relationship legibility, then attach exports to the
academic report. Product architecture and import-source coverage remain
complete.
