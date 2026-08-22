---
status: accepted
maturity: BASELINED
scope: v1
owner: governance
last-reviewed: 2026-08-19
---

# Design system source of truth

This document defines how Nexa design decisions are resolved without copying
implementation into the Blueprint or treating an executable specimen as a
product contract.

## Authority order

1. Accepted Product, architecture and governance decisions.
2. This Blueprint design baseline: vocabulary, intent, tokens, contracts,
   maturity and adoption rules.
3. The Design Lab: rendered states, interaction evidence, automated gates and
   browser review artifacts.
4. Legacy Vue/FLOW material: comparative evidence only.

When sources disagree, the higher source wins and the disagreement is recorded
for the owning reviewer. A screenshot or implementation detail cannot silently
close an open Product or domain decision.

## Ownership boundary

Blueprint documents what is accepted, why it is accepted and what consumers
may rely on. Design Lab documents how the candidate renders, behaves and is
validated. Product applications consume the approved `nexa-ui` public API;
they do not import documentation renderers, Lab evidence or generated
screenshots.

## Change and adoption

Every adopted change names its source SHA, maturity, owner, affected token or
component contract, validation evidence and human decision. The Design Lab may
propose evidence, but it cannot promote a Candidate to Frozen or define a
production domain transition by itself.
