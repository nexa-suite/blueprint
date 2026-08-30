---
status: draft
maturity: DRAFT
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# BC-04 Sales Commitment — Tactical Model

**State:** TARGET core-domain model. This is the commercial authority for
Purchase Request, Commercial Commitment and Sales Order. It never owns
Warehouse, Lot or Physical Allocation.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `RequestDraft` | editable buyer intent; no commitment or reservation | Customer/Buyer/SKU IDs |
| `PurchaseRequest` | submitted all-or-nothing commercial intent with expiry and immutable snapshots | CustomerAccount, BuyerRelationship, SKU IDs |
| `CommercialCommitment` | persistent warehouse-neutral SKU demand; ownership transfers PR to SO | SKU ID; backing is BC-05 |
| `SalesOrder` | confirmed commercial roll-up and lifecycle; no draft SO V1 | Customer/Buyer IDs, PR ID |

Lines compose into their root. Commitment references do not compose Inventory
Backing or Physical Allocation. `MaterialChangeProposal` and adjustment facts
preserve history without mutating submitted snapshots.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `RequestDraft` | Aggregate Root | draft ID, buyer/tenant scope, status, version | `addLine()`, `removeLine()`, `changeDestination()`, `submit()` | composes DraftLine; submit delegates atomic app service |
| `RequestDraftLine` | Entity | SKU ID, quantity, informative price | `changeQuantity()` | owned by Draft; no reservation |
| `PurchaseRequest` | Aggregate Root | request ID, scope, status, expiresAt, commercial snapshot, version | `submit()`, `proposeMaterialChange()`, `acceptMaterialChange()`, `withdraw()`, `reject()`, `expire()`, `convert()` | composes RequestLine; accepted state machine |
| `PurchaseRequestLine` | Entity | SKU ID, quantity, price snapshot, terms snapshot | `replaceCommercialSnapshot()` | owned by PR; immutable after submit except replacement revision |
| `MaterialChangeProposal` | Entity / fact | revision, change set, buyer consent, validation status | `accept()`, `reject()`, `expire()` | owned by PR history; TARGET |
| `CommercialCommitment` | Aggregate Root | commitment ID, owner type/id, status, expiry, version | `establish()`, `transferOwnership()`, `release()`, `adjust()` | warehouse-neutral; BC-05 references ID |
| `CommercialCommitmentLine` | Entity | SKU ID, quantity, unit price, snapshot | `adjustQuantity()` | owned by Commitment |
| `SalesOrder` | Aggregate Root | order ID, source PR, status, confirmedAt, version | `confirm()`, `markInFulfillment()`, `recordFulfillment()`, `complete()`, `cancel()` | composes SO lines; confirmed born state |
| `SalesOrderLine` | Entity | SKU ID, committed/fulfilled quantity, price snapshot | `recordFulfilledQuantity()`, `cancelRemainder()` | owned by SO |
| `CommercialTermsSnapshot` | Value Object | price, terms, currency, delivery facts | `isEquivalentTo()` | immutable PR/SO evidence |
| `Quantity` / `Expiration` | Value Objects | positive amount / absolute Instant | `subtract()`, `hasExpired(now)` | protects quantity and expiry |
| `PurchaseRequestState` / `SalesOrderState` | Enum | accepted lifecycle values | none | no `UNDER_REVIEW` persisted |
| `SalesCommitmentPolicy` | Domain Service | none | `validateSubmission()`, `validateConversion()` | coordinates policy without owning roots |
| `PurchaseRequestRepository` / `SalesOrderRepository` | Repository interfaces | none | `save()`, `byId()` | roots only |
| `PurchaseRequestSubmitted` / `SalesOrderConfirmed` | Domain Events | IDs, occurredAt, correlation | immutable facts | published catalog remains 14 |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `SubmitPurchaseRequestHandler` | PR submission | locks required resources in deterministic order; creates commitment, backing and credit reservation atomically |
| `AcceptMaterialChangeHandler` | accepted revision | buyer consent, authoritative price/inventory/credit revalidation and atomic replacement |
| `ConvertPurchaseRequestHandler` | PR to SO | CAS plus `now >= expiresAt` guard; transfers commitment ownership without release gap |
| `ConfirmDirectOrderHandler` | direct SO | authoritative validation and same logical commitment/credit boundary |
| `TerminatePurchaseRequestHandler` | withdraw/reject/expire | terminal CAS, release ledger and outbox exactly once |
| `RecordSalesOrderFulfillmentHandler` | commercial roll-up | consumes fulfillment facts; never chooses lots |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `BuyerRequestController` | Portal draft/PR boundary | AS-IS sales controller; KEEP/REFINE |
| `SalesOrderController` | Portal/Platform SO boundary | AS-IS; KEEP/REFINE |
| `ManualSalesOrderController` | Platform direct/manual order boundary | AS-IS; KEEP |
| `SalesCommitmentConsumer` | Inventory/Credit orchestration port | TARGET application contract, not a REST endpoint invention |
| `PurchaseRequestProjectionConsumer` | Platform/Portal/Mobile reader | TARGET projection contract |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `PurchaseRequestRepositoryAdapter` | PostgreSQL PR, lines, snapshots and events | AS-IS `JdbcPurchaseRequest...`; KEEP/REFINE |
| `SalesOrderRepositoryAdapter` | PostgreSQL SO and lifecycle | AS-IS; KEEP/REFINE |
| `CommercialCommitmentRepositoryAdapter` | commitment persistence | AS-IS V75 evidence; REFINE ownership semantics |
| `InventoryAvailabilityPort` | synchronous BC-05 backing decision | TARGET port; no aggregate sharing |
| `CreditReservationPort` | synchronous BC-07 credit decision | TARGET port; no ledger ownership |
| `SalesOutboxAdapter` | post-commit publication | AS-IS integration outbox; KEEP |

## Invariants and transaction boundaries

- Draft creates no commitment/reservation.
- PR submission is all-or-nothing: committed demand, complete Inventory
  Reservation backing and applicable Credit Reservation are established before
  commit.
- `SUBMITTED`, `CHANGES_PROPOSED`, `CONVERTED`, `REJECTED`, `WITHDRAWN` and
  `EXPIRED` are the only persisted PR states.
- Default expiry is 72 hours; conversion fails at `now >= expiresAt` even if a
  worker has not written `EXPIRED`.
- PR to SO transfers commitment ownership; no release/re-reserve gap.
- SO is born `CONFIRMED`; completion means no unresolved quantity, not payment.
- Material change requires Buyer acceptance and authoritative revalidation.

## Events, persistence and evidence

Internal events include `PurchaseRequestSubmitted`, `MaterialChangeAccepted`,
`CommercialCommitmentTransferred` and `SalesOrderConfirmed`. Published event
count remains 14. See [BC-04 data model](data/data-model.md), [target SQL](data/target-relational-model.sql)
and [domain UML](diagrams/domain-model.puml).

AS-IS evidence at API main: `sales` PR/SO/draft/commitment classes and V11–V13,
V21, V41, V45, V55, V75–V76, V83. Classification: draft/PR/SO persistence
**KEEP/REFINE**, commercial commitment **KEEP structurally / REFINE atomic
orchestration**, full material-change replacement semantics **NOT IMPLEMENTED**.
