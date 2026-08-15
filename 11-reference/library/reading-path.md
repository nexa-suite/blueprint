# Nexa reading path

Ruta mínima. No leer toda la biblioteca antes de avanzar.

## Phase 1 — Strategic domain architecture

READ FIRST:

- `domain-driven-design-distilled-vaughn-vernon.pdf` — Strategic DDD vocabulary.
- `domain-driven-design-eric-evans.pdf` — source depth for model boundaries and ubiquitous language.

REFERENCE WHILE WORKING:

- `user-story-mapping-jeff-patton.pdf` — collaborative product discovery.
- `use-case-2-0-ivar-jacobson.pdf` — requirements slicing and traceability.

OPTIONAL DEEP DIVE:

- `implementing-ddd-vaughn-vernon.epub`.
- `hands-on-ddd-by-example-michael-plod.epub`.

Use official EventStorming and Domain Storytelling links in [gaps-and-wishlist.md](gaps-and-wishlist.md) before declaring Strategic DDD complete.

## Phase 2 — Application and modular architecture

READ FIRST:

- `software-architecture-in-practice-4.pdf`.
- `building-evolutionary-architectures.pdf`.

REFERENCE WHILE WORKING:

- `patterns-of-enterprise-application-architecture-martin-fowler.epub`.
- `dependency-injection-principles-practices-and-patterns.pdf`.

OPTIONAL DEEP DIVE:

- `the-software-architect-elevator-gregor-hohpe.epub`.

Spring Modulith remains a P0 legal link-only gap; do not infer modular-monolith guidance from folder names or from microservices books.

## Phase 3 — SaaS and tenant architecture

READ FIRST: no adequate local book selected.

REFERENCE WHILE WORKING:

- AWS SaaS Lens links under P0.
- PostgreSQL Row-Level Security documentation under P0.

Before implementation rebaseline, cover tenant context, lifecycle, isolation, pooled/siloed trade-offs, noisy neighbors, tenant-aware jobs, observability and quotas.

## Phase 4 — Data, API and security

READ FIRST:

- `designing-data-intensive-applications-martin-kleppmann.pdf`.
- `restful-web-apis-richardson-amundsen.pdf`.
- `practical-cloud-security-chris-dotson.pdf`.

REFERENCE WHILE WORKING:

- `sql-performance-explained-markus-winand.pdf`.
- `postgresql-up-and-running-2e.pdf`, with version caveat.
- `service-design-patterns-robert-daigneau.pdf`.

Validate current decisions against IETF HTTP/Problem Details, OAuth/OIDC, OWASP ASVS/API Security and PostgreSQL current documentation.

## Phase 5 — Integration, reliability and quality

READ FIRST:

- `site-reliability-engineering-google.pdf`.
- `developer-testing-alexander-tarlinder.pdf`.

REFERENCE WHILE WORKING:

- `site-reliability-workbook-google.pdf`.
- `growing-object-oriented-software-guided-by-tests.pdf`.
- `designing-distributed-systems-brendan-burns.epub`.

Use SRE concepts without forcing Nexa into microservices. Add contract, architecture, performance and tenant-isolation tests from the gap list.

## Phase 6 — Production architecture and UX

READ FIRST:

- `continuous-delivery-humble-farley.pdf`.
- `docker-up-and-running.pdf`.

REFERENCE WHILE WORKING:

- `cloud-native-patterns-cornelia-davis.pdf`.
- `prometheus-up-running-brian-brazil.pdf`.
- `lean-ux-3e.pdf`.
- `information-architecture-4e.pdf`.

Close gaps with current OpenTelemetry, Angular, Spring Boot, C4 and accessibility documentation. Keep mobile, IoT and V2 outside V1 claims.
