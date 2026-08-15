nexa = softwareSystem "Nexa" "Multi-tenant B2B SaaS platform coordinating commercial operations, catalog, customer relationships, inventory, fulfillment, delivery and Buyer self-service for importers and distributors, with specialized support for cold-chain operations" {
    publicWebsite = container "Public Website" "Public Nexa discovery, product communication, contact/demo intake and entry into authenticated experiences" "Static HTML/CSS/JavaScript served by Nginx"
    internalWebPlatform = container "Internal Web Platform" "Authenticated Tenant workforce experience for company, customer, catalog, commercial and operational workflows" "Angular 22 SPA served by Nginx"
    buyerPortal = container "Buyer Portal" "Authenticated B2B Buyer experience for catalog, purchasing, order visibility and self-service" "Angular 22 SPA served by Nginx"
    applicationApi = container "Nexa Application API" "Authoritative application and domain behavior, security, tenant enforcement, workflows, integrations and persistence orchestration" "Java 25 / Spring Boot 4.1 / Spring Modulith modular monolith"
    postgresqlDatabase = container "PostgreSQL Database" "Authoritative relational persistence for current Nexa transactional and configuration data" "PostgreSQL" {
        tags "Database"
    }
    objectStorage = container "Object Storage" "Binary object storage for tenant-owned documents and media, accessed through an S3-compatible boundary" "S3-compatible Object Storage" {
        tags "Storage"
    }

    nexaMobile = container "Nexa Mobile" "Future mobile experience for selected Nexa roles and Buyer self-service" "Mobile — Future" {
        tags "Future"
    }
    driverExperience = container "Delivery Driver Experience" "Future driver-specific mobile workflow for delivery execution" "Mobile — Future" {
        tags "Future"
    }
    nexaControlCenter = container "Nexa Control Center" "Future V2 platform administration and support experience" "Web Application — V2/Future" {
        tags "V2/Future"
    }
}
