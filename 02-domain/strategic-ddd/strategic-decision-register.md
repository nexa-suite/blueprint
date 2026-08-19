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
| DDD-002 | Assign ownership and integration for the closed Commercial Commitment / Physical Allocation distinction | Product closes SKU + quantity commitment versus Inventory Lot allocation; physical truth and lot selection are different | Proposed; review context ownership, integration direction and consistency boundary in P1/P2; do not reopen the distinction |
| DDD-003 | Keep Customer Account and Buyer Relationship distinct | Buyer can exist without portal/account; relationships are Tenant-specific and independent | Proposed; validate identity/account-claim stories |
| DDD-004 | Keep Payment distinct from Stripe and Receivable | Provider boundary, Payment Reported != Confirmed, financial posting semantics | Proposed; validate P5 |
| DDD-005 | Keep Dispatch, Delivery and Route distinct | Partial delivery/continuation and simple route grouping rules | Proposed; validate P3 |
| DDD-006 | Model Notification/Timeline as projection authority, not source-of-truth owner | Buyer reduced timeline and business-significance rule | Proposed; validate P6 and KPI ownership |
| DDD-007 | Treat Inventory Availability and Fulfillment as collaborating candidates | Physical stock/sellability differs from lot allocation/picking/delivery | Proposed; test handoff cost and operational ownership |
| DDD-008 | Keep only numeric Purchase Request expiry policy open | Consent, substitution acceptance, material-change validity reset, rejection reason and withdrawal semantics are accepted | Product authority preserved; no numeric policy inferred |
| DDD-009 | Use identifier references/snapshots across proposed contexts | Immutable Sales Order and provider/entity leakage risks | Proposed technical/domain rule; validate data architecture |
| DDD-010 | Use one business owner per concept before technical module realignment | Prevents schema/package-driven architecture | Proposed governance gate; revisit after review |
| DDD-011 | Decide Tenant Governance versus Identity/Access context shape | Current IAM/Tenant technical seams are evidence; governance and identity lifecycle may differ strategically | Proposed; Business Architect review |
| DDD-012 | Assign Workforce Membership lifecycle authority | Membership, roles and access context cross current IAM/Tenant areas | Proposed; review lifecycle and authorization boundary |
| DDD-013 | Assign Buyer Relationship authority relative to Customer Account and Identity | AS-IS relationship is fragmented across membership, Client Account and Buyer access | Proposed; review privacy, linking and relationship lifecycle |
| DDD-014 | Decide Catalog and Commercial Policy model boundary | Product/SKU/pricing flows are related but may evolve at different rates | Proposed; review language and policy ownership |
| DDD-015 | Decide Financial Posting and notification/projection ownership | Credit, Receivable, Payment, Documents and Traceability have separate invariants | Proposed; review facts, projections and integration direction |
| DDD-016 | Decide cold-chain disposition authority | Inventory, Fulfillment and Delivery all carry temperature/exception evidence | Proposed; preserve HOLD-first semantics |

## Decision quality gate

No entry above is a Product change or canonical Business Architect acceptance. A review may merge, split, rename or reject candidates using evidence from workshops and process exceptions.
