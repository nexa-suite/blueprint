---
status: planned
maturity: BASELINED
scope: runway
owner: design
last-reviewed: 2026-09-18
---

# Mobile UX and research evidence plan

No research evidence is fabricated. Product direction is owner-accepted.
Needfinding is complete at 9/9 interviews for problem/task evidence; solution prototype validation and Product/UX Acceptance remain open.

## Segments and interview obligation

| Segment | Actors | Required research | Current state |
|---|---|---|---|
| Warehouse & Dispatch Operations | Warehouse Operator; Dispatch Coordinator | Needfinding evidence; warehouse/dispatch tasks plus deferred field-sales questions | RESEARCH EVIDENCE AVAILABLE; 3/3 |
| Driver Delivery Execution | Driver / Delivery Operator | Needfinding evidence; privacy, battery, connectivity and evidence | RESEARCH EVIDENCE AVAILABLE; 3/3 |
| B2B Buyers | Customer Buyer | Needfinding evidence; receipt, discrepancy and relationship needs | RESEARCH EVIDENCE AVAILABLE; 3/3 |

Solution validation later requires participants interacting with Landing Page and
Mobile flows. Needfinding evidence is not solution validation. Names,
screenshots, timings, URLs and validation outcomes are not invented here.

## High-value user goals

1. Warehouse Operator resolves SKU and records an authoritative receipt or
   allocated FEFO pick.
2. Driver starts a Delivery Attempt, records outcome and presents an ephemeral
   Buyer Handoff QR.
3. Customer Buyer resolves the handoff, confirms quantities and preserves an
   immutable discrepancy fact.
4. Commercial work with a deferred lifecycle has its own master-backlog status;
   this task model does not promote it into observed solution evidence.

Each goal requires the following chain:

`Actor/Segment -> Goal -> User Story -> AC -> Task Flow -> Wireflow -> User Flow -> Mock-up -> Prototype -> validation evidence`.

## Required artifacts

| Artifact | Tool constraint from rubric | Status |
|---|---|---|
| User Persona | UXPressia | RESEARCH-INFORMED SYNTHETIC ARTIFACT |
| User Task Matrix | UXPressia | RESEARCH EVIDENCE AVAILABLE |
| As-Is User Journey Map | UXPressia | RESEARCH EVIDENCE AVAILABLE |
| Empathy Map | UXPressia | RESEARCH EVIDENCE AVAILABLE |
| Impact Map | UXPressia | STRUCTURE_READY; SMART metrics proposed |
| Wireframes | Figma | IMPLEMENTATION_PENDING |
| Wireflows | LucidChart / Overflow | IMPLEMENTATION_PENDING |
| Mock-ups | Figma | IMPLEMENTATION_PENDING |
| User Flows | LucidChart / Overflow | IMPLEMENTATION_PENDING |
| Interactive Prototype | Figma | OPEN; solution validation not evidenced |

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
