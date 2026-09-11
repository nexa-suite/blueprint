---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-09-10
---

# Academic backlog boundary

This record fixes the relationship between the canonical Mobile Product
backlog and the current academic Mobile Report projection.

## Distinct inventories

| Inventory | Count | Meaning | Authority |
|---|---:|---|---|
| Mobile functional Product stories | 73 | `MOB-US-001..073`: 49 historical IDs plus 24 independent outcomes; 28 V1, 35 V2, 9 V3 and 1 V4/Future | Blueprint Product backlog |
| Academic report functional user stories | 79 | 6 `LAND` stories plus the 73 `MOB-US` stories in the course projection | Mobile Report academic projection |
| Academic report technical stories | 12 | Course technical planning elements | Mobile Report academic projection |
| Academic report spikes | 6 | Course research/decision planning elements | Mobile Report academic projection |
| Academic report total backlog elements | 97 | `6 LAND + 73 MOB + 12 Technical + 6 Spikes` | Mobile Report academic projection |

The 73 canonical Mobile functional stories are **not** the 97-item academic
backlog. The academic `LAND`, Technical Story and Spike elements do not create
additional Product functional stories, Bounded Contexts or accepted Product
requirements. They remain `ACADEMIC_PROJECTION`, `PROPOSED` or `RESEARCHING`
according to their own evidence state.

The Blueprint shared technical catalog and shared Spikes remain governed by
their canonical records. The twelve course Technical Stories are not silently
substituted for the shared catalog.

## Academic planning boundary

The current academic projection is sourced from Mobile Report `v0.2.0`, target
commit `7205469f032fd0b3acd31195ad4084a4bdb0640a`. It contains planning for the
28 V1 stories and a four-sprint academic runway. Sprint 4 remains hardening,
integration, validation and learning; V2, V3 and V4/Future stories are not
promoted into the V1 course scope.

The report's personas, assumptions, hypotheses, Needfinding plans, Business
Outcomes, planned experiments, interviews, Sprint events and validation
artifacts do not become accepted Product truth without current evidence and
Owner promotion. The inspected report does not prove a Mobile client, device
run, participant-backed interview result, Product Acceptance or production
readiness.

## Reading and authority

- [Canonical Mobile Requirements Reconciliation](reconciliation.md)
- [Master Mobile Product Backlog](master-mobile-backlog.md)
- [Academic requirements projection](../../90-academic/courses/mobile-1acc0238/projections/requirements-projection.md)
- [Academic/model authority](../../01-shared/architecture/model-authority.md)
