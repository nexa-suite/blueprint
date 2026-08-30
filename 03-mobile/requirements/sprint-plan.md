---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-30
---

# Mobile Sprint Projection

This document projects delivery sequencing for the canonical registry. It
does not duplicate story bodies. `Sprint Planned` is not evidence that a
client sprint occurred; implementation and verification are tracked
independently in [master-mobile-backlog.md](master-mobile-backlog.md).

## V1 planned slices

| Sprint | Product slice | Story IDs | Planned points |
|---|---|---|---:|
| S1 | Access context, product identification, receiving, lot facts, stock condition, picking and cold-chain evidence | MOB-US-001, MOB-US-002, MOB-US-003, MOB-US-011, MOB-US-012, MOB-US-013, MOB-US-014, MOB-US-015, MOB-US-016, MOB-US-017, MOB-US-019 | 37 |
| S2 | Dispatch preparation, driver responsibility, delivery start, navigation, delivery outcome and proof | MOB-US-020, MOB-US-021, MOB-US-022, MOB-US-023, MOB-US-024, MOB-US-025, MOB-US-026, MOB-US-027, MOB-US-028, MOB-US-031, MOB-US-032, MOB-US-033, MOB-US-034 | 46 |
| S3 | Buyer delivery attention, handoff verification, receipt and discrepancy reporting | MOB-US-044, MOB-US-047, MOB-US-048, MOB-US-049 | 16 |
| **V1 total** | 28 stories |  | **99** |

The points are the current planning projection from the academic V1 runway,
not an implementation measurement. No sprint is marked implemented.

## V2 candidate sequencing

V2 has no committed sprint assignment. Refinement candidates are grouped by
outcome so Product can sequence them after research and contract closure:

| Candidate group | Story IDs |
|---|---|
| Operational visibility and commercial preparation | MOB-US-004, MOB-US-005, MOB-US-006, MOB-US-007, MOB-US-008, MOB-US-009, MOB-US-010, MOB-US-036, MOB-US-037, MOB-US-038, MOB-US-039, MOB-US-040, MOB-US-041, MOB-US-042, MOB-US-043, MOB-US-046 |
| Warehouse accuracy and disposition | MOB-US-018, MOB-US-050, MOB-US-051, MOB-US-052, MOB-US-053 |
| Dispatch and delivery coordination | MOB-US-030, MOB-US-035, MOB-US-057, MOB-US-058, MOB-US-061, MOB-US-062, MOB-US-063, MOB-US-064, MOB-US-065 |
| Buyer delivery continuity and financial follow-through | MOB-US-067, MOB-US-068, MOB-US-069, MOB-US-070, MOB-US-071 |

## V3 and V4 runway

`MOB-US-029`, `MOB-US-045`, `MOB-US-054..056`, `MOB-US-059..060`,
`MOB-US-066` and `MOB-US-072` remain roadmap candidates with
`Sprint Planned = UNASSIGNED`. `MOB-US-073` remains a V4/Future hypothesis
with no sprint, points or implementation promise.
