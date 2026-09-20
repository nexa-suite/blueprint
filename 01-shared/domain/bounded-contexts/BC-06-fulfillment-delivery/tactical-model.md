---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-09-20
---

# BC-06 Fulfillment & Delivery — Tactical Model

**State:** TARGET core-domain execution model. Fulfillment and Delivery are
separate roots; a failed attempt remains under one Delivery and partial outcome
creates an idempotent Continuation Delivery.

## Purpose and product participation

Own fulfillment execution, dispatch, delivery attempts, continuation and
immutable operational evidence. Platform and OWNER-ACCEPTED Operations Mobile
projections execute work; Portal and Buyer Mobile consume authorized
projections.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `Fulfillment` | execution plan for a Sales Order, lines and picking/packing progression | SO and Physical Allocation IDs |
| `Delivery` | delivery obligation, assignment, attempts, handoff/Buyer facts and remaining quantity | SO/Fulfillment IDs, customer/address snapshot |
| `ProofOfDelivery` | immutable delivery evidence; corrections are addenda | Delivery/Attempt IDs, Object Storage refs |
| `TemperatureEvidence` | manual reading/evidence and excursion decision input | Delivery/Lot IDs |

Picking results are Fulfillment-owned facts. DeliveryAttempt belongs to Delivery
and is never a new Delivery aggregate.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `Fulfillment` | Aggregate Root | fulfillment ID, SO ID, status, version | `allocate()`, `startPicking()`, `markPicked()`, `pack()`, `stage()`, `handover()`, `complete()` | composes lines/results |
| `FulfillmentLine` | Entity | SKU, required/picked/packed quantity, allocation ID | `recordPick()`, `recordDiscrepancy()` | owned by Fulfillment |
| `PickingResult` | Entity / fact | line, actor, quantity, scan ref, occurredAt | `confirm()` | immutable scan result |
| `PickingDiscrepancy` | Entity / fact | reason, quantity, disposition | `record()` | owned by Fulfillment history |
| `Delivery` | Aggregate Root | delivery ID, SO/Fulfillment IDs, state, window, remaining quantity, version | `schedule()`, `assignDriver()`, `start()`, `recordAttempt()`, `issueHandoffToken()`, `recordBuyerReceipt()`, `closePartial()`, `createContinuation()`, `complete()` | composes Assignment/Attempt/Driver Outcome, handoff and Buyer facts |
| `DeliveryAssignment` | Entity | driver reference, vehicle/reference, assignedAt, unassignedAt | `assign()`, `reassign()`, `unassign()` | owned by Delivery; at most one active assignment |
| `DeliveryAttempt` | Entity | attempt ID, delivery ID, Driver Outcome, attemptedAt | `recordFailure()`, `recordPartialOutcome()`, `recordSuccess()` | one Delivery; no numeric universal limit |
| `DeliveryQuantityOutcome` | Entity / Value | SKU, delivered, rejected, remaining, reason | `validateAgainstObligation()` | owned by Attempt |
| `DeliveryHandoffToken` | Entity / security fact | token hash, expiry, one-time state, Delivery/Attempt/Buyer references | `issue()`, `consumeOnce()`, `expire()` | bounded application-security fact; not QR/Scanner aggregate |
| `BuyerReceiptFact` | Entity / immutable fact | Buyer relationship, accepted/rejected quantity, discrepancy and occurredAt | `record()` | does not overwrite Driver Outcome or POD history |
| `DriverOutcome` | Value Object / immutable fact | attempted result, actor, occurredAt, reason | `isTerminal()` | Driver fact; distinct from Buyer Receipt |
| `ProofOfDelivery` | Aggregate Root | POD ID, delivery/attempt ID, status, capturedAt, immutable evidence | `finalize()`, `rejectPending()` | immutable; Addendum not overwrite |
| `ProofOfDeliveryAddendum` | Entity / fact | POD ID, correction reason, evidence ref, createdAt | `append()` | append-only correction |
| `TemperatureEvidence` | Aggregate Root / immutable fact | evidence ID, delivery/lot, reading, unit, capturedAt, actor | `record()` | manual V1 evidence; excursion references it by ID |
| `TemperatureExcursion` | Entity | affected quantity, threshold, state, disposition | `placeOnHold()`, `recordDisposition()` | links BC-05 disposition by ID |
| `ContinuationDelivery` | Entity / root-linked record | parent Delivery, child Delivery, remaining quantities, idempotency key | `createOnce()` | one idempotent parent-to-child relation; not retry attempt or second lifecycle |
| `DeliveryState` / `FulfillmentState` | Enum | accepted progress and explicit exceptions | none | lifecycle guards; Assignment remains a fact |
| `DeliveryExecutionPolicy` | Domain Service | none | `calculateRemaining()`, `shouldCreateContinuation()` | no aggregate ownership |
| `FulfillmentRepository` / `DeliveryRepository` | Repository interfaces | none | `save()`, `byId()` | roots only |
| `ProofOfDeliveryFinalized` / `DeliveryPartiallyCompleted` | Domain Events | IDs, quantities, occurredAt | immutable facts | published catalog unchanged |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `PlanFulfillmentHandler` | create/advance fulfillment | validates allocation contract and line quantities |
| `ConfirmPickingHandler` | scan/pick confirmation | idempotent scan, version guard, discrepancy fact |
| `AssignDeliveryHandler` | driver/route assignment | checks delivery readiness and capability |
| `FinalizeDeliveryAttemptHandler` | success/failure/partial attempt | immutable outcomes, same Delivery and continuation idempotency |
| `FinalizeProofOfDeliveryHandler` | immutable POD finalization | evidence references, policy-scoped fields and outbox |
| `RecordTemperatureEvidenceHandler` | manual cold-chain evidence | stores reading, creates excursion/hold signal; no IoT claim |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `LogisticsController` | dispatch/delivery operations boundary | AS-IS; KEEP/REFINE |
| `ProofOfDeliveryController` | POD/evidence boundary | AS-IS; KEEP |
| `FulfillmentController` | Platform warehouse execution boundary | TARGET coherent seam; current routes are evidence |
| `DeliveryStatusConsumer` | Portal/Mobile read projection | AS-IS Portal facade plus OWNER-ACCEPTED Mobile target projection; no live tracking |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `FulfillmentRepositoryAdapter` | fulfillment/picking persistence | TARGET over warehouse/logistics evidence |
| `DeliveryRepositoryAdapter` | delivery/attempt/continuation persistence | AS-IS `DispatchQueryPersistenceAdapter`; REFINE |
| `ProofEvidenceObjectPort` | Object Storage metadata/upload boundary | AS-IS evidence lifecycle; KEEP/REFINE |
| `MapRoutingPort` | optional route/geolocation ACL | AS-IS maps port; external provider, not domain class |
| `FulfillmentOutboxAdapter` | post-commit transition publication | shared technical adapter |

