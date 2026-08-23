---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# PRE-V1 architecture readiness and Production Gate

PRE-V1 application, integration, data, security and selective C4 L3 construction targets are accepted. This page separates them from future production/deployment decisions.

| Area | PRE-V1 status | Remaining gate |
|---|---|---|
| Application architecture | BASELINED | implementation conformance and migration proof |
| Tenant/access architecture | BASELINED | complete RLS/pool/worker proof |
| Integration/event architecture | BASELINED | consumer/runtime/replay proof |
| C4 Level 3/4 | SELECTIVE TARGET BASELINED | implementation traceability; no deployment claim |
| Data Architecture | BASELINED logical ownership | physical schema, retention and migration proof |
| Security Architecture | BASELINED construction target | production threat, break-glass and incident proof |
| Cloud/Deployment Architecture | OPEN-NON-BLOCKER | provider/topology decision at Production Gate |

## Production Gate

Keep open: cloud/provider, managed PostgreSQL, object storage, email, observability, secret manager, RPO, RTO, backup retention, external SLA/SLO and incident responder organization. Required evidence includes production-like staging, restore, rollback, migration runbook, outage handling, secret rotation, break-glass, failed background processing and data correction.

Current implementation evidence is AS-IS and may be DRIFT, MISSING or UNVERIFIED. It does not invalidate accepted TARGET unless direct contradiction makes the domain model impossible; otherwise record remediation backlog.
