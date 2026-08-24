component nexa.buyerMobile "Nexa-Buyer-Mobile-PROPOSED" "Proposed Buyer Mobile projection; not implemented or research-validated" {
    include nexa.buyerMobile.buyerMobileAuth
    include nexa.buyerMobile.buyerMobileCommerce
    include nexa.buyerMobile.buyerMobileSync
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
