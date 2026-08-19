---
status: draft
maturity: DRAFT
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-19
---

# AS-IS to TARGET fit

Disposition is evidence-based. `REWRITE` is not proposed for any audited area. A proposed boundary remains review-gated and does not authorize code changes.

| Area | Disposition | Evidence | TARGET direction | Transition / risk / tests |
|---|---|---|---|---|
| API modular monolith | KEEP + REFINE | Spring Boot/Spring Modulith, ports, ArchUnit, 74 migrations, broad integrated workflows | Keep one deployment; expose explicit module APIs and events; realign only after context review | Add dependency/contract tests; avoid premature microservices |
| Domain/application layering | REFINE | Domain purity and application ports exist; some JDBC orchestration remains in adapters | Move invariant ownership toward application/domain services and keep provider/persistence behind ports | Characterization tests before moves; risk of transaction drift |
| Tenant context and authorization | KEEP + REFINE | CurrentAccessContext, membership/surface/permission checks, RLS mechanisms | Defense in depth with one context resolver, fail-closed authorization and worker scope | Inventory all tables/workers; RLS/security regression and concurrency tests |
| PostgreSQL shared database | KEEP + REFINE | Shared relational transactions, composite scope keys, Flyway V1-V74 | Retain shared DB V1; publish ownership matrix, RLS coverage and cross-context reference rules | Forward-only migrations; no broad RLS rewrite until owner acceptance |
| Catalog and pricing | KEEP + REFINE | Product/SKU/pricing/promotion code and tests | Separate commercial policy language from physical availability; preserve price snapshots | Contract tests for price resolution and immutable orders |
| Sales / Purchase Requests / Sales Orders | KEEP + REWORK | Strong current flows, snapshots, idempotency and conversion tests; commitment language needs reconciliation | Explicit Sales Commitment boundary, controlled PR revision, immutable SO | Migration aliases/snapshots; conflict and last-unit tests |
| Warehouse reservations | REWORK, not rewrite | FEFO, lots, reservations and concurrency exist; Product distinguishes commitment from allocation | Introduce explicit semantic distinction; preserve current tables during transition | Dual-read/translation period; shortage/transfer/temperature tests |
| Logistics / delivery | REFINE | Dispatch/POD/lifecycle/test evidence exists | Separate Dispatch, Delivery, Route and Continuation Delivery concepts in contracts | Characterize partial delivery and retry; no TMS expansion |
| Credit / receivables / payments | REFINE + REWORK at ownership seams | Payment/credit/receivable tests, Stripe idempotency and inbox leases | Separate Credit exposure, Financial Posting, Receivable, Payment and provider ACL | Double-counting, duplicate callback, refund reconciliation tests |
| Business documents/storage | KEEP + REFINE | Object storage, malware scanning, evidence lifecycle and document tests | Preserve immutable metadata/versioning; API controls object authorization | Forward-only metadata changes; unsafe-file and download authorization tests |
| Outbox/inbox/change feed | KEEP + REFINE | Wave 0 leases/fencing, canonical outbox and frontend live refresh | Use durable events only for meaningful cross-boundary facts; projection idempotency | Event contract/version/retry tests; avoid event-everything |
| Platform frontend | KEEP + REFINE | Angular standalone routes, guards, signals, clients, shared states, E2E | Feature boundaries follow user capabilities; API contracts and authorization remain separate | Add dependency and contract tests; design integration later |
| Portal frontend | KEEP + REFINE | Buyer-specific shell, permission guards, signals, live refresh and E2E | Preserve Buyer-specific information boundary and current Tenant context | Add stale/conflict UX and relationship contract tests |
| Website | KEEP | Static public surface and API contact intake | Keep static public boundary; no backend/domain logic | Syntax/static smoke; publication/provider gate separate |
| Mobile | DEFER | Runway repository only | Keep future/runway label | Product and architecture discovery before implementation |
| Production deployment | DEFER | Local Compose only | Define provider, edge, backup, DR, SLO and rollout later | Explicit production architecture gate |

## REWORK rules

Any future REWORK must name the current consumers, semantic target, migration path, observability, rollback, compatibility strategy and tests. No current area meets evidence for REWRITE.

