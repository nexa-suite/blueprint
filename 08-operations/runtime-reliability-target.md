---
status: accepted
maturity: BASELINED
scope: v1
owner: operations
last-reviewed: 2026-08-23
---

# Runtime and reliability TARGET

## Reliability posture

Local Compose is a development/test topology, not production architecture. PRE-V1 worker, expiry, outbox/inbox, retry and reconciliation contracts are accepted; production provider, edge, secret management, backup/restore, disaster recovery, SLOs, alert ownership and rollout strategy remain explicit Production Gate decisions.

## Current evidence boundary

Reconnaissance reports successful API compile/architecture tests/API tests, Platform and Portal unit tests, both frontend builds and frontend asset validation. It reports 373 API tests run with 0 failures, 0 errors and 96 skipped integration tests; 53 Platform unit files/102 tests; and 40 Portal unit files/79 tests. Playwright tests were discovered/listed but not executed in a browser. Full integration, authenticated browser E2E and live API runtime are not proven. The local runtime attempt was blocked by missing `NEXA_MINIO_MINIO_ROOT_USER`; this is `RUNTIME ACCEPTANCE EVIDENCE PENDING`, not an architecture failure.

| Concern | Target contract |
|---|---|
| Health | separate liveness/readiness; dependency health visible without leaking secrets |
| Correlation | request, command, event, provider and job correlation IDs |
| Metrics | latency/error/saturation plus queue/outbox/inbox, lease, retry, reconciliation and business-critical conflict metrics |
| Logs | structured, scoped, redacted, actor/correlation aware; no tokens/payment secrets |
| Tracing | API to DB/provider/worker spans with tenant-safe attributes |
| Retry | bounded, classified, jittered; no retry of non-idempotent external side effect without key/state |
| Outage | explicit degraded state, operator signal and reconciliation path |
| Rollout | forward-compatible migration, health gate, rollback/forward-fix plan and evidence |

## Worker and expiration contract

Expiry correctness uses absolute `expiresAt: Instant` and `now >= expiresAt`, not scheduler punctuality. The worker claim/reconstruct-scope/`SET LOCAL`/lease-fence/process/finalize/cleanup/retry sequence is required. A stale worker cannot finalize after lease loss; duplicate expiry is a no-op after the first committed release.

## Operational invariants

Outbox/inbox records, provider callbacks, document scans, payment reconciliation, delivery continuation and failed order/payment handoffs must be observable as state, not only logs. Leases expire safely; fencing prevents an old worker from committing after ownership changes. Alerts must distinguish infrastructure failure, business conflict, authorization denial and data reconciliation.

## Production Gate, not PRE-V1 blockers

No production readiness claim until provider decisions, secret paths, backup/restore test, DR target, edge/TLS, SLO/error budget, on-call ownership, migration rollback, break-glass proof and authenticated end-to-end evidence are accepted. Do not invent numeric SLOs or retention values in this baseline.
