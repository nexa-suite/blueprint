---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-08-29
---

# Surface-role matrix

Surfaces project the shared actor catalog. A surface never creates a Bounded
Context or becomes authoritative over business state.

| Surface | Primary actors | Authorized work projection | Authority boundary | Current status |
|---|---|---|---|---|
| Website | Public Interested Company / Prospect; Nexa Commercial & Onboarding Staff | Acquisition, contact and onboarding initiation | No Tenant operational state; no workforce or Buyer data | IMPLEMENTED, Website v1.1.0 |
| Platform | Company Owner; Tenant Administrator; Business Operations Manager; Sales Representative; Warehouse Operator; Dispatch Coordinator | Workforce governance, customer, catalog, commercial, inventory, fulfillment, finance, documents and traceability | API and Tenant policy remain authoritative | IMPLEMENTED, Platform v0.26.0 |
| Buyer Portal | Customer Buyer; authorized internal support projection | Catalog, draft, PR/SO, delivery, credit, payments and documents | Buyer Relationship and API authorization remain authoritative | IMPLEMENTED, Portal v0.26.0 |
| Operations Mobile | Business Operations Manager; Sales Representative; Warehouse Operator; Dispatch Coordinator; Driver / Delivery Operator | Field sales, warehouse, dispatch and assigned delivery execution | API remains authority; selective offline may queue evidence but cannot fake success | OWNER-ACCEPTED direction; client NOT STARTED |
| Buyer Mobile | Customer Buyer | Frequent catalog, commitment, delivery handoff, credit/payment visibility and documents | Buyer Relationship/API remains authority; no offline confirmation of critical facts | OWNER-ACCEPTED direction; client NOT STARTED |

## Projection rules

- Platform and Portal remain feature-complete Web projections while Mobile is
  researched and constructed.
- Operations Mobile and Buyer Mobile share the same Nexa domain and eleven
  accepted Bounded Contexts. They do not form Mobile, Scanner, QR, Device or
  Cold Chain contexts.
- Driver and Buyer outcomes are separate facts. A Buyer receipt or discrepancy
  never overwrites the Driver attempt/POD history.
- Maps, camera, phone/WhatsApp, push provider and device secure storage are
  surface integrations; provider choice and credentials remain open gates.
