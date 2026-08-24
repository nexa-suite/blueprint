---
status: planned
maturity: BASELINED
scope: runway
owner: domain
last-reviewed: 2026-08-23
---

# Mobile projection over the shared domain

Mobile adds no Bounded Context. It projects the frozen 11-context domain through
two planned applications: [Nexa Operations Mobile](../../05-mobile/README.md)
and [Nexa Buyer Mobile](../../05-mobile/README.md). A Mobile capability is an
experience/use-case composition, not ownership of a new business invariant.

| Mobile actor / segment | Capability projection | Existing BC authority | Contract / consistency |
|---|---|---|---|
| Sales Representative / MOB-SEG-01 Field & Warehouse Operations | customer lookup, Buyer relationship, catalog/SKU/pricing/terms, sellable availability, draft and PR/order capture | BC-02, BC-03, BC-04, BC-05, BC-07 when relevant | synchronous authoritative lookup and submit; drafts may be selectively offline |
| Warehouse Operator / MOB-SEG-01 | scan-to-inventory, receiving, lot/expiry/quantity, picking, transfers, counts and evidence | BC-05, BC-11 | operational mutations require capability, idempotency and explicit sync; encoded data only |
| Dispatch Coordinator / MOB-SEG-01 | fulfillment readiness, Dispatch Handoff, assignment and evidence | BC-06, BC-05, BC-11 | handoff is source fact; photographic evidence mandatory; async notifications |
| Driver / MOB-SEG-02 Delivery Workforce | assigned deliveries, attempt, route, active location, outcome, POD and cold-chain evidence | BC-06, BC-09, BC-10, BC-11 | selective offline for delivery; location only active lifecycle; POD immutable |
| B2B Buyer / MOB-SEG-03 B2B Buyers | catalog, availability, draft, PR/direct order, changes, SO, delivery, QR, discrepancy, credit, payment and documents | BC-02, BC-03, BC-04, BC-06, BC-07, BC-08, BC-09, BC-10, BC-11 | Portal remains feature-complete; online-authoritative payment/QR/security actions or explicit queued/idempotent semantics |
| Business Operations Manager / cross-functional secondary | overview, critical exceptions and authorized decisions | BC-01, BC-04, BC-05, BC-06, BC-07, BC-10, BC-11 | projection/read/drill-down; full Web parity is not Mobile V1 priority |

## Boundary decisions

- No Scanning, QR, Maps, Offline, Tracking, Push Notification or IoT BC.
- Camera, location, QR, secure local storage and synchronization are application
  or integration concerns; Notifications remains BC-10 authority.
- Dispatch Handoff is not POD. Driver and Buyer facts remain separate; a
  discrepancy preserves both histories and creates an operations resolution.
- Any concept that cannot fit the frozen contexts is a `STRATEGIC DDD REVIEW
  CANDIDATE`, not an automatic new BC.
