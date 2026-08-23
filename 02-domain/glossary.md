---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Nexa Glossary

Canonical terms are maintained in [Ubiquitous Language](strategic-ddd/ubiquitous-language.md). This index highlights terms most likely to collide in implementation.

| Term | Canonical use | Avoid |
|---|---|---|
| Tenant | SaaS customer and maximum business/data isolation boundary | deployment, Workspace or global user organization |
| Workspace | V1 operational environment, 1:1 with Tenant | C4 Container or separate Tenant |
| Buyer | actor using an authorized Buyer Relationship | workforce member or generic user |
| Customer Account | Tenant-side business customer record | global identity or Buyer Relationship |
| SKU | concrete sellable commercial identity | Product, Inventory Lot or catalog item legacy label |
| Commercial Commitment | persistent Warehouse-neutral SKU + quantity demand owned by PR/SO | Inventory Reservation, Warehouse backing or allocation |
| Inventory Reservation | Inventory-owned protection of commercial demand across eligible Warehouses; no Lot selection | Commercial Commitment or Physical Allocation |
| Warehouse Backing | deterministic distribution of protected demand by SKU + Warehouse | Commercial Commitment ownership or Lot allocation |
| Physical Allocation | selection/authority for Inventory Lot(s) | commercial commitment or picking scan |
| Sellable Availability | usable on-hand minus commitments and Safety Stock at business scope; authoritative by SKU + Warehouse | physical stock or an unqualified Tenant-wide total |
| ColdChainDisposition | authorized outcome for temperature-affected quantity | automatic destruction or supplier return synonym |
| REJECT | outcome: quantity not accepted for normal sellable/fulfillment use | automatic RETURN_TO_SUPPLIER |
| RETURN_TO_SUPPLIER | possible physical action after REJECT | REJECT outcome |
| Credit Reservation | reserved credit for commercial demand | Outstanding Receivable |
| Available Credit | Credit Limit - Credit Reservations - Outstanding Receivables | global Buyer balance, `exposure`, `used` |
| Payment | business money movement/report/confirmation | Stripe, Receivable or Credit |
| Receivable | formal commercial debt | Payment or invoice rendering |
| Financial Adjustment | explicit correction of historical obligation | silent rewrite or SUNAT Credit Note |
| Delivery Attempt | attempt within one Delivery | new Delivery |
| Continuation Delivery | remaining quantity after partial Delivery | retry or automatic backorder |
| POD | immutable delivery evidence | mutable status or mandatory signature/photo |
| Business Document | immutable issued commercial/evidence artifact | automatic fiscal document |
| Notification | retryable channel delivery state | source fact or traceability |
| Business Traceability | durable business fact/timeline representation | notification or Security Audit |

Legacy identifiers and implementation columns remain AS-IS translation points until a documented migration; they do not redefine this vocabulary.
