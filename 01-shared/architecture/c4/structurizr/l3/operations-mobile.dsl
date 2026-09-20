component nexa.operationsMobile "Nexa-Operations-Mobile-TARGET" "OWNER-ACCEPTED V1 Operations Mobile construction decomposition; Android/Kotlin/Compose is canonical, while implementation and Product acceptance remain separate gates" {
    include nexa.operationsMobile.operationsPresentation
    include nexa.operationsMobile.operationsApplication
    include nexa.operationsMobile.operationsRepositories
    include nexa.operationsMobile.operationsRemoteDataSource
    include nexa.operationsMobile.operationsLocalState
    include nexa.operationsMobile.operationsDeviceAdapters
    include nexa.operationsMobile.operationsBackgroundRetry
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
