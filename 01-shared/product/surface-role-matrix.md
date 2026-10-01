---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-09-18
---

# Surface-role matrix

Surfaces project the shared actor catalog. A surface never creates a Bounded
Context or becomes authoritative over business state.

| Surface | Primary actors | Authorized work projection | Authority boundary | Current status |
|---|---|---|---|---|
| Website | Public Interested Company / Prospect; Nexa Commercial & Onboarding Staff | Acquisition, contact and onboarding initiation | No Tenant operational state; no workforce or Buyer data | IMPLEMENTED, Website v1.1.0 |
| Platform | Company Owner; Tenant Administrator; Business Operations Manager; Sales Representative; Warehouse Operator; Dispatch Coordinator | Workforce governance, customer, catalog, commercial, inventory, fulfillment, finance, documents and traceability | API and Tenant policy remain authoritative | IMPLEMENTED, Platform v0.26.0 |
| Buyer Portal | Customer Buyer; authorized internal support projection | Catalog, draft, PR/SO, delivery, credit, payments and documents | Buyer Relationship and API authorization remain authoritative | IMPLEMENTED, Portal v0.26.0 |
| Operations Mobile | Business Operations Manager; Sales Representative; Warehouse Operator; Dispatch Coordinator; Driver / Delivery Operator | Field sales, warehouse, dispatch and assigned delivery execution | Business/API surface `PLATFORM`; transport marker `NATIVE`; API remains authority | PARTIAL AS-IS IMPLEMENTATION EVIDENCE ON UNMERGED FEATURE BRANCH; NOT INTEGRATED; PRODUCT ACCEPTANCE OPEN |
| Buyer Mobile | Customer Buyer | Frequent catalog, commitment, delivery handoff, credit/payment visibility and documents | Business/API surface `PORTAL`; transport marker `NATIVE`; Buyer Relationship/API remains authority | TARGET / NOT IMPLEMENTED; participant-backed Buyer research evidence available; solution validation open |

## Projection rules

- Platform and Portal remain feature-complete Web projections while Mobile is
  researched and constructed.
- Operations Mobile and Buyer Mobile share the same Nexa domain and eleven
  accepted Bounded Contexts. They do not form Mobile, Scanner, QR, Device or
  Cold Chain contexts.
- Driver and Buyer outcomes are separate facts. A Buyer receipt or discrepancy
  never overwrites the Driver attempt/POD history.
- Maps, camera, Sales ↔ Buyer contextual Nexa chat, push provider and device secure storage are
  surface integrations; provider choice and credentials remain open gates.

## Operational location and communication scope

[Owner closure](owner-decisions-2026-10-01-mobile-operations.md) limits internal Driver location visibility to Driver own context, Dispatch Coordinator and BOM where responsibility requires it. Warehouse, Sales and Tenant Administrator have no location access merely by role. Buyer maps are current relationship + own Delivery scoped. Chat is business-contextual; WhatsApp/SMS and implicit personal telephone exposure are excluded. Sales location remains voluntary/contextual.

Owner clarification 2026-10-01: chat is exclusively Sales ↔ Buyer in an authorized relationship. Driver ↔ Buyer and other chat participant pairs are excluded from this scope.
