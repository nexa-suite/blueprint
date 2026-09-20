---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-09-18
---

# Mobile Product Definition

## Product direction

The Product owner accepts two projections for the Mobile V1 Product Generation,
subject to solution validation and later Product Acceptance:

- **Nexa Operations Mobile:** Warehouse receiving/picking, dispatch handoff and
  Driver delivery execution/proof.
- **Nexa Buyer Mobile:** Critical Delivery updates, handoff verification,
  Buyer receipt and discrepancy reporting; Buyer Portal remains
  feature-complete for broader commerce.

Mobile is not a new product domain, deployment unit or Bounded Context. It
reuses the shared Product language and eleven accepted Bounded Contexts.

## V1 direction

All 73 canonical Mobile stories are in the Nexa Mobile V1 Product Generation
planning envelope. The former 28/35/9/1 grouping remains historical planning
provenance in the [Master Mobile Product Backlog](../requirements/master-mobile-backlog.md);
it does not define current Product releases. Academic planning is separate and
does not promote implementation or acceptance.

The API v0.17.0 backend is a partial contract baseline. Final AV1 Needfinding is
available for actors, tasks and journeys; solution validation remains open for
mobile IA, device permissions, accessibility, connectivity recovery and priority.

## Non-negotiable product rules

- Tenant is the maximum isolation boundary; Tenant 1:1 Workspace in V1.
- Draft != PR != SO. Direct Order is an explicit path, not a fake PR.
- Payment Reported != Payment Confirmed. Buyer receipt, Driver outcome and POD
  are separate facts.
- QR resolves an ephemeral handoff; it does not equal acceptance.
- V1 is online-first. Offline may cache, preserve a harmless draft or stage
  temporary evidence, never fake payment, credit, PR, SO, inventory or
  Delivery-finalization success.
- Continuous tracking, ETA, route optimization, advanced GS1/transfer/count,
  IoT, chat, rich notification campaigns and returns/RMA remain V2/Future or
  outside the current contract.
