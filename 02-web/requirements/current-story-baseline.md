---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-24
---

# Current Web story baseline

Preservation register for the exact 37 current Web stories. Detailed contracts
remain in [the current catalog](user-stories/user-story-catalog.md). These are
pre-refinement capability stories, not a final backlog: all Story Points remain
`TBD — DELIVERY REFINEMENT` and future review may classify each as
`KEEP / REFINE / SPLIT / MERGE / REWRITE / SUPERSEDE / DROP`.

The canonical path for every row is
`02-web/requirements/user-stories/user-story-catalog.md`; `same` below is an
index shorthand and is not a second canonical location.

| ID | Title | Actor | Surface | Capability | Primary BC | Priority | AC | Status | Canonical path | Provenance |
|---|---|---|---|---|---|---:|---:|---|---|---|
| US-001 | Request a Nexa evaluation | Public Interested Company / Prospect | Website | Acquisition/onboarding | BC-01 | MUST | 2 | CURRENT / REFINEMENT PENDING | `02-web/requirements/user-stories/user-story-catalog.md` | Blueprint current baseline |
| US-002 | Activate a Tenant and Workspace | Nexa Commercial & Onboarding Staff / Company Owner | Platform | Acquisition/onboarding | BC-01 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-003 | Govern workforce access | Tenant Administrator / Company Owner | Platform | Workforce governance | BC-01 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-004 | Maintain a Customer Account | Sales Representative / Business Operations Manager | Platform | Customer accounts | BC-02 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-005 | Approve a Buyer Relationship | Company Owner / Business Operations Manager | Platform | Buyer relationships | BC-02 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-006 | Use an independent Buyer relationship | Customer Buyer | Buyer Portal | Buyer relationships | BC-02 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-007 | Publish a sellable Product and SKU | Company Owner / Catalog responsibility | Platform | Catalog | BC-03 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-008 | Manage catalog media metadata | Company Owner / Catalog responsibility | Platform | Catalog | BC-03 | SHOULD | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-009 | Resolve authoritative price | Customer Buyer / Sales Representative | Platform + Buyer Portal | Commercial policy | BC-03 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-010 | Configure commercial policy | Company Owner / Catalog responsibility | Platform | Commercial policy | BC-03 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-011 | Build a Cart without reservation | Customer Buyer | Buyer Portal | Buyer shopping | BC-03 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-012 | Choose direct order or approval request | Customer Buyer | Buyer Portal | Buyer shopping / commitment | BC-04 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-013 | Submit a Purchase Request | Customer Buyer | Buyer Portal | Purchase Requests | BC-04 | MUST | 3 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-014 | Review and respond to material change | Sales Representative / Customer Buyer | Platform + Buyer Portal | Purchase Requests | BC-04 | MUST | 4 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-015 | Withdraw, reject or expire a PR | Customer Buyer / Sales / system | Portal + Platform | Purchase Requests | BC-04 | MUST | 3 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-016 | Confirm a Sales Order | Sales Representative / Customer Buyer | Platform + Buyer Portal | Sales Orders | BC-04 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-017 | Correct or cancel a confirmed SO | Company Owner / Business Operations Manager | Platform | Sales Orders | BC-04 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-018 | View safe sellable availability | Customer Buyer / Sales Representative | Portal + Platform | Availability | BC-05 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-019 | Allocate physical lots under FEFO | Warehouse Operator | Platform | Inventory/FEFO | BC-05 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-020 | Receive stock with lot traceability | Warehouse Operator | Platform | Receiving/warehouse | BC-05 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-021 | Transfer or adjust inventory safely | Warehouse Operator | Platform | Receiving/warehouse | BC-05 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-022 | Progress a Fulfillment | Warehouse Operator / Fulfillment operator | Platform | Fulfillment | BC-06 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-023 | Resolve a shortage | Warehouse Operator / Sales Representative | Platform | Fulfillment | BC-06 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-024 | Schedule and dispatch a Delivery | Dispatch Coordinator | Platform | Dispatch/delivery | BC-06 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-025 | Record an attempt and POD | Dispatch Coordinator / Driver / Delivery Operator | Platform | Dispatch/delivery | BC-06 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-026 | Continue a partial delivery | Dispatch Coordinator / Driver / Delivery Operator | Platform | Dispatch/delivery | BC-06 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-027 | Capture and disposition a temperature excursion | Warehouse / Dispatch responsibility | Platform | Cold-chain evidence | BC-06 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-028 | View Tenant-specific credit | Company Owner / Customer Buyer | Platform + Buyer Portal | Credit | BC-07 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-029 | Reserve and release credit safely | Sales Representative / Credit responsibility | Platform | Credit | BC-07 | MUST | 3 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-030 | Post and correct a Receivable | Company Owner / authorized receivables responsibility | Platform | Receivables | BC-07 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-031 | Report and confirm a Payment | Customer Buyer / authorized payment responsibility | Portal + Platform | Payments | BC-08 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-032 | Recover prepaid payment/order failure | Payment/Reconciliation responsibility | Platform | Payments | BC-08 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-033 | Issue and retrieve an immutable business document | Sales / Customer Buyer | Platform + Buyer Portal | Business documents | BC-09 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-034 | Receive relevant business notification | authorized recipient | Platform + Buyer Portal | Notifications | BC-10 | SHOULD | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-035 | Consult a durable business timeline | authorized workforce / Customer Buyer | Platform + Buyer Portal | Traceability | BC-11 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-036 | View current operational work | authorized workforce | Platform | Operational visibility | BC-11 projection | SHOULD | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |
| US-037 | Understand Nexa and enter an authenticated flow | Public Interested Company / Prospect | Website | Acquisition/onboarding | BC-01 | MUST | 2 | CURRENT / REFINEMENT PENDING | same | Blueprint current baseline |

Historical academic stories use a separate mechanism; see
[the historical catalog](../../91-reference/legacy/legacy-ecosystem-report/historical-user-story-catalog.md).
