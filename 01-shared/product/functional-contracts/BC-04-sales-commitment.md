---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-04 — Sales Commitment functional contract

**Purpose:** own the lifecycle from Request Draft to Purchase Request (PR) and
Sales Order (SO), including material change decisions and commitment history.

| Contract element | Definition |
|---|---|
| Concepts / roots | Request Draft, Purchase Request, Sales Order, Commercial Commitment, Material Change |
| Value objects | CommitmentId, OrderLine, Quantity, CommercialSnapshot, DeliveryWindow, IdempotencyKey |
| Boundary | Owns commitment state; it does not own catalog policy, stock, credit ledger or delivery execution. |
| Commands | CreateDraft, AddDraftLine, SubmitPurchaseRequest, ConfirmDirectOrder, AcceptMaterialChange, RejectMaterialChange, CancelAllowedCommitment |
| Queries | ReadDraft, ReadPurchaseRequest, ReadSalesOrder, ReadCommitmentHistory |
| Invariants | Draft != PR != SO; Direct Order is not a fake PR; no V1 backorder; submit/confirm revalidates price, availability and credit; duplicate command is idempotent. |
| Actors / surfaces | Company Owner, Business Operations Manager, Sales Representative, Customer Buyer; Platform, Buyer Portal, Operations Mobile, Buyer Mobile. |
| Synchronous dependencies | BC-02 relationship, BC-03 commercial snapshot, BC-05 availability/allocation decision, BC-07 credit reservation. |
| Events / consumers | `CommercialCommitmentEstablished.v1`, `SalesOrderConfirmed.v1`, `CreditReservationEstablished.v1` and existing catalog only. |
| Trace / idempotency / concurrency | Idempotency-Key and command result; version/CAS for stale draft; trace actor, source and reason; outbox same transaction. |
| Scope | V1: PR, Direct Order, SO, change and immutable commitment snapshot. V2/Future: richer reorder/returns and advanced commerce. |
| AS-IS evidence | API v0.14–v0.17 commitment/direct-order/expiry contracts and OpenAPI v0.17.0; Web consumers exist, Mobile client absent. |
