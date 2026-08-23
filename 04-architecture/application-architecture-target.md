---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-08-23
---

# Application Architecture TARGET — PRE-V1

This is the accepted construction target. It does not claim current code already conforms and does not mandate a microservice or one technical module per Bounded Context.

## Runtime shape

| Decision | PRE-V1 target | Constraint |
|---|---|---|
| Deployment | one Nexa Application API modular monolith | no service split before ownership, data and operations justify it |
| Persistence | shared PostgreSQL | logical ownership, tenant scope and RLS; no database-per-BC assumption |
| Files | Object Storage behind application port | API owns metadata, authorization and scanning state |
| Web surfaces | Website, Internal Web Platform and Buyer Portal | distinct actors, workflows and information exposure |
| Integrations | provider ACLs and durable inbound/outbound processing | Payment/Stripe, email, maps and storage details stay at adapters |

## Strategic ownership to technical responsibility

| Strategic BC | Technical responsibility lens | Contract boundary |
|---|---|---|
| Tenant & Access Governance | identity, tenant, workspace, membership, authorization and context | synchronous access decision; RLS scope |
| Customer & Buyer Relationships | account, relationship and eligibility application services | relationship query/command contract |
| Catalog & Commercial Policy | product/SKU, visibility and price resolution | immutable commercial snapshot |
| Sales Commitment | PR, commitment, SO, revision, conversion and correction | atomic commands; no repository reach-through |
| Inventory Availability | physical stock, availability, safety stock, FEFO, transfer and allocation authority | conditional availability/allocation contract |
| Fulfillment & Delivery | fulfillment execution, dispatch, delivery, POD and continuation | committed line/quantity contract |
| Credit & Receivables | credit decision, reservation, receivable and adjustment | atomic credit result; ledger/application contract |
| Payments | payment report/confirmation, provider ACL, refund and reconciliation | provider-neutral Payment contract |
| Business Documents | numbering, snapshot, immutable issue, replacement and storage metadata | document request/reference contract |
| Notifications | notification intent, channel delivery, retry and terminal failure | durable notification contract |
| Business Traceability | append-only business fact and timeline projection | source reference/correlation contract |

Technical modules may co-host contexts during migration. They must not share entity/repository/table ownership. A module boundary is not a Bounded Context.

## Dependency and layer rules

```text
presentation -> application -> domain
                         \-> ports <- infrastructure adapters

cross-context: published command/query contract or durable event
forbidden: module A -> module B entity/repository/table/provider client
```

The application layer owns transaction orchestration and idempotency. Domain layer owns invariants and state transitions. Infrastructure implements ports, RLS scope, outbox/inbox, provider ACLs and leases. Presentation maps canonical UI states and contracts.

## Consistency strategy

- PR submit, required commitment/credit reservation, direct order, PR-to-SO conversion, terminal transition, physical mutation and critical authorization are synchronous in one PostgreSQL transaction where required.
- Optimistic version/CAS protects mutable objects. Conditional updates/row locks protect scarce inventory and credit. Lock order is deterministic.
- `If-Match` protects user-facing revisions; idempotency keys protect retried business intentions. Neither replaces the other.
- Outbox rows commit with source state. Consumers are at-least-once and use inbox/deduplication, lease/fencing and visible retry/terminal state.
- External calls are not held inside unnecessarily long DB transactions. Provider success with local failure becomes reconciliation state, never erased history.

## Construction gate

Construction authorization is passed for repository-specific target planning and vertical slices. Before implementation ownership changes, verify aggregate/table ownership, API contracts, event matrix, authorization capabilities, migrations, idempotency, concurrency, observability, rollback and consumer tests. Use KEEP -> REFINE -> REWORK. No application repository mutation is part of Blueprint closure; this is not production readiness.
