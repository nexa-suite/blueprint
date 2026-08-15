systemContext nexa "Nexa-SystemContext-Runway" "Nexa Architecture Runway system context" {
    include prospectiveCustomer
    include internalTenantWorkforce
    include b2bBuyer
    include deliveryDriver
    include nexaPlatformAdministrator
    include nexaSupportSpecialist
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

container nexa "Nexa-Containers-Runway" "Nexa Architecture Runway containers" {
    include prospectiveCustomer
    include b2bBuyer
    include internalTenantWorkforce
    include deliveryDriver
    include nexaPlatformAdministrator
    include nexaSupportSpecialist
    include nexa.publicWebsite
    include nexa.internalWebPlatform
    include nexa.buyerPortal
    include nexa.applicationApi
    include nexa.postgresqlDatabase
    include nexa.objectStorage
    include nexa.nexaMobile
    include nexa.driverExperience
    include nexa.nexaControlCenter
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    include googleIdentityProvider
    include appleIdentityProvider
    include linkedinIdentityProvider
    include iotTelemetryProvider
    autolayout lr
}
