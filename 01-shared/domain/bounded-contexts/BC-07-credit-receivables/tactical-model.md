---
status: draft
maturity: DRAFT
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# BC-07 Credit & Receivables — Tactical Model

**State:** TARGET supporting financial authority. Credit history is not
rewritten; Financial Adjustment changes current obligation while preserving
original facts. Payment provider lifecycle belongs to BC-08.

## Purpose and product participation

Own credit exposure, reservations, receivables and provider-neutral financial
adjustments. Platform governs authorized financial work; Portal and proposed
Mobile surfaces consume restricted projections.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `CreditAccount` | limit, exposure and reservation policy for one Customer Account | CustomerAccount ID |
| `CreditReservation` | active protection for one commercial source; released or converted once | PR/SO/Commitment IDs |
| `Receivable` | posted obligation, balance and due state | SalesOrder ID |
| `FinancialAdjustment` | explicit correction effect with reason and actor | Receivable ID, source document ID |

`ReceivableApplication` belongs to financial authority because it changes
receivable balance, but references Payment by ID. The application boundary
coordinates BC-08 and BC-07 without a giant cross-context aggregate.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `CreditAccount` | Aggregate Root | account ID, customer ID, limit, policy, version | `setLimit()`, `availableCredit()`, `reserve()`, `release()` | owns reservation decisions |
| `CreditReservation` | Aggregate Root | reservation ID, source type/id, amount, status, version | `establish()`, `release()`, `convertToReceivable()` | one active protection per source |
| `Receivable` | Aggregate Root | receivable ID, SO ID, original amount, outstanding, dueAt, status, version | `post()`, `apply()`, `adjust()`, `close()` | owns obligation history |
| `ReceivableApplication` | Entity / fact | payment ID, amount, appliedAt, idempotency key | `applyOnce()` | Payment ID external; immutable effect |
| `FinancialAdjustment` | Aggregate Root / fact | adjustment ID, receivable ID, effect, amount, reason, createdAt | `approve()`, `apply()` | provider-neutral correction, never erase |
| `FinancialLedgerEntry` | Entity / immutable fact | type, source ID, amount, occurredAt, correlation | none after append | durable financial history |
| `Money` / `CreditLimit` | Value Objects | amount, currency/limit | `subtract()`, `isSufficient()` | no negative balance |
| `ReceivableStatus` / `ReservationStatus` | Enum | open, applied, adjusted, released | none | lifecycle constraints |
| `CreditExposurePolicy` | Domain Service | none | `calculateAvailable(limit, reservations, receivables)` | formula authority |
| `ReceivablePostingPolicy` | Domain Service | none | `postAtSalesOrderConfirmation()` | policy, no source aggregate ownership |
| `CreditAccountRepository` / `ReceivableRepository` | Repository interfaces | none | `save()`, `byId()` | roots only |
| `CreditReservationEstablished` / `ReceivablePosted` | Domain Events | IDs, amount, occurredAt | immutable facts | existing published events only |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `EvaluateCreditHandler` | evaluate available credit | locks account/reservations, applies formula and returns decision |
| `EstablishCreditReservationHandler` | reserve at PR/direct SO boundary | conditional balance guard and idempotency |
| `ConvertCreditReservationHandler` | convert to receivable exposure | one transition key; prevents double count |
| `PostReceivableHandler` | post credit/net obligation | triggered by confirmed SO, not invoice/delivery universally |
| `ApplyPaymentToReceivableHandler` | apply provider-neutral Payment fact | coordinates Payment ID, allocation uniqueness and remaining balance |
| `RecordFinancialAdjustmentHandler` | explicit correction | preserves original ledger fact and reason/evidence |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `CreditExposureController` | Platform/Portal credit view and decisions | AS-IS payment controller/facade; REFINE |
| `ReceivablesController` | financial history projection | TARGET coherent interface; current frontend evidence |
| `CreditReservationPort` | Sales application boundary | TARGET port, not REST endpoint |
| `ReceivableProjectionConsumer` | Platform/Portal/Mobile reader | TARGET projection contract |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `CreditAccountRepositoryAdapter` | PostgreSQL credit/reservation persistence | AS-IS `JdbcCreditBoundary`; KEEP/REFINE |
| `ReceivableRepositoryAdapter` | receivable/allocation/ledger persistence | AS-IS payments adapter; REFINE history |
| `PaymentFactPort` | consumes BC-08 provider-neutral Payment result | TARGET integration port |
| `CreditOutboxAdapter` | emits committed reservation/receivable facts | shared technical outbox |

## Invariants and transaction boundaries

- Available Credit = Credit Limit − Active Credit Reservations − Outstanding
  Receivable Balances.
- Credit purchase reserves at PR submission; direct order reserves during same
  logical SO confirmation.
- Credit/net Receivable posts at SO confirmation. Delivery completion or
  document issuance is not a universal trigger.
- Payment application cannot over-apply or double-apply; original facts and
  explicit adjustments remain queryable.
- Financial data is tenant-scoped and capability-restricted; Buyer sees a safe
  projection, not internal risk policy.

## Events, persistence and evidence

See [BC-07 data model](data/data-model.md), [target SQL](data/target-relational-model.sql)
and [domain UML](diagrams/domain-model.puml). Published event count remains 14.

AS-IS evidence at API main: `payments` credit/receivable domain and V43, V59,
V76, V78. Classification: credit/reservation/receivable persistence **KEEP**,
formula and ledger history **REFINE**, complete Payment-to-Receivable atomic
application **PARTIAL / NOT IMPLEMENTED**.
