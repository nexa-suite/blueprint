---
status: reference
maturity: BASELINED
scope: runway
owner: mobile
last-reviewed: 2026-09-18
---

# Mobile Lean UX baseline

The final AV1 campaign provides problem/task evidence. It does not close
solution validation, Product Acceptance or System Acceptance. No item below is
labelled as generically `VALIDATED`.

## Business assumptions

- **BA1 — Relevance of B2B continuity.**
- **BA2 — Mobile complement.** Mobile can be valuable as a complement when work
  occurs near goods, during delivery or at receipt and desktop dependence is
  inconvenient.
- **BA3 — Progressive adoption.** Adoption alongside existing tools can be more
  viable than forced replacement.
- **BA4 — B2B SaaS monetization.** Monetization is an assumption, not a proven
  willingness-to-pay result.
- **BA5 — Repeatable service.** Nexa may provide a repeatable common service
  across organizations without becoming one custom product per customer.
- **BA6 — Cold-chain specialization.** Lots, expiry, condition and temperature
  can deepen specialization where relevant without making cold-chain the only
  market.

## Business outcome assumptions

- **BOA1 — Warehouse & Dispatch continuity.** Candidate indicators: time to
  identify next action, sources consulted, clarifications, tasks completed
  without assistance and errors/omissions.
- **BOA2 — Delivery Attempt traceability.** Candidate indicators: attempts with
  identifiable outcome, attributable evidence, contextualized incidents,
  association errors and later Driver clarification requests.
- **BOA3 — Buyer receipt autonomy/context.** Candidate indicators: verification
  time, tasks without assistance, contextualized discrepancies, later manual
  coordination and interpretation errors.
- **BOA4 — Adoption signals.** No metric is evidence of a closed outcome until a
  real baseline and a pre-declared experiment target exist.

## User assumptions

`UA1` Warehouse Operator; `UA2` Dispatch Coordinator; `UA3` Driver / Delivery
Operator; `UA4` Customer Buyer; `UA5` variable Mobile context; `UA6` Warehouse
and Dispatch are related but distinct roles.

## Feature assumptions and hypotheses

- **FA1** Warehouse & Dispatch continuity Mobile flow.
- **FA2** Delivery Attempt plus evidence Mobile flow.
- **FA3** Buyer receipt plus discrepancy Mobile flow.

Candidate mechanisms remain subordinate to the assumptions: camera/scan with a
manual alternative, manual condition/temperature when relevant,
readiness/handoff evidence, external navigation, evidence associated with a
Delivery Attempt, limited temporary recovery, critical delivery updates and
Buyer discrepancy evidence. They are not accepted merely because code exists.

The three solution hypotheses are H1 Warehouse & Dispatch continuity, H2
Delivery Attempt and attributable evidence, and H3 B2B Buyer receipt and
discrepancy. All require later experiments. Current state: `RESEARCH EVIDENCE
AVAILABLE`; `SOLUTION VALIDATION OPEN`; `PRODUCT ACCEPTANCE OPEN`.
