---
status: draft
maturity: DISCOVERY
scope: cross-cutting
owner: data
last-reviewed: 2026-08-15
---

# Data requirements evidence

This is an evidence register for future discovery. It is not a conceptual, logical or physical data model and it does not assign Bounded Context ownership.

| Evidence concern | Current interpretation | Discovery question |
|---|---|---|
| Tenant isolation | Tenant is the maximum business/data isolation boundary; V1 keeps Tenant 1:1 Workspace | Which business capabilities require independent ownership, policy and audit boundaries? |
| Catalog and SKU | Product-to-sellable-SKU is the accepted direction; presentation, SKU, visibility and availability are distinct concerns | Which concepts and lifecycle rules are shared or context-specific? |
| Commercial pricing | Price Lists and promotions are policy-driven; confirmed orders must retain authoritative pricing | Which decisions must be recorded as immutable facts and which may be recalculated? |
| Inventory traceability | Warehouse, lot, expiry, FEFO, holds and delivery evidence are relevant cold-chain concerns | What is the minimum traceability event history and retention policy? |
| Identity and relationships | Global identity, workforce membership and buyer relationships are separate concepts | Which data is global identity, tenant membership or commercial relationship data? |
| Documents and media | Object Storage is the V1 binary boundary; tenant-owned media and evidence require access control | Which metadata, retention and deletion rules apply to each asset class? |

Resolution sequence: Capability Mapping, EventStorming, Domain Storytelling and Strategic DDD first; then Data Architecture, Security Architecture and Cloud/Deployment Architecture.
