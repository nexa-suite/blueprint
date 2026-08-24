---
status: reference
maturity: HISTORICAL
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# Nexa V1 implementation baseline — historical AS-IS evidence

This document describes AS-IS evidence and must not be interpreted as the TARGET domain or technical architecture.

Audit date: 2026-08-13; final micro-closure update: 2026-08-13. Scope: active Modern API, Platform, Portal and Website repositories. No application code, Git history, branch, tag, release or remote state was changed. This record is historical; the [2026-08-23 current-ref verification](pre-v1-current-ref-verification.md) is the current AS-IS cut.

## Governance boundary

At the historical audit date, `00-governance/current-state.md` recorded the
Modern AS-IS audit and pre-DDD baseline while Strategic DDD work remained
pending. The accepted PRE-V1 decisions now supersede that status; this file
preserves only the older evidence and does not define current TARGET authority.

## Canonical location and provenance

HECHO: This document is canonical at `11-reference/as-is/v1-implementation-baseline.md` in the Blueprint repository.

HECHO: The prior `10-reference/as-is/` tree was accidental and contained only duplicated AS-IS documents from the previous run. It was consolidated into this canonical directory and removed after comparison. No unrelated `10-reference` content existed.

HECHO: Previous runtime evidence used preserved local feature worktrees. The runtime evidence in this micro-closure is separately labeled below and was required to use exact fetched `origin/develop` revisions.

## Exact repository and SCM snapshot

Expected remote `develop` values supplied in the task matched the fetched remote values.

| Repository | Local branch / HEAD | Working tree | `origin/develop` | `origin/main` | Divergence / preserved local work |
|---|---|---|---|---|---|
| API | `feature/onboarding-identity-propagation` / `306b0303966a2c310ed4389c14c4264375588676` | HECHO: clean | `01af8c7cad833de4054fc90ee76a7c90ebe560bb` | `7b0e1b29d7078ada4a905381c4468e9cf3659945` | local feature is behind merged develop; `feature/iam-security-contact-intake` preserved locally and remote ref observed |
| Platform | `feature/platform-change-feed-singleton` / `1bb3586405f4d1ecf6760288ae230b24fed8891f` | HECHO: clean | `73f8bd2e8f70aacdb5456d3a87232316777d3cfc` | `df142c990cd8e52479e463d1db6c6602a9546544` | local feature is behind merged develop; corresponding remote feature ref absent |
| Portal | `develop` / `730c605324f547335733af96a2f654ec8d41b5fa` | HECHO: clean, tracking develop | `730c605324f547335733af96a2f654ec8d41b5fa` | `db454924276959450ea1c16ac4dadeb54a0ddea3` | no local feature branch observed |
| Website | `develop` / `3f98a1faf39886a303035b9ce0573518b5bbd766` | HECHO: clean, tracking develop | `3f98a1faf39886a303035b9ce0573518b5bbd766` | `1207add8797144db8222d4484110017d9a9f269d` | preserved `feature/public-contact-intake` has stale tracking; remote feature ref absent; local `main` preserved |

All four origins were inspected before Blueprint publication. Application repository metadata was fetched safely; no application push, merge, branch deletion, tag deletion, release, reset or history rewrite occurred. API PR #7, Platform PR #6 and Website PR #3 are merged historical owners of local feature work. Portal has no corresponding local feature branch.

## API — observed implementation

Evidence root: local-only independent checkout `../api`.

- HECHO: Spring Boot 4.1.0 modular monolith, Java release 25 in `pom.xml`, executed locally with Java 26.0.1. The compiled main source set contains 906 Java files. Current implementation areas include `payments`, `bootstrap`, `sales`, `tenantmanagement`, `shared`, `iam`, `audit`, `catalogmanagement`, `warehouse`, `invoicing`, `logistics` and `notifications`. These are current implementation areas, not future Bounded Contexts.
- HECHO: REST controllers cover IAM/security/public contact, tenant administration, catalog, sales/purchase requests/orders/client accounts, warehouse, logistics, documents, payments, notifications, audit and change feed. Static OpenAPI at `docs/openapi/openapi.json` contains 224 paths.
- HECHO: Current database evidence includes Flyway migrations `V1` through `V73`, PostgreSQL schemas `audit`, `business_documents`, `catalog_management`, `iam`, `integration`, `logistics`, `notifications`, `payments`, `reference_data`, `sales`, `tenant_management` and `warehouse`.
- HECHO: RLS evidence exists in migrations V44, V55, V58, V59, V69 and V72. `RlsScopedDataSource` sets `app.current_tenant_id` and `app.current_workspace_id`; multiple tables enable and force RLS with policies. This proves observed mechanisms, not comprehensive final Security Architecture.
- HECHO: Current role values are `TENANT_ADMIN`, `COMPANY_OWNER`, `SALES`, `WAREHOUSE`, `LOGISTICS` and `BUYER`; typed permission keys cover tenant administration, catalog, sales, warehouse, logistics, documents, payments, notifications, exports, executive analytics and buyer surfaces. Effective access context includes verified membership, tenant, workspace and surface.
- HECHO: Current events and background processing include canonical outbox events, change-feed events, audit events, inventory/dispatch events, notification projection, reservation expiration, invitation/throttle cleanup, security retention, document/payment workers and SSE change-feed streaming. The API exposes `/api/v1/change-feed/stream`.
- HECHO: Current external/local integrations include PostgreSQL, MinIO/object storage, ClamAV, SMTP/Mailpit, deterministic/Stripe-compatible payment integration and mock, maps/geolocation adapter, WireMock test doubles, Actuator and OpenTelemetry/Jaeger components.
- HECHO: Idempotency/concurrency evidence includes command idempotency tables, optimistic/concurrency tests, unique/exclusion constraints, outbox/inbox processing and replay/security tests. Important database groups cover tenant management, IAM, catalog, sales, warehouse, logistics, business documents, payments, notifications, audit and integration.
- HECHO: Test source inventory contains 146 test files. Representative evidence includes `OpenApiContractIT`, migration/upgrade tests, RLS/runtime isolation, tenant-context security, payment tenant isolation/concurrency, webhook replay/security, Sales Order conversion/lifecycle, Purchase Request management, client-account buyer association, warehouse, dispatch lifecycle, business-document tenant isolation, ClamAV, change-feed, dynamic authorization, organization activation and public contact tests.

