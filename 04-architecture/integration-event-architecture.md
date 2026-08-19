---
status: draft
maturity: DRAFT
scope: v1
owner: architecture
last-reviewed: 2026-08-19
---

# Integration and event architecture TARGET

## Event classes

| Class | Purpose | Durability | Consumer contract |
|---|---|---|---|
| Domain fact | Notify a local module that an owned decision happened | transactionally recorded with owner state | internal, versioned only when crossing a durable boundary |
| Integration event | Cross-module or external contract | outbox-backed | stable event name, schema version, scope and event ID |
| Notification intent | Ask delivery infrastructure to inform a person/system | durable intent and delivery attempt | retryable, template/version aware |
| Audit fact | Evidence of actor, scope, action and outcome | append-only audit trail | not a replacement for domain state |
| Change-feed event | Refresh a web projection | durable or replayable enough for UX | consumer treats it as a hint and refetches authoritative data |

## Required envelope

```json
{
  "eventId": "uuid",
  "eventType": "SalesOrderConfirmed.v1",
  "occurredAt": "2026-08-19T00:00:00Z",
  "tenantId": "uuid",
  "workspaceId": "uuid",
  "aggregateType": "SalesOrder",
  "aggregateId": "uuid",
  "aggregateVersion": 4,
  "correlationId": "uuid",
  "causationId": "uuid",
  "actor": {"type": "USER", "id": "uuid"},
  "payload": {}
}
```

`tenantId` and `workspaceId` are mandatory where the fact is tenant-scoped. System workers carry an explicit bounded actor and may not omit scope. Sensitive payment/provider payloads are minimized; secrets and raw credentials never enter events.

## Delivery and failure

- Write owner state and outbox record in one database transaction.
- Dispatcher claims records with a lease and fencing token; retry uses bounded backoff and visible terminal state.
- Consumer inbox records `(consumer, eventId)` before/with its effect. Duplicate delivery is a normal condition.
- Poison messages go to a reviewable dead-letter state with reason, attempt count and correlation ID.
- Replays are explicit, scoped and idempotent. A replay cannot silently resend an external payment or email.
- A web change feed is advisory. The browser refetches with current authorization and revision, then renders conflict/stale state if needed.

Spring Modulith supports transactional event publication and module interaction patterns; the target still requires explicit idempotency and operational policy. See the [official event publication guidance](https://docs.spring.io/spring-modulith/reference/events.html).

## Initial event families

| Family | Examples | Primary consumers |
|---|---|---|
| Access | `MembershipActivated`, `MembershipSuspended`, `CapabilityChanged` | Platform/Portal authorization projection, audit |
| Relationship | `BuyerRelationshipApproved`, `BuyerRelationshipSuspended` | Catalog visibility, Portal projection |
| Commercial | `PurchaseRequestSubmitted`, `CommercialCommitmentEstablished`, `SalesOrderConfirmed`, `SalesOrderCancelled` | Availability, Credit, notifications |
| Availability | `AvailabilityChanged`, `AllocationChanged`, `InventoryAdjusted` | Sales, fulfillment, operational views |
| Fulfillment | `FulfillmentShort`, `DispatchCreated`, `DeliveryCompleted`, `ContinuationRequired` | Portal tracking, documents, notifications |
| Finance | `CreditReserved`, `ReceivableRecorded`, `PaymentConfirmed`, `PaymentFailed` | Sales, reconciliation, Portal read models |
| Evidence | `DocumentIssued`, `NotificationDelivered`, `AuditRecorded` | traceability and support |

The list is a starting contract register, not permission to emit events from every method. Current implementation event names such as `StockCommitted` remain AS-IS translation evidence where found; the target Product language is Commercial Commitment versus Physical Allocation. Each event must have an owner, consumer, retention, privacy classification and test.
