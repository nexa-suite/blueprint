---
status: accepted
scope: cross-cutting
owner: governance
last-reviewed: 2026-08-12
---

# Documentation standard

## Maturity vocabulary

Use these statuses for major documentation areas and records:

`NOT STARTED`, `DISCOVERY`, `DRAFT`, `BASELINED`, `FROZEN`, `BLOCKED`, `SUPERSEDED`, `HISTORICAL`.

Status means documentation maturity, not code completion or product completeness. A document may also state `VERIFIED`, `CLOSED WITH CAVEAT` or `NOT DEFINED` when those are the accepted evidence labels for a baseline or unresolved TARGET area.

- Use lower-kebab-case filenames.
- Keep one authoritative document per question.
- Separate AS-IS, TARGET and FUTURE / RUNWAY.
- Prefer editable source files before generated exports.
- Co-locate visuals with the concept they document.
- Do not create invented documentation to fill directories.
- Every major area must state what exists, its maturity, its authority, unresolved items and the activity that will resolve them.
- Canonical documents may use lightweight YAML metadata with `status`, `scope`, `owner` and `last-reviewed`.
- Allowed statuses: `accepted`, `draft`, `planned`, `reference`, `deprecated`.
- Allowed scopes: `v1`, `runway`, `v2`, `cross-cutting`.
