nexa = softwareSystem "Nexa" "Multi-tenant B2B SaaS platform coordinating B2B commercial commitments, inventory availability, fulfillment and delivery for importers and distributors" {
publicWebsite = container "Nexa Website" "Public product discovery, Contact/Request Demo intake and entry into authenticated experiences" "Static HTML/CSS/JavaScript served by Nginx" {
    websitePublicExperience = component "Public Experience and Intake" "Public content, Contact/Request Demo boundary and authentication entry" "Static web boundary" {
        tags "AS-IS / TARGET"
    }
}
applicationApi = container "Nexa API" "Authoritative application and domain behavior, tenant enforcement, workflows, integrations and persistence orchestration" "Java 25 / Spring Boot 4.1 / Spring Modulith modular monolith" {
    apiPresentation = component "API Presentation" "REST controllers, webhook endpoints and Problem Details translation" "Spring MVC / REST"
    apiApplication = component "Application Use Cases and Ports" "Commands, queries, transactions and ports coordinating business workflows" "Java application layer"
    apiDomain = component "Domain Policies and Lifecycles" "Framework-free domain models, policies, state transitions and invariant decisions" "Java domain layer"
    apiAccessContext = component "Tenant Access Context" "Identity, Tenant/Workspace, membership, relationship and capability context" "Spring Security / application context"
    apiPersistence = component "Tenant-aware Persistence Adapters" "Scoped repositories, mappings, Flyway-backed state and RLS boundary" "JDBC / JPA / PostgreSQL"
    apiIntegrations = component "Provider and Device Adapters" "Payment, email, maps, storage and scanning/location ACLs" "Ports and adapters"
    apiReliability = component "Outbox, Inbox and Projections" "Durable events, leases, fencing, retries, reconciliation and change-feed projections" "Transactional outbox/inbox"
    targetCommercialCommitment = component "Sales Commitment" "TARGET logical seam for Purchase Request, Commercial Commitment and Sales Order" "PRE-V1 target logical component"
    targetInventoryAvailability = component "Inventory Availability" "TARGET logical seam for sellable availability, backing and Physical Allocation authority" "PRE-V1 target logical component"
    targetFulfillmentDelivery = component "Fulfillment and Delivery" "TARGET logical seam for fulfillment, dispatch, delivery, POD and continuation" "PRE-V1 target logical component"
    targetCreditReceivables = component "Credit and Receivables" "TARGET logical seam for credit, reservation, receivable and correction" "PRE-V1 target logical component"
    targetPaymentDocuments = component "Payments and Business Documents Lens" "TARGET technical lens for distinct Payments and Business Documents contexts" "PRE-V1 target logical component"
    targetNotificationTraceability = component "Notifications and Business Traceability Lens" "TARGET technical lens for distinct Notifications and Business Traceability contexts" "PRE-V1 target logical component"
}
internalWebPlatform = container "Nexa Platform" "Authenticated Tenant workforce experience for governance, commercial and physical operations" "Angular 22 SPA served by Nginx" {
    platformRouting = component "Routing and Guards" "Lazy routes, authentication, surface and capability navigation" "Angular Router"
    platformShell = component "Platform Shell" "Internal workforce shell, navigation and responsive layout" "Angular standalone components"
    platformAuthorization = component "Authorization Experience" "Capability-aware menus and action visibility; API remains authoritative" "Angular guards and policies"
    platformFeatureState = component "Feature State" "Feature facades/signals for IAM, sales, catalog, warehouse and logistics" "Angular signals/facades"
    platformApiClients = component "Platform API Clients" "Typed HTTP clients, concurrency headers, idempotency and Problem Details mapping" "HttpClient / OpenAPI-aligned DTOs"
    platformSharedExperience = component "Shared Experience" "Loading, empty, error, forbidden, stale, conflict, i18n and accessibility primitives" "Angular Material"
}
buyerPortal = container "Nexa Buyer Portal" "Authenticated B2B Buyer experience for catalog, purchasing, order visibility and self-service" "Angular 22 SPA served by Nginx" {
    portalRouting = component "Routing and Guards" "Buyer routes, authentication, surface and relationship navigation" "Angular Router"
    portalShell = component "Portal Shell" "Buyer shell, navigation and responsive self-service layout" "Angular standalone components"
    portalAuthorization = component "Authorization Experience" "Relationship-aware navigation and visibility; API remains authoritative" "Angular guards and policies"
    portalFeatureState = component "Feature State" "Feature facades/signals for catalog, requests, orders, delivery, documents and payments" "Angular signals/facades"
    portalApiClients = component "Portal API Clients" "Typed Buyer projections, concurrency headers, idempotency and Problem Details mapping" "HttpClient / OpenAPI-aligned DTOs"
    portalSharedExperience = component "Shared Experience" "Loading, empty, error, forbidden, stale, conflict, i18n and accessibility primitives" "Angular Material"
}
postgresqlDatabase = container "PostgreSQL" "Authoritative relational persistence for current Nexa transactional and configuration data" "PostgreSQL"
objectStorage = container "Object Storage" "Tenant-owned documents, media and evidence through an S3-compatible boundary" "S3-compatible Object Storage"

operationsMobile = container "Nexa Operations Mobile" "TARGET V1 planning projection for Warehouse, Dispatch and Driver delivery work; client NOT STARTED" "Mobile client — framework not selected" {
    tags "TARGET V1,PLANNED,PROPOSED"
    operationsMobileAuth = component "Authentication and Active Context" "Secure session, tenant/workspace context and capability-driven entry" "PROPOSED mobile component"
    operationsMobileWork = component "Warehouse, Dispatch and Driver Work" "V1 product identification, receiving, FEFO/picking, dispatch handoff and Driver Delivery execution" "PROPOSED mobile component"
    operationsMobileSync = component "Connectivity and Evidence Recovery" "V1 safe cache, harmless drafts, temporary evidence staging and retry/conflict states; no generic offline authority" "PROPOSED mobile component"
    operationsMobileEvidence = component "Physical Capture and Handoff" "V1 package/label input, temperature/POD evidence and bounded handoff code; no stored location" "PROPOSED integration component"
}
buyerMobile = container "Nexa Buyer Mobile" "TARGET V1 planning projection for critical Delivery updates, handoff, receipt and discrepancy; client NOT STARTED" "Mobile client — framework not selected" {
    tags "TARGET V1,PLANNED,PROPOSED"
    buyerMobileAuth = component "Buyer Authentication and Relationship Context" "Buyer identity, active supplier relationship and authorized Delivery context" "PROPOSED mobile component"
    buyerMobileCommerce = component "Handoff and Receipt Work" "V1 handoff verification, actual quantity receipt and discrepancy reporting" "PROPOSED mobile component"
    buyerMobileSync = component "Critical Delivery Updates" "V1 relevant Delivery updates, freshness and refresh; no notification-driven mutation" "PROPOSED mobile component"
}
}
