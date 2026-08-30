---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# Functional contract layer

One file per accepted Bounded Context. These contracts translate Product and
Strategic DDD decisions into behavior that Web, Mobile and future consumers can
use without importing persistence structure. They are target contracts; exact
URI, DTO and migration details remain implementation evidence or an explicit
technical decision.

| Contract | Owner | Core responsibility |
|---|---|---|
| [BC-01 Tenant & Access Governance](BC-01-tenant-access-governance.md) | BC-01 | identity, workforce access, Tenant/Workspace scope |
| [BC-02 Customer & Buyer Relationships](BC-02-customer-buyer-relationships.md) | BC-02 | Customer Account and Buyer Relationship authority |
| [BC-03 Catalog & Commercial Policy](BC-03-catalog-commercial-policy.md) | BC-03 | Product/SKU, offer, price and terms resolution |
| [BC-04 Sales Commitment](BC-04-sales-commitment.md) | BC-04 | drafts, Purchase Requests and Sales Orders |
| [BC-05 Inventory Availability](BC-05-inventory-availability.md) | BC-05 | physical stock, sellability, backing and allocation |
| [BC-06 Fulfillment & Delivery](BC-06-fulfillment-delivery.md) | BC-06 | pick, dispatch, delivery outcomes and handoff |
| [BC-07 Credit & Receivables](BC-07-credit-receivables.md) | BC-07 | credit exposure and receivable lifecycle |
| [BC-08 Payments](BC-08-payments.md) | BC-08 | payment attempts, confirmation and corrections |
| [BC-09 Business Documents](BC-09-business-documents.md) | BC-09 | immutable issued documents and evidence metadata |
| [BC-10 Notifications](BC-10-notifications.md) | BC-10 | notification intent, channel delivery and retry |
| [BC-11 Business Traceability](BC-11-business-traceability.md) | BC-11 | append-only business facts and timeline |

## Contract conventions

- Commands return an authoritative outcome, conflict or rejection; queries may
  be stale and must expose freshness/version where relevant.
- Cross-context references are stable identifiers. A consumer does not write
  another context's tables.
- Required atomic invariants use synchronous application contracts. Committed
  facts propagate through an outbox/inbox path.
- `V1`, `V2` and `Future` are product scope labels, not implementation claims.
- Each contract records AS-IS evidence separately from TARGET behavior.
