---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-09-19
---

# Model authority and derived artifacts

This document prevents diagrams, reports or exports from becoming independent
semantic authorities.

## Authority map

| Concern | Canonical authority | Derived or supporting material |
|---|---|---|
| Strategic DDD and eleven Bounded Contexts | Shared Blueprint Domain, accepted decisions and context catalog | Mobile Report strategic projection, C4 views, tactical diagrams |
| Tactical domain semantics | Shared Blueprint Bounded Context/domain records | Academic PlantUML/UML and generated exports |
| C4 system/container semantics | Shared Structurizr DSL and included DSL sources | Generated workspace JSON, manual mirror, SVG/PNG exports and academic C4 |
| Target relational ownership/model | Shared target data model and SQL | Database diagrams and academic database UML |
| Mobile Product | `03-mobile` over shared canon | Mobile Report Product/research projection and generated assets |
| Academic course projection | `90-academic/mobile/course-1acc0238` | Mobile Report publication/evidence |

Mobile does not create a Bounded Context, separate C4 Software System,
alternate domain model, alternate Ubiquitous Language or deployment-per-BC
architecture. Operations Mobile and Buyer Mobile are C4 Containers projected
within Nexa and may be represented on explicit device deployment nodes. Mobile
consumes shared domain semantics. If Mobile Report contains genuinely newer
evidence, promote the semantic fact into the appropriate Blueprint authority
first.

## Post-AV1 source boundary

The final Mobile Report `v1.0.1` target
`77895a8950676ccdaec520a61c41107852268606` is a derived academic projection.
Its C4/DDD/UML material, including provider/system views, is derived academic
evidence. It can refine an accepted semantic fact only through the Blueprint
authority named above; it cannot override TARGET because it is newer or more
granular.

## Wave 2 reconciliation outcome

| Difference or evidence | Classification | Canonical outcome |
|---|---|---|
| One Nexa system, granular L1 actors and 6 AS-IS / 8 TARGET containers | `KEEP_CANON` | One software system; no generic Tenant Workforce actor; unmerged Operations preview stays outside integrated AS-IS and Buyer stays absent. |
| Academic Push Delivery Service as a V1 provider | `REJECT_REPORT_DRIFT` | Push Delivery Service is Future/OPEN only; V1 external boundaries are Payment, Email and Maps. |
| Academic Mobile topology, framework and per-BC C4 views | `HISTORICAL_ONLY` / `DERIVED_ACADEMIC_PROJECTION` | No Web/Mobile C4 split, no Mobile BC and no canonical L3 per BC; final Mobile technology remains OPEN. |
| Operations and Buyer Product surfaces | `REFINE_CANON` | Both are `TARGET V1 / OWNER-ACCEPTED`; Operations has partial unmerged Android/Kotlin/Compose AS-IS evidence and Buyer is not implemented. |
| Customer/Supplier labels, Published Language, Payment ACL and BC-06/07/08 source facts for BC-09 | `PROMOTE_SEMANTIC_DELTA` | Context map refined without changing the 11-context model or the 14 Published Integration Events. |
| ResolvedOfferSnapshot, submission data/factory, Reservation/Warehouse Backing, handoff/receipt, document work item and provider-neutral PushSubscription | `PROMOTE_SEMANTIC_DELTA` | Tactical terminology and diagrams are corrected in their owning BCs; candidates are not promoted automatically to integration events. |
| `inventory_backing_line.warehouse_id` | `REFINE_CANON` | The 95-table inventory is retained while deterministic SKU + Warehouse Backing is represented in both SQL authorities. |
| Needfinding, technical verification and acceptance claims | `KEEP_CANON` | Needfinding is problem/task evidence; technical verification is distinct from Product Acceptance, System Acceptance and Production Readiness, all OPEN. |

The reconciled C4 DSL and generated artifacts are canonical for their scope.
The Mobile Report remains immutable v1.0.1 evidence; its views do not become a
second C4, Strategic DDD, tactical or data authority.
