---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-07 — Credit & Receivables functional contract

**Purpose:** protect credit exposure and maintain receivable facts for accepted
commercial commitments and confirmed payments.

| Contract element | Definition |
|---|---|
| Concepts / roots | Credit Account, Credit Reservation, Receivable, Receivable Application, Financial Adjustment |
| Value objects | CreditAccountId, Currency, Money, Exposure, ReservationId, ReceivableId |
| Boundary | Owns credit/receivable authority; BC-08 owns payment facts and provider interaction. |
| Commands | ConfigureCredit, ReserveCredit, ReleaseCredit, PostReceivable, ApplyPayment, RecordFinancialAdjustment |
| Queries | ReadCreditAvailability, ReadReceivables, ReadExposure, ReadApplicationHistory |
| Invariants | Last-credit race is serialized; reservation and commitment atomicity is explicit; confirmed receivables are immutable with append-only corrections. |
| Actors / surfaces | Company Owner, Business Operations Manager, Sales Representative, Customer Buyer; Platform, Buyer Portal, Operations/Buyer Mobile. |
| Synchronous dependencies | BC-04 commitment and BC-08 confirmed payment; no UI calculation authorizes credit. |
| Events / consumers | `CreditReservationEstablished.v1`, `ReceivablePosted.v1`; consumes confirmed payment facts with dedupe. |
| Trace / idempotency / concurrency | reservation/application keys; row lock/CAS on exposure; actor, reason, currency and source version recorded. |
| Scope | V1: credit limit/availability, reservation, receivable and correction. V2/Future: richer collections, financing and currency expansion. |
| AS-IS evidence | API v0.15–v0.17 credit/receivable and payment application contracts; Product Acceptance remains open. |
