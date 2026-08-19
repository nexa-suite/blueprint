---
status: draft
maturity: DISCOVERY
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Proposed Context Map

Relationships below describe authority direction, not deployment or Spring module dependencies. Pattern labels are used only where they explain a real relationship.

| Upstream | Downstream | Proposed relationship | Translation / contract |
|---|---|---|---|
| Tenant & Access Governance | all tenant-scoped contexts | Customer/Supplier-like upstream authorization | Verified Tenant context and capability decision; downstream never trusts raw client tenant IDs |
| Customer & Buyer Relationships | Catalog & Commercial Policy | Upstream relationship policy | Customer eligibility and active Price List reference by identifier/snapshot |
| Customer & Buyer Relationships | Sales Commitment | Upstream account relationship | Customer Account and Buyer Relationship identity; no entity sharing |
| Catalog & Commercial Policy | Sales Commitment | Published Language candidate | Price resolution and commercial snapshot; price authority remains upstream |
| Inventory Availability | Sales Commitment | Customer/Supplier-like availability supplier | Sellable availability query; final commitment command must preserve invariant ownership |
| Sales Commitment | Inventory Availability | Downstream demand fact | Commercial Commitment event/reference; inventory does not own Sales Order |
| Sales Commitment | Credit & Receivables | Downstream exposure fact | commitment/reserved amount; transformation must avoid double count |
| Sales Commitment | Fulfillment & Delivery | Upstream commercial obligation | immutable Sales Order snapshot and fulfillment request |
| Inventory Availability | Fulfillment & Delivery | Upstream physical stock | eligible lot/availability contract; Fulfillment owns selection/actual allocation |
| Fulfillment & Delivery | Business Documents | Upstream delivery evidence | Delivery/POD facts and document request |
| Credit & Receivables | Payments | Upstream receivable/payment target | Receivable identifier and allocation contract |
| Payments | Credit & Receivables | Downstream payment fact | confirmed/reversed payment with immutable provider-independent semantics |
| Payments | Business Documents | Downstream evidence request | Payment Receipt input; no Stripe vocabulary in document model |
| all source contexts | Notification & Business Traceability | Upstream facts | versioned business event; projection and delivery eventually consistent |
| Tenant & Access Governance | Notification & Business Traceability | Security boundary | authorization/audit facts are separate from Buyer timeline |
| Object Storage / provider adapters | Business Documents and Catalog | Anti-Corruption Layer | storage object metadata and safe retrieval; provider vocabulary stays outside core |
| Stripe adapter | Payments | Anti-Corruption Layer | provider intent/event/reference translated into Payment semantics |
| Maps adapter | Fulfillment & Delivery | Anti-Corruption Layer | geolocation/routing response translated to route planning data |

## Context Map rules

- Shared Kernel is not declared for database schemas, DTOs, entities or current `shared` Java package.
- A Published Language is proposed only for stable business facts/contracts; it requires versioning, ownership and compatibility tests.
- An Anti-Corruption Layer protects Payment, Maps, Email, Object Storage and malware-scanning provider vocabulary.
- Current Spring Modulith open modules are implementation evidence. They do not become Context Map relationships by annotation.
