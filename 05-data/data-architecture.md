---
status: draft
maturity: DRAFT
scope: v1
owner: data
last-reviewed: 2026-08-19
---

# Data architecture TARGET

## Position

Keep the shared PostgreSQL V1 topology. It is a deliberate operational choice, not proof that every current schema is an accepted domain boundary. Proposed ownership follows Strategic DDD and must be reconciled with the existing Flyway history before implementation.

PostgreSQL Row-Level Security is a defense-in-depth control: when enabled, normal queries are constrained by policies, but table ownership, bypass roles and service paths still require explicit review. See the [PostgreSQL RLS documentation](https://www.postgresql.org/docs/current/ddl-rowsecurity.html).

## Ownership model

| Data family | Proposed owner | Other modules receive |
|---|---|---|
| Global identity, Tenant, Workspace, membership | Tenant and Access | authorized identity/context projection |
| Buyer relationship and Customer Account | Customer and Buyer Relationship | relationship status and allowed commercial view |
| Product/SKU, price policy and terms | Catalog and Commercial Policy | immutable resolution/snapshot |
| Purchase Request and Sales Order | Sales Commitment | status, line and snapshot projections |
| stock, lots, reservations, allocation | Inventory Availability | availability/commitment decisions |
| fulfillment, dispatch, delivery, POD, incidents | Fulfillment and Delivery | progress and evidence projection |
| exposure, credit, receivable, posting intent | Credit and Receivables | decision and financial status |
| payment intent/report/confirmation/provider event | Payments | business payment status; no raw provider secret |
| document metadata, versions, numbering | Business Documents | authorized reference and download capability |
| notification delivery and audit/change feed | Notification and Traceability | delivery/status/trace facts |

Logical schema ownership may remain physically shared. A module must not write another owner's rows directly. Cross-owner references use stable IDs and published contracts; read projections may denormalize with recorded source version.

## Identity and scope

- Global identity ID is distinct from Tenant, Workspace, membership and Buyer relationship IDs.
- Use UUID identifiers internally and separate human-readable numbers for business documents/orders where required.
- Every tenant-scoped row carries an explicit scope path appropriate to its owner; do not infer authorization from a client-provided Tenant ID.
- RLS policies, application access context, repository predicates and worker scope form defense in depth. A missing context fails closed.
- A Buyer relationship is not workforce membership. Buyer access is authorized per relationship and current supplier Tenant.

## History and snapshots

Submitted Purchase Request and confirmed Sales Order retain line, price, terms, delivery and commercial snapshots. Inventory decisions retain lot/expiry and quantity evidence. Payment and document records retain provider/reference identity without storing secrets. Audit records actor, scope, action, outcome and correlation; it does not replace business state.

## Migration and operations rules

- Flyway migrations are forward-only and backward-compatible with the rollout step.
- Prefer additive columns/tables, backfill with scoped batches, dual-read/dual-write only with an explicit sunset and rollback plan.
- Never silently reinterpret current data as a new context owner. Record translation/alias mapping.
- Index every high-volume scope predicate, foreign key, status/expiry query and idempotency lookup after query-plan evidence.
- Retention, legal hold, deletion/anonymization, backup, restore and residency are open decisions; do not invent periods.
- Deterministic seed imports must be explicit, scoped and safe for repeated execution; seed data is not production business history.
