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

- **Nexa Operations Mobile:** Sales, Warehouse, Dispatch and Driver work.
- **Nexa Buyer Mobile:** Customer Buyer catalog, commitment, delivery handoff,
  finance visibility and documents; Buyer Portal remains feature-complete.

Mobile is not a new product domain, deployment unit or Bounded Context. It
reuses the shared Product language and eleven accepted Bounded Contexts.

## V1 direction

Identity/context foundation, field sales, SKU/lot/receiving/FEFO/pick,
dispatch, Driver attempts/evidence, Buyer handoff/receipt/discrepancy,
Buyer commerce/credit/payment/document visibility, push subscription and safe
selective evidence synchronization are represented in the catalog.

The API v0.17.0 backend is a partial contract baseline, not a completed Mobile
client. Research must still validate actors, workflows, app boundary, mobile
IA, device permissions, accessibility, offline recovery and priority.

## Non-negotiable product rules

- Tenant is the maximum isolation boundary; Tenant 1:1 Workspace in V1.
- Draft != PR != SO. Direct Order is an explicit path, not a fake PR.
- Payment Reported != Payment Confirmed. Buyer receipt, Driver outcome and POD
  are separate facts.
- QR resolves an ephemeral handoff; it does not equal acceptance.
- Offline may cache, draft or queue selected evidence, never fake payment,
  credit, PR, SO, inventory or Delivery-finalization success.
- Continuous tracking, ETA, route optimization, advanced GS1/transfer/count,
  IoT, chat, rich notification campaigns and returns/RMA remain V2/Future or
  outside the current contract.
