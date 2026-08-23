---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-08-23
---

# Transaction, Concurrency and Idempotency Matrix

`Owner` is strategic invariant authority, not current Java package. Required scope, actor, version and idempotency key are resolved before mutation.

| Scenario | Owner / atomic boundary | Guard | Required outcome |
|---|---|---|---|
| Two Buyers request last unit | Inventory Availability + Sales Commitment, one DB transaction | conditional availability update/row lock; deterministic order | one succeeds; loser receives current conflict/shortage; no negative sellable quantity |
| DIRECT_ORDER | Sales Commitment + Inventory Availability + Credit | same ordered locks; availability decision, Commercial Inventory Commitment and required Credit Reservation all-or-nothing; no lot selection or Physical Allocation | SO confirmed with effects, or no SO/effects |
| PR submit | Sales Commitment + Inventory Availability + Credit | PR snapshot, Commercial Inventory Commitment, applicable Credit Reservation, idempotency result and outbox in one transaction; no lot selection or Physical Allocation | submitted PR complete or rollback; no partial commitment |
| PR-to-SO conversion | Sales Commitment | version/CAS, expiry check and ownership transfer | no release/re-reserve gap; stale/expired conversion fails |
| Expire vs Convert | Sales Commitment | terminal-state CAS plus `now >= expiresAt` check | first valid terminal transition wins; conversion cannot win after expiry |
| PR withdrawal/rejection/expiry | Sales Commitment with Inventory Availability/Credit effects | guarded active state and release ledger | Commercial Inventory Commitment and applicable Credit Reservation release exactly once; durable fact/outbox |
| Material PR change | Sales Commitment | revision/If-Match and consent evidence | stale change conflicts; prior snapshot immutable; material change revalidates |
| SO cancellation vs Fulfillment | Sales Commitment + Fulfillment | state/quantity version and deterministic lock order | cancellation or execution wins explicitly; no silent quantity loss |
| Deliver vs Cancel | Fulfillment & Delivery + Sales Commitment | Delivery/POD finalization guard and SO state guard | one authoritative outcome; correction/replacement explicit |
| Physical Allocation | Inventory Availability | lock/version by SKU + Warehouse + lot; FEFO policy | allocation <= commitment and usable quantity; shortage explicit |
| Negative inventory adjustment | Inventory Availability | authorized reason, versioned lot/warehouse mutation | physical truth retained; affected commitment shortage created, not hidden |
| Transfer dispatch/receive | Inventory Availability | transfer ID idempotency and ordered source/destination lock | `REQUESTED -> IN_TRANSIT -> RECEIVED`; no double sellability |
| Fulfillment scan confirmation | Fulfillment & Delivery | line/quantity version and scan idempotency | duplicate scan no-op; quantity never exceeds allocation/commitment |
| Partial delivery | Fulfillment & Delivery | immutable POD/finalization key and remaining quantity CAS | one partial outcome; continuation created once for remainder |
| Delivery retry | Fulfillment & Delivery | Delivery Attempt ID and same Delivery state | failed attempt remains same Delivery; no new Delivery for retry |
| Temperature excursion | Inventory + Fulfillment | lot quantity/state guard | affected quantity HOLD; disposition explicit; no automatic destruction |
| Credit reservation race | Credit & Receivables | conditional balance/reservation row lock/version | last available credit deterministic; no overspend |
| Reservation -> Receivable | Credit & Receivables | transition key and ledger uniqueness | amount counted once; reservation released/converted without double count |
| Payment application | Payments + Credit & Receivables | Payment ID, Receivable ID and application uniqueness | concurrent payments cannot over-apply; residual/review state explicit |
| Provider webhook | Payments | signature plus inbox `(provider,eventId)` and lease/fencing | duplicate callback acknowledged safely; one financial effect |
| Payment success + SO failure | Payments + Sales Commitment | provider side effect outside long DB transaction; reconciliation record | `UNALLOCATED / RECONCILIATION_REQUIRED`; refund attempt; history retained |
| Business Document issue | Business Documents | scoped numbering uniqueness and issuance idempotency | one immutable issued snapshot or reviewable sequence gap |
| Notification delivery | Notifications | notification attempt key/inbox and retry lease | at-least-once delivery; terminal failure visible; source state unchanged |
| Worker claim/finalize | owning worker context | lease expiry, claim token and fencing token | stale worker cannot finalize after lease loss |

## Common strategy

- Optimistic concurrency/CAS for mutable business objects.
- Conditional updates or row locks for scarce inventory/credit and terminal transitions.
- Deterministic lock ordering; narrow critical section; no silent last-write-wins.
- `If-Match` handles user-facing revision conflicts. Idempotency keys handle repeatable business intentions and persist across process restart.
- External provider calls are not held inside unnecessarily long transactions. Provider result plus local failure is reconciled, never erased.
- All critical mutations emit traceability and required outbox facts in the same local commit.

## Idempotency contract

Persist `(tenant, actor/context, intention type, idempotency key, request fingerprint, source reference, result, status, created/expiry metadata)`. A retry with same key and same fingerprint returns original result. Same key with different fingerprint conflicts. Retention duration is a Production/Legal Gate policy; process-local memory is insufficient.
