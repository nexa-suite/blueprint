---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Bounded Context Canvases

One canvas exists per strategic context. The detailed canvas is kept beside the
context so ownership, tactical candidates and surface projections remain easy to
review without duplicating the catalog.

| Context | Canvas |
|---|---|
| BC-01 Tenant & Access Governance | [canvas](01-tenant-access-governance/README.md) |
| BC-02 Customer & Buyer Relationships | [canvas](02-customer-buyer-relationships/README.md) |
| BC-03 Catalog & Commercial Policy | [canvas](03-catalog-commercial-policy/README.md) |
| BC-04 Sales Commitment | [canvas](04-sales-commitment/README.md) |
| BC-05 Inventory Availability | [canvas](05-inventory-availability/README.md) |
| BC-06 Fulfillment & Delivery | [canvas](06-fulfillment-delivery/README.md) |
| BC-07 Credit & Receivables | [canvas](07-credit-receivables/README.md) |
| BC-08 Payments | [canvas](08-payments/README.md) |
| BC-09 Business Documents | [canvas](09-business-documents/README.md) |
| BC-10 Notifications | [canvas](10-notifications/README.md) |
| BC-11 Business Traceability | [canvas](11-business-traceability/README.md) |

All canvases use the same fields: purpose, classification, actors, authority,
invariants, commands, events, contracts, failure/transaction semantics,
security, surfaces and explicit exclusions. Tactical DDD is TARGET guidance,
not a claim about current code structure.
