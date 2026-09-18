---
status: planned
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-09-18
---

# Product Acceptance gate

Product Acceptance is a business decision over observable behavior. A green
build, API release or technical test is not Product Acceptance.

## Required evidence

| Gate | Required proof | Current state |
|---|---|---|
| Product semantics | Accepted Product decisions and eleven BCs remain unchanged | VERIFIED |
| Surface behavior | Website, Platform and Portal scenarios against authorized tenant/relationship data | PARTIAL; release evidence exists, authenticated cross-surface proof open |
| Mobile direction | Operations Mobile and Buyer Mobile direction with 73-story V1 Product Generation catalog | ACCEPTED direction; implementation and Product Acceptance remain separate |
| Mobile research | Participant-bounded Needfinding, method, dates, observed needs and interpretations | COMPLETE 9/9 for problem/task evidence; solution validation OPEN |
| API compatibility | OpenAPI v0.17.0 and consumer contract checks | TECHNICALLY VERIFIED in API release evidence |
| Critical lifecycle | PR/SO, allocation, FEFO, dispatch, attempt, receipt/discrepancy, payment and documents | PARTIAL; API foundation verified, full Product Acceptance open |
| Tenant/security | authenticated object-level isolation and RLS runtime proof | OPEN in this Blueprint cut |
| Production readiness | cloud, providers, secrets, backups, recovery, SLO/SLA, incident and rollback | OPEN |

## Decision rule

The Product owner may mark a scenario `PRODUCT ACCEPTED` only when the actor,
authorized tenant/relationship, expected result, business rejection and
recovery path are evidenced. Mobile stories remain subject to solution
validation and Product Acceptance; Needfinding evidence does not close either
gate.
