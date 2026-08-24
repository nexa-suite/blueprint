systemContext nexa "Nexa-SystemContext-V1" "Nexa current web system context" {
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

systemContext nexa "Nexa-SystemContext-Runway" "Nexa system context with proposed Mobile projection" {
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
    include googleIdentityProvider
    include appleIdentityProvider
    include linkedinIdentityProvider
    include iotTelemetryProvider
    autolayout lr
}
