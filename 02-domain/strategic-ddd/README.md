---
status: accepted
maturity: FROZEN
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Strategic DDD PRE-V1 baseline

Strategic DDD is accepted for Nexa PRE-V1. It is product/domain authority, not a transcription of Java packages, Spring Modulith modules, PostgreSQL schemas or frontend folders.

## Canonical records

- [Strategic DDD baseline](strategic-ddd-baseline.md) — verdict, core domain and boundary rules.
- [Bounded Context catalog](bounded-context-catalog.md) — 11 frozen contexts and conceptual authority.
- [Bounded Context canvases](bounded-context-canvases.md) — language, invariants, inputs and outputs.
- [Business ownership matrix](business-ownership-matrix.md) — source-of-truth ownership.
- [Context Map](context-map.md) — accepted upstream/downstream relationships and translations.
- [Capability Map](capability-map.md) — capability families, not BCs.
- [Subdomain classification](subdomains.md) — Core, Supporting and Generic.
- [Ubiquitous Language](ubiquitous-language.md) — accepted terms and forbidden collapses.
- [EventStorming baseline](eventstorming.md) and [Domain Stories](domain-stories.md) — process evidence and business sequence.
- [Strategic Decision Register](strategic-decision-register.md) — accepted decisions and superseded proposals.
- [Discovery input register](discovery-input-register.md) — historical inputs and evidence boundary; not a source of accepted TARGET semantics.

## Frozen boundary

The final TARGET contains 11 Bounded Contexts. BC ownership means authority for business concepts, invariants and lifecycle facts. It does not mandate one deployable service, database schema or technical module per BC.

## Implementation rule

Map TARGET to current AS-IS with KEEP -> REFINE -> REWORK. REWRITE requires extraordinary evidence, compatibility, migration, rollback and explicit scope. This baseline does not authorize application changes.

## Future work

Delivery teams may refine aggregate design, APIs, schema migrations and module placement while preserving accepted language and invariants. Production deployment, provider, retention and SLO decisions remain in the Production Gate.