## Platform — observed implementation

Evidence root: local-only independent checkout `../platform`.

- HECHO: Angular 22 application with current implementation areas for shell/layout/routing/security, IAM, tenant management, catalog, sales, warehouse, logistics, documents, invoicing, audit, notifications, change feed and overview.
- HECHO: `src/app/app.routes.ts` contains public authentication/onboarding routes and authenticated Platform routes for overview/executive overview, audit, sales dashboard/client accounts/manual orders/purchase requests/Sales Orders, catalog products/families/SKUs/taxonomy/pricing/promotions, warehouse/inventory/lots/movements/reservations/fulfillment readiness, logistics/dispatch/POD/incidents/analytics, documents and security/profile/session surfaces.
- HECHO: Route guards include anonymous, authentication, Platform-surface, permission, catalog/promotion and manual-order-draft guards. The navigation registry checks tenant, owner, sales, catalog, promotion, warehouse, fulfillment and logistics permissions.
- HECHO: Current API clients/facades cover catalog, audit, change feed, notifications, documents, authentication/security, logistics, sales/manual drafts, company administration and warehouse operations. Existing E2E specs cover business patch, catalog, commercial flow, company administration, IAM/security/onboarding, logistics, organization activation, responsive shell, role access, session security and warehouse.
- INFERENCIA: Some frontend services and guards contain user-facing business decisions or duplicated display logic. Final ownership is unresolved and must not be inferred from folder names.

## Portal — observed implementation

Evidence root: local-only independent checkout `../portal`.

- HECHO: Angular 22 buyer-facing application with current implementation areas for shell/security/layout, IAM, catalog, sales/buyer requests and orders, warehouse availability, logistics/delivery tracking, documents, invoicing/receivables, payments/Stripe, notifications, support, premium and shared UI.
- HECHO: `src/app/app.routes.ts` contains authentication and Portal shell routes for home/profile/account/notifications/security, catalog, request builder, purchase requests/details, Sales Orders/details, documents, receivables/payment methods, deliveries/details, support/legal/premium and permission guards for catalog, buyer sales/orders, documents, payments, tracking and notifications.
- HECHO: Permission normalization converts dotted permission names to colon form in Portal auth state; client services cover catalog, authentication/security, notifications, documents, logistics, payments/Stripe, buyer requests/drafts, Sales Orders and warehouse availability. Change-feed and live-refresh services are present for delivery, Purchase Request and Sales Order surfaces.
- HECHO: Existing E2E specs cover buyer commerce, buyer IAM boundary, tracking, catalog pricing preview, IAM security and workspace preview.
- INFERENCIA: Portal account/workspace selection and buyer relationship behavior are observable in current flows but are not sufficient evidence for final global Buyer identity or relationship architecture.

## Website — observed implementation

Evidence root: local-only independent checkout `../website`.

- HECHO: Static HTML/CSS/vanilla JavaScript website, ES/EN, with pages for product, team, buyer portal, company, FAQ, platform, pricing, solutions and legal content. No `package.json` exists.
- HECHO: The company contact/request-demo form is implemented in `assets/js/interactions.js` and targets `POST /api/v1/public/contact-requests` through a configurable API base. Form fields include contact, company, request type and message data. Static links target login and organization registration paths; those links alone are not runtime proof of an available WebApp service.
- HECHO: `node --check` passed for the four JavaScript files. A temporary static HTTP server returned HTTP 200 for representative root, company, platform, solution and legal pages, including `/pages/legal/privacy.html` and `/pages/legal/terms.html`.
- HECHO: npm build/test are `NO APLICA` because there is no `package.json`. The current Website `develop` source contains the Contact/Request Demo API submission flow; external publication/provider proof remains separate.

