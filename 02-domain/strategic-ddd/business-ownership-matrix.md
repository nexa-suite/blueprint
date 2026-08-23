---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Business Ownership Matrix

`Owner` means strategic source-of-truth authority. `Executor` means a context may perform operational work without owning the source fact.

| Business concept/fact | Owner | Executor or consumer | Required boundary |
|---|---|---|---|
| Tenant, Workspace relationship, Workforce Membership, roles/capabilities | Tenant & Access Governance | all tenant-scoped contexts | server authorization and relationship eligibility |
| Customer Account, Buyer Relationship, contacts, addresses | Customer & Buyer Relationships | Platform/Portal surfaces | Customer Account may exist without Buyer identity |
| Product, SKU, visibility, price, terms, promotions | Catalog & Commercial Policy | Sales Commitment, Portal/Platform | authoritative resolution then immutable commercial snapshot |
| Purchase Request, Commercial Commitment, Sales Order | Sales Commitment | Platform/Portal, Inventory, Fulfillment | commitment is SKU + quantity, no Warehouse/Lot |
| physical stock, Inventory Lot, Sellable Availability, Safety Stock, FEFO | Inventory Availability | Warehouse/Fulfillment, Sales | SKU + Warehouse authority; tenant-wide views are projections |
| Physical Allocation authority | Inventory Availability | Fulfillment & Delivery executes selection/work | allocation cannot exceed commitment or usable quantity |
| Fulfillment, Dispatch, Delivery, Attempt, Continuation, POD | Fulfillment & Delivery | Platform/Portal, Documents, Notifications | failed attempt stays on same Delivery; partial creates continuation |
| Credit Limit, Credit Reservation, Available Credit, Receivable | Credit & Receivables | Sales Commitment, Payments | no double count on reservation-to-receivable transition |
| Payment Report, Payment, provider callback/refund | Payments | Credit & Receivables applies financial effect | provider vocabulary translated at ACL |
| issued Business Document and numbering | Business Documents | source contexts request; Portal/Platform consume | issued snapshot immutable; replacement/addendum linked |
| notification intent/delivery state | Notifications | source contexts produce candidate; channels execute | failure/retry never changes source state |
| business timeline/trace fact | Business Traceability | all contexts emit facts | append-only representation, source retains authority |
| security/authorization audit | Tenant & Access Governance plus security technical authority | all contexts emit security facts | separate from Business Traceability |

## Data boundary

Shared PostgreSQL is infrastructure. It does not create shared ownership. Each owner exposes stable identifiers and contracts; another context never writes owner rows directly. Read projections carry source version and correlation.
