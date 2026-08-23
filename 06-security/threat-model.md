---
status: accepted
maturity: BASELINED
scope: v1
owner: security
last-reviewed: 2026-08-23
---

# Threat model TARGET

| Asset / boundary | Threat | Control | Residual / proof |
|---|---|---|---|
| Tenant data / API | cross-tenant BOLA or guessed ID | access context, capability/object checks, repository predicates, RLS, composite keys | inventory every endpoint/table; isolation tests |
| Session / identity | theft, replay, stale membership | short-lived token, refresh rotation, revocation, context re-resolution | credential/rotation/browser tests |
| Worker / scheduler | unbounded system authority | explicit actor, tenant/job scope, lease/fencing, audit | worker matrix and failure tests |
| Object Storage | key guessing, unsafe download, malware | metadata authorization, short-lived transfer, scan/quarantine, no direct public bucket | object auth and unsafe-file tests |
| Payment webhook | forged, replayed or reordered event | signature verification, provider/event uniqueness, inbox lease, state machine | provider fixtures and reconciliation |
| Public contact intake | spam, abuse, payload injection | validation, throttling, size limits, safe logging and mail sink separation | rate/abuse tests; policy values remain open |
| PostgreSQL/RLS | bypass role or missing context | least privilege, fail-closed context, RLS policy inventory, runtime tests | DBA/role-path review |
| Audit / traceability | tampering, sensitive leakage | append-only controls, redaction, correlation, restricted access | retention/legal decision pending |
| Supply chain | vulnerable dependency/image or secret | lockfiles, scanning, SBOM/provenance and CI gates | current scan evidence per release |

Trust boundaries: anonymous Website to public intake; browser to API; API to PostgreSQL/Object Storage; API to external providers; workers to scoped jobs; operators to privileged actions. TLS/edge, production secret manager, backup/DR and provider SLA remain deployment decisions, not inferred here.
