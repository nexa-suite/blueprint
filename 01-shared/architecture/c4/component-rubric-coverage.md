---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-19
---

# Bounded Context component-level rubric coverage

The UPC rubric asks for C4 Component diagrams for containers participating in
each Bounded Context. Existing Structurizr views are reused when they explain
the relevant logical seams. No new Software System, strategic context or
container-per-BC architecture is created in this wave. Existing accepted Mobile
containers remain within Nexa; TARGET deployment explicitly contains separate
logical Operations Mobile Device and Buyer Mobile Device nodes.

| BC | Participating container(s) | Existing component view | Coverage decision |
|---|---|---|---|
| BC-01 Tenant & Access Governance | Nexa API, Platform, Buyer Portal, Mobile TARGET V1 surfaces | `Nexa-API-IdentityTenantCustomer-TARGET`; Platform/Portal frontend; Mobile TARGET views | PASS — access-context/domain seams plus surface authorization/freshness projections |
| BC-02 Customer & Buyer Relationships | Nexa API, Platform, Buyer Portal, Mobile TARGET V1 surfaces | `Nexa-API-IdentityTenantCustomer-TARGET`; Platform/Portal frontend views | PASS — relationship authority and consuming projections explicit |
| BC-03 Catalog & Commercial Policy | Nexa API, Platform, Buyer Portal, Mobile TARGET V1 surfaces | `Nexa-API-CommercialInventory-TARGET`; Platform/Portal frontend views | PASS — catalog target seams and client projections reused |
| BC-04 Sales Commitment | Nexa API, Platform, Buyer Portal, Buyer Mobile TARGET V1 surface | `Nexa-API-CommercialInventory-TARGET`; Platform/Portal frontend; Buyer Mobile view | PASS — commitment application/domain seams cover PR/SO and authorized Buyer projection |
| BC-05 Inventory Availability | Nexa API, Platform, Buyer Portal, Operations Mobile TARGET V1 surface | `Nexa-API-CommercialInventory-TARGET`; `Nexa-API-FulfillmentDelivery-TARGET`; Platform/Operations Mobile views | PASS — inventory authority, backing/allocation and Warehouse consumers visible |
| BC-06 Fulfillment & Delivery | Nexa API, Platform, Buyer Portal, Mobile TARGET V1 surfaces | `Nexa-API-FulfillmentDelivery-TARGET`; Platform/Portal; Mobile TARGET views | PASS — execution, delivery and evidence seams reused |
| BC-07 Credit & Receivables | Nexa API, Platform, Buyer Portal, Mobile TARGET V1 surfaces | `Nexa-API-CreditPaymentDocuments-TARGET`; Platform/Portal frontend views | PASS — credit target seam and read projections explicit |
| BC-08 Payments | Nexa API, Platform, Buyer Portal, Buyer Mobile TARGET V1 surface | `Nexa-API-CreditPaymentDocuments-TARGET`; `Nexa-API-IntegrationReliability-ASIS`; frontend/Buyer Mobile views | PASS — payment/provider reliability separation explicit |
| BC-09 Business Documents | Nexa API, Platform, Buyer Portal, Mobile TARGET V1 surfaces | `Nexa-API-CreditPaymentDocuments-TARGET`; `Nexa-API-IntegrationReliability-ASIS`; frontend/Mobile views | PASS — document generation, Object Storage and consumers covered |
| BC-10 Notifications | Nexa API, Platform, Buyer Portal, Mobile TARGET V1 surfaces | `Nexa-API-FulfillmentDelivery-TARGET`; `Nexa-API-CreditPaymentDocuments-TARGET`; frontend/Mobile views | PASS — delivery/traceability seam and channel consumers reused |
| BC-11 Business Traceability | Nexa API, Platform, Buyer Portal, Mobile TARGET V1 surfaces | `Nexa-API-FulfillmentDelivery-TARGET`; `Nexa-API-Overall-ASIS`; frontend/Mobile views | PASS — append-only facts and authorized projections covered |

Mobile entries son superficies de producto `TARGET V1 / OWNER-ACCEPTED`, no
afirmaciones de cliente integrado: Operations tiene evidencia parcial no
fusionada y Buyer no está implementada; la tecnología final permanece OPEN. La
fuente de componentes sigue siendo el [Structurizr DSL](structurizr/workspace.dsl).
El conjunto SVG/PNG generado bajo [exports](exports/README.md) es evidencia de
revisión y no reemplaza el DSL ni la representación generada.

Deployment coverage is shared across all rows: `Nexa-Deployment-Local-ASIS`
proves the local runtime boundary and `Nexa-Deployment-V1-TARGET` projects
provider-neutral hosting, separate logical Operations Mobile Device and Buyer
Mobile Device nodes with technology `Mobile device`, and only Payment, Email
and Maps external boundaries. Push remains Future/OPEN. Deployment nodes remain
runtime concerns, not Bounded Contexts or one-container-per-BC architecture.
