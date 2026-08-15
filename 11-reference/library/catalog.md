# Catalog

Scores use `Nexa relevance / authority / depth / practical applicability / longevity / uniqueness`, each 0–5. Total is out of 30. Scores support judgment; they do not replace it.

Publication status for every copied binary: `PRIVATE_LOCAL_REFERENCE`.

## 01 — Software architecture

### Software Architecture in Practice, 4th edition

- Author: Len Bass, Paul Clements, Rick Kazman.
- Edition/year: 4th edition, 2021.
- Topic: architecture characteristics, quality attributes, trade-offs and governance.
- Classification: CORE.
- Score: 5 / 5 / 5 / 5 / 5 / 4 = 29.
- Why selected: strongest general architecture anchor in Biblioteca.
- Specific Nexa relevance: quality scenarios, architectural decisions, evolution and fitness thinking before C4 L3.
- When to consult: every major architecture trade-off and quality gate.
- Original source path: `/Users/diegosandoval284/Biblioteca/arquitectura-y-diseno/software-architecture-in-practice-4.pdf`.
- Curated destination: `11-reference/library/01-software-architecture/software-architecture-in-practice-4.pdf`.

### Building Evolutionary Architectures

- Author: Neal Ford, Rebecca Parsons, Patrick Kua.
- Edition/year: 1st edition, 2017.
- Topic: evolutionary architecture, change, architecture fitness functions.
- Classification: CORE.
- Score: 5 / 5 / 5 / 5 / 5 / 5 = 30.
- Why selected: directly supports Nexa architecture governance and controlled evolution.
- Specific Nexa relevance: protects modular boundaries and quality attributes during implementation rebaseline.
- When to consult: before introducing a new dependency, module communication path or production constraint.
- Original source path: `/Users/diegosandoval284/Biblioteca/arquitectura-y-diseno/building-evolutionary-architectures.pdf`.
- Curated destination: `11-reference/library/01-software-architecture/building-evolutionary-architectures.pdf`.

### Architecting for Scale

- Author: Lee Atchison.
- Edition/year: 2016.
- Topic: scalability, availability, service tiers, operational growth.
- Classification: DEEP DIVE.
- Score: 4 / 4 / 4 / 4 / 4 / 4 = 24.
- Why selected: useful scale and availability trade-offs without requiring a microservices migration.
- Specific Nexa relevance: tenant load, buyer traffic, order workflows and noisy-neighbor preparation.
- When to consult: performance, capacity and availability design.
- Original source path: `/Users/diegosandoval284/Biblioteca/arquitectura-y-diseno/architecting-for-scale.epub`.
- Curated destination: `11-reference/library/01-software-architecture/architecting-for-scale.epub`.

### The Software Architect Elevator

- Author: Gregor Hohpe.
- Edition/year: 2020.
- Topic: architecture communication, organizational change and business alignment.
- Classification: CORE.
- Score: 4 / 5 / 4 / 5 / 5 / 4 = 27.
- Why selected: helps connect domain, product, engineering and governance conversations.
- Specific Nexa relevance: keeps library material subordinate to accepted Product and Architecture decisions.
- When to consult: architecture reviews, decision records and cross-functional alignment.
- Original source path: `/Users/diegosandoval284/Biblioteca/arquitectura-y-diseno/the-software-architect-elevator-gregor-hohpe.epub`.
- Curated destination: `11-reference/library/01-software-architecture/the-software-architect-elevator-gregor-hohpe.epub`.

## 02 — Domain-Driven Design

### Domain-Driven Design: Tackling Complexity in the Heart of Software

- Author: Eric Evans.
- Edition/year: 2003.
- Topic: domain modeling, ubiquitous language, bounded contexts and strategic/tactical DDD foundations.
- Classification: CORE.
- Score: 5 / 5 / 5 / 5 / 5 / 5 = 30.
- Why selected: foundational DDD source; age does not invalidate its core concepts.
- Specific Nexa relevance: Strategic DDD gate before Bounded Contexts and C4 L3.
- When to consult: domain discovery, model boundaries and language decisions.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-aplicacion/domain-driven-design-tackling-complexity-in-the-heart-of-software-eric-evans.pdf`.
- Curated destination: `11-reference/library/02-domain-driven-design/domain-driven-design-eric-evans.pdf`.

### Implementing Domain-Driven Design

- Author: Vaughn Vernon.
- Edition/year: 2013.
- Topic: aggregates, entities, value objects, repositories, domain events and bounded contexts.
- Classification: CORE.
- Score: 5 / 5 / 5 / 5 / 4 / 5 = 29.
- Why selected: complementary tactical depth to Evans.
- Specific Nexa relevance: implementation boundaries after Strategic DDD, without deriving contexts from current folders.
- When to consult: aggregate consistency, application services, events and repositories.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-aplicacion/implementing-ddd.epub`.
- Curated destination: `11-reference/library/02-domain-driven-design/implementing-ddd-vaughn-vernon.epub`.

