systemContext nexa "Nexa-SystemContext-V1" "Nexa V1 system context" {
    include prospectiveCustomer
    include internalTenantWorkforce
    include b2bBuyer
    include nexa
    include paymentProvider
    include emailDeliveryService
    include mapsGeolocationProvider
    autolayout lr
}

container nexa "Nexa-Containers-V1" "Nexa V1 containers" {
    include prospectiveCustomer
    include b2bBuyer
    include internalTenantWorkforce
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
