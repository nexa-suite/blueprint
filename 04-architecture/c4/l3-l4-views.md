---
status: draft
maturity: DRAFT
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-22
---

# C4 Level 3 and Level 4 technical views

These are selective technical lenses inside V1 applications. They are not
accepted Bounded Contexts, do not derive ownership from folders and do not
authorize application refactoring.

## API component lenses

| Lens | Technical concern | State |
| --- | --- | --- |
| Identity | Authentication and global human identity | AS-IS / TARGET seam |
| Tenant | Tenant and Workspace scope enforcement | AS-IS / TARGET seam |
| Customer | Customer Account and Buyer relationship access | TARGET proposal |
| Catalog | Product, SKU, visibility and commercial policy | AS-IS / TARGET seam |
| Sales | Purchase Request and Sales Order orchestration | AS-IS / TARGET seam |
| Commitment | Commercial Inventory Commitment lifecycle | TARGET proposal |
| Inventory | Sellable availability, lots and FEFO policy | AS-IS / TARGET seam |
| Warehouse | Receiving, movement, adjustment and physical operations | AS-IS / TARGET seam |
| Fulfillment | Allocation and readiness handoff | TARGET proposal |
| Delivery | Dispatch, attempts, continuation and POD | AS-IS / TARGET seam |
| Payments | Payment lifecycle and provider adapter | AS-IS / TARGET seam |
| Credit | Credit limit, reserved credit and receivables | TARGET proposal |
| Documents | Business document metadata, evidence and storage | AS-IS / TARGET seam |
| Notifications | Durable publication and user-facing projections | AS-IS / TARGET seam |
| Shared infrastructure | Access context, persistence, outbox/inbox, reliability and adapters | AS-IS / TARGET seam |

These lenses map to the canonical Structurizr API views in
[structurizr/README.md](structurizr/README.md) and the implementation seams in
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

The canonical flow views are [Buyer sales](../../11-reference/flows/workflows.md#1-buyer-sales-flow),
[Warehouse and delivery](../../11-reference/flows/workflows.md#2-warehouse-and-delivery-flow),
[Payment and receivable](../../11-reference/flows/workflows.md#3-payment-and-receivable-flow)
and [durable events](../../11-reference/flows/workflows.md#4-durable-business-events).
Code-level paths and AS-IS/TARGET labels remain in [C4 code views](code-views.md).

## Review gate

Business Architect review must confirm ownership, language and integration
direction before these technical lenses reshape modules, schemas, APIs or
event contracts. No L3/L4 view is evidence of production readiness.