### Hands-on Domain-Driven Design — by example

- Author: Michael Plöd.
- Edition/year: 2019 Leanpub version.
- Topic: DDD workshop and implementation case study.
- Classification: DEEP DIVE.
- Score: 5 / 4 / 4 / 5 / 4 / 5 = 27.
- Why selected: practical bridge from discovery to model and code.
- Specific Nexa relevance: helps test domain language and boundaries against realistic workflows.
- When to consult: after core Strategic DDD reading, before tactical design.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-aplicacion/hands-on-domain-driven-design-by-example.epub`.
- Curated destination: `11-reference/library/02-domain-driven-design/hands-on-ddd-by-example-michael-plod.epub`.

### Domain-Driven Design Distilled

- Author: Vaughn Vernon.
- Edition/year: 2016.
- Topic: concise Strategic DDD, subdomains, bounded contexts and context maps.
- Classification: CORE.
- Score: 5 / 5 / 4 / 5 / 5 / 4 = 28.
- Why selected: realistic first pass before Evans and Vernon deep dives.
- Specific Nexa relevance: Capability Mapping, EventStorming and Strategic DDD roadmap preparation.
- When to consult: first reading of the domain architecture phase.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-aplicacion/domain-driven-design-distilled.pdf`.
- Curated destination: `11-reference/library/02-domain-driven-design/domain-driven-design-distilled-vaughn-vernon.pdf`.

## 03 — Domain discovery

### User Story Mapping

- Author: Jeff Patton with Peter Economy.
- Edition/year: 2014.
- Topic: collaborative discovery, user activities, outcomes and incremental slices.
- Classification: CORE.
- Score: 5 / 4 / 4 / 5 / 4 / 4 = 26.
- Why selected: strongest local discovery resource; not a substitute for EventStorming or Domain Storytelling.
- Specific Nexa relevance: role-focused B2B workflows and product baseline refinement.
- When to consult: before and alongside domain workshops.
- Original source path: `/Users/diegosandoval284/Biblioteca/scrum/user-story-mapping-discover-the-whole-story-build-the-right-product.pdf`.
- Curated destination: `11-reference/library/03-domain-discovery/user-story-mapping-jeff-patton.pdf`.

### Use Case 2.0

