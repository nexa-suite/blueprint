---
status: planned
maturity: BASELINED
scope: runway
owner: mobile
last-reviewed: 2026-08-23
---

# Mobile Product Definition — proposed target

## Boundary

Mobile is a projection of the shared Nexa domain, not a new product domain. Two
planned applications are justified by materially different actors, trust and
navigation models, offline/security needs, release goals and daily workflows:

- **Nexa Operations Mobile:** Sales, Warehouse, Dispatch, BOM and Driver work.
- **Nexa Buyer Mobile:** Buyer-primary frequent actions; Buyer Portal Web remains
  feature-complete.

## Foundation proposal

Authentication, active business context, capability-driven navigation, secure
local storage, selective offline, synchronization, push, camera/scanning
abstraction, maps/location, evidence upload and resilient API integration.
Framework selection is intentionally open.

## Product rules

- Driver Delivery execution and Warehouse core physical workflows MUST support
  selective offline with explicit sync/conflict states.
- Sales drafts, Dispatch preparation and safe Buyer recent/draft state SHOULD
  support selective offline.
- Payment, security-sensitive confirmation and certain QR verification require
  connectivity or explicitly designed queued/idempotent semantics. Never show
  silent fake success.
- Push is core Mobile V1 projection, but not every domain event becomes a push.
- Live Driver location exists only during the relevant active Delivery lifecycle.
- Manual temperature evidence is proposed V1; continuous sensors and automatic
  excursion detection are `FUTURE — IoT SPECIALIZATION`.

## Research caveat

This is a product-definition target, not research evidence. Assumptions,
interview areas and validation tasks remain in [Discovery](../ux/discovery/README.md).
