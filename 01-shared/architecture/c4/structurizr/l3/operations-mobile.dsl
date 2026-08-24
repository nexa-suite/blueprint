component nexa.operationsMobile "Nexa-Operations-Mobile-PROPOSED" "Proposed Operations Mobile projection; not implemented or research-validated" {
    include nexa.operationsMobile.operationsMobileAuth
    include nexa.operationsMobile.operationsMobileWork
    include nexa.operationsMobile.operationsMobileSync
    include nexa.operationsMobile.operationsMobileEvidence
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
