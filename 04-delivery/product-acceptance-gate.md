---
status: planned
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# Product Acceptance gate

Product Acceptance is a business decision over observable behavior. A green
build, API release or technical test is not Product Acceptance.

## Required evidence

| Gate | Required proof | Current state |
|---|---|---|
| Product semantics | Accepted Product decisions and eleven BCs remain unchanged | VERIFIED |
| Surface behavior | Website, Platform and Portal scenarios against authorized tenant/relationship data | PARTIAL; release evidence exists, authenticated cross-surface proof open |
| Mobile direction | Operations Mobile and Buyer Mobile owner direction with story/AC catalog | OWNER-ACCEPTED direction; research pending |
| Mobile research | Participant, method, date, observed need, confidence and interpretation per story | OPEN |
| API compatibility | OpenAPI v0.17.0 and consumer contract checks | TECHNICALLY VERIFIED in API release evidence |
| Critical lifecycle | PR/SO, allocation, FEFO, dispatch, attempt, receipt/discrepancy, payment and documents | PARTIAL; API foundation verified, full Product Acceptance open |
| Tenant/security | authenticated object-level isolation and RLS runtime proof | OPEN in this Blueprint cut |
| Production readiness | cloud, providers, secrets, backups, recovery, SLO/SLA, incident and rollback | OPEN |

## Decision rule

The Product owner may mark a scenario `PRODUCT ACCEPTED` only when the actor,
authorized tenant/relationship, expected result, business rejection and
recovery path are evidenced. Mobile stories remain `PROPOSED / RESEARCH
VALIDATION PENDING` until research and client acceptance are complete.
