---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-08-30
---

# Bounded Context component-level rubric coverage

The UPC rubric asks for C4 Component diagrams for containers participating in
each Bounded Context. Existing Structurizr views are reused when they explain
the relevant logical seams. No new C4 Container, deployment unit or strategic
context is created in this wave.

| BC | Participating container(s) | Existing component view | Coverage decision |
|---|---|---|---|
| BC-01 Tenant & Access Governance | Nexa API, Platform, Buyer Portal, Mobile TARGET planning projections | `Nexa-API-IdentityTenantCustomer-TARGET`; Platform/Portal frontend; Mobile TARGET views | PASS — access-context/domain seams plus surface authorization/sync projections |
| BC-02 Customer & Buyer Relationships | Nexa API, Platform, Buyer Portal, Mobile TARGET planning projections | `Nexa-API-IdentityTenantCustomer-TARGET`; Platform/Portal frontend views | PASS — relationship authority and consuming projections explicit |
| BC-03 Catalog & Commercial Policy | Nexa API, Platform, Buyer Portal, Mobile TARGET planning projections | `Nexa-API-CommercialInventory-TARGET`; Platform/Portal frontend views | PASS — catalog target seams and client projections reused |
| BC-04 Sales Commitment | Nexa API, Platform, Buyer Portal; Mobile V2+ planning projection | `Nexa-API-CommercialInventory-TARGET`; Platform/Portal frontend views | PASS — commitment application/domain seams cover PR/SO; Mobile commerce client NOT STARTED |
| BC-05 Inventory Availability | Nexa API, Platform, Buyer Portal, Operations Mobile V1 planning projection | `Nexa-API-CommercialInventory-TARGET`; `Nexa-API-FulfillmentDelivery-TARGET`; Platform/Operations Mobile views | PASS — inventory authority, backing/allocation and Warehouse consumers visible |
| BC-06 Fulfillment & Delivery | Nexa API, Platform, Buyer Portal, Mobile TARGET planning projections | `Nexa-API-FulfillmentDelivery-TARGET`; Platform/Portal; Mobile TARGET views | PASS — execution, delivery and evidence seams reused |
| BC-07 Credit & Receivables | Nexa API, Platform, Buyer Portal, Mobile TARGET planning projections | `Nexa-API-CreditPaymentDocuments-TARGET`; Platform/Portal frontend views | PASS — credit target seam and read projections explicit |
| BC-08 Payments | Nexa API, Platform, Buyer Portal, Buyer Mobile TARGET planning projection | `Nexa-API-CreditPaymentDocuments-TARGET`; `Nexa-API-IntegrationReliability-ASIS`; frontend/Buyer Mobile views | PASS — payment/provider reliability separation explicit |
| BC-09 Business Documents | Nexa API, Platform, Buyer Portal, Mobile TARGET planning projections | `Nexa-API-CreditPaymentDocuments-TARGET`; `Nexa-API-IntegrationReliability-ASIS`; frontend/Mobile views | PASS — document generation, Object Storage and consumers covered |
| BC-10 Notifications | Nexa API, Platform, Buyer Portal, Mobile TARGET planning projections | `Nexa-API-FulfillmentDelivery-TARGET`; `Nexa-API-CreditPaymentDocuments-TARGET`; frontend/Mobile views | PASS — delivery/traceability seam and channel consumers reused |
| BC-11 Business Traceability | Nexa API, Platform, Buyer Portal, Mobile TARGET planning projections | `Nexa-API-FulfillmentDelivery-TARGET`; `Nexa-API-Overall-ASIS`; frontend/Mobile views | PASS — append-only facts and authorized projections covered |

Mobile entries below are owner-accepted product projections but remain
PLANNED/PROPOSED client implementation views until a framework/client exists. The
component source remains [Structurizr DSL](structurizr/workspace.dsl). The
manual versioned SVG set under [exports](exports/README.md) is canonical review
evidence and does not replace the DSL or generated workspace representation.

Deployment coverage is shared across all rows: `Nexa-Deployment-Local-ASIS`
proves the local runtime boundary and `Nexa-Deployment-V1-TARGET` projects
provider-neutral hosting, Android physical-device clients and external
provider boundaries. Deployment nodes remain runtime concerns, not Bounded
Contexts or one-container-per-BC architecture.
