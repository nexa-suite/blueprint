---
status: planned
maturity: BASELINED
scope: runway
owner: delivery
last-reviewed: 2026-09-19
---

# Mobile validation and acceptance evidence plan

Technical verification, Product/UX Acceptance, System Acceptance and Production
Readiness are independent.

## Gate matrix

| Gate | What it proves | Current status | Required evidence |
|---|---|---|---|
| Technical implementation | Code/build exists for claimed slice | Operations PARTIAL on named unmerged feature branch; Buyer NOT IMPLEMENTED | Repository, branch, build and commit |
| Technical verification | Tests and static/runtime checks pass | Named branch/unit/build/emulator/local-fixture evidence only; physical/deployed-device evidence not verified | Unit, integration, acceptance and device checks |
| Product/UX Acceptance | Users and Product Owner accept behavior/design | OPEN | Research, validation interviews, UX heuristic review, Owner decision |
| System Acceptance | Cross-surface tenant-safe system works | OPEN | Authenticated tenant/Buyer scenarios, API/Web/Mobile integration, RLS and conflict evidence |
| Production Readiness | Operational deployment can be run safely | OPEN | provider, secrets, backups, restore, rollback, SLO/RPO/RTO, incidents and break-glass |

## Frozen dimensions for this projection

| Dimension | Expected state |
|---|---|
| Product Generation | V1 = 73 Mobile functional stories |
| Historical Planning Bands | V1 = 28; V2 = 35; V3 = 9; V4_FUTURE = 1; provenance only |
| Academic Mobile Sprint counts | Sprint 1 = 4; Sprint 2 = 21; Sprint 3 = 24; Sprint 4 = 24; total = 73 |
| Academic backlog | 73 MOB + 6 LAND + 12 Technical + 6 Spikes = 97 PBIs / 426 SP |
| Story-to-design readiness | 28-story assessed subset; does not define Product Generation V1 |

## Representative acceptance scenarios

| Flow | Must demonstrate |
|---|---|
| Warehouse receipt/pick | camera/manual fallback, SKU/lot resolution, FEFO, stale allocation, duplicate retry, network failure, truthful result |
| Driver Delivery | assignment, Attempt lifecycle, POD policy, handoff evidence, QR expiry/replay rejection, safe retry |
| Buyer handoff | relationship authorization, one-time/TTL token, quantity confirmation, immutable receipt and discrepancy separation |
| Deferred commercial intent | Draft no reservation, PR/Direct Order distinction, idempotency, credit/inventory conflict and server authority. Individual stories may remain lifecycle `DEFERRED` while Target Product Generation is V1; the historical planning band is provenance only. |
| Push | subscription lifecycle, tenant-safe routing, invalid token/retry, deep-link reauthorization; no source-state mutation |

## Physical-device gate

Final evidence must show a real Android device with the representative flow
installed and working. Track camera/scanner, network/API, third-party service,
local storage, i18n, a11y and critical flow. Emulator-only success is
insufficient.

## Evidence state boundary

Needfinding interviews are COMPLETE (9/9). Validation interviews are NOT COMPLETED
unless independently evidenced. Product/UX Acceptance, System
Acceptance and Production Readiness remain OPEN.

## Video evidence register

| Evidence | Required pattern | Current status |
|---|---|---|
| Needfinding video publication / attachment | `upc-pre-202620-1acc0238-4949-nexa-team-needfinding-av1.mp4` | PENDING |
| Prototype Navigation | `upc-pre-202620-1acc0238-4949-nexa-team-prototypenavigation-tb1.mp4` | PENDING |
| Validation AV2/TB2 | `upc-pre-202620-1acc0238-4949-nexa-team-validation-{av2/tb2}.mp4` | PENDING |
| About the Product AV2/TB2 | source-defined names | PENDING |
| About the Team AV2/TB2 | source-defined names | PENDING |

Each eventual record needs private OneDrive/Stream URL, screenshot, timing,
participants, scope and validation status. Blueprint contains no fake URLs.
