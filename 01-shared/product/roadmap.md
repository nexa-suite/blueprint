---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# Architecture and delivery roadmap

## PRE-V1 closure — complete as documentation

1. Product and Business V1 — FROZEN / CLOSED.
2. Capability Map, EventStorming and Domain Stories — BASELINED.
3. Ubiquitous Language and subdomain classification — BASELINED.
4. Strategic DDD — ACCEPTED.
5. Bounded Contexts — 11 FROZEN.
6. Context Map and ownership — ACCEPTED.
7. State machines, event contracts, transaction/concurrency/idempotency — BASELINED.
8. C4 L1/L2 and selective C4 L3 TARGET — BASELINED where useful.
9. AS-IS verification and AS-IS/TARGET fit — recorded with current-ref caveats.
10. V1 User Stories, Acceptance Criteria and frontend product/UI contracts — COMPLETE.
11. ADR minimum set and Production Gate separation — BASELINED.

## Construction gate — PASSED — CONSTRUCTION AUTHORIZED

Repository-specific construction may begin through controlled vertical slices with current API/Platform/Portal refs, compatibility mapping, tenant isolation, runtime/OpenAPI, concurrency/idempotency, authenticated browser, accessibility and rollback evidence. This authorization does not claim implementation completion, runtime parity or production readiness; Blueprint closure does not mutate application repositories.

Use KEEP -> REFINE -> REWORK. Do not delete legacy paths or duplicate contract owners without consumer mapping, migration, tests and rollback. REWRITE requires extraordinary evidence.

## Production Gate — open, non-blocking for PRE-V1

Cloud/provider topology, managed PostgreSQL, object storage, email, observability, secret manager, RPO/RTO, retention, SLA/SLO and responder organization remain open. Required future proof includes production-like staging, restore, rollback, migration runbook, provider outage, secret rotation, incident, break-glass, failed worker and data correction handling.

## Future runway

Mobile, Driver, IoT automation, full Procurement, advanced Finance/BI, SUNAT, Control Center, Support, plans/subscriptions and multi-user Buyer organizations remain future scope. They do not reopen the 11-context V1 baseline.