- Author: Ivar Jacobson and collaborators.
- Edition/year: ACM Queue, 2016 local version.
- Topic: use-case slicing, requirements evolution and traceability.
- Classification: REFERENCE.
- Score: 4 / 4 / 3 / 4 / 4 / 4 = 23.
- Why selected: compact complement for slicing business behavior without inventing domain decisions.
- Specific Nexa relevance: purchase, sales, fulfillment and buyer flows.
- When to consult: translating discovered behavior into testable increments.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-aplicacion/use-case-2-0-final-rev3.pdf`.
- Curated destination: `11-reference/library/03-domain-discovery/use-case-2-0-ivar-jacobson.pdf`.

## 06 — Identity and security

### Identity and Data Security for Web Development

- Author: not reliably present in local metadata.
- Edition/year: not reliably present in local metadata; verify before citation.
- Topic: identity and web data security.
- Classification: SPECIALIZED.
- Score: 4 / 2 / 3 / 3 / 2 / 3 = 17.
- Why selected: only local resource directly combining identity and web data security; deliberately low-confidence selection.
- Specific Nexa relevance: tenant-aware identity, secure data handling and web threat review.
- When to consult: as a secondary reference beside OWASP current standards.
- Original source path: `/Users/diegosandoval284/Biblioteca/otros-temas/seguridad-y-hacking/identity-and-data-security-for-web-development-best-practices.pdf`.
- Curated destination: `11-reference/library/06-identity-security/identity-and-data-security-for-web-development.pdf`.

### Practical Cloud Security

- Author: Chris Dotson.
- Edition/year: 2019.
- Topic: secure cloud design and deployment.
- Classification: DEEP DIVE.
- Score: 4 / 4 / 4 / 4 / 4 / 4 = 24.
- Why selected: useful security architecture complement beyond framework tutorials.
- Specific Nexa relevance: TLS, secrets, cloud boundaries, object storage and deployment risks.
- When to consult: cloud and production security design.
- Original source path: `/Users/diegosandoval284/Biblioteca/devops-y-sistemas/practical-cloud-security-a-guide-for-secure-design-and-deployment.pdf`.
- Curated destination: `11-reference/library/06-identity-security/practical-cloud-security-chris-dotson.pdf`.

### The Web Application Hacker’s Handbook, 2nd edition

- Author: Dafydd Stuttard, Marcus Pinto.
- Edition/year: 2nd edition, 2011.
- Topic: web application vulnerabilities and testing.
- Classification: DEEP DIVE.
- Score: 4 / 4 / 5 / 4 / 2 / 4 = 23.
- Why selected: deep attack-model reference; age requires current OWASP overlay.
- Specific Nexa relevance: BOLA/IDOR, session, upload and API threat reasoning.
- When to consult: threat modeling and security test design, never as current standard.
- Original source path: `/Users/diegosandoval284/Biblioteca/otros-temas/seguridad-y-hacking/dafydd-stuttard-marcus-pinto-the-web-application-hacker-s-handbook-finding-and-exploiting-security-flaws-wiley-2011.pdf`.
- Curated destination: `11-reference/library/06-identity-security/web-application-hackers-handbook-stuttard-pinto.pdf`.

## 07 — Data and PostgreSQL

### Designing Data-Intensive Applications

- Author: Martin Kleppmann.
- Edition/year: 2017.
- Topic: data models, storage, replication, transactions, consistency and distributed data.
- Classification: CORE.
- Score: 5 / 5 / 5 / 5 / 5 / 5 = 30.
- Why selected: strongest data architecture resource in Biblioteca.
- Specific Nexa relevance: operational data, consistency boundaries, events, backups and integration trade-offs.
- When to consult: data architecture and reliability decisions.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-datos/designing-data-intensive-applications.pdf`.
- Curated destination: `11-reference/library/07-data-postgresql/designing-data-intensive-applications-martin-kleppmann.pdf`.

### SQL Performance Explained

- Author: Markus Winand.
- Edition/year: 2012.
- Topic: indexes, execution plans and SQL performance.
- Classification: SPECIALIZED.
- Score: 4 / 5 / 4 / 5 / 4 / 5 = 27.
- Why selected: practical and vendor-aware performance reference without premature caching.
- Specific Nexa relevance: catalog, orders, inventory and tenant-scoped query performance.
- When to consult: after measurement shows query or index risk.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-datos/sql-performance-explained.pdf`.
- Curated destination: `11-reference/library/07-data-postgresql/sql-performance-explained-markus-winand.pdf`.

### PostgreSQL Up & Running, 2nd edition

- Author: Regina Obe, Leo Hsu.
- Edition/year: 2nd edition, 2014; covers PostgreSQL 9.3/9.4.
- Topic: PostgreSQL administration and development basics.
- Classification: SPECIALIZED.
- Score: 4 / 4 / 3 / 4 / 2 / 3 = 20.
- Why selected: only practical PostgreSQL book with useful local coverage; version is materially old.
- Specific Nexa relevance: PostgreSQL operational vocabulary and developer onboarding.
- When to consult: historical/conceptual lookup only; validate every current behavior against PostgreSQL docs.
- Original source path: `/Users/diegosandoval284/Biblioteca/bases-de-datos/postgresql-up-and-running.pdf`.
- Curated destination: `11-reference/library/07-data-postgresql/postgresql-up-and-running-2e.pdf`.

### Patterns of Enterprise Application Architecture

- Author: Martin Fowler and contributors.
- Edition/year: 2002/2003.
- Topic: domain logic, data source, transactions, mapping and enterprise application patterns.
- Classification: DEEP DIVE.
- Score: 5 / 5 / 5 / 4 / 5 / 4 = 28.
- Why selected: durable patterns remain useful despite old framework context.
- Specific Nexa relevance: application/domain/infrastructure boundaries and transactional behavior.
- When to consult: tactical architecture and persistence trade-offs.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-datos/patterns-of-enterprise-application-architecture-martin-fowler.epub`.
- Curated destination: `11-reference/library/07-data-postgresql/patterns-of-enterprise-application-architecture-martin-fowler.epub`.

