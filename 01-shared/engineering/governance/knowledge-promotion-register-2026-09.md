---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-09-19
---

# Knowledge-promotion register — 2026-09

This register classifies the durable material promoted or referenced by the
Post-AV1 Wave 1 and Wave 2 reconciliation. Classification preserves
provenance; it is not itself Owner acceptance.

| Source or finding | Classification | Durable destination | Promotion boundary |
|---|---|---|---|
| Explicit 2026-09-18 Product-generation decision | `OWNER_DECISION` | [Owner decisions](../../product/owner-decisions-2026-09.md) and current decisions | accepted semantics only; no implementation claim |
| Final Mobile AV1 research, 9/9 Needfinding | `RESEARCH_EVIDENCE` | `03-mobile/ux/discovery`, interview provenance and findings | problem/task evidence; solution validation open |
| Final Mobile academic backlog, 97 PBIs / 426 SP | `ACADEMIC_PROJECTION` | [Academic backlog boundary](../../../03-mobile/requirements/academic-backlog-boundary.md) and `90-academic/mobile/course-1acc0238` | planning only; does not redefine 73 Product stories |
| Mobile Report C4/DDD/UML/PlantUML/PNG/SVG | `DERIVED_ACADEMIC_PROJECTION` | [Model authority](../../architecture/model-authority.md) | immutable v1.0.1 evidence; never a competing C4/DDD/data authority |
| 73 Mobile Product story catalog | `CANONICAL_PRODUCT_REQUIREMENTS` | `03-mobile/requirements` | Product authority for story behavior and lifecycle projection |
| Old 28/35/9/1 grouping | `SUPERSEDED_PRODUCT_RELEASE_NOMENCLATURE` / `HISTORICAL_PLANNING_PROVENANCE` | Mobile roadmap, reconciliation and master backlog | exact history retained; not current Product release truth |
| Mobile feature branches | `IMPLEMENTATION_EVIDENCE` | [Live repository baseline](../../../04-delivery/as-is/live-repository-baseline-2026-09-18.md) | exact branch/ref only; unmerged and not Product Accepted |
| Named test/build/emulator/local-fixture records | `TECHNICAL_VERIFICATION_EVIDENCE` | live baseline and academic evidence plan | exact ref/scope only; not Product/System Acceptance |
| Alejandro, Diego and Carlos personas | `RESEARCH_INFORMED_SYNTHETIC_ARTIFACT` | `03-mobile/actors/personas.md` | synthetic; not interview participants or Product authority |
| Tenant Workforce actor and Mobile-specific C4 systems/containers inferred from the report | `REJECT_REPORT_DRIFT` | [Canonical C4](../../architecture/c4/README.md) | retain granular accepted actors and one Nexa software system |
| Push Delivery Service modeled as V1 provider | `REJECT_REPORT_DRIFT` | Structurizr Future/OPEN runway | selection and Product channel acceptance beyond in-app/email remain OPEN |
| Per-BC C4 component diagrams and Android/Flutter client topology in the report | `HISTORICAL_ONLY` | academic projection and component rubric coverage | selective canonical L3 only; no final Mobile technology selection |
| Customer/Supplier labels, Published Language commercial snapshot, Payment ACL, and BC-06/07/08 source facts for BC-09 | `PROMOTE_SEMANTIC_DELTA` | [Strategic context map](../../domain/strategic-ddd/context-map.md) | refines interaction language without adding a context or event |
| ResolvedOfferSnapshot, RequestSubmissionData/PurchaseRequestFactory, Reservation/Warehouse Backing, delivery handoff/receipt split, document work item and provider-neutral PushSubscription | `PROMOTE_SEMANTIC_DELTA` | owning BC tactical records | useful semantic terms only; no automatic Published Integration Event promotion |
| `inventory_backing_line.warehouse_id` | `REFINE_CANON` | BC-05 and [master target relational SQL](../../data/master-target-relational-model.sql) | corrects deterministic Warehouse Backing while retaining 95 TARGET tables |
| Provider credentials, final Mobile technology, solution validation and acceptance | `OPEN` | product/deployment/acceptance records | no inference from research, feature branches or technical verification |

## Review rule

Future promotion from `RESEARCH_EVIDENCE`, `ACADEMIC_PROJECTION`,
`IMPLEMENTATION_EVIDENCE`, `OPEN` or `DERIVED_ACADEMIC_PROJECTION` requires
named evidence and the applicable Owner or Architecture authority. Do not use
a generic `VALIDATED` state as a shortcut.
