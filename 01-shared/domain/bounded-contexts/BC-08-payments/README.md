---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-08 Payments

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Owns Payment and provider lifecycle translation; Generic. Strategic importance: isolates provider uncertainty from credit and sales semantics. |
| Language / actors | Payment, Payment Report, provider event, confirmation, refund, correction. Actors: B2B Buyer, Sales Representative, payment worker. |
| Responsibilities / data | Payment intent/report, provider ACL, callback verification, confirmation, failure, refund and correction history. |
| Invariants | Payment != Receivable, Credit or Stripe; provider callbacks dedupe; history is never erased; provider-neutral business state is retained. |
| Commands | ReportPayment, ConfirmProviderPayment, RejectPayment, RefundPayment, CorrectPayment, ReconcilePayment. |
| Domain / published events | Internal: PaymentReported, ProviderCallbackAccepted, PaymentRejected, PaymentRefunded. Published: PaymentConfirmed.v1. |
| Upstream / downstream | Upstream: Buyer/Platform payment intent and provider callback. Downstream: Credit & Receivables, Sales/Portal, Notifications, Traceability, Documents. Sync: callback verification; async: confirmed fact. |
| Failure / transaction | Inbox dedupe and lease/fencing protect callbacks; provider success with failed order creation becomes UNALLOCATED / RECONCILIATION_REQUIRED; no silent refund or erase. |
| Security / tenant | Never store PAN/CVV or bearer secrets in events; verify callback identity; tenant and payment references are scoped. |
| Web / Mobile consumers | Web: Portal and Platform payment surfaces. Mobile: Buyer Mobile payment/evidence and read-only status; Operations Mobile only relevant visibility. |
| Out of scope | Receivable authority, credit policy, document fiscal status and a provider-specific/Stripe BC. |

## Tactical DDD target

Aggregate Root: Payment. Entities: PaymentReport, ProviderCallback, Refund, ReconciliationCase. Value Objects: PaymentId, ProviderReference, Money, PaymentStatus. Domain Services: ProviderCallbackVerification, PaymentReconciliationPolicy. Repositories: PaymentRepository, InboxRepository. Lifecycle: reported → pending → confirmed/rejected → refunded/corrected.

## Tactical wave artifacts

- [Tactical model](tactical-model.md)
- [Domain UML source](diagrams/domain-model.puml)
- [Rendered UML SVG](diagrams/BC08_Payments.svg)
- [Rendered UML PNG](diagrams/BC08_Payments.png)
- [Target data model](data/data-model.md)
- [Target SQL](data/target-relational-model.sql)
- [Database ERD SVG](data/database-diagram.svg) · [PNG](data/database-diagram.png)