## 08 — API and integration

### RESTful Web APIs

- Author: Leonard Richardson, Mike Amundsen.
- Edition/year: 2013.
- Topic: REST constraints, hypermedia, resource modeling and API evolution.
- Classification: CORE.
- Score: 5 / 5 / 5 / 5 / 4 / 5 = 29.
- Why selected: strongest local REST architecture reference.
- Specific Nexa relevance: stable REST/OpenAPI contracts, resource semantics and compatibility.
- When to consult: every new endpoint, contract change and integration boundary.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-presentacion/restful-web-apis.pdf`.
- Curated destination: `11-reference/library/08-api-integration/restful-web-apis-richardson-amundsen.pdf`.

### Service Design Patterns

- Author: Robert Daigneau.
- Edition/year: 2011.
- Topic: SOAP/WSDL and REST service interaction patterns.
- Classification: DEEP DIVE.
- Score: 4 / 4 / 4 / 4 / 3 / 4 = 23.
- Why selected: useful command/query, message and response-management patterns.
- Specific Nexa relevance: external Payment, Email, Maps and partner integration design.
- When to consult: synchronous/asynchronous integration and API interaction choices.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-presentacion/service-design-patterns.pdf`.
- Curated destination: `11-reference/library/08-api-integration/service-design-patterns-robert-daigneau.pdf`.

### Build APIs You Won’t Hate

