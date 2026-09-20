---
status: planned
maturity: BASELINED
scope: runway
owner: academic
last-reviewed: 2026-09-18
---

# 1ACC0238 rubric compliance matrix

This matrix is an evidence register. It does not turn planned structure into
completed coursework or accepted Product scope.

| Requirement | Rubric source | Current status | Evidence / owner action | Gate |
|---|---|---|---|---|
| Problem/Solution Profile and Lean UX | Chapter I–II | STRUCTURE_READY | Shared Product problem, segments and Lean UX projection; validate with team research | AV1 |
| 3–5 needfinding interviews per segment | Interviews | COMPLETE 9/9 | Participant-bounded Needfinding evidence is indexed; solution validation remains separate | AV1 |
| Personas, tasks, journeys, empathy maps | Needfinding | RESEARCH EVIDENCE AVAILABLE | Research-informed synthetic personas plus As-Is tasks/journeys; no PII | AV1 |
| Competitor analysis and SWOT | Chapter II | OWNER_INPUT_REQUIRED | Select at least three defensible competitors and cite sources | AV1 |
| User Stories and Gherkin AC | Requirements | COMPLETE | Academic index covers 73 MOB + 6 LAND; canonical Product story bodies remain in Blueprint | AV1 |
| Business Goals and Impact Mapping | Impact Mapping | STRUCTURE_READY | Proposed SMART goals and actor-impact-deliverable links; metrics remain proposed | AV1 |
| Product Backlog | Requirements | COMPLETE | 97 PBIs / 426 SP across four academic Sprints; Website Landing Page dependency remains separate in Sprint 1 | AV1 |
| Strategic DDD | Chapter II | READY | 11 accepted BCs, EventStorming, Context Map and canvases in shared Blueprint | AV1 |
| C4 Context / Container / Deployment | Architecture | VERIFIED WITH CAVEAT | Shared C4 model has AS-IS and TARGET views; provider-neutral Deployment; rendering gate remains | AV1 |
| Tactical DDD class diagrams | Chapter II | STRUCTURE_READY | Shared per-BC domain projections; academic mapping is linked, not duplicated | AV1 |
| Database design diagrams | Chapter II | VERIFIED WITH CAVEAT | SQL-authoritative 11-BC and master ERD projections | AV1 |
| Wireframes, wireflows, mock-ups, user flows, prototype | Chapter III | OPEN | Figma/LucidChart/Overflow evidence plan; solution prototype validation not evidenced | TB1 |
| Local storage | Mobile constraint | TARGET DEFINED | Secure session/context, freshness, safe read cache, harmless draft, temporary evidence and retry metadata only | TB1 |
| Internal RESTful service | Mobile constraint | VERIFIED WITH CAVEAT | Nexa API v0.17.0 supports selected contracts; deployed client integration not verified | TB1 |
| Internal device resource | Mobile constraint | NOT VERIFIED | Camera proof for barcode/QR/evidence on physical Android device remains pending | TB1 |
| Third-party service | Mobile constraint | OWNER_INPUT_REQUIRED | Select Maps, Push or Payment candidate and record PoC evidence | TB1 |
| Autonomous-learning feature | Course outcome 7 | OPEN | SPIKE-001 evaluates feature relevance, uncertainty, privacy and demonstrability | AV2 |
| Android native implementation | Technology | PARTIAL IMPLEMENTATION EVIDENCE | Kotlin/Operations evidence is on an unmerged branch; integrated release not claimed | TB1 |
| Cross-platform implementation strategy | Technology | OWNER_INPUT_REQUIRED | Evaluate Flutter/Dart vs KMP; do not silently choose | TB1 |
| Physical-device demonstration | Course requirement | PENDING | Install and run representative flow on real Android device | TB2 |
| Firebase App Distribution | Course requirement | IMPLEMENTATION_PENDING | Publish test build or record accepted equivalent | TB2 |
| English and Latin American Spanish | i18n | TARGET DEFINED | `en_US` default; `es_419` coverage and screenshots pending | TB1 |
| Mobile accessibility | a11y | TARGET DEFINED | semantic labels, touch targets, scalable text, contrast, focus, alternatives | TB1 |
| Terms and Conditions / ethics | Ethics | STRUCTURE_READY | Product surface obligation documented; final links and evidence pending | TB2 |
| 4 recent Q1/Q2 papers | Bibliography | RESEARCH_PENDING | Two domain and two Mobile-tech papers, max two years old, verified and cited APA 7 | AV1 |
| Needfinding / validation videos | Annex C | OPEN | Needfinding is evidenced; validation/video publication fields remain open; no fabricated URLs | AV1/TB2 |
| About Product / About Team videos | Annex C | IMPLEMENTATION_PENDING | Script, participant evidence, timing and publication links pending | AV2/TB2 |
| Sprint 1 / Sprint 2 / Sprint 3 / Sprint 4 evidence | Chapter IV | STRUCTURE_READY | Sprint evidence templates mapped to all four academic milestones; results pending | TB1/TB2 |

## Evidence rules

- The external academic source is not a publishable Blueprint artifact; only derived constraints are retained here.
- Current Product decisions remain in [Current Decisions](../../../01-shared/product/current-decisions.md).
- No external interview, citation, UX artifact, device run or video is inferred from repository structure.
- Course technology constraints do not select a Mobile framework or create a new Bounded Context.
- `Technical PASS`, `IMPLEMENTATION`, `Product Acceptance`, `System Acceptance`
  and `Production Readiness` remain separate gates.
