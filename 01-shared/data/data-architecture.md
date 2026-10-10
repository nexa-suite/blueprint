---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-10-09
---

# Data architecture — ownership and persistence states

AS-IS: the current API uses shared PostgreSQL with Tenant/Workspace scope and RLS. TARGET: the [accepted Owner decision](../product/owner-decisions-2026-10.md#physical-database-isolation-by-tenant) requires a central identity/governance database and a physically independent business database per Tenant. The earlier shared PostgreSQL deployment target is superseded. Neither physical topology defines Bounded Context ownership. The logical ownership and invariants below remain applicable; physical migration, retention, legal hold and production operations remain separate gates.

## Ownership matrix

| Data family | Strategic owner | Other contexts receive |
|---|---|---|
| Tenant, Workspace relationship, identity, membership and capabilities | Tenant & Access Governance | authorized scope/context |
| Customer Account and Buyer Relationship | Customer & Buyer Relationships | relationship status and eligible account reference |
| Product, SKU, visibility, price lists, terms, promotions | Catalog & Commercial Policy | resolved offer and immutable snapshot |
| Purchase Request, Commercial Commitment, Sales Order and revisions | Sales Commitment | status, line, snapshot and commitment reference |
| physical stock, Inventory Lot, Sellable Availability, Safety Stock, Inventory Reservation, Warehouse Backing, HOLD/QUARANTINE | Inventory Availability | availability, deterministic multi-Warehouse protection, movement, shortage and allocation contracts |
| Physical Allocation authority | Inventory Availability | Fulfillment execution receives selected lot/quantity contract after Warehouse backing |
| Fulfillment, Dispatch, Delivery, Attempt, Continuation and POD | Fulfillment & Delivery | progress/outcome/evidence projections |
| Credit Limit, Credit Reservation, Available Credit, Receivable and Financial Adjustment | Credit & Receivables | credit decision and financial status |
| Payment report/confirmation, provider event, refund and reconciliation | Payments | provider-neutral Payment facts |
| issued Business Documents, numbering, versions, storage metadata | Business Documents | authorized document reference/download capability |
| Notification intent, attempts, delivery and retry state | Notifications | delivery outcome |
| business timeline and trace facts | Business Traceability | authorized historical projection |
| security/authorization audit | security technical authority; BC-01 supplies tenant/access scope | protected security evidence, never Buyer timeline |

## Data rules

Financial Adjustment business effect belongs to Credit & Receivables; an issued Financial Adjustment document belongs to Business Documents. The document record never becomes a second financial authority.

- One owner writes source rows. Cross-owner references use stable IDs, versioned contracts or immutable snapshots; no direct repository/entity/table reach-through.
- Every tenant-scoped row has an explicit scope path appropriate to its owner. Client-supplied Tenant IDs are never authorization.
- RLS, application authorization, repository predicates and worker scope form defense in depth. Missing context fails closed. Use transaction-local PostgreSQL scope (`SET LOCAL`), never unsafe pooled session state.
- Submitted PR and confirmed SO retain price, terms, line, delivery and commercial snapshots. Inventory facts retain lot, expiry, quantity, hold/disposition and allocation evidence. Payment and document facts retain provider/reference identity without secrets.
- `Sellable Availability = usable physical on-hand - active Commercial Commitments - Safety Stock` at business scope. Inventory Reservation backing distributes protected demand across SKU + Warehouse authorities without double counting. HOLD, QUARANTINE, DAMAGED/WASTE, EXPIRED and IN_TRANSIT are excluded from usable sellable quantity.
- Inventory Availability owns Inventory Reservation backing, deterministic Warehouse sourcing and Physical Allocation authority; Fulfillment & Delivery owns execution. One demand line may be backed by multiple eligible Warehouses. Physical Allocation cannot exceed committed/backed quantity or usable physical quantity.
- Available Credit is `max(0, Credit Limit - Financed Exposure - Outstanding Receivable Balances - Active Credit Reservations)`. These are separate current-use buckets; one obligation must not be counted twice when its balance moves between buckets.
- Append-only traceability and issued documents preserve history. Retention/deletion/anonymization periods are Production/Legal Gate decisions; no destructive deletion is assumed.

## Migration policy

Use additive forward migrations, scoped backfills, compatibility windows and explicit translation aliases. Existing `catalog_item_id`, `exposure`, `used` and reservation columns are AS-IS translation points. No current schema is silently renamed into a strategic owner. Keep, refine or rework before any rewrite.

The physical split requires rehearsed extraction and reconciliation, provisioned database identity checks, isolated credentials and pools, and explicit cross-database consistency contracts. Existing cross-schema foreign keys and joins cannot be assumed to work across independent databases. Preserve published migration history; no production cutover follows from this documentation. Apply BCNF, 4NF and 5NF only to documented dependencies with lossless decomposition, while preserving immutable business evidence.
