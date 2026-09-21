---
status: reference
maturity: BASELINED
scope: runway
owner: academic
last-reviewed: 2026-09-18
---

# UPC 1ACC0238 Mobile course AV1 projection

Isolated academic projection for **Aplicaciones para Dispositivos Móviles**,
period `202620`, NRC `4949`, team `nexa-team`. AV1 is complete in the official
`nexa-suite/mobile-report` v1.0.1 publication. This folder contains only
derived planning and evidence maps; the external course source is intentionally
not stored in the publishable Blueprint tree. These documents do not copy
academic authority into Nexa Product, Domain or Architecture.

## Authority boundary

- `01-shared` owns accepted Product, Domain, Architecture and delivery rules.
- `03-mobile` owns the Mobile Product projection and canonical story behavior.
- `90-academic/mobile/course-1acc0238` owns course mapping, backlog projection,
  milestone readiness and evidence status. The final academic projection covers
  97 PBIs / 426 SP across four Sprints; the Product runway is indexed in the
  [Master Mobile Product Backlog](../../../03-mobile/requirements/master-mobile-backlog.md).
- `91-reference` owns historical and external evidence.
- The external course statement is an input constraint only; its source file is
  local-only and is not a publishable Blueprint artifact.

No interview, persona, statistic, paper, provider credential, deployment,
physical-device run, video or Product Acceptance result is claimed without
attached evidence. `READY` means structurally prepared; it does not mean
implemented or accepted.

## Direct reading order

1. [Rubric compliance](rubric-compliance.md)
2. [Requirements and backlog projection](requirements-projection.md)
3. [Epic projection](epic-projection.md)
4. [Story-to-design readiness](../../../03-mobile/requirements/story-to-design-readiness.md)
5. [Milestone plan](milestone-plan.md)
6. [Architecture projection](architecture-projection.md)
7. [UX evidence plan](ux-evidence-plan.md)
8. [Implementation evidence plan](implementation-evidence-plan.md)
9. [Validation evidence plan](validation-evidence-plan.md)
10. [Bibliography evidence plan](bibliography-evidence-plan.md)

## Official course configuration

| Item | Value | Evidence state |
|---|---|---|
| Course | 1ACC0238 Aplicaciones para Dispositivos Móviles | SOURCE VERIFIED |
| Period | 202620 / 2026-02 | SOURCE VERIFIED |
| NRC | 4949 | SOURCE VERIFIED |
| Team | nexa-team | SOURCE VERIFIED |
| Official milestones | AV1 week 4; TB1 week 7; AV2 week 12; TB2 week 15 | SOURCE VERIFIED; AV1 COMPLETE; next milestone TB1 |
| Native constraint | Operations Android / Kotlin / Jetpack Compose accepted TARGET by ADR-0018 | Framework selection CLOSED / SUPERSEDED; implementation evidence remains separate |
| Cross-platform constraint | Flutter/Dart accepted TARGET by ADR-0019; Kotlin Multiplatform/Kotlin is historical evaluated course alternative | Framework selection CLOSED / SUPERSEDED by ADR-0018 and ADR-0019; unrelated device/provider research remains OPEN |
| Local storage | Required, non-authoritative in Nexa V1 | TARGET DEFINED; client evidence pending |
| Device resource | Camera/scanner/evidence candidate | TARGET DEFINED; physical proof pending |
| Internal service | Nexa REST API | API AS-IS PARTIAL; client integration not verified |
| Third-party service | Maps, Push or Payment candidate | Provider and proof OPEN |
| Autonomous-learning feature | Explicit research Spike required | OPEN; SPIKE-001 |
| Physical device | Required for final demonstration | PENDING |
| App distribution | Firebase App Distribution or accepted equivalent | PENDING |
| Languages | English `en_US`; Latin American Spanish `es_419` | TARGET DEFINED; Mobile client not verified |
| Accessibility | Mobile a11y evidence required | TARGET DEFINED; validation pending |

## AV1 evidence snapshot

| Dimension | Current evidence state |
|---|---|
| Official academic report | `mobile-report` v1.0.1 at `77895a8950676ccdaec520a61c41107852268606` |
| Needfinding | COMPLETE, 9/9 interviews; problem/task evidence only |
| Academic backlog | 97 PBIs / 426 SP; 73 MOB + 6 LAND + 12 Technical + 6 Spikes |
| Academic planning | Four Sprints; Mobile counts 4 / 21 / 24 / 24 |
| Product solution validation | OPEN |
| Product/UX Acceptance | OPEN |
| Physical-device evidence | PENDING |

The final AV1 plan places the accepted Flutter/Dart Buyer construction work in
later academic Sprints. `SPIKE-002` preserves historical framework evaluation,
but its framework-selection question is **CLOSED / SUPERSEDED** by ADR-0018 and
ADR-0019. Technology selection does not prove implementation, solution
validation or Product Acceptance; unrelated device/provider research remains
OPEN.

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
| RESEARCH EVIDENCE AVAILABLE | Named Needfinding evidence is available for the stated scope; solution validation remains open. |
| OWNER_INPUT_REQUIRED | A Product, Architecture, Design or team decision is needed. |
| PARTIAL IMPLEMENTATION EVIDENCE | A named unmerged Operations Android branch contains partial evidence; it is not an integrated release. |
| IMPLEMENTATION_PENDING | The named slice has no verified client/runtime artifact. |
| VERIFIED WITH CAVEAT | Evidence exists but scope or maturity boundary remains. |
| NOT APPLICABLE | Rubric item does not apply to current bounded scope; rationale recorded. |

Current course readiness is **AV1 COMPLETE with implementation, solution
validation, Product/UX Acceptance and physical-device gates open**; next course
evolution is **TB1**.
