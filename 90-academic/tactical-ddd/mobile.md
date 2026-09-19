---
status: reference
maturity: BASELINED
scope: runway
owner: academic
last-reviewed: 2026-09-19
---

# Mobile Tactical DDD report projection

Operations Mobile and Buyer Mobile reuse the same eleven canonical server-side
Domain Models through REST contracts. They are online-first: any academic local
persistence is proposed, temporary and non-authoritative; it is not generic
offline synchronization or local business truth. No Mobile framework or
concrete client implementation is claimed here.

| Required coverage | Canonical source |
|---|---|
| Shared BC Domain Layer, UML and database authority | [Web projection](web.md) and linked BC artifacts |
| Operations local persistence | [logical model](../../03-mobile/architecture/data/operations-mobile-local-persistence.md), [PlantUML](../../03-mobile/architecture/data/operations-mobile-local-persistence.puml), [SVG](../../03-mobile/architecture/data/OperationsMobileLocalPersistence.svg) and [PNG](../../03-mobile/architecture/data/OperationsMobileLocalPersistence.png) |
| Buyer local persistence | [logical model](../../03-mobile/architecture/data/buyer-mobile-local-persistence.md), [PlantUML](../../03-mobile/architecture/data/buyer-mobile-local-persistence.puml), [SVG](../../03-mobile/architecture/data/BuyerMobileLocalPersistence.svg) and [PNG](../../03-mobile/architecture/data/BuyerMobileLocalPersistence.png) |
| Mobile requirements status | [73 canonical functional stories](../../03-mobile/requirements/README.md) in the accepted Mobile V1 Product Generation envelope |
| Product participation | [BC × Product matrix](../../01-shared/data/product-data-participation.md) |
| C4 component participation | [component coverage](../../01-shared/architecture/c4/component-rubric-coverage.md) and [generated SVG/PNG exports](../../01-shared/architecture/c4/exports/README.md) |

Temporary draft/staging state is not Payment success, credit approval, security
mutation, Purchase Request submission, Sales Order confirmation, POD finality,
Driver Outcome or Buyer Receipt. Buyer receipt/discrepancy is distinct from a
Driver outcome; navigation remains an external handoff and no permanent,
background or live Driver tracking is accepted. Academic report structures stay
`PROPOSED / RESEARCH VALIDATION PENDING`; needfinding and technical verification
do not prove Product Acceptance, System Acceptance or Production Readiness.
