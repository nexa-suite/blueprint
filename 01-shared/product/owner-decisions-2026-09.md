---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-09-18
---

# Owner decisions — 2026-09

This record is the provenance source for the accepted 2026-09-18 Post-AV1
Product-generation decision. It is not implementation evidence, research
evidence or Product Acceptance evidence.

## 1. Product generation semantics — ACCEPTED

From 2026-09-18, **Nexa V1** means the first coherent course-end Product
Generation. Web V1 and Mobile V1 are surface generations/projections of the
same Nexa Product. Product Generation is distinct from Historical Planning
Band, Academic Sprint, Story lifecycle, repository SemVer and Academic Report
Version.

The 73 canonical `MOB-US-001..073` stories belong to the Nexa Mobile V1
planning envelope. This does not claim that all 73 are implemented, verified,
Product Accepted or production ready. `MOB-US-073` remains a conditional,
hypothesis-level outcome.

## 2. Historical Mobile release-band supersession — ACCEPTED

The former Mobile `V1 = 28`, `V2 = 35`, `V3 = 9`, `V4/Future = 1` labels are
preserved exactly as historical planning provenance. They are
**SUPERSEDED AS CURRENT PRODUCT RELEASE NOMENCLATURE on 2026-09-18**. The
membership lists remain recoverable in the Mobile roadmap, reconciliation and
master lifecycle registry.

## 3. Mobile research evidence boundary — ACCEPTED PROVENANCE

Mobile Report `v1.0.1`, target commit
`77895a8950676ccdaec520a61c41107852268606`, provides final AV1 evidence:
9/9 Needfinding interviews, three per segment, three research-informed
synthetic personas, As-Is tasks, journeys and de-identified findings.
Needfinding establishes problem/task evidence. Solution validation, Product
Acceptance, System Acceptance and Production Readiness remain open.

## 4. Mobile surface/transport mapping — ACCEPTED

- Operations Mobile: business/API surface `PLATFORM`; transport marker `NATIVE`.
- Buyer Mobile: business/API surface `PORTAL`; transport marker `NATIVE`.

`NATIVE` is a transport marker, not a third business `ClientSurface`. This
mapping creates no Bounded Context, C4 System or new API surface.

## 5. Mobile implementation evidence boundary — ACCEPTED AS-IS CLASSIFICATION

- `mobile/main`: documentation/runway only; no integrated Mobile application.
- `feature/native-foundation`: partial Android/Kotlin/Compose implementation
  evidence, unmerged, not Product Accepted and not Production Ready.
- `feature/connected-access-preview`: additional partial connected-access and
  warehouse identification evidence, unmerged, not Product Accepted and not
  Production Ready.
- Buyer Mobile: TARGET / NOT IMPLEMENTED.
- Cross-platform client: academic planning exists; Product architecture choice
  remains OPEN and is not implemented.

Recorded technical verification is limited to the named historical branch
build/unit/static, local fixture and emulator evidence. Technical Verification
does not equal Product Acceptance.

## 6. Knowledge-promotion rules — ACCEPTED

Blueprint remains the shared Product, Domain and Architecture authority.
Mobile is a Product projection; Mobile Report is academic/research evidence;
application repositories are AS-IS implementation evidence. Promote durable
semantics only with provenance and preserve unresolved material as
`RESEARCH_EVIDENCE`, `ACADEMIC_PROJECTION`, `IMPLEMENTATION_EVIDENCE`,
`OPEN`, `SUPERSEDED` or another existing precise state. Do not introduce a
generic `VALIDATED` state.

The 11 accepted Bounded Contexts, shared C4 model, target data model, security
model and integration/event architecture are unchanged and outside this Wave
1 rebase. C4/DDD/UML material from the academic report remains derived
evidence for Wave 2 reconciliation.

Peru-first remains Owner-accepted current Product direction. Website pricing,
plans and registration drift remains outside this wave.
