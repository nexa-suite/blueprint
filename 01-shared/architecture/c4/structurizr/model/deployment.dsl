deploymentEnvironment "Local AS-IS" {
    deploymentNode "Developer Machine" {
        technology "macOS workstation"
        deploymentNode "Docker Compose Runtime" {
            technology "Docker Compose"
            containerInstance nexa.publicWebsite
            containerInstance nexa.internalWebPlatform
            containerInstance nexa.buyerPortal
            containerInstance nexa.applicationApi
            containerInstance nexa.postgresqlDatabase
            containerInstance nexa.objectStorage
            infrastructureNode "Mailpit" {
                technology "Local SMTP sink"
            }
            infrastructureNode "ClamAV" {
                technology "Local malware scanner"
            }
            infrastructureNode "OpenTelemetry Collector" {
                technology "Local telemetry collector"
            }
            infrastructureNode "Jaeger" {
                technology "Local trace viewer"
            }
        }
    }
}

deploymentEnvironment "V1 TARGET" {
    deploymentNode "Operations Mobile Device" {
        technology "Mobile device"
        containerInstance nexa.operationsMobile
    }
    deploymentNode "Buyer Mobile Device" {
        technology "Mobile device"
        containerInstance nexa.buyerMobile
    }
    deploymentNode "Provider-neutral Hosting" {
        deploymentNode "Static Web Hosting / CDN" {
            containerInstance nexa.publicWebsite
            containerInstance nexa.internalWebPlatform
            containerInstance nexa.buyerPortal
        }
        deploymentNode "API Compute" {
            containerInstance nexa.applicationApi
        }
        deploymentNode "Managed PostgreSQL" {
            containerInstance nexa.postgresqlDatabase
        }
        deploymentNode "Object Storage" {
            containerInstance nexa.objectStorage
        }
    }
    deploymentNode "External Provider Boundary" {
        softwareSystemInstance paymentProvider
        softwareSystemInstance emailDeliveryService
        softwareSystemInstance mapsGeolocationProvider
    }
}
