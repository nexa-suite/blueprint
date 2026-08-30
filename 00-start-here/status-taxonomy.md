---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-08-29
---

# Canonical status taxonomy

Status describes the authority and evidence level of a decision. It is not a
replacement for a test result, a release tag or Product Acceptance.

| Status | Meaning | Evidence required |
|---|---|---|
| `PROPOSED` | Candidate direction; not authorized as a product promise. | Written hypothesis and owner. |
| `RESEARCHING` | Evidence collection is active. | Research plan, method and provenance. |
| `OWNER-ACCEPTED` | Product or Architecture owner accepted the direction for planning. | Explicit owner decision; implementation may still be absent. |
| `ACCEPTED` | Canonical business or architecture rule. | Accepted decision and no unresolved contradiction. |
| `BASELINED` | Inventory or contract is coherent at a named point in time. | Reproducible source and review date. |
| `FROZEN` | Changes require explicit authority; implementation is not implied. | Freeze scope and change authority. |
| `IMPLEMENTED` | Code or documentation exists in the named repository/ref. | Exact path and commit/tag. |
| `TECHNICALLY VERIFIED` | A named technical check passed. | Exact command, ref and result. |
| `PRODUCT ACCEPTED` | Product behavior passed the acceptance plan. | Scenarios, actors, evidence and decision. |
| `PRODUCTION READY` | Production gate is closed for the stated scope. | Operational, security, recovery and release evidence. |
| `DEFERRED` | Explicitly moved outside the current scope. | Owner, reason and target horizon. |
| `SUPERSEDED` | Replaced by a newer decision or contract. | Replacement link and preserved history. |
| `RETIRED` | No longer used; retained only for historical traceability. | Retirement reason and successor/history. |

## Composition rules

- `OWNER-ACCEPTED` Mobile direction is compatible with `RESEARCHING` or
  `PROPOSED / RESEARCH VALIDATION PENDING` stories.
- `IMPLEMENTED` is repository evidence only. It does not imply
  `PRODUCT ACCEPTED` or `PRODUCTION READY`.
- `TECHNICALLY VERIFIED` is always scoped to the exact command and ref.
- `FROZEN` protects semantics; it does not freeze an unvalidated client.
- `DEFERRED` and `SUPERSEDED` must retain a migration or replacement record.
- AS-IS, TARGET and FUTURE labels are orthogonal to this taxonomy.
