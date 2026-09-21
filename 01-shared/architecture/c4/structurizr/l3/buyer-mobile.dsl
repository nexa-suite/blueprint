component nexa.buyerMobile "Nexa-Buyer-Mobile-TARGET" "OWNER-ACCEPTED V1 Buyer Mobile construction decomposition; Flutter/Dart Android+iOS is canonical, the client is not implemented and Product acceptance remains a separate gate" {
    include nexa.buyerMobile.buyerPresentation
    include nexa.buyerMobile.buyerApplication
    include nexa.buyerMobile.buyerRepositories
    include nexa.buyerMobile.buyerRemoteServices
    include nexa.buyerMobile.buyerLocalState
    include nexa.buyerMobile.buyerPlatformAdapters
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
