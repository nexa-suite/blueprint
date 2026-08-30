---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-30
---

# Mobile Release Roadmap

This is a release projection over the canonical stories in
[mobile-v1-catalog.md](mobile-v1-catalog.md). It contains no second story
body. Lifecycle metadata is indexed in [master-mobile-backlog.md](master-mobile-backlog.md).

## Release intent

| Release | Product intent | Readiness boundary | Count |
|---|---|---|---:|
| V1 | Safe, connected operations and buyer handoff/receipt | Implementation-ready after research, design and Product Acceptance gates | 28 |
| V2 | Refined operational recovery, buyer continuity and commercial follow-through | Refinement-ready; contracts, research and provider decisions open | 35 |
| V3 | Expanded field coordination, grouping, selective recovery and sales visits | Roadmap-ready; scope and feasibility still require evidence | 9 |
| V4/Future | Controlled intelligent warehouse observations | Hypothesis only; no implementation commitment | 1 |

## V1 — current course and Product commitment

`MOB-US-001..003`, `MOB-US-011..017`, `MOB-US-019..028`,
`MOB-US-031..034`, `MOB-US-044`, `MOB-US-047..049`.

V1 is online-first. Temporary drafts, safe read cache and evidence staging may
exist, but disconnected state cannot create authoritative inventory,
allocation, dispatch, delivery, receipt, payment, credit, Purchase Request or
Sales Order truth. Location is an external navigation handoff only.

## V2 — refinement-ready

`MOB-US-004..010`, `MOB-US-018`, `MOB-US-030`, `MOB-US-035..043`,
`MOB-US-046`, `MOB-US-050..053`, `MOB-US-057..058`, `MOB-US-061..065`,
`MOB-US-067..071`.

V2 completes the deferred operational and commercial outcomes that have a
credible product shape but still need research, contracts, authority rules or
provider decisions. It does not make the generic “offline” or “contact”
mechanisms authoritative by implication.

## V3 — roadmap-ready

`MOB-US-029`, `MOB-US-045`, `MOB-US-054..056`, `MOB-US-059..060`,
`MOB-US-066`, `MOB-US-072`.

V3 groups the higher-cost outcomes: consented location visibility, FEFO
substitution, richer identity, grouped warehouse and delivery work, carrier
handoff, selective offline recovery and authorized field visits. Each remains
subject to explicit product and architecture decisions.

## V4/Future — hypothesis

`MOB-US-073` is the single hypothesis for advanced warehouse automation
evidence. RFID, industrial scanners, labels, sensors and telemetry are
possible mechanisms, not separate bounded contexts or promises. A device or
provider cannot become authoritative without a Product decision, evidence
contract, security/privacy review and owning-context design.

## Release gates

- V1: all 28 stories have human outcomes, mature acceptance scenarios, points,
  sprint placement and design-readiness fields; research and Product
  Acceptance remain open.
- V2: each story has an identifiable outcome and preliminary acceptance
  scenarios, but remains deferred until research and contract decisions close.
- V3: each story is a bounded roadmap outcome with intentionally unestimated
  delivery effort.
- V4/Future: conditions are hypothesis-level and cannot use
  `READY`, `IMPLEMENTED`, `VERIFIED` or `PRODUCT_ACCEPTED`.
