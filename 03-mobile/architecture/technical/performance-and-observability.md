---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# Mobile performance and observability

Performance work is evidence-driven. Measure representative authorized flows,
startup, network recovery, camera/manual fallback and background retry before
claiming a device-ready result. Do not optimize by weakening authorization,
freshness, idempotency or evidence integrity.

Client telemetry is optional construction instrumentation. It may use safe
correlation IDs, route/feature outcome, latency class, retry category and
non-sensitive device/app version. It must exclude raw tokens, endpoint
material, customer/payment data, unnecessary PII and authoritative tenant
state. Backend observability remains the shared API concern.

Background work has bounded retries, network/battery constraints where the
platform supports them, and explicit unknown-result recovery. It does not
create generic offline authority or continuous location tracking.
