paymentProvider = softwareSystem "Payment Provider" "External payment processing service" {
    tags "External System"
}
emailDeliveryService = softwareSystem "Email Delivery Service" "External email delivery service" {
    tags "External System"
}
mapsGeolocationProvider = softwareSystem "Maps & Geolocation Provider" "External maps and geolocation service" {
    tags "External System"
}

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
