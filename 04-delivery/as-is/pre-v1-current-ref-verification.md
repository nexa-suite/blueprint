---
status: accepted
maturity: VERIFIED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# PRE-V1 current-ref verification — AS-IS

This is the current read-only ref cut used for PRE-V1 closure. It updates the
older dated implementation records without rewriting their historical evidence.
It is AS-IS only: it does not override the accepted TARGET, promote technical
folders to Bounded Contexts, or claim V1 implementation or production readiness.

## Repository refs

All refs below were read directly on 2026-08-23. No application repository or
Design Lab file was modified.

| Repository | Local checkout | Remote refs observed | Working tree | Scope |
|---|---|---|---|---|
| API | `main@e7492f7` | `main@e7492f7`, `develop@440ac6c` | clean | implementation evidence |
| Platform | `main@6ee6845` | `main@6ee6845`, `develop@c642473` | clean | implementation evidence |
| Portal | `main@41a7f72` | `main@41a7f72`, `develop@b2d7117` | clean | implementation evidence |
| Website | `develop@2bfeb6a` | `main@462adef`, `develop@2bfeb6a` | clean | public acquisition evidence |
| Mobile runway | `develop@4a94db7` | `main@36e7100`, `develop@4a94db7` | clean | runway only; not V1 scope |
| Design Lab | external `main@d27e158` | `main@d27e158` | clean | visual evidence only |

## Findings against the accepted TARGET

| Area | Classification | Current evidence | Closure meaning |
|---|---|---|---|
| Commercial commitment | PARTIAL | API V75 adds tenant-scoped `sales.commercial_commitment` and lines; current implementation is a durable seam. | Does not prove the complete PR/SO ownership transfer or availability invariant. |
| Purchase Request lifecycle | DRIFT | Current API/clients still expose legacy states and draft-oriented write paths; accepted PR states and absolute `expiresAt` are TARGET decisions. | Converge through the construction contract; do not delete a path without consumer mapping and migration evidence. |
| Sellable availability | DRIFT | Current availability queries use lot on-hand/reserved and safety-stock seams; the accepted formula also subtracts active commercial commitments and excludes unusable statuses. | Inventory implementation requires refinement before claiming TARGET conformance. |
| Physical allocation and transfers | PARTIAL | FEFO/reservation code and V80 safety-stock/transfer evidence exist; transfer persistence is currently completion-oriented. | Inventory remains the authority; staged transfer semantics are not closed by this ref cut. |
| Delivery continuation | PARTIAL | V79 contains delivery-attempt and continuation tables/events. | Consumer, Portal contract and authenticated runtime behavior remain unverified. |
| Credit and receivables | DRIFT | Credit, reservation and receivable primitives exist; current trigger evidence includes `INVOICE_ISSUED`. | Reconcile implementation with the accepted credit formula and SO-confirmation timing. |
| Events and workers | PARTIAL | Outbox/inbox, leases and fencing seams exist; V81 adds worker/RLS hardening evidence. | Restart, retry, SYSTEM scope and tenant cleanup still require runtime proof. |
| RLS and scope | PARTIAL | Tenant/workspace policies exist across migrations, including V75/V79/V80/V81 additions. | Full table/worker/bootstrap coverage is not certified by static inspection. |
| API contract | FACT + UNVERIFIED | Static OpenAPI on the API main checkout contains 237 paths. | Runtime OpenAPI parity was not run in this ref cut. |
| Platform / Portal UI | DRIFT | Both surfaces contain relevant workflows, but identifiers, PR write paths and delivery continuation contracts are not fully converged. | Use the Blueprint frontend and UI-state contracts as construction target. |
| Website | CONFORMING FOR SCOPE | Public discovery/contact surface is separate from tenant authorization and transactional ownership. | No deeper V1 business context is inferred. |
| Mobile | RUNWAY | Repository exists at the recorded develop ref. | No mobile business capability is promoted to V1. |
| Design Lab | EVIDENCE ONLY | Current external checkout is `v1.0.1` evidence at the recorded ref. | Design Lab owns visual foundations; Blueprint owns domain and governance decisions. |

## Validation boundary

- Static ref and source inspection: **DONE**.
- Application repository mutation: **NOT DONE**.
- Application build/test: **NOT RUN in this verification**.
- Runtime/API parity: **UNVERIFIED**.
- Authenticated browser/E2E: **UNVERIFIED**.
- Provider, cloud, backup/restore, RPO/RTO and SLO evidence: **OPEN production gate**.

The canonical interpretation is: construction authorization is passed for
repository-specific planning and vertical slices; implementation convergence,
runtime proof and production certification remain separate gates. See [current state](../../00-start-here/status.md),
[accepted decisions](../../01-shared/product/current-decisions.md) and the
[historical implementation audit](architecture-implementation-audit.md).
