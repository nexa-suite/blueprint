container nexa "Nexa-Containers-ASIS" "Integrated AS-IS containers exclude the unmerged Operations Mobile preview; Buyer Mobile is absent" {
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

container nexa "Nexa-Containers-V1-TARGET" "Nexa V1 TARGET containers with owner-accepted Operations and Buyer Mobile surfaces" {
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
