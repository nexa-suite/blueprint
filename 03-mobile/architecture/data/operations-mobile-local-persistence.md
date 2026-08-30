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
**Offline scope:** online-first V1 assistance only: safe reads, harmless drafts,
temporary evidence staging and retry metadata.

## Logical records

| Record | State kind | Minimum fields | V1 rule |
|---|---|---|---|
| `LocalSessionReference` | secure reference | `sessionId`, `humanIdentityId`, expiry, revocation marker | Never stores password, bearer token or provider secret; secure platform boundary remains open |
| `ActiveTenantContext` | context | `tenantId`, `workspaceId`, `membershipId`, capability version | Refresh before mutation; server authorization wins |
| `AssignedWorkCache` | cache | work ID, work type, version, status, assigned actor, fetchedAt | Refreshable projection; stale work cannot imply authority |
| `DeliveryAssignmentCache` | cache | delivery ID, destination reference, customer reference, version, freshness | Read-only until Nexa accepts an operation |
| `FulfillmentWorkCache` | cache | fulfillment ID, lines, SKU/lot refs, expected quantity, version | Picking view is projection; authoritative allocation stays server-side |
| `SkuLotLookupCache` | cache | SKU/lot identity, barcode/QR metadata, expiry, disposition, fetchedAt | Safe refresh; expired/quarantined state cannot be overridden locally |
| `DeliveryHandoffReference` | remote reference | delivery/attempt, token state, expiry, customer reference | Token resolution is online-authoritative; never store raw token beyond approved transient use |
| `BuyerReceiptEvidenceDraft` | draft/evidence | offered/accepted quantities, decision, reason, evidence refs, idempotency key | Temporary staging only; Buyer receipt/discrepancy fact is created by Nexa |
| `PushSubscriptionReference` | device reference | installation, platform, safe lifecycle/version | Store no provider token; BC-10 API controls registration/disable/retry |
| `TemperatureEvidenceDraft` | draft | draft ID, delivery/lot reference, reading, unit, capturedAt, actor, evidence refs | Draft may survive loss; submission gets idempotency key and server result |
| `EvidenceUploadQueueItem` | temporary staging | local evidence ID, object metadata, hash, retry count, state | Upload only through an authorized flow; never proof success by itself |
| `PendingOperationalAction` | pending operation | action ID, action type, aggregate ID, payload snapshot, idempotency key, createdAt | Safe retry metadata only; never authoritative while disconnected |
| `FreshnessMetadata` | freshness metadata | scope, source version, lastCheckedAt, staleAt | Advisory; refresh is required before critical work |
| `ConflictRetryMetadata` | retry metadata | operation ID, attempts, nextRetryAt, conflict code, lastKnownVersion | Bounded retry and visible review; no last-write-wins |

## Offline safety

Local read/cache, harmless drafts and temporary evidence staging can support
warehouse and driver work. A local action is not a successful inventory
mutation, allocation, pick, dispatch, Delivery finalization, POD issuance,
Buyer receipt, temperature disposition or authorization change until Nexa
returns an authoritative result. Duplicate retry reuses the same idempotency
key. There is no generic V1 sync cursor or background synchronization engine.

## Academic boundary

This model satisfies logical local-persistence coverage without selecting a
framework or inventing Mobile implementation classes. It reuses BC-01, BC-05,
BC-06, BC-09, BC-10 and BC-11 canonical Domain Models through shared contracts.

Diagram: [Operations Mobile local persistence](operations-mobile-local-persistence.puml).
