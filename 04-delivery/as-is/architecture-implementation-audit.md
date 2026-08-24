---
status: accepted
maturity: CLOSED WITH CAVEAT
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# Modern implementation audit — AS-IS

Audit date: 2026-08-19. This is a historical read-only audit of the Modern repositories. Product repositories were not modified. Current implementation areas are evidence only; they are not Bounded Contexts.

> **Current-ref correction — 2026-08-23:** the exact refs and inventory in the
> dated sections below are preserved historical evidence. The canonical current
> cut is [PRE-V1 current-ref verification](pre-v1-current-ref-verification.md),
> which records the live refs and current caveats used for PRE-V1 closure.

## Exact refs and working-tree result

| Repository | Remote ref audited | SHA | Local checkout state | Mutation |
|---|---|---|---|---|
| API | `origin/develop` | `118e4ccd591af8f259ad38dc11cb3f62e5939f15` | local `feature/technical-foundation-wave-0@3de329b`; clean; preserved feature tip differs from audited remote ref | none |
| Platform | `origin/develop` | `7ecdceff21c749b3149e0d01454e16539061fdc4` | local `feature/technical-foundation-wave-0@f75c172`; clean; preserved feature tip differs from audited remote ref | none |
| Portal | `origin/develop` | `b13f42101f747579594b592edc607741086ae88c` | local `feature/technical-foundation-wave-0@5e729267`; clean; preserved feature tip differs from audited remote ref | none |
| Website | `origin/develop` | `2bfeb6a37b3b75099a0c91b8d3c811a9ee89cdf0` | clean, current develop is ahead of known main baseline | none |
| Mobile | `origin/develop` | `4a94db73336f93b460b564bddb9fa0a100114e87` | clean; runway only | none |
| Design Lab | `origin/main` reference `e7f5ece93a56aa5953b955adf343b96e9835e7be` | local branch has unrelated user diffs | preserved unchanged | none |

Remote checks: API, Platform, Portal, Website, Mobile and Design Lab remotes point to the expected `nexa-suite` repositories. Product repositories remain read-only for this task.

## API — observed implementation

### Build and structural evidence

- Java 25, Spring Boot 4.1.0, Spring Modulith 2.1.0, ArchUnit 1.4.2, Testcontainers 2.0.4, Stripe Java 31.4.0, PostgreSQL JDBC 42.7.12 and springdoc OpenAPI 3.0.3 are declared in `pom.xml`.
- Source inventory is 915 Java files and 155 test files at the audited checkout.
- Technical package areas are `iam`, `tenantmanagement`, `catalogmanagement`, `sales`, `warehouse`, `logistics`, `payments`, `invoicing`, `notifications`, `audit`, `shared` and `bootstrap`.
- Spring Modulith package metadata exists for several areas; `sales`, `warehouse`, `logistics`, `payments`, `invoicing`, `notifications` and `audit` are open modules. `ArchitectureConstitutionTests` calls `ApplicationModules.verify()` and ArchUnit checks domain/application/presentation direction.
- This proves a technical modular-monolith arrangement and selected dependency rules. It does not prove Strategic DDD boundaries, absence of cycles in all semantic business models, independent persistence ownership or accepted context ownership.

### Application and domain behavior

- REST presentation covers authentication, tenant administration, catalog, Customer Accounts, Purchase Requests, Sales Orders, warehouse/inventory, dispatch/delivery/POD, documents, payments, notifications, audit and change feed.
- Application ports/services and framework-free domain models are present in multiple areas. Some transaction and orchestration logic remains in infrastructure JDBC adapters; this is a target-boundary hotspot, not a claim of failure.
- Current domain evidence includes Product/SKU and pricing primitives, Purchase Request/Sales Order snapshots, FEFO/lot/reservation policies, delivery/POD evidence, Credit/Receivable/Payment primitives and business documents.
- Static OpenAPI is tracked under `docs/openapi/openapi.json`; current generated path count is 224 by repository evidence. Runtime parity remains a contract validation gate, not a proof of complete V1 business closure.

### Persistence, tenancy and RLS

- Flyway contains V1 through V74 migrations. Observed PostgreSQL schemas include `iam`, `tenant_management`, `catalog_management`, `sales`, `warehouse`, `logistics`, `payments`, `business_documents`, `notifications`, `audit`, `integration` and `reference_data`.
- RLS and direct tenant/workspace policy evidence is present in V44, V55, V58, V59, V69 and V72. `RlsScopedDataSource`/tenant-aware transaction infrastructure sets scoped database context; tables and composite Tenant/Workspace keys are used in multiple migration groups.
- Composite scope foreign keys, unique constraints and version columns protect important resources. Coverage is not a complete proof for every table, worker, bootstrap path or operational role. Comprehensive policy inventory remains a TARGET Security/Data gate.

### Security and authorization

