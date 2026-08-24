paymentProvider = softwareSystem "Payment Provider" "Abstract external payment processing service; provider identity is an implementation decision"
emailDeliveryService = softwareSystem "Email Delivery Service" "Abstract external email delivery service"
mapsGeolocationProvider = softwareSystem "Maps & Geolocation Provider" "Abstract external maps and geolocation service"

googleIdentityProvider = softwareSystem "Google Identity Provider" "Future optional identity provider; not a V1 production integration" {
    tags "External System,Future"
}
appleIdentityProvider = softwareSystem "Apple Identity Provider" "Future optional identity provider; not a V1 production integration" {
    tags "External System,Future"
}
linkedinIdentityProvider = softwareSystem "LinkedIn Identity Provider" "Future optional identity provider; not a V1 production integration" {
    tags "External System,Future"
}
iotTelemetryProvider = softwareSystem "IoT / Telemetry Integrations" "Future sensor and telemetry integration surface; not a V1 implementation" {
    tags "External System,Future"
}
