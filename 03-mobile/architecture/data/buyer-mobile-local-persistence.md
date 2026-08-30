---
status: planned
maturity: DRAFT
scope: runway
owner: mobile
last-reviewed: 2026-08-29
---

# Buyer Mobile Local Persistence

**Decision:** PROPOSED / RESEARCH VALIDATION PENDING
**Technology:** NOT SELECTED
**Authority:** LOCAL / NON-AUTHORITATIVE
**Offline scope:** online-first V1 safe reading, harmless receipt/discrepancy
drafts and notification state.

## Logical records

| Record | State kind | Minimum fields | V1 rule |
|---|---|---|---|
| `BuyerSessionReference` | secure reference | `sessionId`, identity reference, expiry, revocation marker | No password, raw token, card data or provider secret in local business records |
| `ActiveBuyerRelationshipReference` | context | tenant, workspace, customer account, relationship ID/status, fetchedAt | Revalidate server-side before protected reads or writes |
| `RecentDeliveryProjection` | cache | delivery ID, window, state, safe handoff/evidence refs, freshness | Read-only projection; no local delivery completion or POD success |
| `HandoffContextProjection` | cache/session | delivery, attempt, relationship, token state and expiry | Refresh/resolve through API; QR resolution is not acceptance |
| `BuyerReceiptDraft` | draft | offered/accepted quantities, decision, reason, evidence refs, idempotency key | Queue only; API creates immutable receipt/discrepancy fact |
| `NotificationState` | local notification state | notification reference, target reference, receivedAt, consumedAt | Opens an authorized Delivery projection; stale links fail safely |
| `FreshnessMetadata` | freshness metadata | relationship scope, source version, lastCheckedAt, staleAt | Advisory; refresh is required before receipt |
| `ConflictRetryMetadata` | retry metadata | operation ID, attempts, retryAt, conflict code, lastKnownVersion | Explicit retry/review; no last-write-wins |

## Forbidden offline success

Payment success, credit decision, security/authorization mutation, Purchase
Request submission, Sales Order confirmation and Buyer receipt are never marked
successful offline. A harmless draft can remain local; only Nexa can create or
confirm business facts. There is no generic V1 sync cursor or background sync
engine.
Payment credentials and unrestricted sensitive identity data remain outside this
model.

## Academic boundary

This model reuses BC-01, BC-02, BC-03, BC-04, BC-06, BC-07, BC-08, BC-09,
BC-10 and BC-11 Domain Models through shared contracts. V1 local records are
limited to recent Delivery/handoff reads, harmless receipt/discrepancy drafts,
freshness and notification state. It does not create a Buyer Mobile Bounded
Context or authoritative database.

Diagram: [Buyer Mobile local persistence](buyer-mobile-local-persistence.puml).
