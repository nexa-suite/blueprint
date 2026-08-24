---
status: accepted
maturity: BASELINED
scope: v1
owner: engineering
last-reviewed: 2026-08-23
---

# Vertical slice contract

## Candidate slice

An authorized Buyer views sellable SKU/price/availability for a supplier Tenant, submits a Purchase Request, the Tenant workforce reviews/accepts it into a Sales Order, availability is committed, fulfillment progress is visible to the Buyer, and the resulting notification/audit evidence is traceable. Payment may be represented as a separate explicit step; it must not be collapsed into order acceptance.

## Required cross-cutting proof

| Layer | Proof |
|---|---|
| Identity/scope | Buyer relationship, Tenant and object authorization; Platform role path |
| API | OpenAPI request/response, Problem Details, `If-Match`, idempotency and state transitions |
| Domain/data | snapshots, aggregate invariants, owned writes, migration/seed safety |
| Concurrency | last-unit conflict, duplicate submit, stale revision and commitment release |
| Frontend | loading/empty/error/forbidden/stale/conflict states in Platform and Portal |
| Events | outbox envelope, consumer inbox/idempotency, change-feed refresh |
| Evidence | audit/correlation, documents if applicable, no cross-Tenant leakage |
| Runtime | health, metrics/logs/traces, retry/reconciliation path |
| Browser | approved authenticated fixtures, responsive/accessibility and visual matrix |

This contract is a construction gate, not a claim that the slice is already implemented or closed.
