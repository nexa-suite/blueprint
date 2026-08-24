component nexa.applicationApi "Nexa-API-Overall-ASIS" "API implementation components evidenced by the read-only audit" {
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

component nexa.applicationApi "Nexa-API-IdentityTenantCustomer-TARGET" "PRE-V1 target identity, Tenant access and Buyer relationship seams" {
    include nexa.applicationApi.apiPresentation
    include nexa.applicationApi.apiAccessContext
    include nexa.applicationApi.apiApplication
    include nexa.applicationApi.apiDomain
    include nexa.applicationApi.targetCommercialCommitment
    include nexa.applicationApi.apiReliability
    autolayout lr
}

component nexa.applicationApi "Nexa-API-CommercialInventory-TARGET" "PRE-V1 target commercial commitment and availability seams" {
    include nexa.applicationApi.apiApplication
    include nexa.applicationApi.apiDomain
    include nexa.applicationApi.targetCommercialCommitment
    include nexa.applicationApi.targetInventoryAvailability
    include nexa.applicationApi.targetCreditReceivables
    include nexa.applicationApi.apiReliability
    include nexa.postgresqlDatabase
    autolayout lr
}

component nexa.applicationApi "Nexa-API-FulfillmentDelivery-TARGET" "PRE-V1 target fulfillment, delivery and continuation seams" {
    include nexa.applicationApi.targetInventoryAvailability
    include nexa.applicationApi.targetFulfillmentDelivery
    include nexa.applicationApi.targetNotificationTraceability
    include nexa.applicationApi.apiReliability
    include nexa.postgresqlDatabase
    autolayout lr
}

component nexa.applicationApi "Nexa-API-CreditPaymentDocuments-TARGET" "PRE-V1 target credit, payment and business evidence seams" {
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

component nexa.internalWebPlatform "Nexa-Platform-Frontend-TARGET" "Platform frontend components: navigation, state, API clients and shared experience" {
    include nexa.internalWebPlatform.platformRouting
    include nexa.internalWebPlatform.platformShell
    include nexa.internalWebPlatform.platformAuthorization
    include nexa.internalWebPlatform.platformFeatureState
    include nexa.internalWebPlatform.platformApiClients
    include nexa.internalWebPlatform.platformSharedExperience
    include nexa.applicationApi.apiPresentation
    autolayout lr
}

component nexa.buyerPortal "Nexa-Portal-Frontend-TARGET" "Buyer Portal frontend components: relationship-aware state and shared experience" {
    include nexa.buyerPortal.portalRouting
    include nexa.buyerPortal.portalShell
    include nexa.buyerPortal.portalAuthorization
    include nexa.buyerPortal.portalFeatureState
    include nexa.buyerPortal.portalApiClients
    include nexa.buyerPortal.portalSharedExperience
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
