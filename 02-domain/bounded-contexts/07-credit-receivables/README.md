---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-07 Credit & Receivables

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Owns credit risk, reservation, formal obligation and correction; Supporting. Strategic importance: protects commercial acceptance and financial consistency. |
| Language / actors | Credit Account, Credit Limit, Credit Reservation, Available Credit, Receivable, Financial Adjustment. Actors: Business Operations Manager, Sales Representative, B2B Buyer. |
| Responsibilities / data | Credit policy, reservations, available credit formula, receivable posting/application and explicit financial corrections. |
| Invariants | Available Credit is explicit; reservation and receivable do not double count; corrections preserve history; Payment != Receivable. |
| Commands | SetCreditLimit, EvaluateCredit, EstablishCreditReservation, ConvertReservationToReceivable, ApplyPayment, ReleaseCredit, RecordFinancialAdjustment. |
| Domain / published events | Internal: CreditEvaluated, CreditReservationReleased, PaymentApplied, FinancialAdjustmentRecorded. Published: CreditReservationEstablished.v1, ReceivablePosted.v1. |
| Upstream / downstream | Upstream: Sales Commitment and Payments facts. Downstream: Sales Commitment, Documents, Portal/Platform and Traceability. Sync: reservation decision; async: payment/receivable announcements. |
| Failure / transaction | Credit rejection rolls back atomic commitment flow; duplicate payment application is idempotent; reconciliation is visible, never silent. |
| Security / tenant | Financial values are tenant-scoped and capability-restricted; Buyer sees authorized projection, not internal risk policy. |
| Web / Mobile consumers | Web: Platform credit/receivable and Portal visibility. Mobile: relevant Sales/BOM visibility and Buyer Mobile read-only credit/receivables/payment evidence. |
| Out of scope | Payment provider lifecycle, document rendering, fiscal authority and a Finance BC. |

## Tactical DDD target

Aggregate Roots: CreditAccount, CreditReservation, Receivable. Entities: CreditLimit, ReceivableApplication, FinancialAdjustment. Value Objects: CreditAmount, AvailableCredit, Terms, AdjustmentReason. Domain Services: CreditDecisionPolicy, DoubleCountPreventionPolicy. Repositories: CreditAccountRepository, ReceivableRepository. Lifecycle: reservation → converted/released; receivable → open → applied/adjusted.
