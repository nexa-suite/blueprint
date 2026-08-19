---
status: draft
maturity: DISCOVERY
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Strategic Decision Register

| ID | Proposed decision | Evidence / reason | Status / revisit |
|---|---|---|---|
| DDD-001 | Treat current modules as AS-IS technical boundaries, not Bounded Contexts | Source-of-truth rule; code inspection shows cross-module contracts, open modules and shared persistence | Proposed; revisit after Business Architect review |
| DDD-002 | Keep Sales Commitment distinct from Inventory Availability | Cart/commitment/allocation invariants and physical truth rule are different | Proposed; validate in P1/P2 EventStorming |
| DDD-003 | Keep Customer Account and Buyer Relationship distinct | Buyer can exist without portal/account; relationships are Tenant-specific and independent | Proposed; validate identity/account-claim stories |
| DDD-004 | Keep Payment distinct from Stripe and Receivable | Provider boundary, Payment Reported != Confirmed, financial posting semantics | Proposed; validate P5 |
| DDD-005 | Keep Dispatch, Delivery and Route distinct | Partial delivery/continuation and simple route grouping rules | Proposed; validate P3 |
| DDD-006 | Model Notification/Timeline as projection authority, not source-of-truth owner | Buyer reduced timeline and business-significance rule | Proposed; validate P6 and KPI ownership |
| DDD-007 | Treat Inventory Availability and Fulfillment as collaborating candidates | Physical stock/sellability differs from lot allocation/picking/delivery | Proposed; test handoff cost and operational ownership |
| DDD-008 | Keep final exact Purchase Request expiry policy open | Final execution handoff removed numeric assumption; scenario detail remains discovery work | Product authority preserved; no numeric policy inferred |
| DDD-009 | Use identifier references/snapshots across proposed contexts | Immutable Sales Order and provider/entity leakage risks | Proposed technical/domain rule; validate data architecture |
| DDD-010 | Use one business owner per concept before technical module realignment | Prevents schema/package-driven architecture | Proposed governance gate; revisit after review |

## Decision quality gate

No entry above is a Product change or canonical Business Architect acceptance. A review may merge, split, rename or reject candidates using evidence from workshops and process exceptions.

