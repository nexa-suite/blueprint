---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-08-23
---

# Data Architecture TARGET — PRE-V1

Shared PostgreSQL is the V1 topology. It is infrastructure, not a Bounded Context boundary. This target closes logical ownership and invariants; physical migrations, retention, legal hold and production operations remain separate gates.

## Ownership matrix

| Data family | Strategic owner | Other contexts receive |
|---|---|---|
| Tenant, Workspace relationship, identity, membership and capabilities | Tenant & Access Governance | authorized scope/context |
| Customer Account and Buyer Relationship | Customer & Buyer Relationships | relationship status and eligible account reference |
| Product, SKU, visibility, price lists, terms, promotions | Catalog & Commercial Policy | resolved offer and immutable snapshot |
| Purchase Request, Commercial Commitment, Sales Order and revisions | Sales Commitment | status, line, snapshot and commitment reference |
| physical stock, Inventory Lot, Sellable Availability, Safety Stock, HOLD/QUARANTINE | Inventory Availability | availability, movement, shortage and allocation contracts |
| Physical Allocation authority | Inventory Availability | Fulfillment execution receives selected lot/quantity contract |
| Fulfillment, Dispatch, Delivery, Attempt, Continuation and POD | Fulfillment & Delivery | progress/outcome/evidence projections |
| Credit Limit, Credit Reservation, Available Credit, Receivable and Financial Adjustment | Credit & Receivables | credit decision and financial status |
| Payment report/confirmation, provider event, refund and reconciliation | Payments | provider-neutral Payment facts |
| issued Business Documents, numbering, versions, storage metadata | Business Documents | authorized document reference/download capability |
| Notification intent, attempts, delivery and retry state | Notifications | delivery outcome |
| business timeline and trace facts | Business Traceability | authorized historical projection |
| security/authorization audit | security technical authority with BC-01 scope | protected security evidence, never Buyer timeline |

## Data rules

- One owner writes source rows. Cross-owner references use stable IDs, versioned contracts or immutable snapshots; no direct repository/entity/table reach-through.
- Every tenant-scoped row has an explicit scope path appropriate to its owner. Client-supplied Tenant IDs are never authorization.
- RLS, application authorization, repository predicates and worker scope form defense in depth. Missing context fails closed. Use transaction-local PostgreSQL scope (`SET LOCAL`), never unsafe pooled session state.
- Submitted PR and confirmed SO retain price, terms, line, delivery and commercial snapshots. Inventory facts retain lot, expiry, quantity, hold/disposition and allocation evidence. Payment and document facts retain provider/reference identity without secrets.
- `Sellable Availability = usable physical on-hand - active Commercial Commitments - Safety Stock`. HOLD, QUARANTINE, DAMAGED/WASTE, EXPIRED and IN_TRANSIT are excluded from usable sellable quantity.
- Inventory Availability owns Physical Allocation authority; Fulfillment & Delivery owns execution. Allocation cannot exceed commitment or usable physical quantity.
- Credit formula is `Credit Limit - Active Credit Reservations - Outstanding Receivable Balances`. Reservation-to-receivable transition is explicit and cannot double count.
- Append-only traceability and issued documents preserve history. Retention/deletion/anonymization periods are Production/Legal Gate decisions; no destructive deletion is assumed.

## Migration policy

Use additive forward migrations, scoped backfills, compatibility windows and explicit translation aliases. Existing `catalog_item_id`, `exposure`, `used` and reservation columns are AS-IS translation points. No current schema is silently renamed into a strategic owner. Keep, refine or rework before any rewrite.
