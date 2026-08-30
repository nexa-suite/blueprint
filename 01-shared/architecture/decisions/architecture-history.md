---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-29
---

# Architecture history and reconciliation

This index preserves architectural change without promoting implementation
shape into Product or Domain authority.

| Period / evidence | AS-IS or decision | Canonical interpretation |
|---|---|---|
| Legacy Vue / ASP.NET and former package/schema topology | AS-IS historical migration evidence | Retained under `91-reference`; not TARGET authority. |
| Former context model | Historical Strategic DDD candidate | Reconciled to exactly eleven accepted contexts; former Notification + Traceability combined context is superseded. |
| ADR-0016 and Strategic DDD closure | TARGET decision | BC-10 Notifications and BC-11 Business Traceability remain separate; no Mobile/Scanner/QR/Device BC. |
| Frontend migration | AS-IS evolution | Website, Platform and Buyer Portal are separate projections; they do not redefine the domain. |
| Mobile proposals and academic material | FUTURE/proposed evidence | Rebaselined as Operations Mobile and Buyer Mobile over shared BCs; research remains pending. |
| API v0.14 | IMPLEMENTED AS-IS release evidence | Commercial commitment, reservation, direct-order and expiry foundations; no Mobile client claim. |
| API v0.15 | IMPLEMENTED AS-IS release evidence | Fulfillment and financial completion foundations; no new context. |
| API v0.16.0 / v0.16.1 | IMPLEMENTED AS-IS release evidence | Backend closure, security, idempotency, retry/dead-letter and mobile-readiness foundations. |
| API v0.17.0 | IMPLEMENTED / TECHNICALLY VERIFIED candidate evidence | SKU/GTIN/lot resolution, FEFO/picking controls, ephemeral delivery handoff, immutable Buyer receipt/discrepancy and push subscription reliability; Mobile client remains absent. |
| Platform/Portal v0.26.0 | IMPLEMENTED surface evidence | Production API-only adapter composition; no new endpoint, entity, state or BC. |
| Website v1.1.0 | IMPLEMENTED surface evidence | Public contact/demo API-backed experience; acquisition boundary only. |
| Design Lab v1.0.2 | IMPLEMENTED design evidence | Executable Design System evidence; not product/domain authority. |
| Mobile v0.1.1 | IMPLEMENTED documentation evidence | No Android/iOS/KMP/Flutter/SwiftUI client or runtime. |

## Reconciliation rules

- Current code can prove AS-IS implementation but cannot silently reopen an
  accepted Product or Strategic DDD decision.
- C4 containers describe logical system boundaries; they do not map one-to-one
  to the eleven contexts.
- Tactical data models may project current release concepts, but migration
  SQL, ownership and runtime readiness remain separately gated.
- The former combined Notification + Traceability concept is retained as
  history and is not recreated in current docs.

See [the live compatibility baseline](../../../04-delivery/compatibility-baseline-2026-08-29.md),
[current decisions](../../product/current-decisions.md), and [ADR index](README.md).
