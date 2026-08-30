systemContext nexa "Nexa-SystemContext-ASIS" "Nexa evidenced AS-IS system context; Mobile client not present" {
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

systemContext nexa "Nexa-SystemContext-V1-TARGET" "Nexa V1 TARGET system context with owner-accepted Mobile planning projections" {
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
    include googleIdentityProvider
    include appleIdentityProvider
    include linkedinIdentityProvider
    include iotTelemetryProvider
    autolayout lr
}
