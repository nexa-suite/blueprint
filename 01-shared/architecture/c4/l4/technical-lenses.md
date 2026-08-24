---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# C4 Level 3 and Level 4 technical views

These are selective PRE-V1 TARGET technical lenses inside V1 applications. They are not one-to-one Bounded Contexts, do not derive ownership from folders and do not authorize application refactoring.

## API component lenses

| Lens | Technical concern | State |
| --- | --- | --- |
| Identity | Authentication and global human identity | AS-IS / TARGET seam |
| Tenant | Tenant and Workspace scope enforcement | AS-IS / TARGET seam |
| Customer | Customer Account and Buyer relationship access | TARGET baseline |
| Catalog | Product, SKU, visibility and commercial policy | AS-IS / TARGET seam |
| Sales | Purchase Request and Sales Order orchestration | AS-IS / TARGET seam |
| Commitment | Commercial Inventory Commitment lifecycle | TARGET baseline |
| Inventory | Sellable availability, lots and FEFO policy | AS-IS / TARGET seam |
| Warehouse | Receiving, movement, adjustment and physical operations | AS-IS / TARGET seam |
| Fulfillment | Allocation execution and readiness handoff | TARGET baseline |
| Delivery | Dispatch, attempts, continuation and POD | AS-IS / TARGET seam |
| Payments | Payment lifecycle and provider adapter | AS-IS / TARGET seam |
| Credit | Credit limit, reserved credit and receivables | TARGET baseline |
| Documents | Business document metadata, evidence and storage | AS-IS / TARGET seam |
| Notifications | Durable publication and user-facing projections | AS-IS / TARGET seam |
| Shared infrastructure | Access context, persistence, outbox/inbox, reliability and adapters | AS-IS / TARGET seam |

These lenses map to the canonical Structurizr API views in
[structurizr/README.md](../structurizr/README.md) and the implementation seams in
[code views](code-views.md). Coarse Structurizr components are intentional:
they avoid pretending every capability is already a separate technical
module.

## Frontend component lenses

### Platform

`Shell`, `IAM`, `Sales`, `Catalog`, `Warehouse`, `Logistics` are feature lenses
within the Internal Web Platform. Routing, authorization presentation,
feature state, API clients and shared experience remain cross-cutting; the API
remains authoritative for access.

### Portal

`Authentication`, `Catalog`, `Buyer Requests`, `Orders`, `Payments`,
`Delivery`, `Documents` are feature lenses within the Buyer Portal. Buyer
relationship scope and server authorization are not delegated to the browser.

## Selective Level 4 flows

The canonical flow views are [Buyer sales](../../../domain/processes/workflows.md#1-buyer-sales-flow),
[Warehouse and delivery](../../../domain/processes/workflows.md#2-warehouse-and-delivery-flow),
[Payment and receivable](../../../domain/processes/workflows.md#3-payment-and-receivable-flow)
and [durable events](../../../domain/processes/workflows.md#4-durable-business-events).
Code-level paths and AS-IS/TARGET labels remain in [C4 code views](code-views.md).

## Construction boundary

Implementation must preserve accepted ownership, language and integration direction when these technical lenses reshape modules, schemas, APIs or event contracts. No L3/L4 view is evidence of production readiness. Production cloud, provider, RPO/RTO, SLO and break-glass proof remain Production Gate items.
