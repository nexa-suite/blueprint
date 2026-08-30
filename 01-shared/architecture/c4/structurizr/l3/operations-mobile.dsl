component nexa.operationsMobile "Nexa-Operations-Mobile-TARGET" "V1 TARGET Operations Mobile planning projection for Warehouse, Dispatch and Driver work; client not implemented or research-validated" {
    include nexa.operationsMobile.operationsMobileAuth
    include nexa.operationsMobile.operationsMobileWork
    include nexa.operationsMobile.operationsMobileSync
    include nexa.operationsMobile.operationsMobileEvidence
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
