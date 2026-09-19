component nexa.buyerMobile "Nexa-Buyer-Mobile-TARGET" "OWNER-ACCEPTED V1 Buyer Mobile target surface; not implemented, final technology and Product Acceptance remain open" {
    include nexa.buyerMobile.buyerMobileAuth
    include nexa.buyerMobile.buyerMobileCommerce
    include nexa.buyerMobile.buyerMobileSync
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
