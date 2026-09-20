nexa = softwareSystem "Nexa" "Multi-tenant B2B SaaS platform coordinating B2B commercial commitments, inventory availability, fulfillment and delivery for importers and distributors" {
publicWebsite = container "Nexa Website" "Public product discovery, Contact/Request Demo intake and entry into authenticated experiences" "Static Web / Nginx" {
    websitePublicExperience = component "Public Experience and Intake" "Public content, Contact/Request Demo boundary and authentication entry" "Static web boundary" {
        tags "AS-IS / TARGET"
    }
}
applicationApi = container "Nexa API" "Authoritative application and domain behavior, tenant enforcement, workflows, integrations and persistence orchestration" "Java 25 / Spring Boot 4.1 / Spring Modulith" {
    apiPresentation = component "API Presentation" "REST controllers, webhook endpoints and Problem Details translation" "Spring MVC / REST"
    apiApplication = component "Application Use Cases" "Commands, queries, transactions and ports coordinating business workflows" "Java application layer"
    apiDomain = component "Domain Policies / Invariants" "Framework-free domain models, policies, state transitions and invariant decisions" "Java domain layer"
    apiAccessContext = component "Tenant Access Context" "Identity, Tenant/Workspace, membership, relationship and capability context" "Spring Security / application context"
    apiPersistence = component "Persistence Adapters" "Scoped repositories, mappings, Flyway-backed state and RLS boundary" "JDBC / JPA / PostgreSQL"
    apiIntegrations = component "External Integration Adapters" "Payment, email, maps, storage and device capability ACLs" "Ports and adapters"
    apiReliability = component "Reliability / Outbox / Inbox / Projections" "Durable events, leases, fencing, retries, reconciliation and change-feed projections" "Transactional outbox/inbox"
    targetCommercialCommitment = component "Sales Commitment" "Logical ownership mapping lens for Purchase Request, Commercial Commitment and Sales Order; BC != Java package, Spring Modulith module, C4 Container or PostgreSQL schema" "Domain ownership mapping"
    targetInventoryAvailability = component "Inventory Availability" "Logical ownership mapping lens for sellable availability, backing and Physical Allocation; BC != Java package, Spring Modulith module, C4 Container or PostgreSQL schema" "Domain ownership mapping"
    targetFulfillmentDelivery = component "Fulfillment and Delivery" "Logical ownership mapping lens for fulfillment, dispatch, delivery, POD and continuation; BC != Java package, Spring Modulith module, C4 Container or PostgreSQL schema" "Domain ownership mapping"
    targetCreditReceivables = component "Credit and Receivables" "Logical ownership mapping lens for credit, reservation, receivable and correction; BC != Java package, Spring Modulith module, C4 Container or PostgreSQL schema" "Domain ownership mapping"
    targetPaymentDocuments = component "Payments and Business Documents Lens" "Logical ownership mapping lens for distinct Payments and Business Documents contexts; BC != Java package, Spring Modulith module, C4 Container or PostgreSQL schema" "Domain ownership mapping"
    targetNotificationTraceability = component "Notifications and Business Traceability Lens" "Logical ownership mapping lens for distinct Notifications and Business Traceability contexts; BC != Java package, Spring Modulith module, C4 Container or PostgreSQL schema" "Domain ownership mapping"
}
internalWebPlatform = container "Nexa Platform" "Authenticated Tenant workforce experience for governance, commercial and physical operations" "Angular 22 / TypeScript" {
    platformRouting = component "Routing and Guards" "Lazy routes, authentication, surface and capability navigation" "Angular Router"
    platformShell = component "Platform Shell" "Internal workforce shell, navigation and responsive layout" "Angular standalone components"
    platformAuthorization = component "Authorization Experience" "Capability-aware menus and action visibility; API remains authoritative" "Angular guards and policies"
    platformFeatureState = component "Feature State" "Feature facades/signals for IAM, sales, catalog, warehouse and logistics" "Angular signals/facades"
    platformApiClients = component "Platform API Clients" "Typed HTTP clients, concurrency headers, idempotency and Problem Details mapping" "HttpClient / OpenAPI-aligned DTOs"
    platformSharedExperience = component "Shared Experience" "Loading, empty, error, forbidden, stale, conflict, i18n and accessibility primitives" "Angular Material"
}
buyerPortal = container "Nexa Buyer Portal" "Authenticated B2B Buyer experience for catalog, purchasing, order visibility and self-service" "Angular 22 / TypeScript" {
    portalRouting = component "Routing and Guards" "Buyer routes, authentication, surface and relationship navigation" "Angular Router"
    portalShell = component "Portal Shell" "Buyer shell, navigation and responsive self-service layout" "Angular standalone components"
    portalAuthorization = component "Authorization Experience" "Relationship-aware navigation and visibility; API remains authoritative" "Angular guards and policies"
    portalFeatureState = component "Feature State" "Feature facades/signals for catalog, requests, orders, delivery, documents and payments" "Angular signals/facades"
    portalApiClients = component "Portal API Clients" "Typed Buyer projections, concurrency headers, idempotency and Problem Details mapping" "HttpClient / OpenAPI-aligned DTOs"
    portalSharedExperience = component "Shared Experience" "Loading, empty, error, forbidden, stale, conflict, i18n and accessibility primitives" "Angular Material"
}
postgresqlDatabase = container "PostgreSQL" "Authoritative relational persistence for current Nexa transactional and configuration data" "PostgreSQL"
objectStorage = container "Object Storage" "Tenant-owned documents, media and evidence through an S3-compatible boundary" "S3-compatible Object Storage"

operationsMobile = container "Nexa Operations Mobile" "TARGET V1 / OWNER-ACCEPTED surface for Warehouse, Dispatch and Driver work. Partial unmerged Android/Kotlin/Compose work remains AS-IS evidence; the canonical construction technology is accepted, while implementation and Product acceptance remain separate gates." "Android / Kotlin / Jetpack Compose" {
    tags "TARGET V1,OWNER-ACCEPTED"
    operationsPresentation = component "Operations Presentation" "Compose UI, navigation, ViewModels, UiState, UiActions and accessible loading/error/stale/conflict states" "Jetpack Compose"
    operationsApplication = component "Operations Application / Use Cases" "Workflow orchestration, command preparation, freshness checks, explicit retry decisions and idempotency-key reuse; no server-domain authority" "Kotlin application layer"
    operationsRepositories = component "Operations Repositories" "Client data boundary, remote/local mediation, safe cache/staging and mapping" "Kotlin repositories"
    operationsRemoteDataSource = component "Nexa API Remote Data Source" "Nexa API contracts only" "HTTPS/JSON"
    operationsLocalState = component "Operations Local State & Staging" "DataStore, Room only where structured persistence is justified, temporary evidence/drafts/retry metadata; no authoritative business truth and no generic offline synchronization" "Android client-local storage"
    operationsDeviceAdapters = component "Device Capability Adapters" "Camera, Barcode/QR input, secure storage/Keystore, external navigation and connectivity; camera evidence is optional and policy-authorized" "Android platform adapters"
    operationsBackgroundRetry = component "Background Retry / Work Coordinator" "WorkManager-style persistent retries only for safe retryable client work; refetches and revalidates server state" "Android WorkManager-style coordination"
}
buyerMobile = container "Nexa Buyer Mobile" "TARGET V1 / OWNER-ACCEPTED surface for critical Delivery updates, handoff, receipt and discrepancy. The client is not implemented; Flutter/Dart Android+iOS is the accepted construction technology and Product acceptance remains a separate gate." "Flutter / Dart / Android + iOS" {
    tags "TARGET V1,OWNER-ACCEPTED"
    buyerPresentation = component "Buyer Presentation" "Flutter Views/Widgets, ViewModels, UI state/actions and navigation" "Flutter presentation"
    buyerApplication = component "Buyer Application / Use Cases" "Delivery attention, handoff verification, receipt/discrepancy preparation and selected commercial/financial convenience flows under server authority" "Dart application layer"
    buyerRepositories = component "Buyer Repositories" "Safe client state, refresh, mapping and retry/error handling" "Dart repositories"
    buyerRemoteServices = component "Nexa API Remote Services" "Portal/Nexa API native-client contracts" "HTTPS/JSON"
    buyerLocalState = component "Buyer Local State & Drafts" "Safe recent projections, harmless receipt/discrepancy drafts, freshness/retry metadata and no business authority" "Flutter client-local storage"
    buyerPlatformAdapters = component "Buyer Platform Adapters" "Camera/QR input, secure platform storage, deep links and notifications only when accepted" "Flutter platform adapters"
}
}
