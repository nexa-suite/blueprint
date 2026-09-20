---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-09-19
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
| Mobile proposals and academic material | FUTURE/proposed evidence | Rebaselined as Operations Mobile and Buyer Mobile over shared BCs; AV1 Needfinding is complete as problem/task evidence, while solution validation remains open. |
| API v0.14 | IMPLEMENTED AS-IS release evidence | Commercial commitment, reservation, direct-order and expiry foundations; no Mobile client claim. |
| API v0.15 | IMPLEMENTED AS-IS release evidence | Fulfillment and financial completion foundations; no new context. |
| API v0.16.0 / v0.16.1 | IMPLEMENTED AS-IS release evidence | Backend closure, security, idempotency, retry/dead-letter and mobile-readiness foundations. |
| API v0.17.0 | IMPLEMENTED / TECHNICALLY VERIFIED candidate evidence | SKU/GTIN/lot resolution, FEFO/picking controls, ephemeral delivery handoff, immutable Buyer receipt/discrepancy and push subscription reliability; Mobile client remains absent. |
| Platform/Portal v0.26.0 | IMPLEMENTED surface evidence | Production API-only adapter composition; no new endpoint, entity, state or BC. |
| Website v1.1.0 | IMPLEMENTED surface evidence | Public contact/demo API-backed experience; acquisition boundary only. |
| Design Lab v1.0.2 | IMPLEMENTED design evidence | Executable Design System evidence; not product/domain authority. |
| Mobile `main` | AS-IS documentation/runway evidence | No integrated Mobile application on main. |
| Mobile `feature/native-foundation` and `feature/connected-access-preview` | PARTIAL IMPLEMENTATION EVIDENCE, UNMERGED | Android/Kotlin/Compose access and warehouse previews; not Product Accepted or Production Ready. |
| Buyer Mobile | TARGET evidence | Not implemented; cross-platform Product architecture remains open. |

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

## Post-AV1 Wave 1 boundary — 2026-09-18

Mobile `main` remains documentation-only. Operations Android implementation
evidence exists on unmerged feature branches and is recorded as AS-IS only;
there is no Product Acceptance claim. Buyer Mobile is not implemented. C4
structural reconciliation and any change to shared Strategic DDD are
intentionally deferred to Wave 2.

## Post-AV1 Wave 2 reconciliation — 2026-09-19

The canonical C4 source was reconciled and regenerated from Structurizr DSL:
there remains one Nexa software system, six integrated AS-IS containers and
eight TARGET V1 containers. Operations Mobile and Buyer Mobile are
owner-accepted TARGET surfaces; the former has partial unmerged Android/Kotlin/
Compose evidence and the latter is not implemented. The V1 provider boundary is
Payment, Email and Maps. Push Delivery Service is Future/OPEN only. V1
deployment uses separate logical Operations Mobile Device and Buyer Mobile
Device nodes with no Buyer Android claim.

Strategic DDD remains exactly 11 Bounded Contexts and 14 Published Integration
Events. The context map was refined with Customer/Supplier language, a
Published Language commercial snapshot, a Payment ACL and BC-06/07/08 durable
source facts for BC-09. Tactical corrections clarify that a Driver Outcome is
not a Buyer Receipt, retain 95 TARGET tables, and make Warehouse Backing
deterministic by SKU plus Warehouse. These changes are semantic refinements,
not an implementation, Product Acceptance, System Acceptance or Production
Readiness claim.
