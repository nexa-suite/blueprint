---
status: draft
maturity: DRAFT
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Strategic DDD synthesis

Status: **PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW**.

This package synthesizes the frozen Product / Business V1 baseline and verified implementation evidence into a reviewable Strategic DDD proposal. It does not silently change Product policy, mark proposed Bounded Contexts as canonically accepted, or authorize application refactoring.

## Navigation

- [Discovery input register](discovery-input-register.md)
- [Capability Map](capability-map.md)
- [EventStorming P1-P6](eventstorming.md)
- [Domain Stories](domain-stories.md)
- [Ubiquitous Language](ubiquitous-language.md)
- [Subdomain Map](subdomains.md)
- [Bounded Context Catalog](bounded-context-catalog.md)
- [Bounded Context Canvases](bounded-context-canvases.md)
- [Business Ownership Matrix](business-ownership-matrix.md)
- [Context Map](context-map.md)
- [Strategic Decision Register](strategic-decision-register.md)
- [Strategic DDD baseline](strategic-ddd-baseline.md)

## Authority boundary

The frozen Product / Business V1 baseline remains authoritative. Strategic DDD outputs below are hypotheses and proposed boundaries derived from accepted business invariants, process behavior and current implementation evidence. Business Architect review is required before a boundary becomes a canonical business decision.

Current Java packages, database schemas and frontend feature folders are AS-IS technical evidence. They are not used as direct Bounded Context declarations.

## Sequencing

```text
Frozen Product baseline
  -> Capability Map
  -> Big Picture EventStorming
  -> Process EventStorming
  -> Domain Storytelling
  -> Ubiquitous Language
  -> Subdomain classification
  -> Bounded Context proposals
  -> Context Map
  -> Business Architect review
```

## Open review hotspots

- exact ownership split between Tenant & Access and Customer / Buyer Relationships;
- whether Catalog and Commercial Policy should remain one context for V1 or separate after process discovery;
- commitment authority versus physical allocation authority;
- Fulfillment, Dispatch, Delivery and cold-chain disposition handoffs;
- Credit, Financial Posting, Receivable, Payment and Document ownership;
- analytics and notification projection ownership;
- global Buyer identity privacy and multi-Tenant relationship behavior.
