---
status: accepted
maturity: BASELINED
scope: runway
owner: architecture
last-reviewed: 2026-08-29
---

# Mobile spike reconciliation

The six existing spikes remain the research/decision backlog. No spike result
is fabricated by API v0.17.0 and no framework is selected here.

| ID | Existing spike | Reconciled question | Current result |
|---|---|---|---|
| SPIKE-001 | Select the autonomous-learning feature and external technology | Not a Mobile product authority; keep separate from domain/mobile decisions. | OPEN / course or autonomous-learning scope; no Nexa architecture change. |
| SPIKE-002 | Evaluate Native versus Cross-Platform distribution | Choose client strategy for Operations Mobile and Buyer Mobile after research/constraints. | OPEN; no framework selected. |
| SPIKE-003 | Evaluate Barcode / QR / GS1 scanning | Validate camera/scanner UX, identifier mapping, QR TTL/replay and future GS1 boundary. | PARTIAL; API v0.17.0 supports identifier/handoff contracts, device research pending. |
| SPIKE-004 | Evaluate Mobile local storage and offline synchronization | Define safe cache/draft/queue, conflict and recovery behavior per story. | PARTIAL target; no client implementation, no offline critical success. |
| SPIKE-005 | Evaluate Push Notifications and deep links | Select provider/configuration, lifecycle, deep-link authorization and retry operations. | PARTIAL; API subscription foundation exists, provider/credentials open. |
| SPIKE-006 | Evaluate Maps, live location, privacy, battery consumption and fallback | Decide bounded location, provider, consent, retention and V2 map/live tracking. | OPEN; v0.17.0 explicitly excludes GPS/live tracking/ETA/geofencing. |

Spike completion requires evidence, owner decision and links to the affected
story/technical contract. A spike cannot create a Bounded Context.
