component nexa.applicationApi "Nexa-API-Overall-ASIS" "Observed API technical component view; target semantics remain explicitly separated" {
    include nexa.applicationApi.apiPresentation
    include nexa.applicationApi.apiApplication
    include nexa.applicationApi.apiDomain
    include nexa.applicationApi.apiAccessContext
    include nexa.applicationApi.apiPersistence
    include nexa.applicationApi.apiIntegrations
    include nexa.applicationApi.apiReliability
    include nexa.postgresqlDatabase
    include nexa.objectStorage
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    autolayout lr
}

component nexa.applicationApi "Nexa-API-TechnicalArchitecture-TARGET" "TARGET API technical architecture: presentation, application, domain, access, persistence, integrations and reliability" {
    include nexa.applicationApi.apiPresentation
    include nexa.applicationApi.apiApplication
    include nexa.applicationApi.apiDomain
    include nexa.applicationApi.apiAccessContext
    include nexa.applicationApi.apiPersistence
    include nexa.applicationApi.apiIntegrations
    include nexa.applicationApi.apiReliability
    include nexa.postgresqlDatabase
    include nexa.objectStorage
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    autolayout lr
}

component nexa.applicationApi "Nexa-API-DomainOwnershipMapping-TARGET" "TARGET logical ownership mapping. Bounded Context is not a Java package, Spring Modulith module, C4 Container or PostgreSQL schema." {
    include nexa.applicationApi.apiApplication
    include nexa.applicationApi.apiDomain
    include nexa.applicationApi.targetCommercialCommitment
    include nexa.applicationApi.targetInventoryAvailability
    include nexa.applicationApi.targetFulfillmentDelivery
    include nexa.applicationApi.targetCreditReceivables
    include nexa.applicationApi.targetPaymentDocuments
    include nexa.applicationApi.targetNotificationTraceability
    autolayout lr
}

component nexa.applicationApi "Nexa-API-IdentityTenantCustomer-TARGET" "Target identity, Tenant access and Buyer relationship seams" {
    include nexa.applicationApi.apiPresentation
    include nexa.applicationApi.apiAccessContext
    include nexa.applicationApi.apiApplication
    include nexa.applicationApi.apiDomain
    include nexa.applicationApi.apiReliability
    autolayout lr
}

component nexa.applicationApi "Nexa-API-CommercialInventory-TARGET" "Target Sales Commitment and Inventory Availability seams" {
    include nexa.applicationApi.apiApplication
    include nexa.applicationApi.apiDomain
    include nexa.applicationApi.targetCommercialCommitment
    include nexa.applicationApi.targetInventoryAvailability
    include nexa.applicationApi.targetCreditReceivables
    include nexa.applicationApi.apiReliability
    include nexa.postgresqlDatabase
    autolayout lr
}

component nexa.applicationApi "Nexa-API-FulfillmentDelivery-TARGET" "Target Fulfillment, Dispatch, Delivery and continuation seams" {
    include nexa.applicationApi.targetInventoryAvailability
    include nexa.applicationApi.targetFulfillmentDelivery
    include nexa.applicationApi.targetNotificationTraceability
    include nexa.applicationApi.apiReliability
    include nexa.postgresqlDatabase
    autolayout lr
}

component nexa.applicationApi "Nexa-API-CreditPaymentDocuments-TARGET" "Target Credit, Payments and Business Documents seams" {
    include nexa.applicationApi.targetCreditReceivables
    include nexa.applicationApi.targetPaymentDocuments
    include nexa.applicationApi.targetNotificationTraceability
    include nexa.applicationApi.apiIntegrations
    include nexa.applicationApi.apiReliability
    include nexa.postgresqlDatabase
    include nexa.objectStorage
    include paymentProvider
    autolayout lr
}

component nexa.applicationApi "Nexa-API-IntegrationReliability-ASIS" "Observed provider ACL and durable processing components" {
    include nexa.applicationApi.apiApplication
    include nexa.applicationApi.apiIntegrations
    include nexa.applicationApi.apiReliability
    include nexa.postgresqlDatabase
    include nexa.objectStorage
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    autolayout lr
}
