---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-06 — Fulfillment & Delivery functional contract

**Purpose:** execute allocated work through pick, pack, stage, dispatch, Delivery
Attempts, handoff and immutable physical outcome evidence.

| Contract element | Definition |
|---|---|
| Concepts / roots | Fulfillment, Delivery, Dispatch Handoff, Delivery Attempt, Continuation Delivery, POD, Temperature Evidence, Buyer Receipt |
| Value objects | DeliveryId, AttemptId, HandoffTokenReference, DeliveryQuantity, GeoPoint, EvidenceReference |
| Boundary | Owns execution and delivery facts; BC-05 remains physical allocation authority and BC-09 owns document metadata. |
| Commands | PlanFulfillment, ConfirmPicking, RecordDispatchHandoff, DispatchDelivery, StartAttempt, RecordDeliveryOutcome, CreateContinuation, CapturePOD, IssueHandoffToken, RecordBuyerReceipt, RecordDiscrepancy |
| Queries | ReadFulfillment, ReadAssignedDeliveries, ReadDelivery, ReadAttemptHistory, ValidateHandoffToken |
| Invariants | Allocation binding precedes pick; handoff != POD; QR/token != acceptance; Driver outcome != Buyer receipt; partial/rejection preserves offered/accepted/rejected quantities and continuation. |
| Actors / surfaces | Warehouse Operator, Dispatch Coordinator, Driver / Delivery Operator, Customer Buyer; Platform, Operations Mobile, Buyer Portal/Mobile. |
| Synchronous dependencies | BC-05 allocation; BC-02 Buyer Relationship for handoff/receipt; BC-09 evidence references. |
| Events / consumers | `FulfillmentShortage.v1`, `DeliveryCompleted.v1`, `ContinuationDeliveryCreated.v1`; handoff/receipt/discrepancy are internal facts. |
| Trace / idempotency / concurrency | bounded TTL/one-time token, attempt and outcome idempotency, delivery version/CAS, immutable evidence and actor/reason. |
| Scope | V1: pick/dispatch/attempt/handoff/POD/receipt/discrepancy and selective evidence queue. V2/Future: ETA, route optimization, richer contact/tracking. |
| AS-IS evidence | API v0.15–v0.17 fulfillment/delivery endpoints, handoff tokens and receipt/discrepancy facts; native client absent. |