- JWT/resource-server authentication, refresh-token rotation/reuse detection, session revocation, surface checks, verified membership resolution, permission-based access and `CurrentAccessContext` are observed.
- Company Owner, Tenant Administrator, Sales, Warehouse, Logistics and Buyer vocabularies are present in code and migrations; capability/permission mapping is more granular than role labels.
- Request/application authorization and tenant-aware persistence tests exist, including RLS runtime isolation, tenant-context security and security audit tests. Worker/system-actor boundaries require explicit threat review.

### Transactions, concurrency and reliability

- Observed mechanisms include `@Transactional`, row locks, version/precondition handling, idempotency tables/keys, database uniqueness, reservation/conversion concurrency tests, canonical outbox/inbox processing, leases/fencing and change-feed delivery.
- Payment processing includes Stripe provider translation, provider event identity, inbox claims/leases, idempotency and reconciliation-oriented states. A captured payment with failed order creation still requires an operational reconciliation policy at TARGET level.
- Canonical outbox events are used for selected Warehouse, Logistics, Payment, Document, Notification and Security facts. Current event inventory is implementation evidence; it does not mean every method should become a business event.
- Foundation Wave 0 is accepted/baselined for its current purpose. This audit does not rerun it as a broad program and does not claim all technical foundations are complete.

### Integrations and runtime

- Object storage adapters, ClamAV scanning, SMTP/Mailpit, deterministic and Stripe-compatible payment adapters, maps/geolocation adapters, OpenTelemetry/Actuator and local Jaeger/OTEL fixtures are present.
- `modern.compose.yml` provides local API, PostgreSQL, MinIO, Mailpit, ClamAV, Stripe mock, Platform and Portal plus optional observability. Local Compose is not production deployment architecture.
- Production provider credentials, backup/restore, disaster recovery, SLOs, rollout/rollback, edge/TLS and provider SLAs remain open.

## Platform — observed implementation

- Angular 22, TypeScript 6, RxJS 7.8, Angular Material/CDK 22, `@ngx-translate` 18, Vitest and Playwright 1.62 are declared.
- Inventory is 198 TypeScript files, 41 HTML files, 53 unit specs and 21 E2E/support files at audit time.
- Standalone/lazy route configuration includes public sign-in/reset/onboarding and authenticated shell routes for IAM, tenant administration, catalog, customer accounts, sales/requests/orders, warehouse/inventory, fulfillment readiness, dispatch/delivery/POD, documents, audit, notifications and operational analytics.
- Guards include anonymous/authentication, Platform surface, permission, catalog/promotion and manual-order-draft guards. Navigation is capability-aware, but route checks remain a client-side experience control; API authorization is authoritative.
- Feature folders expose application facades, infrastructure HTTP clients, domain models and presentation components. Signals are used for local/server state; shared loading/error/empty/page components, i18n dictionaries and accessibility attributes are observed.
- `If-Match`, `Idempotency-Key`, Problem Details classification, retry/error states and live change-feed refresh are present in selected clients. Cross-feature state ownership and contract duplication remain refinement targets.
- E2E suites cover IAM/onboarding, roles, catalog, sales, warehouse, logistics, documents and responsive shell. Credential-dependent authenticated proof is not re-claimed without approved fixtures.

## Portal — observed implementation

- Angular 22, TypeScript 6, RxJS 7.8, Angular Material/CDK 22, `@ngx-translate` 18, Vitest and Playwright 1.62 are declared.
- Inventory is 132 TypeScript files, 31 HTML files, 40 unit specs and 11 E2E/support files at audit time.
- Routes and feature areas cover authenticated Buyer shell, IAM/profile/security, catalog/pricing preview, Customer Account, Purchase Requests, Sales Orders, deliveries/tracking, documents, receivables/payment methods, notifications, support/legal and shared states.
- Portal auth state normalizes permissions and surface; guards constrain Buyer navigation. API remains authoritative for relationship, Tenant and object scope.
- Facades/signals own server state for Purchase Requests, orders, delivery and notifications. Clients use `If-Match` for optimistic concurrency and `Idempotency-Key` for selected commands. Live refresh listens to change-feed events.
- Portal is not a smaller copy of Platform: its technical boundary is Buyer self-service, reduced information exposure and current supplier-Tenant context. Design and workflow completeness remain separate evidence gates.
- Buyer E2E suites cover commerce, tracking, catalog pricing, IAM and workspace preview. Approved credential/fixture availability is required before claiming full authenticated browser proof.

## Website — observed implementation

- Static HTML5/CSS/vanilla JavaScript, 15 HTML files and four JavaScript files; no package manager/build application exists.
- It provides public discovery, product/solution pages, ES/EN dictionaries, legal pages, login/registration entry links and Contact/Request Demo intake.
- `assets/js/interactions.js` posts to configurable `/api/v1/public/contact-requests`. The Website does not create a Tenant, own tenant data or perform authorization; API validates and throttles the request.
- Website remains a C4 V1 container with a distinct public/security/publication boundary. It does not justify a deeper component model for this rebaseline.

## Mobile and Design Lab

- Mobile is current documentation/native runway only, not a V1 implementation container. No mobile business scope is promoted by this audit.
- Design Lab is non-canonical design evidence. Its current checkout was inspected read-only and no files were changed or interpreted as final Design System decisions.

