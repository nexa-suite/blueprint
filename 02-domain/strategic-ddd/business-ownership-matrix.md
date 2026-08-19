---
status: draft
maturity: DISCOVERY
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Business Ownership Matrix

One proposed authoritative owner is listed for each concept. `Review` means the model is intentionally unresolved; it is not permission to split or merge implementation modules.

| Concept / fact | Proposed authority | Consumers | Review hotspot |
|---|---|---|---|
| Tenant lifecycle/status | Tenant & Access Governance | all contexts, authorization | Tenant versus Workspace lifecycle |
| Workspace operational identity | Tenant & Access Governance | all tenant-scoped contexts | V1 1:1 accepted; future multiplicity deferred |
| Human Identity authentication identity | Tenant & Access Governance with identity adapter | IAM/session, relationships | privacy and provider ownership |
| Workforce Membership | Tenant & Access Governance | Platform, authorization, audit | Company Owner versus Tenant Administrator |
| Buyer Relationship | Customer & Buyer Relationships | Portal, Sales Commitment, Credit | independent from Workforce Membership |
| Customer Account | Customer & Buyer Relationships | Catalog terms, Sales Commitment, Credit, Documents | RUC uniqueness per Tenant |
| Sellable SKU/Product definition | Catalog & Commercial Policy | Buyer catalog, Sales Commitment, Inventory | Product/SKU terminology |
| Price resolution | Catalog & Commercial Policy | Cart, PR, Sales Order snapshot | promotion and terms sequence |
| Cart intent | Sales Commitment | Portal, pricing/availability previews | no reservation |
| Purchase Request lifecycle | Sales Commitment | Buyer, Sales, notification | expiry/material change policy |
| Commercial Commitment | Sales Commitment candidate | Inventory availability, Credit, Fulfillment | AS-IS reservation terminology is translated; Product distinction is closed, context ownership remains review-gated |
| Confirmed Sales Order history | Sales Commitment | Fulfillment, Credit, Documents, Buyer | immutable correction/cancellation |
| Physical Stock / Inventory Lot | Inventory Availability | Sales Commitment read, Fulfillment | Batch/lot and warehouse handoff |
| Sellable Availability | Inventory Availability | Sales Commitment | safety stock and commitment deduction |
| Lot Allocation | Fulfillment & Delivery | warehouse execution, delivery | one line/multiple lots rule |
| Fulfillment readiness | Fulfillment & Delivery | Dispatch, Platform | Warehouse handoff |
| Dispatch/Delivery/POD outcome | Fulfillment & Delivery | Buyer timeline, Documents | route versus delivery |
| Credit Limit/Credit Reserved/Outstanding Receivables | Credit & Receivables | Sales Commitment, Buyer Portal | transformation without double count |
| Financial Posting | Credit & Receivables | Receivables, Documents, Payments | exact trigger open |
| Payment state | Payments | Receivables, Sales Commitment, Documents | provider boundary |
| Business Document identity/version | Business Documents | Buyer, Platform, Payments, Delivery | fiscal status and retention |
| Business Notification | Notification & Business Traceability | surfaces, Email | source facts remain source-owned |
| Security audit fact | Security boundary / Tenant & Access | security review, Platform audit | distinct from business timeline |
| Operational KPI/projection | Review; likely supporting analytics capability | Platform dashboards | no canonical KPI owner yet |
