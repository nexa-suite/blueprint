---
status: planned
maturity: FROZEN
scope: runway
owner: research
last-reviewed: 2026-08-24
---


# Spike Stories

Status: RESEARCH / ENABLER.

Spikes record uncertainty and expected evidence. They do not pretend to deliver normal production functionality and do not close the research or architecture questions in this wave.

The Mobile-specific reconciliation and disposition of these six spikes are in
[Mobile spike reconciliation](../../../03-mobile/requirements/mobile-spike-reconciliation.md).

## SPIKE-001 — Select the autonomous-learning feature and external technology

| Field | Value |
|---|---|
| Status | RESEARCH / ENABLER |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Priority | RESEARCH ORDER PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Uncertainty / question

Which autonomous-learning feature and external technology/library/service satisfy the course requirement while remaining useful to Nexa?

### Investigation goal

Compare candidate learning capabilities against product relevance, data/privacy constraints, course rubric and implementation feasibility. Do not select technology in this wave.

### Expected evidence

Candidate comparison, source references, feasibility evidence and explicit exclusions.

### Completion criteria

A recommendation names one candidate or records why evidence is insufficient; no production feature is claimed.

### Output / recommendation

A concise evidence pack and recommendation, with unresolved assumptions explicitly retained.

## SPIKE-002 — Evaluate Native versus Cross-Platform distribution across Operations Mobile and Buyer Mobile

| Field | Value |
|---|---|
| Status | RESEARCH / ENABLER |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Priority | RESEARCH ORDER PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Uncertainty / question

How should native Kotlin, Flutter/Dart and/or Kotlin Multiplatform be distributed across Operations Mobile and Buyer Mobile to satisfy academic and product constraints?

### Investigation goal

Evaluate actor/workflow fit, offline/security needs, shared domain integration, delivery cost and the course requirement for native and cross-platform development.

### Expected evidence

Decision matrix, technology evidence, app-to-technology options and unresolved assumptions.

### Completion criteria

A documented recommendation or open decision is accepted only after academic expectation is confirmed; this wave does not choose app allocation.

### Output / recommendation

A concise evidence pack and recommendation, with unresolved assumptions explicitly retained.

## SPIKE-003 — Evaluate Barcode / QR / GS1 scanning

| Field | Value |
|---|---|
| Status | RESEARCH / ENABLER |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Priority | RESEARCH ORDER PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Uncertainty / question

Which barcode, QR and future GS1 identifiers must Mobile scan, under what offline, permission, ambiguity and backend-validation constraints?

### Investigation goal

Investigate camera capabilities, identifier formats, scan reliability, manual fallback and server-side validation without creating a Barcode Bounded Context.

### Expected evidence

Standards/technology comparison, representative scan evidence, fallback and security constraints.

### Completion criteria

Recommendation states supported identifier scope, validation boundary and open research questions.

### Output / recommendation

A concise evidence pack and recommendation, with unresolved assumptions explicitly retained.

## SPIKE-004 — Evaluate Mobile local storage and offline synchronization

| Field | Value |
|---|---|
| Status | RESEARCH / ENABLER |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Priority | RESEARCH ORDER PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Uncertainty / question

What Mobile data can be stored locally and how should synchronization, conflict, retry, encryption and stale state be handled?

### Investigation goal

Investigate selective offline by workflow, domain invariants, queued commands, idempotency and explicit recovery states.

### Expected evidence

Data-classification matrix, conflict scenarios, synchronization sequence and feasibility evidence.

### Completion criteria

Recommendation defines safe offline boundaries and lists workflows requiring connectivity; no fake success is permitted.

### Output / recommendation

A concise evidence pack and recommendation, with unresolved assumptions explicitly retained.

## SPIKE-005 — Evaluate Push Notifications and deep links

| Field | Value |
|---|---|
| Status | RESEARCH / ENABLER |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Priority | RESEARCH ORDER PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Uncertainty / question

Which business events merit Mobile push and how should authenticated, tenant-scoped deep links recover from expiry, missing access or stale state?

### Investigation goal

Evaluate channel policy, permission lifecycle, retry, routing, privacy and source-state ownership without making notification delivery authoritative.

### Expected evidence

Event-to-notification matrix, deep-link threat cases, provider options and delivery/recovery evidence.

### Completion criteria

Recommendation identifies relevant push classes, safety rules and open provider decisions.

### Output / recommendation

A concise evidence pack and recommendation, with unresolved assumptions explicitly retained.

## SPIKE-006 — Evaluate Maps, live location, privacy, battery consumption and fallback

| Field | Value |
|---|---|
| Status | RESEARCH / ENABLER |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Priority | RESEARCH ORDER PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Uncertainty / question

What map and active-delivery location capability provides operational value while limiting privacy, battery, connectivity and provider risk?

### Investigation goal

Evaluate navigation, active-delivery-only sharing, consent, retention, battery behavior, unavailable-map fallback and buyer visibility.

### Expected evidence

Privacy and threat notes, battery/connection observations, map options and fallback flow.

### Completion criteria

Recommendation defines the minimum location boundary and explicit exclusions; permanent employee tracking is not accepted.

### Output / recommendation

A concise evidence pack and recommendation, with unresolved assumptions explicitly retained.
