---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-29
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
10. V1 Web User Stories, Acceptance Criteria and frontend product/UI contracts — COMPLETE.
11. Mobile product direction, 49-story reconciliation and cross-surface functional contract layer — BASELINED; research/client acceptance pending.
12. ADR minimum set and Production Gate separation — BASELINED.

## Construction gate — PASSED — CONSTRUCTION AUTHORIZED

Repository-specific construction may begin through controlled vertical slices with current API/Platform/Portal refs, compatibility mapping, tenant isolation, runtime/OpenAPI, concurrency/idempotency, authenticated browser, accessibility and rollback evidence. This authorization does not claim implementation completion, runtime parity or production readiness; Blueprint closure does not mutate application repositories.

Use KEEP -> REFINE -> REWORK. Do not delete legacy paths or duplicate contract owners without consumer mapping, migration, tests and rollback. REWRITE requires extraordinary evidence.

## Production Gate — open, non-blocking for PRE-V1

Cloud/provider topology, managed PostgreSQL, object storage, email, observability, secret manager, RPO/RTO, retention, SLA/SLO and responder organization remain open. Required future proof includes production-like staging, restore, rollback, migration runbook, provider outage, secret rotation, incident, break-glass, failed worker and data correction handling.

## Current delivery sequence

1. Product/Strategic DDD closure — complete and protected by current decisions.
2. Backend construction — API v0.17.0 candidate contracts technically evidenced.
3. Web construction — Website, Platform and Portal released refs evidenced.
4. Product/System Acceptance — open; authenticated tenant and cross-surface proof required.
5. Mobile research and client construction — owner-accepted direction; client not started.
6. Staging and Production Gate — open pending provider, recovery and operational evidence.

## Future runway

IoT automation, full Procurement, advanced Finance/BI, SUNAT, Control Center,
Support, plans/subscriptions, multi-user Buyer organizations, continuous Driver
tracking, route optimization, rich chat and returns/RMA remain V2/Future or
deferred. Mobile product direction is no longer merely a rejected idea, but its
research, client implementation and production readiness remain open. These
items do not reopen the 11-context V1 baseline.
