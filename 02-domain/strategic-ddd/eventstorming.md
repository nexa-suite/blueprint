---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# EventStorming PRE-V1 baseline

Events below are business facts, not commands, endpoints or implementation callbacks. Atomic facts are committed synchronously; published events announce them afterward.

## P1 — Commercial intent to Sales Commitment

`CartDraftCreated -> AuthoritativePriceResolved -> PurchaseRequestSubmitted -> CommercialCommitmentEstablished -> CreditReservationEstablished (when applicable) -> PurchaseRequestVisibleToSales -> MaterialChangeProposed (optional) -> BuyerChangeAccepted (when required) -> SalesOrderConfirmed -> CommitmentOwnershipTransferred`

Rejections, withdrawal and expiry release active commitment/credit effects exactly once. No partial submitted commitment. No persisted `UNDER_REVIEW` state.

## P2 — Availability to Physical Allocation

`StockReceived -> LotCreated -> SellableAvailabilityChanged -> CommitmentDemandObserved -> AllocationExecuted -> InventoryMoved -> ShortageDetected (exception) -> AllocationReplanned (if possible)`

Commercial Commitment protects SKU + quantity. Physical Allocation selects lots and cannot exceed usable stock or commitment. FEFO override records reason.

## P3 — Fulfillment to Delivery and POD

`FulfillmentPlanned -> FulfillmentAllocated -> PickingStarted -> PickingCompleted -> Packed -> Staged -> ReadyForDispatch -> HandedOver -> DeliveryDispatched -> DeliveryAttempted -> DeliveryCompleted`

Exceptions: `FulfillmentShortage`, `FulfillmentOnHold`, `DeliveryAttemptFailed`, `DeliveryRescheduled`, `PartialDeliveryRecorded`, `ContinuationDeliveryCreated`, `PODAmended`.

Failed attempts remain on same Delivery. Partial delivery preserves final delivered/rejected quantities and creates continuation for remaining obligation.

## P4 — Tenant, workforce and Buyer relationship

`TenantProvisioningRequested -> TenantActivated -> WorkforceMembershipGranted -> CapabilityChanged -> BuyerRelationshipRequestedOrInvited -> BuyerRelationshipApproved -> BuyerIdentityLinked`

Suspension/revocation and security audit facts are distinct from business timeline facts.

## P5 — Credit, receivables and payment

Credit/net: `CreditLimitChanged -> CreditReservationEstablished -> SalesOrderConfirmed -> ReceivablePosted (reservation converted/released without double count) -> PaymentReported -> PaymentConfirmed -> PaymentApplied`

PREPAID: `PaymentReported -> PaymentConfirmed -> SalesOrderConfirmed`.

IMMEDIATE: `SalesOrderConfirmed -> PaymentReported -> PaymentConfirmed -> PaymentApplied`.

Provider failure, duplicate callback, refund and correction are explicit facts. Receivable is posted at SO confirmation for credit/net terms; invoice issuance and delivery completion are not universal triggers.

## P6 — Documents, notifications and traceability

`BusinessDocumentIssued -> DocumentAvailable`

Source facts produce `NotificationCandidate`; Notifications emit delivery/retry/failure facts. Every significant source fact also creates an append-only Business Traceability record with actor, timestamp, reason, correlation and evidence reference where relevant. Notification failure never mutates source state.

## Event classes

1. Internal Domain Events: local fact contracts inside owner transaction.
2. Published Integration Events: outbox-backed contracts with a known consumer.
3. Traceability/Audit facts: durable evidence streams; Security Audit remains separate.

No event is emitted merely because a method exists. Event Contract Matrix lives in [Integration and Event Architecture](../../04-architecture/integration-event-architecture.md).
