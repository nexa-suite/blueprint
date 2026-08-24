component nexa.internalWebPlatform "Nexa-Platform-Frontend-TARGET" "Platform frontend components" {
    include nexa.internalWebPlatform.platformRouting
    include nexa.internalWebPlatform.platformShell
    include nexa.internalWebPlatform.platformAuthorization
    include nexa.internalWebPlatform.platformFeatureState
    include nexa.internalWebPlatform.platformApiClients
    include nexa.internalWebPlatform.platformSharedExperience
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
