---
status: planned
maturity: DISCOVERY
scope: runway
owner: product
last-reviewed: 2026-08-23
---

# Mobile capability projection

Canonical business capabilities live in the [Shared capability model](../../01-shared/product/capability-map.md).
Mobile projects them into Operations Mobile and Buyer Mobile only after research.

Operations focus: customer/catalog/commercial work; receiving, inventory,
fulfillment, dispatch, delivery evidence and operational exceptions.
Buyer focus: catalog, order/PR/SO, credit, payment, documents, push, progress
and discrepancy handling.

## Research scope, not commitment

| Projection | Candidate capability areas |
|---|---|
| Operations Mobile — Sales | customer lookup, Buyer Relationship, catalog/SKU, pricing, availability, drafts, PR/order capture and credit context |
| Operations Mobile — Warehouse | EAN/UPC/QR scanning abstraction, future GS1 consideration, receiving, lot/expiry/quantity, inventory, picking, transfer, evidence and selective offline |
| Operations Mobile — Dispatch | ready deliveries, assignment, Dispatch Handoff, delivery evidence and push exceptions |
| Operations Mobile — Driver | assigned delivery, active-delivery location, attempt, POD, temperature evidence, selective offline and push |
| Buyer Mobile | catalog, order/PR/SO, reorder, credit, payment, documents, push, live progress, contextual contact, QR receipt and discrepancy handling |

QR remains ephemeral and backend-validated against Delivery, Attempt, Customer
Account, Buyer Relationship, expiry and replay. Driver-offered and Buyer-accepted
discrepancy are distinct. No permanent location tracking, full chat, IoT V1 or
fabricated Mobile research is authorized.

Status: `PROPOSED / RESEARCH VALIDATION PENDING`. No Mobile BCs and no final
Mobile story catalog are created.