## Implementation Reconnaissance convergence addendum

The following is current AS-IS evidence from the PR #5 read-only Implementation Reconnaissance. It is not Product or Strategic DDD authority.

### Purchase Request write-path collision

Two active Portal write paths coexist:

1. Canonical draft builder: create draft -> mutate lines -> destination -> route preview -> warehouse -> preferences -> submit.
2. Direct Purchase Request: create/update PR -> line mutations -> submit -> review -> adjust -> approve/reject/cancel.

The Portal uses the canonical builder and the direct PR list/detail/action flow. Platform uses the PR inbox/Sales operations flow. This is a high construction-convergence concern. The evidence supports `REWORK / converge to one authoritative write model` as the default transition, but does not authorize deleting either path before the accepted target contract names consumers, migration/compatibility behavior, observability and tests.

### Catalog identifier and vocabulary collision

Current contracts and screens use overlapping identifiers/concepts: `catalogItemId`, `productId`, `skuId`, Product Family, Product Variant and Sellable SKU. Direct PR still consumes `catalogItemId`; pricing preview uses `productId`; the Builder carries `catalogItemId + skuId`. Product authority remains `Product -> sellable SKU`; Variant is not a required Product abstraction. This is an AS-IS vocabulary/contract collision, not permission to rename source code in this task.

### Buyer Relationship fragmentation

Buyer relationship semantics are distributed across `tenant_management.workspace_membership`, `sales.client_account_membership`, the `BUYER` role, `ClientAccount` and `/client-accounts/me`. Migration V71 enforces one Buyer association per Client Account. This is useful implementation evidence but only `PARTIAL / REQUIRES TARGET RECONCILIATION`; it does not prove that the final Buyer Relationship model is already realized.

### Payment and document surface mismatch

The API exposes Payment/Credit/Receivable capabilities. Portal exposes receivables, payment methods and Stripe Payment Element. Platform has no meaningful Payments feature; Platform and Portal invoicing folders are placeholder-only (`.gitkeep`). Business Documents exist through the documents feature. Backend external/bank-transfer payment semantics are present, but no end-to-end Portal UI evidence proves bank-transfer evidence upload. This is a surface parity/evidence gap, not a Product decision to add a dedicated Invoicing UI module.

### Spring Modulith encapsulation pressure

`ApplicationModules.verify()` passes, but `sales`, `warehouse`, `logistics`, `payments`, `invoicing`, `notifications` and `shared` are observed as OPEN modules. `iam`, `tenantmanagement` and `catalogmanagement` have stronger closed-module metadata. Technical modularity therefore exists, while critical business areas lack strong enforced encapsulation. This is a construction fitness pressure while the accepted Strategic DDD boundaries are implemented; no blanket module-closing change is proposed.

### Build, test and runtime evidence boundary

The Reconnaissance reports PASS for API compile, API architecture tests, API tests, Platform unit tests, Portal unit tests, Platform build, Portal build and frontend asset validation. Reported test reality is: API 373 run, 0 failures, 0 errors, 96 skipped integration tests; Platform 53 unit files / 102 tests; Portal 40 unit files / 79 tests. Playwright tests were discovered/listed, not executed in a browser. Authenticated browser E2E, full integration execution and live API runtime remain unproven. The runtime attempt was blocked by missing local configuration `NEXA_MINIO_MINIO_ROOT_USER`; classify this as `RUNTIME ACCEPTANCE EVIDENCE PENDING`, not architecture failure.

## Evidence classes and gaps

| Class | Finding |
|---|---|
| FACT | Modern repositories, remotes, refs, build manifests, code areas, migrations, security mechanisms, frontend routes and tests were inspected read-only. |
| FACT | API/Platform/Portal Wave 0 is merged in their current `origin/develop` refs. |
| INFERENCE | Current modules are useful technical seams for incremental construction, but not accepted business contexts. |
| CAVEAT | Current code and static contracts show broad V1 coverage, not production or product-completion proof. |
| CAVEAT | Authenticated browser/provider production evidence remains credential/provider-gated. |
| FACT | Dual PR write paths, catalog identifiers, Buyer relationship fragments, surface mismatch and OPEN Modulith modules are current construction evidence. |
| CAVEAT | Unit/build evidence is not browser E2E, full integration or live-runtime acceptance. |
| OPEN EVIDENCE GATE | Runtime acceptance remains pending local environment completion; missing `NEXA_MINIO_MINIO_ROOT_USER` is an environment blocker, not an architecture violation. |
| CLOSED FOR DOCUMENTATION | Strategic DDD boundaries are accepted; ownership-driven module/data migration remains outside this Blueprint-only closure and requires its own construction evidence. |

## Audit conclusion

AS-IS implementation baseline: **CLOSED WITH CAVEAT**. Keep the modular monolith and existing safety mechanisms while using explicit TARGET decisions to refine ownership, transactions, data, security, integration and frontend boundaries. The former acceptance blockers in this historical record are now classified by the current-ref verification; no application-repository migration is authorized by this documentation closure.
