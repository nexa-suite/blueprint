---
status: planned
maturity: BASELINED
scope: runway
owner: delivery
last-reviewed: 2026-08-30
---

# Mobile validation and acceptance evidence plan

Technical verification, Product/UX Acceptance, System Acceptance and Production
Readiness are independent.

## Gate matrix

| Gate | What it proves | Current status | Required evidence |
|---|---|---|---|
| Technical implementation | Code/build exists for claimed slice | Mobile NOT STARTED | Repository, branch, build and commit |
| Technical verification | Tests and static/runtime checks pass | API evidence partial; Mobile pending | Unit, integration, acceptance and device checks |
| Product/UX Acceptance | Users and Product Owner accept behavior/design | OPEN | Research, validation interviews, UX heuristic review, Owner decision |
| System Acceptance | Cross-surface tenant-safe system works | OPEN | Authenticated tenant/Buyer scenarios, API/Web/Mobile integration, RLS and conflict evidence |
| Production Readiness | Operational deployment can be run safely | OPEN | provider, secrets, backups, restore, rollback, SLO/RPO/RTO, incidents and break-glass |

## Representative acceptance scenarios

| Flow | Must demonstrate |
|---|---|
| Warehouse receipt/pick | camera/manual fallback, SKU/lot resolution, FEFO, stale allocation, duplicate retry, network failure, truthful result |
| Driver Delivery | assignment, Attempt lifecycle, POD policy, handoff evidence, QR expiry/replay rejection, safe retry |
| Buyer handoff | relationship authorization, one-time/TTL token, quantity confirmation, immutable receipt and discrepancy separation |
| Commercial intent | Draft no reservation, PR/Direct Order distinction, idempotency, credit/inventory conflict, server authority |
| Push | subscription lifecycle, tenant-safe routing, invalid token/retry, deep-link reauthorization; no source-state mutation |

## Physical-device gate

Final evidence must show a real Android device with the representative flow
installed and working. Track camera/scanner, network/API, third-party service,
local storage, i18n, a11y and critical flow. Emulator-only success is
insufficient.

## Video evidence register

| Evidence | Required pattern | Current status |
|---|---|---|
| Needfinding Interviews | `upc-pre-202620-1acc0238-4949-nexa-team-needfinding-av1.mp4` | PENDING |
| Prototype Navigation | `upc-pre-202620-1acc0238-4949-nexa-team-prototypenavigation-tb1.mp4` | PENDING |
| Validation AV2/TB2 | `upc-pre-202620-1acc0238-4949-nexa-team-validation-{av2/tb2}.mp4` | PENDING |
| About the Product AV2/TB2 | source-defined names | PENDING |
| About the Team AV2/TB2 | source-defined names | PENDING |

Each eventual record needs private OneDrive/Stream URL, screenshot, timing,
participants, scope and validation status. Blueprint contains no fake URLs.
