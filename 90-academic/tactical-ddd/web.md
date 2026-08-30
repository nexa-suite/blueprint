---
status: planned
maturity: DRAFT
scope: v1
owner: academic
last-reviewed: 2026-08-25
---

# Web Tactical DDD report projection

## Report section 2.6

For each BC, include the linked canonical tactical document as the explanation
of Domain, Application, Interface and Infrastructure layers. Include the linked
PlantUML Domain Layer class diagram and import the linked SQL into the academic
database tool. The canonical API is Domain authority for Website, Platform and
Buyer Portal.

| BC | Tactical model | Domain UML | Database source | C4 component coverage |
|---|---|---|---|---|
| BC-01 | [model](../../01-shared/domain/bounded-contexts/BC-01-tenant-access-governance/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-01-tenant-access-governance/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-01-tenant-access-governance/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-02 | [model](../../01-shared/domain/bounded-contexts/BC-02-customer-buyer-relationships/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-02-customer-buyer-relationships/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-02-customer-buyer-relationships/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-03 | [model](../../01-shared/domain/bounded-contexts/BC-03-catalog-commercial-policy/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-03-catalog-commercial-policy/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-03-catalog-commercial-policy/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-04 | [model](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-05 | [model](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-06 | [model](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-07 | [model](../../01-shared/domain/bounded-contexts/BC-07-credit-receivables/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-07-credit-receivables/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-07-credit-receivables/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-08 | [model](../../01-shared/domain/bounded-contexts/BC-08-payments/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-08-payments/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-08-payments/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-09 | [model](../../01-shared/domain/bounded-contexts/BC-09-business-documents/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-09-business-documents/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-09-business-documents/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-10 | [model](../../01-shared/domain/bounded-contexts/BC-10-notifications/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-10-notifications/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-10-notifications/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |
| BC-11 | [model](../../01-shared/domain/bounded-contexts/BC-11-business-traceability/tactical-model.md) | [UML](../../01-shared/domain/bounded-contexts/BC-11-business-traceability/diagrams/domain-model.puml) | [SQL](../../01-shared/domain/bounded-contexts/BC-11-business-traceability/data/target-relational-model.sql) | [matrix](../../01-shared/architecture/c4/component-rubric-coverage.md#bounded-context-component-level-rubric-coverage) |

Do not create a Web database diagram. All three Web products use Nexa API
authority and PostgreSQL behind the API.
