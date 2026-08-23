---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Capability Map

Capabilities describe business ability. They are not Bounded Contexts, endpoints, screens or technical modules.

| Capability family | V1 capabilities | Strategic authority |
|---|---|---|
| SaaS onboarding | contact/demo intake, assisted provisioning, activation and suspension/exit | Tenant & Access Governance |
| Workforce and governance | company identity, memberships, roles, capabilities, tenant authorization and access context | Tenant & Access Governance |
| Customer relationships | Customer Account, contacts, addresses, lifecycle and account association | Customer & Buyer Relationships |
| Buyer relationships | invitation/request, approval, principal identity link, suspension/revocation and supplier context | Customer & Buyer Relationships |
| Catalog | Product, SKU, media metadata, visibility, cold-chain requirement and lifecycle | Catalog & Commercial Policy |
| Commercial policy | Base Price, Price Lists, Customer Terms, promotions, currency and authoritative resolution | Catalog & Commercial Policy |
| Buyer shopping | private catalog, informative cart/draft, authoritative checkout and availability presentation | Catalog + Sales Commitment |
| Purchase Requests | submit, commitment, review, material change, buyer response, withdrawal, rejection and expiry | Sales Commitment |
| Sales Orders | confirmed SO, commercial snapshots, cancellation/replacement and roll-up status | Sales Commitment |
| Inventory availability | receiving, lots, physical stock, sellable availability, safety stock, holds, FEFO and transfers | Inventory Availability |
| Warehouse operations | receiving, adjustments, movement history, lot disposition and shortage detection | Inventory Availability |
| Fulfillment | allocation execution, picking, packing, staging, readiness and shortage handling | Fulfillment & Delivery with Inventory authority |
| Dispatch and delivery | dispatch, schedule, attempts, partial delivery, continuation and final outcomes | Fulfillment & Delivery |
| Cold-chain optional capability | manual temperature evidence, excursion, HOLD and disposition | Fulfillment & Delivery operationally; Inventory owns sellability effect |
| Credit | limits, reservations, available credit and approval/rejection | Credit & Receivables |
| Receivables and payments | receivable posting, payment report/confirmation, application, refund/correction and reconciliation | Credit & Receivables + Payments |
| Business documents | SO document, delivery note, commercial invoice, payment receipt, financial adjustment and replacements | Business Documents |
| Notifications | in-app/email candidate, preference, delivery attempt, retry and failure | Notifications |
| Business traceability | durable business timeline, actor/reason/evidence/correlation and historical lookup | Business Traceability |
| Operational visibility | authorized projections for orders, stock, fulfillment, deliveries, credit, payments and exceptions | consuming contexts; source facts remain owned |
| Website acquisition | public product information, Contact/Request Demo and login/onboarding entry | Website surface; Tenant authority remains API/BC-01 |

## Explicit non-mapping

One capability may use several contexts. One context may support several capabilities. A folder, route, table, schema or Spring module is not evidence of a strategic boundary.
