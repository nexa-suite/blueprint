---
status: planned
maturity: DRAFT
scope: runway
owner: academic
last-reviewed: 2026-08-25
---

# Mobile Tactical DDD report projection

Operations Mobile and Buyer Mobile reuse the same eleven canonical server-side
Domain Models through REST contracts. Local persistence is separate, proposed
and non-authoritative because course requires device storage and selective
offline behavior. No Mobile framework or concrete client class is claimed.

| Required coverage | Canonical source |
|---|---|
| Shared BC Domain Layer, UML and database authority | [Web projection](web.md) and linked BC artifacts |
| Operations local persistence | [logical model](../../03-mobile/architecture/data/operations-mobile-local-persistence.md), [PlantUML](../../03-mobile/architecture/data/operations-mobile-local-persistence.puml), [SVG](../../03-mobile/architecture/data/OperationsMobileLocalPersistence.svg) and [PNG](../../03-mobile/architecture/data/OperationsMobileLocalPersistence.png) |
| Buyer local persistence | [logical model](../../03-mobile/architecture/data/buyer-mobile-local-persistence.md), [PlantUML](../../03-mobile/architecture/data/buyer-mobile-local-persistence.puml), [SVG](../../03-mobile/architecture/data/BuyerMobileLocalPersistence.svg) and [PNG](../../03-mobile/architecture/data/BuyerMobileLocalPersistence.png) |
| Mobile requirements status | [49 proposed stories](../../03-mobile/requirements/coverage.md) |
| Product participation | [BC × Product matrix](../../01-shared/data/product-data-participation.md) |
| C4 component participation | [component coverage](../../01-shared/architecture/c4/component-rubric-coverage.md) and [manual SVG exports](../../01-shared/architecture/c4/exports/README.md) |

Offline draft/queue state is not Payment success, credit approval,
security mutation, Purchase Request submission, Sales Order confirmation, POD
finality or delivery acceptance. Academic report must label all Mobile
structures `PROPOSED / RESEARCH VALIDATION PENDING`.
