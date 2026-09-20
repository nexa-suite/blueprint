systemContext nexa "Nexa-SystemContext-ASIS" "Integrated AS-IS excludes the unmerged Operations Mobile engineering preview; Buyer Mobile is absent" {
    include interestedCompany
    include nexaCommercialStaff
    include companyOwner
    include businessOperationsManager
    include tenantAdministrator
    include salesRepresentative
    include warehouseOperator
    include dispatchCoordinator
    include b2bBuyer
    include nexa
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    autolayout lr
}

systemContext nexa "Nexa-SystemContext-V1-TARGET" "Nexa V1 TARGET system context with owner-accepted Operations and Buyer Mobile surfaces" {
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
    include nexa
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    autolayout lr
}

systemContext nexa "Nexa-SystemContext-Future-Runway" "Nexa future runway with explicitly deferred external integrations" {
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
    include nexa
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    include pushDeliveryService
    include googleIdentityProvider
    include appleIdentityProvider
    include linkedinIdentityProvider
    include iotTelemetryProvider
    autolayout lr
}
