---
status: reference
maturity: SUPERSEDED
scope: cross-cutting
owner: data
last-reviewed: 2026-08-15
---

# Data requirements evidence

Historical discovery register. It is retained as input evidence only. The
accepted PRE-V1 logical ownership, transaction/concurrency and RLS baseline is
in [Data Architecture](data-architecture.md), [transaction matrix](transaction-concurrency-matrix.md)
and [Security Architecture](../security/security-architecture-target.md).

| Evidence concern | Known evidence / current interpretation | Open data question | Future resolving activity |
|---|---|---|---|
| Tenant isolation | Tenant is maximum business/data boundary; V1 Tenant 1:1 Workspace | Which records, policies and audit facts require tenant predicates and independent lifecycle? | Strategic DDD, Data/Security Architecture |
| Workspace relationship | Workspace is complete Tenant operational environment, not C4 Container | Which provisioning/configuration facts belong to Tenant versus Workspace? | Capability Mapping, Data Architecture |
| Global identity | One human has one Nexa identity | Which identity facts are global, and which are relationship-scoped? | Domain Storytelling, IAM/Security |
| Workforce membership | Workforce access is Tenant-scoped and role/capability-oriented | What membership lifecycle, history and revocation evidence is required? | Strategic DDD, IAM/Security |
| Buyer relationship | Buyer may relate commercially to multiple Tenants | What relationship, authorization and isolation records are required? | Ubiquitous Language, IAM/Data |
| Customer Account | Customer Account may exist without Buyer identity or Portal access | Which commercial facts exist offline and how are they linked to Portal access? | Domain Storytelling, Data Architecture |
| Catalog/Product/SKU | Product-to-sellable-SKU direction; presentation owns SKU; Brand/Category Tenant-scoped | Which lifecycle, identity and visibility facts must be historical? | Capability Mapping, EventStorming |
| Price Lists/terms/promotions | Pricing precedence is policy-driven; SKU identity is not price identity | Which effective dates, snapshots and policy decisions must be retained? | EventStorming, Data Architecture |
| Historical order prices | Confirmed orders are commitments; order-time prices require snapshots | What immutable commercial facts must survive master-data change? | Domain Storytelling, Data Architecture |
| Purchase Requests | Request is commercial intent; Sales may review/adjust before Sales Order | Which adjustments, acknowledgements and transitions must be recorded? | Process-Level EventStorming |
| Sales Orders | Confirmed order changes are explicit, not silent mutation | What history, cancellation, replacement and document facts are needed? | EventStorming, Data Architecture |
| Availability/commitments | Physical stock, holds, safety stock and committed/reserved quantities differ | What is commitment moment, release behavior and concurrency evidence? | EventStorming, Data/Security |
| Warehouse and lots | Multiple Warehouses; physical Inventory Lot belongs to one Warehouse; source batch may split | How should Source Batch and physical Inventory Lot terminology and traceability be represented? | Domain Storytelling, Ubiquitous Language |
| Expiry/FEFO/hold | Expiry, FEFO, quarantine and traceability are cold-chain concerns | Which facts, overrides and exception evidence must be retained? | EventStorming, Data Architecture |
| Receiving/fulfillment | Receiving, Allocate, Pick, Pack, Stage and Handover are V1 scope areas | Which operational facts are events, current state or projections? | Process-Level EventStorming |
| Dispatch/delivery/POD | Delivery can exist independently of Route; basic photo/signature POD direction | What delivery, attempt, route and POD evidence is required? | Domain Storytelling, Design/Data |
| Credit/payment | Credit limit, payment terms, payment recording and provider/manual representation | What is authoritative payment identity, idempotency and receivable evidence? | EventStorming, Security/Data |
| Provider callbacks | Payment/provider integrations exist as abstract boundaries | How are callback identity, replay, idempotency and tenant context recorded? | Integration/Security Architecture |
| Documents | Basic documents; historical meaning cannot depend on mutable master data | What snapshot, issuance, regeneration and access metadata is required? | Data/Security Architecture |
| Object Storage/media | Object Storage holds tenant-owned binary content; API retains authorization/metadata | Which catalog media, malware/quarantine, retention and deletion states exist? | Data/Security Architecture |
| Notifications | Policy determines WHAT/WHO/WHEN; infrastructure determines HOW | Which notification intent, delivery attempt and preference facts are retained? | EventStorming, Integration Architecture |
| Audit/traceability | Business traceability differs from security/audit evidence | Which safe actor, tenant, correlation and timestamp metadata is required? | Security/Data Architecture |
| Background jobs | Workers and outbox/inbox patterns appear in AS-IS evidence | How is worker/system actor context, retry, idempotency and failure history represented? | Integration/Security/Data Architecture |
| Cross-Tenant processing | Tenant isolation must survive asynchronous processing | Which jobs may process multiple Tenants and what guardrails prove isolation? | Security Architecture, RLS review |
| RLS | RLS mechanisms observed in AS-IS; final ownership not defined | Which tables, worker paths and bypass controls require RLS? | Security/Data Architecture |
| Dashboard/projections | Operational dashboard is V1; no full BI/data warehouse claim | Which projections need freshness, lineage and retention guarantees? | Capability Mapping, Data Architecture |
| Jurisdiction/configuration | Peru may be first market; country, jurisdiction, timezone, locale and currency remain distinguishable | Which configuration is Tenant policy versus historical transaction fact? | Product discovery, Data Architecture |
| Test/demo/reference data | ICISA is explicit reference/demo data, not normal Tenant data | How are test, demo, seed/import and production records separated and identified? | Provisioning/Data/Operations |

Current PostgreSQL, Flyway, RLS, persistence and Object Storage adapter evidence remains AS-IS input. No row above overrides the accepted target or authorizes application migration.
