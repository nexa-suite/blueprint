---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-08-22
---

# Nexa knowledge system

Blueprint is the canonical knowledge system for Nexa. It preserves business
model, accepted decisions, domain discovery, technical architecture,
implementation evidence, repository relationships and design references in
separate, navigable layers.

## Authority and state model

The authority order is defined by [Source of truth](source-of-truth.md):
accepted decisions outrank canonical documentation, verified implementation
is AS-IS evidence, and legacy is historical evidence. Every conclusion is
classified as AS-IS, TARGET, FUTURE or ACCEPTED.

No document may use implementation structure as proof of business ownership.
Candidate Strategic DDD contexts and C4 L3/L4 responsibility views remain
review-gated.

## Canonical navigation

| Question | Entry point |
| --- | --- |
| What is Nexa and what is accepted for V1? | [Business knowledge](../02-domain/business-knowledge.md), [Product baseline](../01-product/product-baseline.md), [Known rules](../02-domain/business-rules/known-rules.md) |
| What do Nexa terms mean? | [Glossary](../02-domain/glossary.md), [Ubiquitous language proposal](../02-domain/strategic-ddd/ubiquitous-language.md) |
| How do key flows work? | [Canonical workflows](../11-reference/flows/workflows.md), [Domain stories](../02-domain/strategic-ddd/domain-stories.md) |
| What boundaries are being considered? | [Strategic DDD](../02-domain/strategic-ddd/README.md), [Capability Map](../02-domain/strategic-ddd/capability-map.md) |
| What is the technical architecture? | [Canonical C4](../04-architecture/c4/README.md), [L3/L4 views](../04-architecture/c4/l3-l4-views.md) |
| What is implemented or evidenced? | [Implementation traceability](../11-reference/implementation-traceability.md), [AS-IS baseline](../11-reference/as-is/v1-implementation-baseline.md) |
| How do repositories relate? | [Repository map](../10-repositories/repository-map.md) |
| How does Design Lab inform frontend work? | [Design convergence interface](../04-architecture/design-convergence-interface.md), [Design adoption](../03-design/05-engineering/design-adoption.md) |

## Reading contract

Read accepted Product and governance decisions first, then business knowledge
and rules, followed by proposed discovery and Strategic DDD. Read C4 and
technical views as implementation architecture; consult traceability for
evidence and gaps. Design Lab is a visual source and executable companion,
not a replacement for accepted Product decisions or frontend contracts.

## Maintenance rule

One document answers one primary question. Cross-links are preferred to copied
text. Accepted-rule changes update their decision source and affected
workflow/traceability links. Implementation baselines remain dated and AS-IS.
