---
status: accepted
maturity: FROZEN
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Bounded Context Catalog

The catalog is the canonical strategic boundary. Current technical structures remain AS-IS evidence.

| ID | Context | Classification | Owns conceptually | Must not own |
|---|---|---|---|---|
| BC-01 | Tenant & Access Governance | Supporting | Tenant, Workspace relationship, Human Identity access, Workforce Membership, Company Owner, roles, capabilities and access eligibility | Customer commercial facts, payment policy or inventory |
| BC-02 | Customer & Buyer Relationships | Supporting | Customer Account, Buyer Relationship, buyer identity association, contacts, addresses and customer lifecycle | Global identity authority, catalog price or credit ledger |
| BC-03 | Catalog & Commercial Policy | Supporting | Product, SKU, visibility, Base Price, Price Lists, Customer Terms, Promotions and SKU cold-chain requirement | Physical stock, commitment state or payment confirmation |
| BC-04 | Sales Commitment | Core | Purchase Request, Commercial Commitment, Sales Order, commercial snapshots and cancellation/replacement | Warehouse/Lot selection or provider calls |
| BC-05 | Inventory Availability | Core | physical stock, Inventory Lot, Sellable Availability, Safety Stock, Inventory Reservation, deterministic Warehouse backing, HOLD/QUARANTINE, transfers, movements, FEFO and Physical Allocation authority | Commercial Order ownership, receivable or notification delivery |
| BC-06 | Fulfillment & Delivery | Core | Fulfillment execution, picking, packing, staging, dispatch, Delivery, attempts, continuation, POD and operational cold-chain evidence | Credit approval, commercial price or physical stock authority |
| BC-07 | Credit & Receivables | Supporting | Credit Account, Limit, Credit Reservation, Available Credit, Receivable, balance and Financial Adjustment effects | Payment provider lifecycle or document rendering |
| BC-08 | Payments | Generic | Payment, Payment Report, provider lifecycle, Stripe translation, callbacks, confirmation, failure, refund and correction | Receivable authority or Sales Order acceptance |
| BC-09 | Business Documents | Generic | Sales Order Document, Delivery Note, Commercial Invoice, Payment Receipt, Financial Adjustment, numbering and issued snapshots | Source business state or fiscal SUNAT authority |
| BC-10 | Notifications | Generic | Notification, template, recipient, channel, preference, delivery attempt, retry and failure | Source business fact or durable business timeline authority |
| BC-11 | Business Traceability | Supporting | durable representation of business fact, actor, timestamp, reason, before/after, evidence, correlation and timeline | Source aggregate authority, notification delivery or Security Audit |

## Boundary tests

1. Context owns a business invariant or lifecycle, not merely a screen.
2. Cross-context references use stable IDs, explicit snapshots or published contracts.
3. Source contexts retain fact authority; Business Traceability is a durable transversal representation.
4. A technical module may host several contexts, and one context may span technical modules during migration.
5. `Payment != Receivable`, `Payment != Credit`, `Business Document != fiscal document`, and `Notification != Traceability` remain explicit.
