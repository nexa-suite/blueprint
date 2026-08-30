---
status: planned
maturity: BASELINED
scope: runway
owner: academic
last-reviewed: 2026-08-30
---

# UPC 1ACC0238 Mobile course runway

Isolated academic projection for **Aplicaciones para Dispositivos Móviles**,
period `202620`, NRC `4949`, team `nexa-team`. The official source is
[Enunciado del Trabajo Final V4.0](../enunciado-trabajo-final.md). This folder
turns that rubric into an actionable evidence plan without copying its
authority into Nexa Product, Domain or Architecture.

## Authority boundary

- `01-shared` owns accepted Product, Domain, Architecture and delivery rules.
- `03-mobile` owns the Mobile Product projection and canonical story behavior.
- `90-academic/mobile/course-1acc0238` owns course mapping, backlog projection,
  milestone readiness and evidence status.
- `91-reference` owns historical and external evidence.
- `enunciado-trabajo-final.md` is the academic constraint source, not Product
  authority.

No interview, persona, statistic, paper, provider credential, deployment,
physical-device run, video or Product Acceptance result is claimed without
attached evidence. `READY` means structurally prepared; it does not mean
implemented or accepted.

## Direct reading order

1. [Rubric compliance](rubric-compliance.md)
2. [Requirements and backlog projection](requirements-projection.md)
3. [Epic projection](epic-projection.md)
4. [Milestone plan](milestone-plan.md)
5. [Architecture projection](architecture-projection.md)
6. [UX evidence plan](ux-evidence-plan.md)
7. [Implementation evidence plan](implementation-evidence-plan.md)
8. [Validation evidence plan](validation-evidence-plan.md)
9. [Bibliography evidence plan](bibliography-evidence-plan.md)

## Official course configuration

| Item | Value | Evidence state |
|---|---|---|
| Course | 1ACC0238 Aplicaciones para Dispositivos Móviles | SOURCE VERIFIED |
| Period | 202620 / 2026-02 | SOURCE VERIFIED |
| NRC | 4949 | SOURCE VERIFIED |
| Team | nexa-team | SOURCE VERIFIED |
| Official milestones | AV1 week 4; TB1 week 7; AV2 week 12; TB2 week 15 | SOURCE VERIFIED |
| Native constraint | Android / Kotlin | TARGET ACADEMIC CONSTRAINT |
| Cross-platform constraint | Flutter/Dart or Kotlin Multiplatform/Kotlin | TARGET ACADEMIC CONSTRAINT; choice OPEN |
| Local storage | Required, non-authoritative in Nexa V1 | TARGET DEFINED; client evidence pending |
| Device resource | Camera/scanner/evidence candidate | TARGET DEFINED; physical proof pending |
| Internal service | Nexa REST API | API AS-IS PARTIAL; client integration pending |
| Third-party service | Maps, Push or Payment candidate | Provider and proof OPEN |
| Autonomous-learning feature | Explicit research Spike required | OPEN; SPIKE-001 |
| Physical device | Required for final demonstration | PENDING |
| App distribution | Firebase App Distribution or accepted equivalent | PENDING |
| Languages | English `en_US`; Latin American Spanish `es_419` | TARGET DEFINED; Mobile client pending |
| Accessibility | Mobile a11y evidence required | TARGET DEFINED; validation pending |

## Owner four-week outcome

The owner goal is an Android-native foundation plus a representative core flow
defined and implementation-ready within approximately four weeks, preferably
demonstrable on a physical Android device. It is a delivery target, not a
claim that the Mobile client exists.

## Status vocabulary

| Status | Meaning |
|---|---|
| READY | Structure and source links exist; evidence may still be absent. |
| STRUCTURE_READY | Required section/schema exists; content or artifact remains pending. |
| RESEARCH_PENDING | Interviews, validation or external decision not evidenced. |
| OWNER_INPUT_REQUIRED | A Product, Architecture, Design or team decision is needed. |
| IMPLEMENTATION_PENDING | No verified client/runtime artifact exists. |
| VERIFIED WITH CAVEAT | Evidence exists but scope or maturity boundary remains. |
| NOT APPLICABLE | Rubric item does not apply to current bounded scope; rationale recorded. |

Current course readiness is **STRUCTURE_READY with implementation and research
gates open**.
