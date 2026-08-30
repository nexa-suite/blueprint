component nexa.buyerMobile "Nexa-Buyer-Mobile-TARGET" "V1 TARGET Buyer Mobile planning projection; client not implemented or research-validated" {
    include nexa.buyerMobile.buyerMobileAuth
    include nexa.buyerMobile.buyerMobileCommerce
    include nexa.buyerMobile.buyerMobileSync
    include nexa.applicationApi.apiPresentation
    autolayout lr
}
