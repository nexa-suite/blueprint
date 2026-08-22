---
status: accepted
maturity: BASELINED
scope: v1
owner: product-domain
last-reviewed: 2026-08-22
---

# Business knowledge layer

This is the compact business model for Nexa. It links accepted product rules
to discovery artifacts without turning technical modules into business
boundaries.

## Business model

Nexa is a B2B, multi-tenant SaaS platform for importers and distributors,
especially cold-chain businesses. It coordinates commercial operations,
buyers, catalog, inventory, warehouse, fulfillment, delivery, credit,
payments, documents and notifications.

| Concept | Accepted V1 meaning |
| --- | --- |
| Tenant | SaaS customer and maximum business/data isolation boundary; approximately a company in V1. |
| Workspace | Tenant's 1:1 operational environment in V1; not a C4 container. |
| Identity | One human has one Nexa identity. Buyer relationships remain Tenant-scoped. |
| Buyer relationship | Authorized commercial relationship between a Buyer and a Tenant; not a global marketplace relationship. |
| Purchase Request | Draft creates no commitment; Submitted creates Commercial Inventory Commitment by SKU + quantity. |
| Commercial Commitment | Demand commitment released by rejection, withdrawal or expiry and continued by Sales Order conversion. |
| Physical Allocation | Later selection of Inventory Lot(s), distinct from commercial commitment and physical stock. |
| Available Credit | `Credit Limit - Credit Reserved - Outstanding Receivables`. |

## Capability map index

This is a business capability index, not a bounded-context decision:

1. Tenant and access governance
2. Customer and Buyer relationships
3. Catalog and commercial policy
4. Sales commitment
5. Inventory availability
6. Fulfillment and delivery
7. Credit and receivables
8. Payments
9. Business documents
10. Notification and business traceability

The full proposed map lives in the [Capability Map](strategic-ddd/capability-map.md).
Business Architect review is required before canonical ownership is assigned.

## Rule anchors

- Cart and Purchase Request Draft do not reserve inventory or create commitment.
- Submitted Purchase Request creates commitment for SKU + quantity.
- Rejection, withdrawal and expiry release it; Sales Order conversion continues it.
- Credit Reserved must not be double-counted when becoming Outstanding Receivables.
- Payment Reported is not Payment Confirmed.
- Dispatch, Delivery and Route are distinct; partial delivery creates continuation.
- Expired, held, quarantined or otherwise non-sellable stock is unavailable.

The authoritative invariant register is [Known domain rules](business-rules/known-rules.md).

## Boundary ledger

| Layer | May claim | May not claim |
| --- | --- | --- |
| Accepted business | Explicitly decided product rules and actor responsibilities. | Final Strategic DDD ownership not reviewed. |
| Proposed domain | Capabilities, events, language and candidate contexts. | A package, schema or UI folder is a Bounded Context. |
| AS-IS evidence | Observed implementation, tests, routes, APIs and runtime behavior. | Production readiness or TARGET conformance. |
| FUTURE | Mobile, IoT, V2 and deferred runway. | V1 implementation. |
