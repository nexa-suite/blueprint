# Source audit

Fecha de auditoría: 2026-08-14.

## Scope and method

Auditada toda `/Users/diegosandoval284/Biblioteca` mediante inventario de rutas, extensión, hash SHA-256 para duplicados exactos, metadata PDF/EPUB y lectura rápida de portada, prefacio, índice o primeras páginas de candidatos. No se leyó íntegramente cada libro de cientos de páginas; esa es la razón de las caveats de provenance y actualidad.

`nexa-saas-library/` se trató como intento previo, no como source of truth.

## Inventory

Directories inspected:

- `arquitectura-y-diseno`
- `bases-de-datos`
- `capas-de-aplicacion`
- `capas-de-datos`
- `capas-de-presentacion`
- `devops-y-sistemas`
- `git`
- `lean-ux`
- `lenguajes-de-programacion`
- `metodologias-y-calidad`
- `nexa-saas-library`
- `otros-temas`
- `scrum`

Counts are file-level and exclude four `.DS_Store` files:

- Candidate files found: 863.
- Selected and copied: 34.
- Exact duplicate copies excluded: 30.
- Materially outdated or target-stack-mismatch candidates flagged: 79.
- Remaining low-relevance, beginner-only or excluded files: 720.

Duplicate and outdated are recorded as a triage classification; a resource can satisfy both tests before final exclusion. Counts describe the audit pass, not logical book editions.

## Previous `nexa-saas-library` assessment

### Good

- Correctly recognized high-value anchors: Evans DDD, Vernon Implementing DDD, Kleppmann DDIA, Fowler PoEAA, SRE, Docker, API design, testing and Lean UX.
- Preserved local provenance by keeping copies under a separate curation folder.
- Included complementary architecture, data, quality and UX topics instead of only framework tutorials.

### Redundant

- 30 exact duplicate copies exist across `nexa-saas-library` and source folders; examples include Evans DDD, Implementing DDD, DDIA, PoEAA, SRE, Docker, Lean UX and Dependency Injection.
- `evans03.pdf` duplicates Evans DDD under an opaque filename.
- `mastering-postgresql-sample.pdf` is only a 29-page sample and does not add a PostgreSQL authority.
- Kubernetes, Nginx, Pro Git and Scrum are peripheral to the requested architecture-first Nexa library.
- Eloquent JavaScript, React patterns and generic Clean Code are beginner/framework-specific or redundant for this scope.

### Missing

- SaaS operating model, tenant lifecycle, tenant isolation, pooled/siloed tenancy and noisy-neighbor controls.
- EventStorming, Domain Storytelling and capability mapping.
- Modular monolith and Spring Modulith.
- Current OAuth/OIDC, OWASP ASVS/API Security, RLS and tenant-aware authorization.
- ERP/CRM, procurement, inventory, warehouse, logistics and cold-chain operations.
- GS1 traceability, CTE/KDE, lot/expiry/FEFO and temperature excursions.
- Payments, AR, credit, reconciliation and provider abstraction.
- Current Angular, OpenTelemetry, C4, ADRs, contract testing and modern PostgreSQL operations.

### Replacements made

- Kept one canonical source path per selected resource; copied files use discoverable names.
- Replaced vague/duplicate references with stronger complementary anchors: Software Architecture in Practice, Building Evolutionary Architectures, Hands-on DDD by Example, RESTful Web APIs, SRE Workbook and Developer Testing.
- Excluded CSS-only `scalable-and-modular-architecture.epub`; it is not modular software architecture.
- Excluded microservices/Kubernetes as default architecture guidance. Selected distributed/cloud material only where it teaches failure, scale or operational trade-offs.

## Classification policy

`CORE` is repeatedly useful for Nexa roadmap decisions. `DEEP DIVE` supports a difficult decision after core reading. `SPECIALIZED` covers a narrow operational or technology concern. `REFERENCE` is lookup material. `DUPLICATE`, `LOW RELEVANCE`, `OUTDATED`, `BEGINNER-ONLY` and `EXCLUDE` remain in Biblioteca and are not copied.

Architecture decisions created: NONE.
