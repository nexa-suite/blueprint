---
status: planned
maturity: DISCOVERY
scope: runway
owner: product
last-reviewed: 2026-08-24
---

# Mobile requirements status

| Dimension | Status | Meaning |
|---|---|---|
| Decision | PROPOSED | two-app target is retained |
| Research | PENDING | class research has not validated actors, needs or journeys |
| Implementation | PLANNED | no Mobile V1 delivery claim |
| Production | OPEN | Production Gate remains open |

## Target projections

Operations Mobile covers Sales, Warehouse, Dispatch and Driver delivery work.
Buyer Mobile covers Customer Buyer work and is a mobile-primary candidate.
Mobile-specific discovery may consider offline, push, camera/scanning, QR,
location, mobile navigation and mobile journeys. These are research questions,
not accepted implementation contracts.

Preserve these boundaries during research:

- QR is ephemeral evidence; backend validates Delivery, Attempt, Customer
  Account, Buyer Relationship, expiry and replay.
- Driver-offered and Buyer-accepted discrepancy are separate facts.
- Driver location is active-delivery-only; no permanent employee tracking.
- Communication is contextual contact, not a full chat product.
- POD evidence is immutable; selective offline must be explicit and idempotent.
- Push is a candidate core channel; IoT telemetry remains future.
