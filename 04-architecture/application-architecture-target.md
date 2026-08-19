---
status: draft
maturity: DRAFT
scope: v1
owner: architecture
last-reviewed: 2026-08-19
---

# Application architecture TARGET

This is a construction target, not an implementation claim. Strategic DDD boundaries are proposed in [Strategic DDD](../02-domain/strategic-ddd/strategic-ddd-baseline.md) and require Business Architect review before code ownership changes.

## Runtime shape

| Decision | TARGET | Constraint |
|---|---|---|
| Deployment | Keep one Nexa Application API modular monolith for V1 | Do not split services before ownership, data and operational evidence justify it |
| Persistence | Keep shared PostgreSQL for V1 | Logical ownership, scope predicates and RLS are mandatory; no database-per-context assumption |
| Files | Keep Object Storage behind an application port | API owns metadata, authorization and malware-scan state |
| Web surfaces | Keep Website, Platform and Buyer Portal separate | Shared design primitives do not erase actor or security boundaries |
| Integration | Provider ACLs behind ports and durable inbound/outbound processing | Stripe, SMTP, maps and storage remain replaceable adapters |

## Proposed application modules

These are logical responsibility modules, not accepted Bounded Contexts and not a promise to rename current packages.

| Module | Owns | Publishes / consumes | Forbidden coupling |
|---|---|---|---|
| Identity and Tenant Access | global identity, Tenant, Workspace, membership, role/capability and access context | membership/access facts; consumes identity provider/session facts | no catalog, order or payment policy |
| Customer and Buyer Relationship | Customer Account, Buyer relationship, terms visibility and relationship lifecycle | relationship facts; consumes Tenant access and commercial policy | no global Buyer credit or inventory mutation |
| Catalog and Commercial Policy | Product/SKU, price lists, terms, promotion eligibility and sellable policy | catalog/policy facts; consumes Tenant configuration | no physical stock or order state |
| Sales Commitment | Purchase Request, revision, Sales Order, commitment and commercial snapshots | commitment facts; consumes customer, price, availability and credit decisions | no direct provider SDK or warehouse row mutation |
| Inventory Availability | stock lots, FEFO, reservation/allocation and availability | availability/allocation facts; consumes catalog and commitment requests | no invoice/payment posting |
| Fulfillment and Delivery | fulfillment plan, pick/pack, dispatch, delivery, POD, incident and continuation | fulfillment/delivery facts; consumes committed lines and routes | no credit approval or provider credentials |
| Credit and Receivables | exposure, available credit, terms, receivable lifecycle and financial posting intent | credit/receivable facts; consumes commitment and payment facts | no Stripe vocabulary in the business model |
| Payments | payment intent/report/confirmation, refund/reconciliation and provider identity | payment facts; consumes receivable/payment commands | no direct order acceptance decision |
| Business Documents | document metadata, numbering, version, evidence and download authorization | document facts; consumes business references | no ownership of source aggregate state |
| Notification and Traceability | notification intent/delivery and cross-context business trace | notification/audit facts; consumes durable facts | no domain invariant ownership |

### Dependency rule

Dependencies point from use cases to domain ports and from adapters to ports. A module may consume another module's published command/query contract or event; it must not reach into another module's repository, entity, table mapping or provider client. Shared code is limited to technical primitives and explicitly approved value objects, never business policy.

```text
presentation -> application -> domain
                         \-> ports <- infrastructure adapters

cross-module: published command/query contract or durable event
forbidden: module A -> module B entity/repository/table/provider
```

Spring Modulith verification and application-module tests are suitable guards for these rules; they verify the declared technical module graph, not Strategic DDD acceptance. See the [official verification guide](https://docs.spring.io/spring-modulith/reference/verification.html).

## Consistency strategy

- Keep one local transaction for an aggregate and its owned rows.
- Use explicit application commands for decisions that need an immediate answer: price resolution, credit decision, availability check and order acceptance.
- Use durable events for cross-module facts, projections, notifications and provider reconciliation.
- Treat event handlers as at-least-once. Every handler needs an event identity, idempotent effect and observable retry/dead-letter state.
- Use an outbox transactionally with the state change. Do not publish a business event from an uncommitted in-memory callback.
- Use inbox/claim leases and fencing for external callbacks and workers; never rely on a process-local lock.
- `If-Match` protects user-facing revision changes. Idempotency keys protect command retries. They solve different problems and are both required where applicable.

## Boundary review gates

Before implementation ownership changes, review: aggregate ownership, data table ownership, event contracts, authorization capabilities, transaction boundaries, migration compatibility, observability, rollback and consumer tests. No proposed module becomes a Bounded Context or a deployable service from this document alone.