- Author: Phil Sturgeon.
- Edition/year: 2015 Leanpub version.
- Topic: practical API design, errors, pagination, authentication and versioning.
- Classification: DEEP DIVE.
- Score: 4 / 3 / 4 / 5 / 3 / 4 = 23.
- Why selected: practical complement to REST theory.
- Specific Nexa relevance: buyer, sales, catalog and operational API ergonomics.
- When to consult: API review and consumer-facing contract design.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-presentacion/build-apis-you-wont-hate.pdf`.
- Curated destination: `11-reference/library/08-api-integration/build-apis-you-wont-hate-phil-sturgeon.pdf`.

## 09 — Distributed systems and reliability

### Site Reliability Engineering

- Author: Betsy Beyer, Chris Jones, Jennifer Petoff, Niall Richard Murphy, editors.
- Edition/year: 2016.
- Topic: SLI/SLO, error budgets, incident response and production reliability.
- Classification: CORE.
- Score: 5 / 5 / 5 / 5 / 5 / 5 = 30.
- Why selected: authoritative reliability reference with public Google provenance.
- Specific Nexa relevance: production hardening, RPO/RTO, operational health and service quality.
- When to consult: before defining SLOs, alerts and incident workflows.
- Original source path: `/Users/diegosandoval284/Biblioteca/devops-y-sistemas/site-reliability-engineering.pdf`.
- Curated destination: `11-reference/library/09-distributed-systems-reliability/site-reliability-engineering-google.pdf`.

### The Site Reliability Workbook

- Author: Betsy Beyer, Niall Richard Murphy, David K. Rensin, Kent Kawahara, Stephen Thorne, editors.
- Edition/year: 2018.
- Topic: practical SRE implementation.
- Classification: DEEP DIVE.
- Score: 5 / 5 / 4 / 5 / 4 / 4 = 27.
- Why selected: actionable companion to SRE concepts.
- Specific Nexa relevance: incident response, monitoring, capacity and reliability rollout.
- When to consult: converting reliability principles into operating practice.
- Original source path: `/Users/diegosandoval284/Biblioteca/devops-y-sistemas/the-site-reliability-workbook-practical-ways-to-implement-sre.pdf`.
- Curated destination: `11-reference/library/09-distributed-systems-reliability/site-reliability-workbook-google.pdf`.

### Designing Distributed Systems

- Author: Brendan Burns.
- Edition/year: 2018.
- Topic: distributed system patterns and event-driven/background processing.
- Classification: SPECIALIZED.
- Score: 4 / 4 / 4 / 4 / 3 / 4 = 23.
- Why selected: compact reference for partial failure and background execution.
- Specific Nexa relevance: jobs, retries, backpressure and future architecture runway.
- When to consult: only when a real distributed boundary exists; Kubernetes examples do not prescribe Nexa deployment.
- Original source path: `/Users/diegosandoval284/Biblioteca/arquitectura-y-diseno/designing-distributed-systems.epub`.
- Curated destination: `11-reference/library/09-distributed-systems-reliability/designing-distributed-systems-brendan-burns.epub`.

## 10 — Cloud, DevOps and observability

### Docker: Up & Running

- Author: Karl Matthias, Sean P. Kane.
- Edition/year: 2015.
- Topic: Docker images, runtime, networking and production containers.
- Classification: SPECIALIZED.
- Score: 4 / 4 / 4 / 4 / 2 / 3 = 21.
- Why selected: useful container fundamentals for current Compose workflow.
- Specific Nexa relevance: reproducible local/runtime environments and health checks.
- When to consult: container and Compose decisions; overlay with current Docker docs.
- Original source path: `/Users/diegosandoval284/Biblioteca/devops-y-sistemas/docker-up-and-running.pdf`.
- Curated destination: `11-reference/library/10-cloud-devops-observability/docker-up-and-running.pdf`.

### Continuous Delivery

- Author: Jez Humble, David Farley.
- Edition/year: 2010.
- Topic: delivery pipelines, deployment automation, feedback and rollback.
- Classification: CORE.
- Score: 5 / 5 / 5 / 5 / 5 / 4 = 29.
- Why selected: durable delivery principles directly support evidence-first gates.
- Specific Nexa relevance: artifact promotion, quality gates, rollback and release traceability.
- When to consult: CI/CD and production hardening design.
- Original source path: `/Users/diegosandoval284/Biblioteca/metodologias-y-calidad/continuous-delivery.pdf`.
- Curated destination: `11-reference/library/10-cloud-devops-observability/continuous-delivery-humble-farley.pdf`.

### Cloud Native Patterns

- Author: Cornelia Davis.
- Edition/year: 2019.
- Topic: change-tolerant cloud-native application patterns.
- Classification: DEEP DIVE.
- Score: 4 / 4 / 4 / 4 / 3 / 4 = 23.
- Why selected: focused pattern reference for resilience and deployability.
- Specific Nexa relevance: stateless runtime, configuration, health and failure handling.
- When to consult: production architecture; do not treat cloud-native as synonym for microservices.
- Original source path: `/Users/diegosandoval284/Biblioteca/devops-y-sistemas/cloud-native-patterns-designing-change-tolerant-software.pdf`.
- Curated destination: `11-reference/library/10-cloud-devops-observability/cloud-native-patterns-cornelia-davis.pdf`.

### Prometheus: Up & Running

- Author: Brian Brazil.
- Edition/year: 2018.
- Topic: metrics, alerting and application/infrastructure monitoring.
- Classification: SPECIALIZED.
- Score: 4 / 4 / 4 / 4 / 3 / 4 = 23.
- Why selected: strongest local observability-specific reference.
- Specific Nexa relevance: tenant-aware metrics, SLI signals and operational dashboards.
- When to consult: metrics design; supplement with current OpenTelemetry guidance.
- Original source path: `/Users/diegosandoval284/Biblioteca/devops-y-sistemas/prometheus-up-running-infrastructure-and-application-performance-monitoring.pdf`.
- Curated destination: `11-reference/library/10-cloud-devops-observability/prometheus-up-running-brian-brazil.pdf`.

## 11 — Testing, quality and performance

### Developer Testing: Building Quality into Software

- Author: Alexander Tarlinder.
- Edition/year: 2017.
- Topic: test strategy, unit/integration testing and quality feedback.
- Classification: CORE.
- Score: 5 / 4 / 4 / 5 / 4 / 4 = 26.
- Why selected: strategy-oriented testing resource, not syntax-only.
- Specific Nexa relevance: distinct unit, integration, contract, browser and security gates.
- When to consult: test-plan and quality-gate design.
- Original source path: `/Users/diegosandoval284/Biblioteca/metodologias-y-calidad/developer-testing.pdf`.
- Curated destination: `11-reference/library/11-testing-quality-performance/developer-testing-alexander-tarlinder.pdf`.

### Growing Object-Oriented Software, Guided by Tests

- Author: Steve Freeman, Nat Pryce.
- Edition/year: 2009.
- Topic: test-guided design, collaboration and maintainable object-oriented software.
- Classification: DEEP DIVE.
- Score: 4 / 5 / 5 / 4 / 4 / 4 = 26.
- Why selected: deep design/testing complement to strategy reference.
- Specific Nexa relevance: ports/adapters, test seams and behavior-focused design.
- When to consult: implementation and refactoring of domain/application code.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-aplicacion/growing-object-oriented-software-guided-by-tests.pdf`.
- Curated destination: `11-reference/library/11-testing-quality-performance/growing-object-oriented-software-guided-by-tests.pdf`.

