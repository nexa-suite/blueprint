---
status: draft
maturity: DRAFT
scope: v1
owner: architecture
last-reviewed: 2026-08-19
---

# Tactical DDD guidance TARGET

This guide turns the proposed Strategic DDD language into implementation questions. It is not a class-generation plan. Each candidate requires example-driven review, invariant confirmation and data ownership acceptance before code changes.

## Aggregate candidate register

| Candidate root | Lifecycle / invariant focus | Atomic boundary | Concurrency / command | Events / repository |
|---|---|---|---|---|
| Tenant / Membership | Tenant identity, Workspace relation, membership status and capability grant | Tenant plus membership change where authorization must be atomic | activate/suspend membership; optimistic version; unique identity+Tenant | `MembershipChanged`; TenantAccess repository |
| Customer Account / Buyer Relationship | relationship status, allowed Buyer users, commercial visibility | relationship and membership link only when same decision | approve/suspend relationship; version + idempotency | `BuyerRelationshipChanged`; relationship repository |
| Product / SKU | sellable identity, units, cold-chain attributes and lifecycle | Product/SKU and owned attributes | publish/archive/update; version | `SkuPublished`; catalog repository |
| Price List / Terms | effective pricing, eligibility, payment terms and snapshot source | policy version and its lines | resolve/activate; effective-date uniqueness | `CommercialPolicyChanged`; policy repository |
| Purchase Request | draft/revision/submit/accept/reject/cancel and immutable submitted lines | request, revision and line snapshots | submit/revise/decide; `If-Match` + idempotency | `PurchaseRequestSubmitted`; request repository |
| Sales Order | accepted commercial commitment, immutable price/terms and lifecycle | order, lines and commercial snapshots | confirm/cancel; version + idempotency | `SalesOrderConfirmed`; order repository |
| Commercial Commitment | committed SKU + quantity and expiry/release policy | commitment and owned lines | establish/release/expire; row/version lock + idempotency | `CommercialCommitmentEstablished`, `CommercialCommitmentReleased` |
| Inventory Lot / Availability | physical truth, usable quantity, lot/expiry and FEFO policy | lot balance and adjustment | qualify/adjust/transfer/release; row lock + version | `InventoryAdjusted`, `AvailabilityChanged` |
| Fulfillment | planned quantities and execution state | fulfillment plan and line execution | create/short/complete; version | `FulfillmentProgressed`; fulfillment repository |
| Dispatch / Delivery | dispatch handoff, route stop, POD, incident and continuation | delivery attempt and evidence metadata | dispatch/accept/deliver/continue; version + idempotency | `DeliveryCompleted`, `ContinuationRequired` |
| Credit / Receivable | Credit Limit, Credit Reserved, Outstanding Receivables and posting intent | credit ledger entry / receivable state | reserve/release/record/settle; serializable or guarded ledger update | `CreditReserved`, `ReceivableRecorded` |
| Payment | payment intent, reported/confirmed state, refund and provider event identity | payment state plus provider event inbox | create/confirm/refund/reconcile; idempotency + inbox lease | `PaymentConfirmed`, `PaymentReconciled` |
| Business Document | immutable metadata/version, number and evidence link | metadata/version/number allocation | issue/replace/download; unique number + authorization | `DocumentIssued`; document repository |

## Modeling rules

- Aggregate roots protect invariants; they are not generic containers for every related table.
- Read models may join across modules. Write models must honor owner boundaries.
- Use value objects for identifiers, quantities, currency, temperature, date ranges, scope and provider event identity when they carry validation or semantic rules.
- Commands name intent and include actor/scope, idempotency key and expected revision where relevant.
- Domain events describe a fact that other modules may need; integration events add a stable external contract and version.
- Repositories expose aggregate-shaped operations, not arbitrary table queries.
- A JPA entity is a persistence mapping, not automatically an aggregate root. Keep transaction and invariant decisions in domain/application code.
- Snapshots on Purchase Request, Sales Order and fulfillment lines preserve the commercial decision at the time it was made. Re-reading current catalog or terms must not rewrite history.
- Payment is a business concept. Stripe is an adapter identity; provider details do not enter Credit, Receivable or Sales Order language.

## Candidate review questions

For each candidate, record: owner, identity, lifecycle, invariant examples, atomic writes, lock/version strategy, idempotency scope, emitted facts, query projections, migration compatibility, authorization capability, audit event and failure compensation. If any answer is unknown, mark the candidate proposed and do not infer code ownership from package names.
