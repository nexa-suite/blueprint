---
status: draft
maturity: DRAFT
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Strategic DDD baseline

## Verdict

**STRATEGIC DDD — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW**.

The repository now contains a systematic synthesis from Capability Mapping through Context Map. It is not canonically accepted because no explicit Business Architect acceptance evidence exists in the authoritative workspace.

## Produced outputs

- Discovery Input Register with authority and evidence classifications.
- L0/L1/L2 Capability Map.
- Big Picture and P1-P6 Process EventStorming synthesis.
- Seven selected Domain Stories.
- Contextual Ubiquitous Language and rejected synonym register.
- Core/supporting/generic subdomain hypotheses.
- Ten proposed Bounded Context candidates with canvases.
- Business Ownership Matrix with one proposed owner per concept.
- Context Map with explicit relationship directions and adapter boundaries.
- Strategic Decision Register with hotspots and review triggers.

## What this baseline does not claim

- No Product scope was reopened.
- No proposed context is canonically accepted.
- No current Java package, frontend feature or database schema was promoted to a Bounded Context.
- No C4 L3 component was named as a business context.
- No final aggregate, schema, migration or API contract was invented.
- No final visual Design System was frozen.

## Required review decisions

1. Accept, merge or reject candidate ownership of Customer / Buyer Relationships.
2. Decide whether Catalog and Commercial Policy remain together for V1.
3. Decide Commercial Commitment ownership and integration direction with Inventory Availability; the SKU + quantity versus Inventory Lot distinction is closed.
4. Validate Fulfillment, Dispatch, Delivery and cold-chain disposition ownership, preserving failed-attempt versus Continuation Delivery semantics.
5. Confirm Financial Posting, Receivable, Payment and Document boundaries, including notification/projection ownership.
6. Define only the numeric Purchase Request expiry policy; accepted consent, substitution and material-change semantics are not reopened.
7. Assign analytics/KPI authority and projection freshness expectations.

## Technical dependency

Technical TARGET documents in `04-architecture`, `05-data` and `06-security` may use these candidates as explicit assumptions, but must remain marked PROPOSED until review. Independent AS-IS hardening, contract validation and documentation work does not wait for acceptance.
