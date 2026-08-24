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
Accepted Strategic DDD contexts and selective C4 L3/L4 responsibility views
are baselined for PRE-V1 construction. Production gates remain separate.

## Canonical navigation

| Question | Entry point |
| --- | --- |
| What is Nexa and what is accepted for V1? | [Business knowledge](../../domain/strategic-ddd/core-domain.md), [Product baseline](../../product/product-baseline.md), [Known rules](../../domain/business-rules/README.md) |
| What do Nexa terms mean? | [Glossary](../../domain/ubiquitous-language/quick-reference.md), [Ubiquitous language](../../domain/ubiquitous-language/glossary.md) |
| How do key flows work? | [Canonical workflows](../../domain/processes/workflows.md), [Domain stories](../../domain/processes/domain-stories.md) |
| What are the accepted boundaries? | [Strategic DDD](../../domain/README.md), [Bounded Context catalog](../../domain/bounded-contexts/README.md), [Context Map](../../domain/strategic-ddd/context-map.md) |
| What is the technical architecture? | [Canonical C4](../../architecture/c4/README.md), [L3/L4 views](../../architecture/c4/l4/technical-lenses.md) |
| What is implemented or evidenced? | [Implementation traceability](../../../04-delivery/as-is/implementation-traceability.md), [current-ref AS-IS verification](../../../04-delivery/as-is/pre-v1-current-ref-verification.md), [AS-IS baseline](../../../04-delivery/as-is/v1-implementation-baseline.md) |
| How do repositories relate? | [Repository map](../../../00-start-here/repository-map.md) |
| How does Design Lab inform frontend work? | [Design convergence interface](../../design/design-system/web-evidence/design-lab-contract.md), [Design adoption](../../design/design-system/web-evidence/05-engineering/design-adoption.md) |

## Reading contract

Read accepted Product and governance decisions first, then business knowledge
and rules, followed by accepted discovery and Strategic DDD. Read C4 and
technical views as implementation architecture; consult traceability for
evidence and gaps. Design Lab is a visual source and executable companion,
not a replacement for accepted Product decisions or frontend contracts.

## Maintenance rule

One document answers one primary question. Cross-links are preferred to copied
text. Accepted-rule changes update their decision source and affected
workflow/traceability links. Implementation baselines remain dated and AS-IS.
