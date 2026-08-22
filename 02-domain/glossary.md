---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-22
---

# Nexa glossary

This glossary preserves accepted vocabulary and makes collisions visible.
Proposed contextual language remains in the [Strategic DDD language proposal](strategic-ddd/ubiquitous-language.md).

| Term | Canonical use | Avoid / classify separately |
| --- | --- | --- |
| Tenant | Company-level SaaS isolation boundary. | Not a deployment or C4 container. |
| Workspace | Tenant's V1 operational environment. | Multiple workspaces per Tenant are FUTURE. |
| Buyer | Human/customer actor purchasing from a Tenant. | Not workforce membership; relationship is Tenant-scoped. |
| Customer Account | Tenant-side commercial account. | Not automatically a global Identity. |
| Product | Catalog concept. | Not a synonym for SKU. |
| SKU | Sellable commercial identity used by commitment quantity. | Not an Inventory Lot. |
| Commercial Inventory Commitment | Submitted demand commitment by SKU + quantity. | Not physical reservation or allocation. |
| Physical Allocation | Selection of physical Inventory Lot(s). | Not the commercial commitment. |
| Inventory Lot | Traceable physical stock in one Warehouse at a time. | Not Manufacturer/Supplier Batch. |
| Available Credit | Credit Limit minus Credit Reserved and Outstanding Receivables. | `exposure` and `used` are AS-IS only. |
| Payment | Business concept and lifecycle. | Stripe is provider direction, not the definition. |
| Payment Reported | External payment claim awaiting confirmation. | Not Payment Confirmed. |
| Delivery | Performed/attempted delivery obligation. | Not Dispatch or Route. |
| Continuation Delivery | New obligation after partial delivery. | Not every failed-attempt retry. |
| Business Document | Commercial/operational evidence. | Not automatically a tax integration. |
| Business Traceability | Timeline and meaningful business facts. | Not the Security Audit Log. |
