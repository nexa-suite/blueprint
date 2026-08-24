container nexa "Nexa-Containers-V1" "Nexa current web containers" {
    include interestedCompany
    include nexaCommercialStaff
    include companyOwner
    include businessOperationsManager
    include tenantAdministrator
    include salesRepresentative
    include warehouseOperator
    include dispatchCoordinator
    include b2bBuyer
    include nexa.publicWebsite
    include nexa.internalWebPlatform
    include nexa.buyerPortal
    include nexa.applicationApi
    include nexa.postgresqlDatabase
    include nexa.objectStorage
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    autolayout lr
}

container nexa "Nexa-Containers-Runway" "Nexa containers with proposed Mobile projection" {
    include interestedCompany
    include nexaCommercialStaff
    include companyOwner
    include businessOperationsManager
    include tenantAdministrator
    include salesRepresentative
    include warehouseOperator
    include dispatchCoordinator
    include b2bBuyer
    include driverDeliveryOperator
    include nexa.publicWebsite
    include nexa.internalWebPlatform
    include nexa.buyerPortal
    include nexa.applicationApi
    include nexa.postgresqlDatabase
    include nexa.objectStorage
    include nexa.operationsMobile
    include nexa.buyerMobile
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    include googleIdentityProvider
    include appleIdentityProvider
    include linkedinIdentityProvider
    include iotTelemetryProvider
    autolayout lr
}
