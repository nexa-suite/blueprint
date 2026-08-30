---
status: draft
maturity: DRAFT
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# BC-08 Payments — Tactical Model

**State:** TARGET generic context. Payment is provider-neutral business truth;
provider callbacks are at-least-once technical inputs. Payment is not Credit,
Receivable or Stripe.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `Payment` | intent/report/confirmation lifecycle and immutable monetary facts | SO/Customer IDs |
| `PaymentProviderEvent` | verified callback identity and payload preservation | Payment ID, provider event ID |
| `PaymentReconciliationCase` | provider success/local failure or uncertain outcome | Payment/SO IDs |

Attempt, refund and correction records are Payment-owned facts; financial
application to Receivable is coordinated with BC-07.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `Payment` | Aggregate Root | payment ID, tenant, source type/id, amount, method ref, status, version | `report()`, `confirm()`, `reject()`, `markUnallocated()`, `requestRefund()` | owns attempts/refund facts |
| `PaymentAttempt` | Entity | attempt ID, provider, provider ref, status, amount, attemptedAt | `recordProviderResult()` | owned by Payment; retries do not double-charge |
| `PaymentProviderEvent` | Entity / inbox fact | provider/event ID, signature result, payload reference, receivedAt | `acceptOnce()`, `rejectSignature()` | at-least-once callback evidence |
| `PaymentRefund` | Entity / fact | refund ID, amount, provider ref, status, createdAt | `request()`, `confirm()`, `fail()` | explicit reversal |
| `PaymentCorrection` | Entity / fact | reason, amount/effect, actor, occurredAt | `record()` | history preserved |
| `PaymentReconciliationCase` | Aggregate Root | case ID, payment ID, state, nextAction | `open()`, `assign()`, `resolve()`, `escalate()` | uncertain provider/local state |
| `PaymentMethodReference` | Value Object | provider-neutral token/reference, type, last4 if safe | `isUsable()` | never raw PAN/CVV |
| `ProviderReference` / `IdempotencyKey` | Value Objects | external ID / stable intention key | `sameAs()` | dedupe keys |
| `PaymentStatus` | Enum | reported, pending, confirmed, rejected, refunded, reconciliation required | none | lifecycle constraints |
| `ProviderCallbackVerification` | Domain Service | none | `verify(signature, event)` | provider ACL, no state ownership |
| `PaymentReconciliationPolicy` | Domain Service | none | `classify(providerResult, localResult)` | explicit uncertainty |
| `PaymentRepository` | Repository interface | none | `save()`, `byId()` | Payment root only |
| `PaymentConfirmed` | Domain Event | payment ID, amount, occurredAt | immutable fact | existing `PaymentConfirmed.v1` only |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `ReportPaymentHandler` | record buyer/platform payment report | validates scope/method and persists intention |
| `InitiateProviderPaymentHandler` | call provider adapter | idempotency, external call boundary and local attempt state |
| `AcceptProviderWebhookHandler` | process callback | signature verification, inbox dedupe and one business transition |
| `ApplyPaymentHandler` | notify/coordinate receivable application | Payment fact plus BC-07 port; no ledger ownership |
| `RequestRefundHandler` | explicit refund | provider operation, refund fact and reconciliation on uncertainty |
| `ResolvePaymentReconciliationHandler` | close uncertain outcome | visible case, no deletion or silent success |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `PaymentController` | payment intent/report/status boundary | AS-IS; KEEP/REFINE |
| `StripeWebhookController` | provider callback boundary | AS-IS; KEEP as adapter edge |
| `PaymentProjectionConsumer` | Portal/Platform/Mobile status reader | TARGET interface role |
| `PaymentApplicationPort` | BC-07 application contract | TARGET port |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `PaymentRepositoryAdapter` | PostgreSQL Payment/attempt persistence | AS-IS `PaymentService`; KEEP/REFINE |
| `StripePaymentProviderAdapter` | provider ACL | AS-IS Stripe adapter; provider remains replaceable |
| `ProviderWebhookInboxAdapter` | durable callback dedupe/lease | AS-IS V53/V63; KEEP |
| `PaymentOutboxAdapter` | publishes PaymentConfirmed after commit | shared technical adapter |

## Invariants and transaction boundaries

- PREPAID requires Payment Confirmed before SO confirmation and physical
  fulfillment. IMMEDIATE may confirm SO first; payment is immediately due.
- Provider webhooks are at-least-once; `(provider, eventId)` dedupe and
  idempotency survive restart.
- Provider success with failed SO creation becomes
  `UNALLOCATED / RECONCILIATION_REQUIRED`; no silent erase.
- Historical Payment facts are immutable. Refund/correction is explicit.
- Never store card secrets, PAN, CVV or bearer/provider secrets.

## Events, persistence and evidence

See [BC-08 data model](data/data-model.md), [target SQL](data/target-relational-model.sql)
and [domain UML](diagrams/domain-model.puml). Existing `PaymentConfirmed.v1`
remains the only relevant published event.

AS-IS evidence at API main: `payments` domain/application/Stripe/presentation,
V43, V53, V59, V62, V63, V68, V78. Classification: Payment/attempt/webhook
queue **KEEP**, provider-neutral reconciliation **REFINE**, complete external
failure compensation **PARTIAL / NOT IMPLEMENTED**.
