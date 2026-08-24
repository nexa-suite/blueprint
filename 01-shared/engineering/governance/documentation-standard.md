---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-08-12
---

# Documentation standard

## Metadata schema

Canonical records use this YAML frontmatter:

```yaml
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-08-15
```

`status` is a lifecycle value. `maturity` describes the evidence state. `scope` limits the claim. `owner` is the accountable documentation area. `last-reviewed` is an ISO date.

Allowed `status` values: `accepted`, `draft`, `planned`, `reference`, `deprecated`.
Allowed `maturity` values: `NOT STARTED`, `DISCOVERY`, `DRAFT`, `BASELINED`, `FROZEN`, `BLOCKED`, `SUPERSEDED`, `HISTORICAL`, `VERIFIED`, `CLOSED WITH CAVEAT`, `NOT DEFINED`.
Allowed `scope` values: `v1`, `runway`, `v2`, `cross-cutting`.

## Documentation rules

- Use lower-kebab-case filenames.
- Keep one authoritative document per question.
- Separate AS-IS, TARGET and FUTURE / RUNWAY.
- Prefer editable source files before generated exports.
- Co-locate visuals with the concept they document.
- Do not create invented documentation to fill directories.
- Every major area must state what exists, its maturity, its authority, unresolved items and the activity that will resolve them.
- Status and maturity are not code-completion claims.
- A document may state `AS-IS`, `TARGET`, `RUNWAY`, or `HISTORICAL` in its body when that distinction is needed.
