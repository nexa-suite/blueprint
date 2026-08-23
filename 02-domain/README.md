# Domain

## Purpose

Maintain accepted domain invariants and the accepted PRE-V1 Strategic DDD baseline while preserving AS-IS evidence and TARGET boundaries.

## Authoritative content

- [Known domain rules](business-rules/known-rules.md) — accepted V1 rules only.
- [Business knowledge layer](business-knowledge.md) — compact business model, capability index and AS-IS/TARGET boundary.
- [Glossary](glossary.md) — canonical terms and visible vocabulary collisions.
- [Current terminology evidence](../11-reference/as-is/current-terminology-evidence.md) — observed terms and collisions.
- [Business behavior evidence](../11-reference/as-is/business-behavior-evidence.md) — observed behavior without ownership conclusions.
- [Discovery readiness](discovery-readiness.md) — deferred discovery and evolution index.
- [Strategic DDD baseline](strategic-ddd/README.md) — accepted 11-context model, ownership, context map and subdomain classification.

## Current status

Capability Mapping, EventStorming, Domain Storytelling and Strategic DDD are **ACCEPTED / BASELINED** for PRE-V1. Eleven Bounded Contexts, Context Map, ownership, Ubiquitous Language and subdomain classification are frozen. Existing implementation structures remain AS-IS evidence.

Current Spring modules are not accepted Bounded Contexts. Current PostgreSQL schemas are not accepted Bounded Contexts. Current frontend feature areas are not accepted Bounded Contexts.

## Expected artifacts

Capability Mapping, EventStorming, Domain Storytelling, Ubiquitous Language, subdomain classification, Bounded Context canvases and Context Map are present as canonical PRE-V1 records. Future discovery may refine implementation without silently changing accepted semantics.

## What must not live here

Invented business rules, silently accepted boundaries, architecture derived from folder names, product-redefining policies, or technical models presented as canonical business decisions.

## Related areas

[Product baseline](../01-product/product-baseline.md), [Current accepted decisions](../00-governance/current-decisions.md), [AS-IS evidence](../11-reference/as-is/README.md), [Evolution roadmap](../09-evolution/README.md).
