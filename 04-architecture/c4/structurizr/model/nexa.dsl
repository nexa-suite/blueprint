nexa = softwareSystem "Nexa" "Multi-tenant B2B SaaS platform coordinating commercial operations, catalog, customer relationships, inventory, fulfillment, delivery and Buyer self-service for importers and distributors, with specialized support for cold-chain operations" {
    publicWebsite = container "Public Website" "Public Nexa discovery, product communication, contact/demo intake and entry into authenticated experiences" "Static HTML/CSS/JavaScript served by Nginx"
    applicationApi = container "Nexa Application API" "Authoritative application and domain behavior, security, tenant enforcement, workflows, integrations and persistence orchestration" "Java 25 / Spring Boot 4.1 / Spring Modulith modular monolith" {
        apiPresentation = component "API Presentation" "REST controllers, webhook endpoints and Problem Details translation" "Spring MVC / REST" {
            tags "AS-IS"
        }
        apiApplication = component "Application Use Cases and Ports" "Commands, queries, transactions and ports coordinating business workflows" "Java application layer" {
            tags "AS-IS / TARGET"
        }
        apiDomain = component "Framework-free Domain Policies" "Domain models, policies, state transitions and invariant decisions" "Java domain layer" {
            tags "AS-IS / TARGET"
        }
        apiAccessContext = component "Tenant Access Context Resolver" "Global identity, Tenant/Workspace, membership, relationship and capability context" "Spring Security / application context" {
            tags "AS-IS / TARGET"
        }
        apiPersistence = component "Tenant-aware Persistence Adapters" "Scoped repositories, JDBC/JPA mappings, Flyway-backed state and RLS boundary" "JDBC / JPA / PostgreSQL" {
            tags "AS-IS / TARGET"
        }
        apiIntegrations = component "Provider Adapters" "Payment, email, maps, storage and scanning ACLs" "Ports and adapters" {
            tags "AS-IS / TARGET"
        }
        apiReliability = component "Outbox Inbox and Projections" "Durable events, leases, fencing, retries, reconciliation and change-feed projections" "Transactional outbox/inbox" {
            tags "AS-IS / TARGET"
        }
        targetCommercialCommitment = component "Sales Commitment" "Proposed Purchase Request, Sales Order and commitment application boundary" "Target logical component — proposed" {
            tags "TARGET / PROPOSED"
        }
        targetInventoryAvailability = component "Inventory Availability" "Proposed stock, reservation, allocation and FEFO application boundary" "Target logical component — proposed" {
            tags "TARGET / PROPOSED"
        }
        targetFulfillmentDelivery = component "Fulfillment and Delivery" "Proposed fulfillment, dispatch, delivery, POD and continuation boundary" "Target logical component — proposed" {
            tags "TARGET / PROPOSED"
        }
        targetCreditReceivables = component "Credit and Receivables" "Proposed exposure, credit, receivable and posting boundary" "Target logical component — proposed" {
            tags "TARGET / PROPOSED"
        }
        targetPaymentDocuments = component "Payments and Business Documents" "Proposed payment, provider ACL, document and evidence boundary" "Target logical component — proposed" {
            tags "TARGET / PROPOSED"
        }
        targetNotificationTraceability = component "Notification and Traceability" "Proposed notification, audit and change-feed boundary" "Target logical component — proposed" {
            tags "TARGET / PROPOSED"
        }
    }
    internalWebPlatform = container "Internal Web Platform" "Authenticated Tenant workforce experience for company, customer, catalog, commercial and operational workflows" "Angular 22 SPA served by Nginx" {
        platformRouting = component "Platform Routing and Guards" "Lazy routes, authentication, surface and capability navigation controls" "Angular Router" {
            tags "AS-IS / TARGET"
        }
        platformShell = component "Platform Shell" "Internal workforce shell, navigation and responsive layout" "Angular standalone components" {
            tags "AS-IS / TARGET"
        }
        platformAuthorization = component "Platform Authorization Experience" "Capability-aware menus and action visibility; API remains authoritative" "Angular guards and policies" {
            tags "AS-IS / TARGET"
        }
        platformFeatureState = component "Platform Feature State" "Feature facades/signals for IAM, sales, catalog, warehouse and logistics" "Angular signals/facades" {
            tags "AS-IS / TARGET"
        }
        platformApiClients = component "Platform API Clients" "Typed HTTP clients, concurrency headers, idempotency and Problem Details mapping" "HttpClient / OpenAPI-aligned DTOs" {
            tags "AS-IS / TARGET"
        }
        platformSharedExperience = component "Platform Shared Experience" "Loading, empty, error, forbidden, stale, conflict, i18n and accessibility primitives" "Angular Material / shared components" {
            tags "AS-IS / TARGET"
        }
    }
    buyerPortal = container "Buyer Portal" "Authenticated B2B Buyer experience for catalog, purchasing, order visibility and self-service" "Angular 22 SPA served by Nginx" {
        portalRouting = component "Portal Routing and Guards" "Buyer routes, authentication, surface and relationship navigation controls" "Angular Router" {
            tags "AS-IS / TARGET"
        }
        portalShell = component "Portal Shell" "Buyer shell, navigation and responsive self-service layout" "Angular standalone components" {
            tags "AS-IS / TARGET"
        }
        portalAuthorization = component "Portal Authorization Experience" "Relationship-aware navigation and visibility; API remains authoritative" "Angular guards and policies" {
            tags "AS-IS / TARGET"
        }
        portalFeatureState = component "Portal Feature State" "Feature facades/signals for catalog, requests, orders, delivery, documents and payments" "Angular signals/facades" {
            tags "AS-IS / TARGET"
        }
        portalApiClients = component "Portal API Clients" "Typed Buyer projections, concurrency headers, idempotency and Problem Details mapping" "HttpClient / OpenAPI-aligned DTOs" {
            tags "AS-IS / TARGET"
        }
        portalSharedExperience = component "Portal Shared Experience" "Loading, empty, error, forbidden, stale, conflict, i18n and accessibility primitives" "Angular Material / shared components" {
            tags "AS-IS / TARGET"
        }
    }
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
