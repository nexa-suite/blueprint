---
status: draft
maturity: DRAFT
scope: v1
owner: data
last-reviewed: 2026-08-19
---

# Transaction and concurrency matrix

The matrix is the minimum construction register. `Owner` means the proposed invariant owner, not the current Java package. All commands require resolved Tenant/Workspace/relationship scope and an auditable actor.

| Scenario | Owner / boundary | Consistency and guard | Retry / failure | Required proof |
|---|---|---|---|---|
| Two Buyers request the last unit | Inventory Availability + Sales Commitment | atomic availability decision; row lock/version; no negative sellable quantity | one succeeds, one receives conflict/shortage; idempotency preserves result | concurrent last-unit test |
| Direct order plus existing commitment | Sales Commitment + Inventory | commit against current available minus active commitments; lock same availability rows | deterministic conflict or partial decision; no double reservation | interleaving test |
| Purchase Request submit | Sales Commitment | request revision, state transition and submitted snapshot in one transaction; `If-Match` + idempotency | duplicate returns original result; stale revision conflict | API and DB integration test |
| Material Purchase Request modification | Sales Commitment | only allowed states; new revision; re-evaluate commercial/availability/credit dependencies | reject stale/invalid state; previous submitted revision immutable | state-machine test |
| Commitment expiry/release | Sales Commitment + Inventory | owner command releases only active, unexpired commitment; guarded state update | repeat is no-op; worker lease/fencing | clock/worker retry test |
| Negative inventory adjustment | Inventory Availability | adjustment policy validates effective quantity; row lock/version and audit fact | reject if policy disallows; compensating correction, not delete | authorization/concurrency test |
| Commitment versus allocation | Inventory Availability + Fulfillment | explicit states; allocation cannot exceed committed/available quantity; row lock | shortage creates exception, not silent over-allocation | transition and partial test |
| Transfer versus allocation | Inventory Availability | source decrement and destination increment atomic where same DB; location/version locks ordered | retry-safe transfer ID; deadlock retry bounded | transfer/allocation interleaving test |
| Temperature excursion | Inventory Availability + Fulfillment | quarantine/usable decision and affected lot evidence atomic | impacted allocations re-evaluated; notification/event retryable | excursion quarantine test |
| Sales Order cancellation | Sales Commitment + Inventory/Credit | order state, release commitment/allocation and credit release follow explicit boundary | local decision committed; downstream retry with reconciliation | cancellation saga/retry test |
| Partial fulfillment | Fulfillment + Inventory | execution quantities cannot exceed order/allocated remaining; line version | short/exception path; repeated scan no-op | partial pick/pack test |
| Partial delivery and continuation | Fulfillment and Delivery | delivered evidence immutable; remaining quantity becomes continuation decision | duplicate POD idempotent; continuation creates explicit next attempt | delivery/POD retry test |
| Credit reserved -> receivable | Credit and Receivables | ledger/state transition once; amount/currency/owner checks | duplicate command returns original; repair via reconciliation | ledger invariant test |
| Payment reported/confirmed | Payments + Receivables | provider event identity and payment state guarded; financial effect explicit | duplicate callback no-op; invalid transition reviewable | webhook/idempotency test |
| Stripe success + order creation failure | Payments + Sales Commitment | payment capture and order acceptance are separate; durable reconciliation state | do not charge twice; compensation/refund/review policy explicit | failure injection + reconciliation test |
| Duplicate provider callback | Payments | inbox unique `(provider,eventId)`; lease/fencing; signature verified | duplicate acknowledged safely | duplicate webhook test |
| Duplicate external reference | Owning aggregate | scoped unique constraint on provider/reference or business id | return conflict with no mutation | constraint test |
| Business document numbering | Business Documents | transaction/sequence uniqueness scoped to numbering policy; immutable issued number | retry reuses allocated result or reviewable gap | parallel numbering test |
| Concurrent role membership change | Tenant and Access | membership version/status and capability change atomic; authorization re-resolves | stale admin command conflicts; revoked session fails closed | concurrent access test |

## Locking order and isolation

Proposed ordering is documented per use case before implementation. When multiple rows are needed, acquire in stable owner/identifier order to reduce deadlocks. Use the least isolation level that proves the invariant; use serializable/explicit locking only for the narrow critical section. A retry must be safe under the same idempotency key and must not replay external side effects blindly.

## Compensation boundary

A transaction ends at a database invariant boundary. Cross-module work is not made falsely atomic by a long transaction: use an outbox, explicit state machine, reconciliation record and observable retry. Every compensation must state whether it reverses business state, issues a financial correction, or creates an operator decision.
