---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-08-23
---

# Integration and Event Architecture PRE-V1

Events are business facts, not commands, endpoints or a substitute for atomic consistency. No Published Integration Event exists without a known consumer.

## Event classes

| Class | Purpose | Persistence |
|---|---|---|
| Internal Domain Event | notify owner/application boundary of a committed local fact | same local business transaction |
| Published Integration Event | cross-context or external consumer contract | durable outbox row in same commit |
| Traceability/Audit fact | durable business history or security evidence | append-only trace/audit store |
| Notification intent | request channel delivery | durable notification/outbox state |
| Change-feed hint | prompt authorized UI refetch | durable/replayable enough for UX; never source authority |

## Event envelope

```json
{
  "eventId": "uuid",
  "eventType": "SalesOrderConfirmed.v1",
  "occurredAt": "2026-08-23T00:00:00Z",
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

Tenant/workspace scope is mandatory for tenant facts. System workers use an explicit bounded actor and reconstructed scope. Secrets, bearer tokens, card PAN/CVV and unnecessary provider payloads never enter events.

## Event Contract Matrix

| Event | Owner | Internal / Published | Known Consumer | Sync / Async | Outbox | Inbox | Ordering scope | Idempotency | Failure behavior | Schema/version |
|---|---|---|---|---|---|---|---|---|---|---|
| `PurchaseRequestSubmitted.v1` | Sales Commitment | Published | Notifications, Traceability, operational projections | async after atomic commit | required | required for durable consumer | Purchase Request | event ID + consumer | retry, visible terminal/dead-letter | additive v1; versioned envelope |
| `CommercialCommitmentEstablished.v1` | Sales Commitment | Published | Inventory Availability, Credit & Receivables | sync decision; async announcement | required | required | CommitmentId | command idempotency + event ID | atomic reject; outbox retry | versioned payload |
| `SalesOrderConfirmed.v1` | Sales Commitment | Published | Fulfillment, Credit, Documents, Notifications, Traceability | sync source fact; async consumers | required | required | SalesOrderId | event ID and source version | retry/reconcile; no duplicate SO | versioned contract |
| `CreditReservationEstablished.v1` | Credit & Receivables | Internal/Published | Sales Commitment, Traceability | synchronous atomic result | required if published | consumer dedupe | Credit Account + CommitmentId | reservation intention key | transaction rollback; no half reservation | v1 with currency/amount |
| `AvailabilityChanged.v1` | Inventory Availability | Published | Sales/Portal/Platform projections | async | required | required | SKU + Warehouse | event ID + source version | refetch/retry; stale UI state | additive v1 |
| `PhysicalAllocationCreated.v1` | Inventory Availability | Published | Fulfillment & Delivery, Traceability | sync decision; async announcement | required | required | CommitmentId | allocation intention key | explicit shortage; no over-allocation | v1 |
| `FulfillmentShortage.v1` | Fulfillment & Delivery | Published | Sales Commitment, Inventory, Notifications, Traceability | async after source decision | required | required | FulfillmentId | event ID + shortage reference | retry; unresolved state visible | v1 |
| `DeliveryCompleted.v1` | Fulfillment & Delivery | Published | Documents, Notifications, Traceability, Portal | async after immutable POD | required | required | DeliveryId | POD/finalization key | retry; source remains completed | v1 |
| `ContinuationDeliveryCreated.v1` | Fulfillment & Delivery | Published | Portal, Dispatch, Notifications, Traceability | async after partial delivery transaction | required | required | SalesOrderId + continuation ID | continuation creation key | retry; one continuation per outcome | v1 |
| `PaymentConfirmed.v1` | Payments | Published | Credit & Receivables, Sales/Portal, Notifications, Traceability | async after provider/manual confirmation | required | required | PaymentId/provider event | provider event ID + payment key | inbox dedupe; reviewable failure | v1; provider-neutral |
| `ReceivablePosted.v1` | Credit & Receivables | Published | Documents, Portal/Platform, Traceability | async after SO confirmation transaction | required | required | ReceivableId | posting intention key | retry/reconcile; no double count | v1 |
| `BusinessDocumentIssued.v1` | Business Documents | Published | Portal, Notifications, Traceability | async after immutable issue | required | required | DocumentId | issuance key | retry; issued history unchanged | v1 |
| `NotificationDeliveryFailed.v1` | Notifications | Published | Traceability, operations | async | required | required | NotificationId | delivery attempt key | retry then terminal visible; source unchanged | v1 |
| `BusinessFactTraced.v1` | Business Traceability | Internal/Published | authorized timeline projections | async after source commit | required | required | source reference | event ID + source version | retry; trace backlog observable | v1 |

## Consistency and delivery

- PR submission, direct order confirmation, required commitment and credit reservation are one logical PostgreSQL transaction. Events do not create those effects later.
- Write owner state and outbox in one commit. Dispatchers claim with lease/fencing. Consumers use durable inbox/deduplication and assume at-least-once delivery.
- No global event ordering or exactly-once transport is assumed. Use aggregate/business-subject ordering where required.
- Poison messages enter a reviewable terminal/dead-letter state with attempts, reason, correlation and safe replay controls. Replay is idempotent and cannot silently resend payment/email side effects.
- Change-feed events are hints; clients refetch with current authorization and revision, then render `CONFLICT / STALE_STATE` when required.
