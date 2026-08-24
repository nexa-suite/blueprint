---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# AS-IS to TARGET fit

Disposition is evidence-based. `REWRITE` is not selected for any audited area. Accepted TARGET boundaries do not authorize code changes; every migration remains KEEP, REFINE or REWORK with consumer mapping, compatibility, rollback and tests.

| Area | Disposition | Evidence | TARGET direction | Transition / risk / tests |
|---|---|---|---|---|
| API modular monolith | KEEP + REFINE | Spring Boot/Spring Modulith, ports, ArchUnit, 74 migrations, broad integrated workflows | Keep one deployment; expose explicit module APIs and events; realign only after context review | Add dependency/contract tests; avoid premature microservices |
| Spring Modulith encapsulation | REFINE | `ApplicationModules.verify()` passes, but sales/warehouse/logistics/payments/invoicing/notifications/shared are OPEN; IAM/Tenant/Catalog have stronger metadata | Add fitness functions and explicit published contracts after accepted ownership; do not close all modules by documentation | Architecture tests for forbidden dependencies and module API usage; no blanket module-closing |
| Domain/application layering | REFINE | Domain purity and application ports exist; some JDBC orchestration remains in adapters | Move invariant ownership toward application/domain services and keep provider/persistence behind ports | Characterization tests before moves; risk of transaction drift |
| Tenant context and authorization | KEEP + REFINE | CurrentAccessContext, membership/surface/permission checks, RLS mechanisms | Defense in depth with one context resolver, fail-closed authorization and worker scope | Inventory all tables/workers; RLS/security regression and concurrency tests |
| PostgreSQL shared database | KEEP + REFINE | Shared relational transactions, composite scope keys, Flyway V1-V74 | Retain shared DB V1; publish ownership matrix, RLS coverage and cross-context reference rules | Forward-only migrations; no broad RLS rewrite until owner acceptance |
| Catalog and pricing | KEEP + REFINE | Product/SKU/pricing/promotion code and tests; `catalogItemId`, `productId`, `skuId`, Product Family/Variant/Sellable SKU collide across current flows | Preserve Product -> sellable SKU authority; introduce an explicit translation/contract map without renaming source code; separate commercial policy from physical availability | Contract tests for identifier mapping, price resolution and immutable orders |
| Sales / Purchase Requests / Sales Orders | KEEP + REWORK | Strong current flows, snapshots, idempotency and conversion tests; submitted PR commitment semantics now closed; two active Portal write paths remain | Converge canonical Builder and direct PR flows to one authoritative write model; PR submit establishes SKU + quantity commitment; immutable SO continues it | Consumer inventory, compatibility aliases, migration, conflict/last-unit and duplicate-submit tests |
| Buyer Relationship implementation | REFINE + REWORK at ownership seam | Membership, Client Account, BUYER role and `/client-accounts/me` distribute relationship semantics; V71 enforces one association per Client Account | Reconcile one target relationship authority with identity/account-linking and Tenant scope; preserve AS-IS translations | Relationship lifecycle, privacy, link/claim and cross-Tenant isolation tests |
| Warehouse reservations | REWORK, not rewrite | FEFO, lots, reservations and concurrency exist; Product closes Warehouse-neutral Commercial Commitment, Inventory Reservation backing across eligible Warehouses and later Physical Allocation (Inventory Lot(s)) | Translate current reservation terms to Inventory-owned backing and later lot allocation; preserve current tables during transition | Dual-read/translation period; multi-Warehouse protection, physical-truth shortage, transfer, allocation and temperature tests |
| Logistics / delivery | REFINE | Dispatch/POD/lifecycle/test evidence exists | Preserve failed attempt on same Delivery; Partial Delivery closes performed Delivery and creates Continuation Delivery for remaining SO obligation | Characterize attempt/continuation, POD idempotency and cold-chain disposition; no TMS expansion |
| Credit / receivables / payments | REFINE + REWORK at ownership seams | Payment/credit/receivable tests, Stripe idempotency and inbox leases; Product formula is Credit Limit - Credit Reserved - Outstanding Receivables | Translate AS-IS exposure/used fields; explicit unallocated/reconciliation/refund flow; provider ACL remains distinct | Double-counting, duplicate callback, automatic refund success/failure and reconciliation tests |
| Business documents/storage | KEEP + REFINE | Object storage, malware scanning, evidence lifecycle and document tests | Preserve immutable metadata/versioning; API controls object authorization | Forward-only metadata changes; unsafe-file and download authorization tests |
| Outbox/inbox/change feed | KEEP + REFINE | Wave 0 leases/fencing, canonical outbox and frontend live refresh | Use durable events only for meaningful cross-boundary facts; projection idempotency | Event contract/version/retry tests; avoid event-everything |
| Platform frontend | KEEP + REFINE | Angular routes/guards/signals; no meaningful Payments feature; invoicing folder placeholder-only | Keep surface gap explicit; add Payments only if Product/Design/API contract requires it; Business Documents remain distinct | Surface parity/contract tests; do not infer an Invoicing module UI |
| Portal frontend | KEEP + REFINE | Buyer shell, payment methods/receivables/Stripe Element; invoicing placeholder-only; no proven bank-transfer evidence-upload flow | Preserve Buyer boundary; converge payment/document flows and explicitly classify bank-transfer evidence as missing proof | API/UI contract and authenticated browser fixture tests; no E2E PASS claim |
| Website | KEEP | Static public surface and API contact intake | Keep static public boundary; no backend/domain logic | Syntax/static smoke; publication/provider gate separate |
| Mobile | DEFER | Runway repository only | Keep future/runway label | Product and architecture discovery before implementation |
| Runtime and browser acceptance | DEFER / REFINE | Compile, architecture tests, unit tests, builds and asset validation reported PASS; Playwright only listed; live runtime blocked by missing `NEXA_MINIO_MINIO_ROOT_USER` | Treat runtime acceptance, full integration and authenticated browser proof as construction exit gates | Complete environment, execute live API/full integration/browser evidence; do not classify as architecture failure |
| Production deployment | DEFER | Local Compose only | Define provider, edge, backup, DR, SLO and rollout later | Explicit production architecture gate |

## REWORK rules

Any future REWORK must name the current consumers, semantic target, migration path, observability, rollback, compatibility strategy and tests. No current area meets evidence for REWRITE.
