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

- whether Tenant Governance and Identity/Access are one context or distinct contexts;
- authoritative Workforce Membership lifecycle ownership;
- Buyer Relationship authority relative to Customer Account and global Identity;
- whether Catalog and Commercial Policy remain one model boundary;
- Commercial Commitment ownership and its integration direction with Inventory Availability; the commitment/allocation distinction itself is closed;
- where Fulfillment ends and Delivery authority begins, including cold-chain disposition ownership;
- Financial Posting authority and the boundary between Credit/Receivables, Payment and Business Documents;
- notification policy ownership versus business projections/traceability;
- global Buyer identity privacy and multi-Tenant relationship behavior;
- numeric Purchase Request expiry policy only. Consent semantics, PR-submit commitment, substitution acceptance and continuation delivery are closed Product decisions.
