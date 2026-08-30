---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-29
---

# Live compatibility baseline — 2026-08-29

This is a point-in-time AS-IS evidence cut. It does not redefine TARGET, grant
Product Acceptance or close the Production Gate. SHAs below are the published
tag targets unless a local branch is explicitly named.

| Repository | Published release / ref | Target commit | Local verification | Scope evidence |
|---|---|---|---|---|
| API | [v0.17.0](https://github.com/nexa-suite/api/releases/tag/v0.17.0) | `4c955ca35331fd3afc58c01f666fc7b0cec9c755` | local `develop` `0ce79dff19a976be44de6bb2659f62644747c169`; tag signature verified | Candidate Mobile V1 backend contracts; Flyway V93–V100; no Mobile client |
| Platform | [v0.26.0](https://github.com/nexa-suite/platform/releases/tag/v0.26.0) | `0244104a9bc86a5df75107a4d2f992a816e65b3b` | local `release/v0.26.0` `52555e1...`; published tag is authority | Production API-only adapter composition; mock/authenticated-live caveat |
| Portal | [v0.26.0](https://github.com/nexa-suite/portal/releases/tag/v0.26.0) | `b29ed7d071a1a37b0bdb5711df36297947612c48` | local `release/v0.26.0` `01113cdf...`; published tag is authority | Buyer-only production composition; 16/16 browser E2E in release note |
| Website | [v1.1.0](https://github.com/nexa-suite/website/releases/tag/v1.1.0) | `ddd299617fe56df90f145a5ed0478a081397883d` | local `develop` `2bfeb6a...`; published tag is authority | Public static/contact acquisition boundary |
| Design Lab | [v1.0.2](https://github.com/nexa-suite/design-lab/releases/tag/v1.0.2) | `87a84053d6d9a3301ce1fae4ed06059b97c55491` | local `feature/mobile-guidelines-foundation` `04e2e4ea...` dirty | Executable Design System; manual visual/AT review remains open |
| Mobile | [v0.1.1](https://github.com/nexa-suite/mobile/releases/tag/v0.1.1) | `e48ef7d629f9547a74c04f3f9621bbee4551b36c` | local `develop` `4a94db73336f...` dirty from `.DS_Store` | Documentation-only; no native/client build |
| Blueprint | no semantic release/tag | published `main` `1daf6faec7e7023bb8679b1f7f927f03a0c55215` | reconciliation branch is intentionally unpublished until this change | Normative Product/Domain/Architecture documentation |

## API v0.17.0 compatibility facts

- Added additive V93–V100 evidence for SKU/GTIN/lot resolution, FEFO and
  physical-allocation scan validation, bounded override, ephemeral Delivery
  handoff token/QR, immutable Buyer receipt/discrepancy fact and provider-neutral
  push subscription lifecycle/retry/dead-letter foundation.
- Ownership remains BC-03, BC-05, BC-06, BC-02, BC-10 and BC-11. No new BC is
  introduced and the published integration-event catalog remains fourteen.
- Explicitly absent: native Mobile client, generic offline sync, GPS/live
  tracking/ETA/geofencing, advanced receiving/transfers/GS1, RFID/Bluetooth/
  printers/IoT, rich chat/campaigns, full disputes/returns/RMA and production
  provider/credential/SLO/RPO/RTO evidence.
- The release note reports the API verification command and 482-test result;
  this Blueprint records it as release evidence and will not re-run it from the
  Blueprint repository.

## Compatibility interpretation

`IMPLEMENTED` means the named release contains the behavior. `PARTIAL` means a
contract or backend foundation exists but a consuming surface, provider,
runtime or Product Acceptance gate remains open. `NOT IMPLEMENTED` means no
client/runtime proof was found in the named release. No UI may replace an
authoritative API result with local success.
