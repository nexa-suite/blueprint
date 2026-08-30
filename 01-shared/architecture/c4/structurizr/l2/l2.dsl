container nexa "Nexa-Containers-ASIS" "Nexa evidenced AS-IS containers; Mobile client not present" {
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

container nexa "Nexa-Containers-V1-TARGET" "Nexa V1 TARGET containers with owner-accepted Mobile planning projections" {
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
    autolayout lr
}
