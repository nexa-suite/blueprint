---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-08 — Payments functional contract

**Purpose:** record payment intent, provider/manual evidence, confirmation,
reconciliation, refund and correction without owning credit or orders.

| Contract element | Definition |
|---|---|
| Concepts / roots | Payment, Payment Attempt, Provider Event, Refund, Payment Correction, Reconciliation Case |
| Value objects | PaymentId, PaymentReference, Money, Currency, ProviderEventId, PaymentStatus |
| Boundary | Owns payment lifecycle and provider ACL; BC-07 owns credit/receivable application. |
| Commands | CreatePaymentIntent, StartPaymentAttempt, ReportPayment, ConfirmPayment, ReconcileProviderEvent, RefundPayment, CorrectPayment |
| Queries | ReadPaymentStatus, ReadPaymentHistory, ReadReconciliationCase |
| Invariants | Payment Reported != Payment Confirmed; provider events are deduped; credentials never enter domain records; confirmed payment is immutable with correction facts. |
| Actors / surfaces | Company Owner, Business Operations Manager, Customer Buyer; Platform, Buyer Portal, Buyer/Operations Mobile. |
| Synchronous dependencies | BC-07 application after confirmation; BC-04 direct order/commitment policy may require immediate result. |
| Events / consumers | `PaymentConfirmed.v1`; consumes provider/manual evidence and publishes only accepted catalog facts. |
| Trace / idempotency / concurrency | provider event/idempotency keys, inbox dedupe, fenced finalization, correction reason and evidence. |
| Scope | V1: provider-neutral/manual payment lifecycle and correction. V2/Future: additional providers, advanced reconciliation and fiscal integration. |
| AS-IS evidence | API v0.15–v0.17 payment/reconciliation classes and OpenAPI; credentials/provider operations are production-gate open. |