## Cross-layer consistency findings

- HECHO / historical clarification: `v1-readiness-baseline-2026-08-12.md:70` records 223/223 static/runtime OpenAPI parity at its historical audit date. Historical exact-develop validation recorded 224 static and runtime paths; current API `main` static OpenAPI contains 237 paths and runtime parity remains unverified.
- HECHO / historical clarification: API, Platform and Portal READMEs had `Bounded contexts` headings while the pre-DDD governance snapshot recorded Bounded Contexts as NOT STARTED. Those headings were documentation evidence, not architecture decisions; accepted current TARGET is 11 frozen Bounded Contexts.
- HECHO / historical clarification: the older repository-map snapshot used older commit/branch references; [current repository map](../../00-start-here/repository-map.md) records refs verified for the current AS-IS cut.
- HECHO / contradiction: Platform and Portal READMEs describe a secured vertical slice and say broader workflows are not implemented, while current code and E2E inventories contain broader sales, warehouse, logistics, documents and buyer flows. This is documentation/code inconsistency, not a claim that all workflows are production-complete.
- BLOQUEO: Platform and Portal authenticated browser E2E require environment credentials/fixtures. Without them, only public/no-credential cases ran; authenticated runtime behavior remains unverified.
- BLOQUEO: Website GitHub Actions inspection returned no runs. Website CI health is not claimed.

## Validation summary

| Area | Result |
|---|---|
| API exact merged develop | HECHO: `./mvnw clean verify -Dnexa.integration.enabled=true`; actual result recorded below. |
| API OpenAPI | HECHO: static/runtime counts and path-set comparison recorded below. |
| Platform unit/build | HECHO: exact merged develop `npm ci`, unit tests and production build recorded below. |
| Portal unit/build | HECHO: exact merged develop `npm ci`, unit tests and production build recorded below. |
| Website | HECHO: no `package.json`; syntax/static validation recorded below. |
| Authenticated E2E | BLOQUEO: existing suites require approved credentials/fixtures; no bypass was attempted. |

## Exact merged-develop runtime evidence

The previous runtime evidence used preserved local feature worktrees. The final evidence below is independently sourced from temporary worktrees at the exact fetched `origin/develop` revisions. This distinction is intentional.

- HECHO: `MERGED-DEVELOP RUNTIME PROVENANCE: VERIFIED`.
- HECHO: Temporary detached worktrees were checked out at API `01af8c7cad833de4054fc90ee76a7c90ebe560bb`, Platform `73f8bd2e8f70aacdb5456d3a87232316777d3cfc`, Portal `730c605324f547335733af96a2f654ec8d41b5fa` and Website `3f98a1faf39886a303035b9ce0573518b5bbd766`. The active preserved feature worktrees were not moved or changed.
- HECHO: Exact-develop gates passed: API `./mvnw clean verify -Dnexa.integration.enabled=true` reported 344 tests, 0 failures, 0 errors and 0 skipped; Platform reported 99 unit tests passed and production build passed; Portal reported 76 unit tests passed and production build passed; Website has no `package.json` (`NO APLICA`) and passed JavaScript syntax plus static HTTP validation.
- HECHO: Canonical Compose was rebuilt from the temporary exact-develop API, Platform and Portal sources. `nexa-modern-api`, `nexa-modern-platform`, `nexa-modern-portal`, `nexa-modern-postgres`, `nexa-modern-mailpit`, `nexa-modern-minio`, `nexa-modern-clamav` and `nexa-modern-stripe-mock` were healthy. API `/actuator/health`, Platform/Portal `/health`, Website static HTTP, Mailpit, MinIO liveness, Stripe mock health and `clamdscan --ping 1` returned successful evidence. Existing observability containers were present; no architecture change was made.
- HECHO: Static OpenAPI contained 224 paths and runtime `/v3/api-docs` contained 224 paths; path-set comparison reported missing `0` and extra `0`.
- BLOQUEO: Authenticated Platform and Portal browser E2E were not rerun in this micro-closure because the approved credential/fixture provenance required by the existing suites was unavailable. No authentication bypass, credential invention or throttling change was used. The prior run's partial E2E evidence remains historical and is not presented as exact-develop fresh full coverage.
- HECHO: Website `develop` contains the Contact/Request Demo flow targeting `POST /api/v1/public/contact-requests`; external publication/provider proof remains separate.

## Architecture boundary

This historical baseline does not define capabilities, subdomains, Bounded
Contexts, aggregates, context maps, final data/security/cloud architecture or
C4 L3. Existing implementation areas remain AS-IS evidence only. Use the
[current-ref verification](pre-v1-current-ref-verification.md) for current
repository state and the accepted Blueprint documents for TARGET authority.
