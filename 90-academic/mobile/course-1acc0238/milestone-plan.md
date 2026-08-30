---
status: planned
maturity: BASELINED
scope: runway
owner: academic
last-reviewed: 2026-08-30
---

# Academic milestones and four-week plan

Official deadlines and owner delivery goals are separate. Dates are not
invented; the source provides week numbers, not calendar dates.

## Official milestone matrix

| Requirement / evidence | AV1 week 4 | TB1 week 7 | AV2 week 12 | TB2 week 15 | Current status | Evidence owner |
|---|---|---|---|---|---|---|
| Report structure, versioning, collaboration, Student Outcome | STRUCTURE_READY | UPDATE_REQUIRED | UPDATE_REQUIRED | FINAL_UPDATE | Structure mapped; participants and report repo evidence pending | Team |
| Chapter I: startup, solution, segments, Lean UX | STRUCTURE_READY | REFINE | REFINE | FINAL | Research and source-backed content pending | Product/Research |
| Needfinding interviews, analysis and personas | RESEARCH_PENDING | REFINE | VALIDATION_PENDING | FINAL | 3–5 interviews per segment required; none claimed | Research |
| User Stories, Impact Mapping and Product Backlog | READY | REFINE | REFINE | FINAL | 28 Mobile V1 projection rows; Product Acceptance pending | Product |
| Strategic DDD and 11 BC baseline | READY | PRESERVE | PRESERVE | FINAL | Shared Blueprint evidence exists | Architecture/Domain |
| C4 Context, Container, Component and Deployment | VERIFIED WITH CAVEAT | REFINE | REFINE | FINAL | AS-IS/TARGET/Deployment source added; render/evidence pending | Architecture |
| Tactical domain/database diagrams | STRUCTURE_READY | REFINE | REFINE | FINAL | Shared SQL/UML projections available | Domain/Data |
| UI/UX wireframes, wireflows, mock-ups, user flows, prototype | RESEARCH_PENDING | IMPLEMENTATION_PENDING | VALIDATION_PENDING | FINAL | No fabricated Design evidence | Design |
| Android native foundation | IMPLEMENTATION_PENDING | TARGET | REFINE | FINAL | Owner four-week target; no client baseline verified | Mobile engineering |
| Representative Warehouse/Operations flow | IMPLEMENTATION_PENDING | TARGET | REFINE | FINAL | Select FEFO/pick or receiving flow; device proof pending | Mobile engineering |
| Driver/Delivery flow | IMPLEMENTATION_PENDING | TARGET | REFINE | FINAL | Select handoff/receipt flow; device proof pending | Mobile engineering |
| Landing Page | AS-IS ref verified | DEPLOYMENT PROOF PENDING | DEPLOYMENT PROOF PENDING | FINAL | Website release ref exists; public deployment evidence separate | Website |
| Backend 70% / 100% rubric thresholds | AS-IS technical evidence | OWNER EVIDENCE REQUIRED | OWNER EVIDENCE REQUIRED | FINAL | Release refs do not prove academic percentage | API/Team |
| Physical device | PENDING | PENDING | PENDING | REQUIRED | No physical run claimed | Mobile engineering |
| Third-party service | RESEARCH_PENDING | PoC TARGET | REFINE | FINAL | Provider open; Maps/Push candidate | Mobile engineering |
| Autonomous-learning feature | SPIKE OPEN | INVESTIGATE | DECISION REQUIRED | EVIDENCE | SPIKE-001 open | Team |
| Firebase App Distribution | PENDING | PENDING | PREPARE | REQUIRED | No distribution evidence | Mobile engineering |
| Validation interviews and heuristics | PENDING | PENDING | FIRST VERSION | FINAL | No participant evidence | Research/Design |
| About Product / About Team videos | PENDING | PENDING | FIRST VERSION | FINAL | No links or media claimed | Team |
| Bibliography: 4 recent Q1/Q2 papers | RESEARCH_PENDING | REFINE | REFINE | FINAL | No papers invented | Research |

## Owner four-week execution runway

| Week | Focus | Concrete output | Truth boundary |
|---|---|---|---|
| Week 1 | Architecture and Product closure | Scope, epics, stories, AC, backlog, architecture questions, Android strategy, local-storage strategy, camera strategy, REST contract, third-party decision question, SPIKE-001, C4 Deployment, tactical projections | Documentation-ready only; no client completion claim |
| Week 2 | Android foundation | Kotlin project skeleton, architecture, authentication, Tenant/Workspace context, API client, i18n/a11y foundation, local persistence foundation, camera proof, first API integration | Target; implementation evidence required |
| Week 3 | Representative core flow | One Warehouse physical workflow, one Driver/Delivery workflow, API use, error/conflict behavior, physical-device run | Target; no result fabricated |
| Week 4 | AV1 readiness plus risk reduction | Requirements/DDD/architecture package and enough Android proof to expose risk | AV1 focuses requirements and architecture; device proof remains evidence gate |

## Sprint projection

| Sprint | Product outcome | Stories | Academic evidence | Sprint Goal template |
|---|---|---|---|---|
| Sprint 1 | Safe physical inventory execution plus Landing Page dependency | Existing Website stories WEB-US-001..005 in Sprint 1; Warehouse identifier, receiving, Lot, stock, FEFO, discrepancy plus context foundation | AV1 requirements/DDD; TB1 core screen and first implementation evidence | Our focus is on reliable warehouse execution and a demonstrable acquisition entry. We believe it delivers less inventory ambiguity to Warehouse Operators and a clear first step for a Prospect. This will be confirmed when the Website dependency is traceable and an allocated pick or receipt records authoritative FEFO, retry and conflict behavior. |
| Sprint 2 | Traceable dispatch, Delivery and Buyer handoff | Dispatch readiness, assignment, handoff, Driver Attempt, POD, QR, receipt and discrepancy | AV2 principal flows, validation-video candidate | Our focus is on traceable Delivery handoff. We believe it delivers clearer delivery outcomes to Drivers and Buyers. This will be confirmed when a physical handoff resolves securely and separate Driver and Buyer facts remain visible. |
| Sprint 3 | Buyer delivery handoff, receipt and critical updates | Buyer update, handoff verification, receipt and discrepancy | TB2 complete backlog, App Distribution and final evidence | Our focus is on completing a narrow truthful Buyer delivery flow. We believe it delivers clearer receipt and follow-up to Buyers. This will be confirmed when update, verification, receipt and discrepancy remain separate and the accepted distribution path shows no false authority. |

Sprint Goal text is an academic projection. No Sprint result, velocity or team
assignment is claimed here.
