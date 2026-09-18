---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-09-18
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

Mobile does not create a Bounded Context, C4 System, deployment unit or
alternate shared dictionary. Mobile consumes shared Ubiquitous Language and
domain semantics. If Mobile Report contains genuinely newer evidence, promote
the semantic fact into the appropriate Blueprint authority first.

## Post-AV1 boundary

The final Mobile Report `v1.0.1` target
`77895a8950676ccdaec520a61c41107852268606` is a derived academic projection.
Its C4/DDD/UML material, including provider/system views, remains evidence to
be reconciled in Wave 2. Wave 1 does not modify the shared C4 DSL, regenerate
C4 JSON/SVG/PNG, alter the 11 BC set or create a competing Mobile UL.
