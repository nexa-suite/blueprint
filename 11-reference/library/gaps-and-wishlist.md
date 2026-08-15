# Gaps and legal wishlist

Estado: LINK_ONLY unless a legal acquisition or redistribution license is confirmed. No internet binaries downloaded.

## P0 — needed for upcoming architecture work

### Strategic domain discovery

- Topic: EventStorming.
  - Recommended: Alberto Brandolini, official EventStorming resources and book.
  - Why: collaborative exploration of complex business domains before Strategic DDD.
  - Legal source: [eventstorming.com](https://www.eventstorming.com/).
  - Status: LINK_ONLY; official starter materials may be separately reviewed for redistribution terms.

- Topic: Domain Storytelling.
  - Recommended: Stefan Hofer and Henning Schwentner, *Domain Storytelling: A Collaborative, Visual, and Agile Way to Build Domain-Driven Software*.
  - Why: visual, scenario-based domain discovery absent from Biblioteca.
  - Legal source: [domainstorytelling.org/book](https://domainstorytelling.org/book).
  - Status: LINK_ONLY / commercial book.

### SaaS and multitenancy

- Topic: pooled, siloed and bridge isolation; tenant context, onboarding, noisy neighbor and tenant-aware operations.
  - Recommended: AWS Well-Architected SaaS Lens.
  - Why: Nexa is multi-tenant B2B SaaS; local Biblioteca has no dedicated SaaS reference.
  - Legal source: [SaaS Lens foundations](https://docs.aws.amazon.com/wellarchitected/latest/saas-lens/foundations.html), [tenant IAM](https://docs.aws.amazon.com/wellarchitected/latest/saas-lens/identity-and-access-management.html), [pool isolation](https://docs.aws.amazon.com/wellarchitected/latest/saas-lens/pool-isolation.html).
  - Status: LINK_ONLY; AWS documentation is provider-specific and must not become Nexa architecture by default.

### Modular monolith and Spring Modulith

- Topic: module boundaries, application events, verification and evolution of a modular monolith.
  - Recommended: Spring Modulith reference and examples.
  - Why: current Nexa target uses a modular monolith; no adequate local resource exists.
  - Legal source: [Spring Modulith reference](https://docs.spring.io/spring-modulith/reference/index.html).
  - Status: LINK_ONLY; validate compatibility with accepted Spring Boot target before use.

### Security and tenant isolation

- Topic: application security verification, API authorization, BOLA/IDOR, SSRF and secure development controls.
  - Recommended: OWASP ASVS 5.0.0 and OWASP API Security Top 10 2023.
  - Why: local books are older or generic; Nexa needs current authorization and tenant-isolation verification.
  - Legal sources: [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/), [OWASP API Security](https://owasp.org/www-project-api-security/).
  - Status: LINK_ONLY / open project resources; record exact version when citing.

### PostgreSQL tenant isolation

- Topic: Row-Level Security, FORCE RLS, bypass roles, policies and backup implications.
  - Recommended: PostgreSQL current documentation.
  - Why: PostgreSQL local books cover obsolete versions and do not cover Nexa tenant policy design sufficiently.
  - Legal source: [PostgreSQL 18 Row Security Policies](https://www.postgresql.org/docs/18/ddl-rowsecurity.html).
  - Status: LINK_ONLY / official documentation.

### ERP, CRM, supply chain and cold-chain domain

- Topic: order management, procurement, inventory, warehouse, lot/expiry/FEFO, temperature excursions, quarantine, recall and proof of delivery.
  - Recommended: ASCM CPIM body of knowledge plus official GS1 traceability standards and cold-chain regulatory/industry guidance.
  - Why: Biblioteca has no reliable ERP/CRM, warehouse or cold-chain source; architecture must not be inferred from current code modules.
  - Legal sources: [ASCM CPIM](https://www.ascm.org/learning-development/certifications-credentials/cpim/), [GS1 Global Traceability Standard](https://ref.gs1.org/standards/global-traceability/2.0.0/).
  - Status: CPIM commercial LINK_ONLY; GS1 standard LINK_ONLY unless redistribution terms are confirmed.

## P1 — needed before implementation rebaseline

- Topic: API contracts and evolution. Recommended: IETF HTTP Semantics, RFC 9457 Problem Details, RFC 9110 and current OAuth/OIDC specifications. Legal sources: [RFC 9110](https://www.rfc-editor.org/rfc/rfc9110), [RFC 9457](https://www.rfc-editor.org/rfc/rfc9457), [OpenID specifications](https://openid.net/specs/). Status: LINK_ONLY.
- Topic: observability architecture. Recommended: OpenTelemetry documentation and semantic conventions. Legal source: [OpenTelemetry docs](https://opentelemetry.io/docs/). Status: LINK_ONLY / open project resources.
- Topic: Angular 21+ architecture, Signals, forms, accessibility and testing. Recommended: official Angular documentation. Legal sources: [Signals](https://angular.dev/guide/signals), [Testing](https://angular.dev/guide/testing). Status: LINK_ONLY.
- Topic: architecture documentation. Recommended: C4 model and ADR practice. Legal sources: [C4 model](https://c4model.com/), [ADR original proposal](https://github.com/joelparkerhenderson/architecture-decision-record). Status: LINK_ONLY; keep C4 L3 blocked until Strategic DDD.
- Topic: modern Spring Boot 4, Spring Security and Spring Data. Recommended: official Spring documentation and release compatibility matrix. Legal source: [Spring documentation](https://docs.spring.io/). Status: LINK_ONLY.
- Topic: contract testing, Testcontainers, property-based testing and architecture fitness functions. Recommended: official project documentation and current standards; acquire books legally only after comparing overlap with selected testing references. Status: LINK_ONLY / commercial acquisition candidate.

## P2 — needed before production hardening

- Topic: backup/PITR, disaster recovery, RPO/RTO and PostgreSQL operations.
- Topic: secure object storage, signed URLs, malware scanning, retention and immutable document snapshots.
- Topic: payment allocation, AR, credit limits, reconciliation and provider abstraction.
- Topic: performance/load methodology, connection pools, caching and capacity planning.
- Topic: supply-chain security, SBOM, provenance, artifact signing and container hardening.
- Topic: accessibility for role-focused B2B operational workflows and complex forms.

All P2 entries require legal, authoritative source selection before copying anything.

## P3 — future knowledge

- IoT temperature telemetry, device identity and offline mobile workflows.
- Advanced analytics pipelines, forecasting and data products.
- Chaos engineering and failure-injection strategy after baseline reliability exists.
- Kubernetes and service-mesh operations only if Nexa architecture runway explicitly requires them.

## Non-goals

Do not acquire pirated books, random file-sharing copies or unauthorised mirrors. Do not use wishlist entries to declare Nexa subdomains, Bounded Contexts, target schemas or implementation plans.
