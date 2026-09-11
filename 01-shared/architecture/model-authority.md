---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-09-10
---

# Model authority and derived artifacts

This document prevents multiple diagrams or report exports from becoming
independent semantic authorities.

## Authority map

| Concern | Canonical authority | Derived or supporting material |
|---|---|---|
| Strategic DDD and eleven Bounded Contexts | [Strategic DDD](../domain/strategic-ddd/README.md), accepted decisions and context catalog | Mobile Report strategic projection, C4 views, tactical diagrams |
| Tactical domain semantics | [Bounded Context records](../domain/bounded-contexts/README.md) and accepted Product rules | academic PlantUML/XMI/XML when present, generated exports |
| C4 system/container semantics | [Structurizr DSL](c4/structurizr/workspace.dsl) and included DSL files | generated workspace JSON, manual review mirror, SVG/PNG exports |
| Target relational ownership/model | [Master target data model](../data/master-data-model.md) and [target relational SQL](../data/master-target-relational-model.sql) | database diagrams and academic database UML |
| Mobile projection | [Mobile product and backlog](../../03-mobile/README.md) over shared canon | Mobile Report academic projection and generated assets |

Strategic Bounded Contexts are not derived from UML classes, repositories,
packages, PostgreSQL schemas, C4 containers, applications or diagrams.

## September 2026 Mobile Report reconciliation

The current Mobile Report projection was audited at `v0.2.0` target commit
`7205469f032fd0b3acd31195ad4084a4bdb0640a` (release published 2026-09-10).
Its academic assets contain 22 PlantUML source files (11 domain and 11
database projections), no XML/XMI source files in the inspected report tree,
and generated SVG/PNG exports. The report confirms the current distinctions
between Draft, Purchase Request, Sales Order, Commercial Commitment, Inventory
Backing, Physical Allocation, Payment, Receivable, Driver outcome, Buyer
receipt, Notification and Business Traceability.

Those semantics are already represented in the accepted Blueprint Product,
Strategic DDD, tactical and target relational records. No additional Bounded
Context or competing semantic source is promoted from the report. The report
assets remain `ACADEMIC_PROJECTION`; generated SVG/PNG/XML/XMI are derived
artifacts unless a future Owner decision explicitly designates a source.

## Controlled derivation

Reports and academic projections should consume or generate artifacts from the
canonical sources where practical. If an academic model adds a genuinely new
current semantic detail, reconcile that detail into the appropriate Blueprint
authority first, record provenance, and leave the academic export as derived
material. Do not maintain two independently edited models that claim the same
authority.
