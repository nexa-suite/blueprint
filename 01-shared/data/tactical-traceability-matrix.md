---
status: draft
maturity: DRAFT
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# Tactical traceability matrix

Coverage maps capabilities and requirement groups to target tactical roots,
relational objects, existing C4 component views and products. It intentionally
does not create one class per User Story.

| BC | Capability / Web epics | Mobile proposed epics | Aggregate Roots | Key target persistence | C4 component view(s) | Main products |
|---|---|---|---|---|---|---|
| BC-01 | onboarding, access; WEB-EPIC-01..03 | MOBILE-EPIC-01 | Tenant, WorkforceMembership, CompanyOnboardingRequest | `tenant`, `workspace`, `human_identity`, `workforce_membership`, `role_definition` | `Nexa-API-IdentityTenantCustomer-TARGET`; platform/frontend; mobile proposed | Website, Platform, Portal, API, both Mobile |
| BC-02 | customer/buyer lifecycle; WEB-EPIC-04 | MOBILE-EPIC-02, 05, 06, 07 | CustomerAccount, BuyerRelationship | `customer_account`, `customer_contact`, `customer_address`, `buyer_relationship` | `Nexa-API-IdentityTenantCustomer-TARGET` | Platform, Portal, API, both Mobile |
| BC-03 | catalog/pricing; WEB-EPIC-05..06 | MOBILE-EPIC-02, 03, 06 | Product, SKU, PriceList, Promotion | `product`, `sku`, `price_list`, `price_list_item`, `customer_terms`, `promotion` | `Nexa-API-CommercialInventory-TARGET` | Platform, Portal, API, both Mobile |
| BC-04 | drafts, PR, SO; WEB-EPIC-06..08 | MOBILE-EPIC-02, 06 | RequestDraft, PurchaseRequest, CommercialCommitment, SalesOrder | `purchase_request`, `commercial_commitment`, `sales_order` and lines | `Nexa-API-CommercialInventory-TARGET` | Platform, Portal, API, both Mobile |
| BC-05 | inventory/warehouse; WEB-EPIC-09 | MOBILE-EPIC-02..05 | InventoryPosition, InventoryBacking, PhysicalAllocation, WarehouseTransfer | `warehouse`, `inventory_lot`, `inventory_position`, `inventory_backing`, `physical_allocation` | `Nexa-API-CommercialInventory-TARGET`; operations proposed | Platform, Portal projections, API, Operations Mobile |
| BC-06 | fulfillment/delivery/cold chain; WEB-EPIC-10..11 | MOBILE-EPIC-03..05, 07 | Fulfillment, Delivery | `fulfillment`, `delivery`, `delivery_attempt`, `proof_of_delivery`, `temperature_evidence` | `Nexa-API-FulfillmentDelivery-TARGET` | Platform, Portal, API, both Mobile |
| BC-07 | credit/receivables; WEB-EPIC-12 | MOBILE-EPIC-02, 06 | CreditAccount, CreditReservation, Receivable, FinancialAdjustment | `credit_account`, `credit_reservation`, `receivable`, `financial_adjustment` | `Nexa-API-CreditPaymentDocuments-TARGET` | Platform, Portal, API, both Mobile projections |
| BC-08 | payment lifecycle; WEB-EPIC-12 | MOBILE-EPIC-06 | Payment | `payment`, `payment_attempt`, `payment_provider_event`, `payment_refund` | `Nexa-API-CreditPaymentDocuments-TARGET` | Platform, Portal, API, Buyer Mobile |
| BC-09 | documents/evidence; WEB-EPIC-13 | MOBILE-EPIC-04..07 | BusinessDocument | `business_document`, `document_revision`, `object_storage_reference` | `Nexa-API-CreditPaymentDocuments-TARGET`; storage component | Platform, Portal, API, both Mobile projections |
| BC-10 | notifications; WEB-EPIC-14 | MOBILE-EPIC-04, 07 | Notification | `notification`, `notification_attempt`, `notification_preference` | `Nexa-API-FulfillmentDelivery-TARGET`; frontend views | Platform, Portal, API, both Mobile |
| BC-11 | traceability/visibility; WEB-EPIC-15 | MOBILE-EPIC-02..07 | BusinessTraceabilityRecord | `business_traceability_record`, `traceability_evidence_reference` | `Nexa-API-FulfillmentDelivery-TARGET`; API overall | Platform, Portal, API, both Mobile projections |

Requirement counts remain canonical: Web 15 Epics / 133 stories; Mobile 7
Epics / 49 proposed stories; Technical 20; Spikes 6; total 208.
