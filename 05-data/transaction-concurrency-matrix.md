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
| Direct order plus existing commitment | Sales Commitment + Inventory | `DIRECT_ORDER` validates required availability, establishes Commercial Commitment and confirms Sales Order; lock same availability rows | deterministic current/insufficient-availability outcome; no partial order, backorder or double commitment | interleaving/direct-order test |
| Approval-required PR submit | Sales Commitment + Inventory/Credit | submitted PR snapshot, SKU + quantity Commercial Commitment, availability/credit decision and idempotency record in one transaction; no physical lot allocation yet | duplicate returns original result; stale revision or insufficient availability is deterministic; commitment release is explicit | API/DB submit and retry test |
| Material Purchase Request modification | Sales Commitment | only allowed states; new revision; submitted content controlled; re-evaluate dependencies; material agreed modification resets validity window | reject stale/invalid state; previous submitted revision immutable; consent evidence preserved where required | state-machine/consent evidence test |
| Commitment expiry/release | Sales Commitment + Inventory | owner command releases only active, unexpired Commercial Commitment; guarded state update | repeat is no-op; worker lease/fencing; release on Withdrawn/Rejected/Expired | clock/worker retry test |
| Negative inventory adjustment | Inventory Availability | authorized actor records physical truth with valid quantity, scope, reason and row/version guard even when physical stock becomes less than committed demand | do not reject because commitments become insufficient; create explicit shortage/business incident and identify affected commitments for downstream resolution | physical-truth/shortage test |
| Commercial Commitment versus Physical Allocation | Sales Commitment + Fulfillment/Inventory | Product distinction is closed: commitment is SKU + quantity; allocation selects Inventory Lot(s); allocation cannot exceed commitment or usable physical quantity, but shortage remains explicit | shortage creates affected-commitment resolution, not silent over-allocation or commitment deletion | transition/shortage/allocation test |
| Transfer versus allocation | Inventory Availability | source decrement and destination increment atomic where same DB; location/version locks ordered | retry-safe transfer ID; deadlock retry bounded | transfer/allocation interleaving test |
| Temperature excursion | Inventory Availability + Fulfillment | out-of-range receiving temperature creates `HOLD` + pending Temperature Excursion evaluation; disposition is Release, continued Hold, Waste or Return to Supplier | no automatic Quarantine; affected allocations re-evaluated after disposition; notification/event retryable | excursion HOLD/disposition test |
| Sales Order cancellation | Sales Commitment + Inventory/Credit | order state, release commitment/allocation and credit release follow explicit boundary | local decision committed; downstream retry with reconciliation | cancellation saga/retry test |
| Partial fulfillment | Fulfillment + Inventory | execution quantities cannot exceed order/allocated remaining; line version | short/exception path; repeated scan no-op | partial pick/pack test |
| Failed Delivery Attempt | Fulfillment and Delivery | failed attempt is recorded on the same Delivery; Delivery remains open for another attempt; evidence immutable | duplicate attempt/POD idempotent; no Continuation Delivery created | failed-attempt retry test |
| Partial delivery and continuation | Fulfillment and Delivery | performed Delivery closes `PARTIAL`; remaining existing Sales Order obligation creates a new Continuation Delivery; it is not another attempt of the original Delivery | duplicate POD idempotent; continuation creation idempotent and traceable | partial/continuation test |
| Credit reserved -> receivable | Credit and Receivables | ledger/state transition once; amount/currency/owner checks | duplicate command returns original; repair via reconciliation | ledger invariant test |
| Payment reported/confirmed | Payments + Receivables | provider event identity and payment state guarded; financial effect explicit | duplicate callback no-op; invalid transition reviewable | webhook/idempotency test |
| Stripe success + order creation failure | Payments + Sales Commitment | payment is recorded `UNALLOCATED / RECONCILIATION_REQUIRED`; financial history remains; automatic refund attempt follows | refund success resolves; refund failure requires operational intervention; never charge twice or erase history | failure injection/refund reconciliation test |
| Duplicate provider callback | Payments | inbox unique `(provider,eventId)`; lease/fencing; signature verified | duplicate acknowledged safely | duplicate webhook test |
| Duplicate external reference | Owning aggregate | scoped unique constraint on provider/reference or business id | return conflict with no mutation | constraint test |
| Business document numbering | Business Documents | transaction/sequence uniqueness scoped to numbering policy; immutable issued number | retry reuses allocated result or reviewable gap | parallel numbering test |
| Concurrent role membership change | Tenant and Access | membership version/status and capability change atomic; authorization re-resolves | stale admin command conflicts; revoked session fails closed | concurrent access test |

## Locking order and isolation

Proposed ordering is documented per use case before implementation. When multiple rows are needed, acquire in stable owner/identifier order to reduce deadlocks. Use the least isolation level that proves the invariant; use serializable/explicit locking only for the narrow critical section. A retry must be safe under the same idempotency key and must not replay external side effects blindly.

## Compensation boundary

A transaction ends at a database invariant boundary. Cross-module work is not made falsely atomic by a long transaction: use an outbox, explicit state machine, reconciliation record and observable retry. Every compensation must state whether it reverses business state, issues a financial correction, or creates an operator decision.
