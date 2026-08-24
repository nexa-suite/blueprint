component nexa.buyerPortal "Nexa-Portal-Frontend-TARGET" "Buyer Portal frontend components" {
    include nexa.buyerPortal.portalRouting
    include nexa.buyerPortal.portalShell
    include nexa.buyerPortal.portalAuthorization
    include nexa.buyerPortal.portalFeatureState
    include nexa.buyerPortal.portalApiClients
    include nexa.buyerPortal.portalSharedExperience
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
