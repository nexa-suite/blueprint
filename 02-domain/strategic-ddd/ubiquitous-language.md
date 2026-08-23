---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Ubiquitous Language

These terms are canonical for PRE-V1. Context-local synonyms require an explicit translation contract.

| Term | Canonical meaning | Must not be collapsed into |
|---|---|---|
| Tenant | Nexa customer and maximum business/data isolation boundary | Workspace, Customer Account or deployment |
| Workspace | V1 operational environment associated 1:1 with Tenant | Tenant, C4 Container or separate security boundary |
| Human Identity | global person authentication identity | Workforce Membership or Buyer Relationship |
| Workforce Membership | Tenant-scoped work/access relationship | Human Identity or Buyer Relationship |
| Customer Account | Tenant-scoped business customer record | Human Identity or Buyer |
| Buyer Relationship | Tenant-approved commercial relationship with supplier Tenant | Customer Account or generic Portal Access |
| Product | catalog concept | SKU or Inventory Lot |
| SKU | concrete sellable commercial identity/UOM | Product or physical lot |
| Base Price | catalog starting price | final resolved price |
| Price List | applicable Tenant/customer pricing configuration | SKU identity or arbitrary Sales override |
| Customer Terms | permitted customer-specific commercial conditions | Price List, Payment or Receivable |
| Promotion | one permitted transformation over resolved price in V1 | stacked discount or price authority |
| Cart / Request Draft | buyer intent before authoritative submission | Purchase Request or inventory commitment |
| Purchase Request | buyer commercial request subject to review | Sales Order, Supplier Purchase Order or Draft SO |
| Commercial Commitment | persistent SKU + quantity demand commitment owned by PR/SO | Physical Allocation or Inventory Lot |
| Sales Order | confirmed immutable commercial obligation | Purchase Request or financial settlement |
| Physical Stock | actual quantity in a Warehouse, including non-sellable states | Sellable Availability |
| Sellable Availability | usable on-hand minus active commitments and Safety Stock | Physical Stock or Commercial Commitment |
| Safety Stock | protected warehouse policy quantity | commitment, allocation or unusable stock |
| Inventory Lot | traceable physical stock unit in one Warehouse at a time | Manufacturer Batch or SKU |
| Physical Allocation | selection/authority for Inventory Lot(s) against commitment | Commercial Commitment or fulfillment scan |
| Fulfillment | operational work preparing committed goods | Delivery or Dispatch |
| Dispatch | coordination/handover grouping | Delivery or Route |
| Delivery | scheduled/attempted obligation to deliver goods | Delivery Attempt or Dispatch |
| Delivery Attempt | one attempt within same Delivery | new Delivery or automatic failure finality |
| Continuation Delivery | new Delivery for remaining quantity after partial delivery | retry of original attempt or backorder |
| POD | immutable proof-of-delivery evidence | mutable delivery state |
| Temperature Excursion | out-of-range observation requiring evaluation | automatic destruction or automatic quarantine |
| HOLD | non-sellable pending disposition | Quarantine, Waste or Release |
| Credit Reservation | credit amount reserved for active commercial demand | Outstanding Receivable |
| Available Credit | Credit Limit - Credit Reservations - Outstanding Receivables | global Buyer balance or `exposure`/`used` |
| Receivable | formal commercial debt/claim posted at accepted trigger | Payment or document rendering |
| Payment | business money movement/report/confirmation lifecycle | Stripe provider or Receivable |
| Payment Report | external/manual payment claim awaiting handling | Payment Confirmed |
| Financial Adjustment | explicit correction to historical financial obligation | silent rewrite or SUNAT Credit Note |
| Business Document | issued commercial/evidence artifact with immutable history | Security Audit or automatic fiscal document |
| Notification | delivery intent and channel state | source business fact or Traceability |
| Business Traceability | durable representation of meaningful business facts and timeline | Notification or Security Audit |
| Security Audit | security and authorization evidence | Buyer business timeline |

## Canonical state names

- PR: `SUBMITTED`, `CHANGES_PROPOSED`, `CONVERTED`, `REJECTED`, `WITHDRAWN`, `EXPIRED`.
- Buyer Relationship: `PENDING / INVITED`, `ACTIVE`, `SUSPENDED`, `REVOKED`.
- Transfer: `REQUESTED`, `IN_TRANSIT`, `RECEIVED`.
- Fulfillment: `PLANNED`, `ALLOCATED`, `PICKING`, `PICKED`, `PACKED`, `STAGED`, `READY_FOR_DISPATCH`, `HANDED_OVER`, `COMPLETED`, with explicit exceptions.
- Delivery: `PLANNED`, `SCHEDULED`, `DISPATCHED / IN_TRANSIT`, `ATTEMPTED`, `DELIVERED`, `PARTIALLY_DELIVERED`, `ATTEMPT_FAILED`, `RESCHEDULED`, `CANCELLED`, `FAILED_FINAL`.

## Translation rule

Legacy `catalog_item_id`, `exposure`, `used`, reservation and provider terms are AS-IS translation points. They do not redefine Product language or TARGET ownership.
