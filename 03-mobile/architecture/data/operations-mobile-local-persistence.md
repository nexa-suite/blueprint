---
status: planned
maturity: DRAFT
scope: runway
owner: mobile
last-reviewed: 2026-08-29
---

# Operations Mobile Local Persistence

**Decision:** PROPOSED / RESEARCH VALIDATION PENDING
**Technology:** NOT SELECTED
**Authority:** LOCAL / NON-AUTHORITATIVE
**Offline scope:** selective Driver and Warehouse assistance only.

## Logical records

| Record | State kind | Minimum fields | Sync rule |
|---|---|---|---|
| `LocalSessionReference` | secure reference | `sessionId`, `humanIdentityId`, expiry, revocation marker | Never stores password, bearer token or provider secret; secure platform boundary remains open |
| `ActiveTenantContext` | context | `tenantId`, `workspaceId`, `membershipId`, capability version | Refresh before mutation; server authorization wins |
| `AssignedWorkCache` | cache | work ID, work type, version, status, assigned actor, fetchedAt | Refreshable projection; stale work cannot imply authority |
| `DeliveryAssignmentCache` | cache | delivery ID, route snapshot, customer reference, version, freshness | Read-only until server accepts operation |
| `FulfillmentWorkCache` | cache | fulfillment ID, lines, SKU/lot refs, expected quantity, version | Picking view is projection; authoritative allocation stays server-side |
| `SkuLotLookupCache` | cache | SKU/lot identity, barcode/QR metadata, expiry, disposition, fetchedAt | Safe refresh; expired/quarantined state cannot be overridden locally |
| `DeliveryHandoffReference` | remote reference | delivery/attempt, token state, expiry, customer reference | Token resolution is online-authoritative; never store raw token beyond approved transient use |
| `BuyerReceiptEvidenceDraft` | draft/evidence | offered/accepted quantities, decision, reason, evidence refs, idempotency key | Queue only; Buyer receipt/discrepancy fact is created by API |
| `PushSubscriptionReference` | device reference | installation, platform, safe lifecycle/version | Store no provider token; BC-10 API controls registration/disable/retry |
| `TemperatureEvidenceDraft` | draft | draft ID, delivery/lot reference, reading, unit, capturedAt, actor, evidence refs | Draft may survive loss; submission gets idempotency key and server result |
| `EvidenceUploadQueueItem` | upload queue | local evidence ID, object metadata, hash, retry count, state | Upload only through authorized API/Object Storage flow |
| `PendingOperationalAction` | outbox / pending operation | action ID, action type, aggregate ID, payload snapshot, idempotency key, createdAt | `PENDING -> SENT -> ACCEPTED/REJECTED/CONFLICT`; never ACCEPTED offline |
| `SyncCursor` | sync metadata | scope, server cursor/version, lastSyncAt | Advisory; server replay or refresh handles gaps |
| `ConflictRetryMetadata` | sync metadata | operation ID, attempts, nextRetryAt, conflict code, lastServerVersion | Bounded retry and visible review; no last-write-wins |

## Offline safety

Local scan/read/cache can support warehouse and driver work. A local action may
be queued, but it is not a successful inventory mutation, delivery finalization,
POD issuance, Buyer receipt, temperature disposition or authorization change until API returns
an authoritative result. Duplicate retry reuses the same idempotency key.

## Academic boundary

This model satisfies logical local-persistence coverage without selecting a
framework or inventing Mobile implementation classes. It reuses BC-01, BC-05,
BC-06, BC-09, BC-10 and BC-11 canonical Domain Models through API contracts.

Diagram: [Operations Mobile local persistence](operations-mobile-local-persistence.puml).
