---
status: planned
maturity: BASELINED
scope: runway
owner: design
last-reviewed: 2026-08-30
---

# Mobile UX and research evidence plan

No research evidence is fabricated. Product direction is owner-accepted;
research is pending.

## Segments and interview obligation

| Segment | Actors | Required research | Current state |
|---|---|---|---|
| Field & Warehouse Operations | Sales Representative; Warehouse Operator; Dispatch Coordinator | 3–5 needfinding interviews; workflows, device, channel, pain and task evidence | RESEARCH_PENDING |
| Delivery Workforce | Driver / Delivery Operator | 3–5 needfinding interviews/observations; privacy, battery, connectivity and evidence | RESEARCH_PENDING |
| B2B Buyers | Customer Buyer | 3–5 needfinding interviews; catalog, commitment, receipt, discrepancy and finance needs | RESEARCH_PENDING |

Validation later requires 3–5 participants per segment interacting with Landing
Page and Mobile flows. Names, screenshots, timings, URLs and summaries remain
placeholders until supplied by the team.

## High-value user goals

1. Warehouse Operator resolves SKU and records an authoritative receipt or
   allocated FEFO pick.
2. Driver starts a Delivery Attempt, records outcome and presents an ephemeral
   Buyer Handoff QR.
3. Customer Buyer resolves the handoff, confirms quantities and preserves an
   immutable discrepancy fact.
4. Sales Representative prepares and submits authorized commercial intent.

Each goal requires the following chain:

`Actor/Segment -> Goal -> User Story -> AC -> Task Flow -> Wireflow -> User Flow -> Mock-up -> Prototype -> validation evidence`.

## Required artifacts

| Artifact | Tool constraint from rubric | Status |
|---|---|---|
| User Persona | UXPressia | RESEARCH_PENDING |
| User Task Matrix | UXPressia | RESEARCH_PENDING |
| As-Is User Journey Map | UXPressia | RESEARCH_PENDING |
| Empathy Map | UXPressia | RESEARCH_PENDING |
| Impact Map | UXPressia | STRUCTURE_READY; SMART metrics proposed |
| Wireframes | Figma | IMPLEMENTATION_PENDING |
| Wireflows | LucidChart / Overflow | IMPLEMENTATION_PENDING |
| Mock-ups | Figma | IMPLEMENTATION_PENDING |
| User Flows | LucidChart / Overflow | IMPLEMENTATION_PENDING |
| Interactive Prototype | Figma | IMPLEMENTATION_PENDING |

## Inclusive design and i18n

Default language: English `en_US`. Required second locale: Latin American Spanish
`es_419`.

Mobile evidence must cover semantic labels, minimum touch targets, scalable
text, contrast, focus/navigation, screen-reader meaning, camera/scanner
permission denial, manual alternatives and network/error states. Automated
a11y PASS is not claimed without a runnable test.

Ethics must cover Tenant confidentiality, safe evidence capture, consent,
location minimization, no permanent Driver surveillance and Terms and
Conditions links through required surfaces.

## Heuristic evaluation template

Use severity `1` superficial, `2` minor, `3` major, `4` very serious. Record
task, observed problem, violated usability/inclusive-design/information-
architecture principle, evidence screenshot, recommendation, participant and
status. Do not convert a blank template into a finding.
