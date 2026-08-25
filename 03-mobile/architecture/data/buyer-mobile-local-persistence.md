---
status: planned
maturity: DRAFT
scope: runway
owner: mobile
last-reviewed: 2026-08-25
---

# Buyer Mobile Local Persistence

**Decision:** PROPOSED / RESEARCH VALIDATION PENDING
**Technology:** NOT SELECTED
**Authority:** LOCAL / NON-AUTHORITATIVE
**Offline scope:** safe reading and non-critical draft preparation.

## Logical records

| Record | State kind | Minimum fields | Sync rule |
|---|---|---|---|
| `BuyerSessionReference` | secure reference | `sessionId`, identity reference, expiry, revocation marker | No password, raw token, card data or provider secret in local business records |
| `ActiveBuyerRelationshipReference` | context | tenant, workspace, customer account, relationship ID/status, fetchedAt | Revalidate server-side before protected reads or writes |
| `RecentCatalogProjection` | cache | SKU, presentation, media ref, cold-chain indicator, server version | Refreshable; product/SKU authority stays BC-03/API |
| `PriceAvailabilityProjection` | cache | SKU, price/terms snapshot, safe availability, currency, freshness/expiry | Stale data cannot authorize a commitment |
| `RequestDraft` | draft | local draft ID, lines, delivery reference, client version, updatedAt | Local draft; server PR only after authoritative validation |
| `PendingSafeDraftOperation` | outbox / pending operation | operation ID, draft ID, payload, idempotency key, state | Queueing is not order confirmation; server controls state |
| `RecentPurchaseRequestProjection` | cache | PR ID, status, expiry, totals, version | Read-only projection; refresh handles missed events |
| `RecentSalesOrderProjection` | cache | SO ID, lifecycle, committed/fulfilled quantities, version | Never mutate local copy into authoritative state |
| `RecentDeliveryProjection` | cache | delivery ID, window, state, safe tracking/evidence refs, freshness | No local delivery completion or POD success |
| `NotificationDeepLinkState` | local navigation | notification/event ID, target reference, consumedAt | Opens authorized API projection; stale links fail safely |
| `SyncCursor` | sync metadata | relationship scope, server cursor/version, lastSyncAt | Gap detection triggers replay or full refresh |
| `ConflictRetryMetadata` | sync metadata | operation ID, attempts, retryAt, conflict code, serverVersion | Explicit retry/review; no last-write-wins |

## Forbidden offline success

Payment success, credit decision, security/authorization mutation, Purchase
Request submission and Sales Order confirmation are never marked successful
offline. A draft can remain local; only API can create or confirm server facts.
Payment credentials and unrestricted sensitive identity data remain outside this
model.

## Academic boundary

This model reuses BC-01, BC-02, BC-03, BC-04, BC-06, BC-07, BC-08, BC-09,
BC-10 and BC-11 Domain Models through shared API. It does not create a Buyer
Mobile Bounded Context or authoritative database.

Diagram: [Buyer Mobile local persistence](buyer-mobile-local-persistence.puml).