## 12 — Java and Spring foundations

### Modern Java in Action

- Author: Raoul-Gabriel Urma, Mario Fusco, Alan Mycroft.
- Edition/year: 2nd edition, 2018.
- Topic: modern Java language, functional style, streams and reactive concepts.
- Classification: SPECIALIZED.
- Score: 4 / 4 / 4 / 4 / 3 / 4 = 23.
- Why selected: best local modern-Java reference, though target Java 25 requires current documentation.
- Specific Nexa relevance: readable Java domain/application code and collection/stream choices.
- When to consult: Java implementation questions; not a Java 25 authority.
- Original source path: `/Users/diegosandoval284/Biblioteca/capas-de-presentacion/modern-java-in-action-lambda-streams-functional-and-reactive-programming.pdf`.
- Curated destination: `11-reference/library/12-java-spring/modern-java-in-action.pdf`.

### Java Concurrency in Practice

- Author: Brian Goetz and contributors.
- Edition/year: 2006.
- Topic: concurrency, memory model, thread safety and shared state.
- Classification: DEEP DIVE.
- Score: 4 / 5 / 5 / 4 / 3 / 5 = 26.
- Why selected: foundational concurrency reasoning remains valuable.
- Specific Nexa relevance: background jobs, inventory/order concurrency and safe state transitions.
- When to consult: concurrency design; overlay with Java 25 virtual-thread documentation.
- Original source path: `/Users/diegosandoval284/Biblioteca/lenguajes-de-programacion/java-concurrency-in-practice.pdf`.
- Curated destination: `11-reference/library/12-java-spring/java-concurrency-in-practice.pdf`.

### Dependency Injection: Principles, Practices, Patterns

- Author: Steven van Deursen, Mark Seemann.
- Edition/year: 2019.
- Topic: dependency inversion, composition roots, lifetimes and testability.
- Classification: DEEP DIVE.
- Score: 4 / 4 / 4 / 4 / 4 / 4 = 24.
- Why selected: framework-independent DI reasoning; examples are not Spring-specific.
- Specific Nexa relevance: domain/application/infrastructure separation and test seams.
- When to consult: dependency graph, adapter and testability decisions.
- Original source path: `/Users/diegosandoval284/Biblioteca/arquitectura-y-diseno/dependency-injection-principles-practices-and-patterns.pdf`.
- Curated destination: `11-reference/library/12-java-spring/dependency-injection-principles-practices-and-patterns.pdf`.

## 14 — Product and UX

### Lean UX, 3rd edition

- Author: Jeff Gothelf, Josh Seiden.
- Edition/year: 3rd edition, 2021.
- Topic: hypothesis-driven collaboration and product discovery.
- Classification: CORE.
- Score: 4 / 4 / 4 / 5 / 4 / 4 = 25.
- Why selected: supports role-focused B2B workflows without dominating technical architecture.
- Specific Nexa relevance: buyer portal, operational roles and measurable workflow outcomes.
- When to consult: product baseline and discovery workshops.
- Original source path: `/Users/diegosandoval284/Biblioteca/lean-ux/lean-ux-creating-great-products-with-agile-teams-3rd-edition.pdf`.
- Curated destination: `11-reference/library/14-product-ux/lean-ux-3e.pdf`.

### Information Architecture for the Web and Beyond, 4th edition

- Author: Louis Rosenfeld, Peter Morville, Jorge Arango.
- Edition/year: 4th edition, 2015.
- Topic: information architecture, navigation, labeling and findability.
- Classification: DEEP DIVE.
- Score: 4 / 4 / 4 / 5 / 4 / 4 = 25.
- Why selected: useful for dense B2B/ERP operational interfaces.
- Specific Nexa relevance: role-focused navigation, catalog/inventory discoverability and workflow structure.
- When to consult: UX and information architecture reviews.
- Original source path: `/Users/diegosandoval284/Biblioteca/arquitectura-y-diseno/information-architecture-for-the-web-and-beyond.pdf`.
- Curated destination: `11-reference/library/14-product-ux/information-architecture-4e.pdf`.