## Invariants and transaction boundaries

- Fulfillment states are exactly `PLANNED`, `ALLOCATED`, `PICKING`, `PICKED`,
  `PACKED`, `STAGED`, `READY_FOR_DISPATCH`, `HANDED_OVER`, `COMPLETED`,
  `SHORTAGE`, `HOLD` and `CANCELLED`; allocation authority remains BC-05.
- Failed DeliveryAttempt remains under same Delivery; no universal numeric
  exhaustion limit.
- Partial delivery records actual delivered/rejected truth and creates one
  idempotent parent-to-child continuation for remaining obligation.
- Delivery states are exactly `PLANNED`, `SCHEDULED`, `DISPATCHED`,
  `IN_TRANSIT`, `ATTEMPTED`, `DELIVERED`, `PARTIALLY_DELIVERED`,
  `ATTEMPT_FAILED`, `RESCHEDULED`, `CANCELLED` and `FAILED_FINAL`.
  Assignment is a separate time-bounded fact; at most one is active.
- POD original is immutable; correction is an addendum/revision.
- Driver Outcome is separate from Buyer Receipt. Buyer acceptance/rejection and
  discrepancy preserve a distinct immutable history; token/QR resolution alone
  is not acceptance.
- Photo/signature evidence is required only when policy says so. V1 location is
  external navigation handoff; no stored, background or live Driver tracking.
- Temperature evidence is manual V1. Excursion places affected quantity on
  HOLD pending explicit ColdChainDisposition; it does not auto-destroy stock.

## Persistence concurrency guards

`fulfillment` and `delivery` use SQL `version` CAS: each mutable transition
includes `WHERE <root_id> = :id AND version = :expectedVersion` and increments
`version`. `proof_of_delivery` uses an expected-state predicate
(`WHERE pod_id = :id AND status = :expectedStatus`) before sealing/rejecting;
`temperature_evidence` is append-only and has no mutable-version claim.

## Events, persistence and evidence

Internal events include `PickingConfirmed`, `DeliveryAttemptRecorded`,
`ProofOfDeliveryFinalized` and `TemperatureExcursionDetected`. See [BC-06 data model](data/data-model.md),
[target SQL](data/target-relational-model.sql) and [domain UML](diagrams/domain-model.puml).

AS-IS evidence at API main: `logistics` delivery/dispatch/POD/temperature
classes, V18–V20, V56, V74, V77, V79 and V81. Classification: dispatch/POD/
temperature persistence **KEEP/REFINE**, failed-attempt/continuation semantics
**KEEP structurally**, full Fulfillment aggregate and atomic partial closure
**PARTIAL / NOT IMPLEMENTED**.

## Mobile v0.17 reconciliation

`DeliveryHandoffToken` is a bounded, hashed/expiring, one-time application
security fact owned by the Delivery workflow. It references Delivery, Attempt,
Customer Account and Buyer Relationship; it is not a QR or Scanner aggregate.
`BuyerReceiptFact` and Buyer discrepancy are immutable Delivery facts. Buyer
acceptance does not overwrite Driver Outcome/Attempt/POD history, and QR
resolution alone is not acceptance. API v0.17.0 provides the handoff token and
receipt/discrepancy contract in additive V93–V100 migrations. V1 location is
external navigation handoff, not stored or permanent tracking.
