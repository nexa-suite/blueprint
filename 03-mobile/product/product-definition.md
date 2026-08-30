---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-29
---

# Mobile Product Definition

## Product direction

The Product owner accepts two projections for planning, subject to research and
later Product Acceptance:

- **Nexa Operations Mobile:** Warehouse receiving/picking, dispatch handoff and
  Driver delivery execution/proof.
- **Nexa Buyer Mobile:** Critical Delivery updates, handoff verification,
  Buyer receipt and discrepancy reporting; Buyer Portal remains
  feature-complete for broader commerce.

Mobile is not a new product domain, deployment unit or Bounded Context. It
reuses the shared Product language and eleven accepted Bounded Contexts.

## V1 direction

Identity/context foundation, product identification, receiving/lot/FEFO/pick,
dispatch/handoff, Driver attempts/proof, and narrow Buyer
handoff/receipt/discrepancy/critical-update work are represented in the
28-story V1 catalog. The remaining historical stories are distributed across
V2, V3 and V4/Future in the [Master Mobile Product
Backlog](../requirements/master-mobile-backlog.md); future projections do not
expand the academic course scope.

The API v0.17.0 backend is a partial contract baseline, not a completed Mobile
client. Research must still validate actors, workflows, app boundary, mobile
IA, device permissions, accessibility, connectivity recovery and priority.

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
