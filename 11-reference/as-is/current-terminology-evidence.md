# Current terminology evidence — AS-IS

This document describes AS-IS evidence and must not be interpreted as the TARGET domain or technical architecture.

The meanings below are apparent from current code, database names, API contracts, frontend labels, tests and accepted governance. They are not the final Ubiquitous Language.

| Term | Current appearances | Current apparent meaning | Conflict / ambiguity | Related implementation areas |
|---|---|---|---|---|
| Tenant | Governance, IAM/tenant tables, RLS context, API contracts | SaaS customer and maximum observed isolation scope | Overlaps with Organization, Company and Workspace in UI and docs | IAM, tenant management, RLS, all business areas |
| Workspace | Governance, workspace tables/context, selectors and previews | V1 operational environment associated 1:1 with a Tenant | Long-term multiplicity and account-selector semantics are unresolved | IAM, tenant management, frontend shell/preview |
| Organization | Registration, activation, administration APIs and frontend labels | Public/applicant or tenant company identity during onboarding/admin | Used alongside Company and Tenant; lifecycle ownership is not uniform | IAM, tenant management, Platform onboarding |
| Company / Company Owner | Roles, navigation, frontend administration labels | Business-facing organization identity and owner role | Company may mean tenant, organization or client account depending on screen | IAM, tenant management, sales/client accounts |
| User / identity | IAM user/account/session/credential tables and APIs | One Nexa human identity with sessions and credentials | Global Buyer identity direction is accepted but implementation relationship details remain incomplete | IAM, membership, buyer surfaces |
| Membership | Tenant/workspace membership tables, invitations, role tests | User-to-tenant/workspace access relationship | Exact scope and multi-tenant Buyer relationship semantics need discovery | IAM, tenant management, RLS |
| Role | Enum values, role assignment APIs and guards | Coarse current access/persona classification | Role and permission are sometimes used interchangeably in UI copy | IAM, frontend guards/navigation |
| Permission | `PermissionKey`, API authorization and frontend route checks | Fine-grained authorization key | Dotted/colon normalization differs by surface; final policy ownership unresolved | IAM, Platform, Portal |
| Buyer | Role, buyer membership, Portal routes and purchase/tracking tests | External purchaser using Portal | Buyer, user, client-account member and customer may be conflated | IAM, sales, Portal |
| Customer / Client Account | Sales client-account tables/controllers and frontend | Business account served by a Tenant and associated addresses/buyers | Customer is a broader word in docs; client account has current persistence semantics | Sales, buyer association, Portal account |
| Purchase Request | Sales API, tables, events, Platform/Portal labels | Buyer-originated request reviewed by Sales | API and UI also use buyer request/request builder/draft variants | Sales, Platform, Portal |
| Purchase Request Draft / Buyer Request Draft | Draft endpoints/tables and Portal request builder | Editable pre-submission request state | Boundary between draft, request and submitted request is surface-dependent | Sales, Portal |
| Sales Order / Order | Sales order controllers/tables/events and UI | Commercial order after request approval or manual creation | Generic “order” is used alongside explicit Sales Order; buyer order wording varies | Sales, Platform, Portal, outbox |
| Warehouse | Warehouse tables/controllers and Platform routes | Physical/operational storage location | Final relation to fulfillment, dispatch and delivery is unresolved | Warehouse, logistics |
| Zone | Warehouse schema/domain and UI | Sub-location within a warehouse | Operational scope and ownership are not documented beyond current code | Warehouse |
| Lot / Batch | Inventory tables, FEFO and traceability tests | Physical inventory traceability unit | Lot and batch are used near each other; split/traceability semantics need discovery | Warehouse, sales fulfillment |
| Reservation | Warehouse reservation tables/events and APIs | Held stock allocation against commercial demand | Relationship to fulfillment and order state is current implementation evidence only | Warehouse, sales, outbox |
| Fulfillment | Readiness routes/events and UI | Operational state that stock/order is ready for dispatch | May refer to readiness, allocation or process; no final definition | Warehouse, logistics |
| Dispatch | Logistics tables/controllers/events and Platform UI | Outbound operational movement after readiness | Overlaps with delivery, route and handoff | Logistics, warehouse, Portal tracking |
| Delivery | Logistics delivery/POD/tracking APIs and Portal | Customer-facing movement and completion state | Dispatch and delivery are distinct in some code but not consistently in language | Logistics, Portal |
| Route | Logistics fields and maps/geolocation integration | Planned movement path or delivery assignment | Final ownership and external provider contract are unresolved | Logistics |
| POD | Proof-of-delivery tables/controllers and UI | Delivery evidence/metadata | Could be a logistics state, document or evidence object | Logistics, invoicing/documents |
| Invoice / Receivable | Invoicing/payment schemas, APIs and UI | Financial document or amount owed | Current names distinguish business documents, invoice drafts and receivables; final financial model is open | Invoicing, payments, Portal |
| Payment / Credit | Payment tables/controllers, Stripe mock and Portal | Payment intent/attempt/event and account credit behavior | Provider, credit, receivable and allocation responsibilities are not finalized | Payments, invoicing |
| Document / Evidence | Business document and evidence object tables, APIs, storage/scanning | Generated/downloadable business artifact or supporting object | Ownership, retention and fiscal status are unresolved | Invoicing, storage, logistics |
| Notification | Notification inbox, outbox workers, Mailpit and frontend services | User-facing or security message/projection | External delivery, preferences and ownership unresolved | Notifications, IAM, all frontend surfaces |
| Audit | Audit schema/controller/events and security audit tests | Trace record of security/business action | Completeness, retention and ownership unresolved | Audit, IAM, all application areas |

## Explicit semantic collisions

1. `Tenant`, `Workspace`, `Organization` and `Company` are all present and overlap in identity, administration and selector surfaces.
2. `Buyer`, `User`, `Membership`, `Client Account` and `Customer` describe related but not fully separated concepts across API and Portal.
3. `Purchase Request`, `Purchase Request Draft`, `Buyer Request` and `Request Builder` describe stages and UI aliases that require business discovery.
4. `Sales Order`, `Order`, `Dispatch`, `Delivery`, `Route` and `POD` form a current cross-area lifecycle vocabulary but do not establish final ownership boundaries.
5. `Document`, `Evidence`, `Invoice`, `Receivable`, `Payment` and `Credit` have separate current implementation artifacts, while final financial/document ownership is intentionally unresolved.
