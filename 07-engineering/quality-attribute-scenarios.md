---
status: draft
maturity: DRAFT
scope: v1
owner: engineering
last-reviewed: 2026-08-19
---

# Quality attribute scenarios

| Attribute | Stimulus | Response measure / evidence |
|---|---|---|
| Tenant isolation | Buyer requests another Tenant object ID | API denies or returns indistinguishable not-found; DB/RLS and browser tests pass |
| Concurrency | two buyers commit last available unit | one accepted, one deterministic conflict/shortage; no negative balance |
| Consistency | payment provider succeeds while order transaction fails | durable reconciliation state, no duplicate charge, operator-visible outcome |
| Recoverability | outbox/inbox worker crashes after external side effect | lease/fencing and idempotent retry converge without duplicate business effect |
| Auditability | privileged inventory/role/payment/document action occurs | actor, scope, target, outcome and correlation are queryable without secret leakage |
| Usability | Buyer submits stale request | clear conflict state, preserved draft/input where safe, refetch path |
| Accessibility | keyboard user completes critical flow | focus, labels, semantic state and error association pass component/E2E checks |
| Interoperability | OpenAPI client sends valid command and retry | contract and runtime agree on status, Problem Details, idempotency and revision behavior |
| Operability | provider or email unavailable | bounded retries, degraded state, alert/reconciliation; no silent data loss |
| Performance | scoped list/query grows | indexed scope query, bounded page/export, measured target recorded before load gate |

Each scenario needs a named test, environment/fixture and owner before it becomes a release gate. No numeric performance or retention target is invented here.
