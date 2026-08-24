# Legacy to Modern diff

Current direction below comes from `00-governance/source-of-truth.md`, `00-governance/current-decisions.md` and user-provided current product differences. Legacy wording remains unchanged in source; this file compares it explicitly.

| Topic | Legacy assumption | Current accepted direction | Conflict? | Potential useful evidence | Action |
|---|---|---|---|---|---|
| Product positioning | Cold-chain B2B web MVP for importers/distributors. | Generic multi-tenant B2B SaaS ERP/CRM for importers/distributors; cold-chain strength, not exclusive boundary. | CONFLICTS_WITH_CURRENT | Sector pains and specialization signal. | Keep pain evidence; revalidate broader segments. |
| Tenant | Tenant/workspace often used as one company space. | Tenant is SaaS customer/isolation boundary; V1 Tenant 1:1 Workspace, concepts distinct. | CONFLICTS_WITH_CURRENT | Need for isolation and organization setup. | Review terms; do not equate concepts. |
| Workspace | Operational tenant/workspace with slug and settings. | Complete operational environment of Tenant; not C4 Container; multiple workspaces deferred. | PARTIAL | Onboarding and navigation evidence. | Adapt UX language later. |
| Organization onboarding | Public founder self-registers, selects slug and plan, requests activation. | Public request does not auto-create Tenant; approved-assisted provisioning direction. | CONFLICTS_WITH_CURRENT | Evidence for intake, eligibility questions and pending state. | Keep as research hypothesis only. |
| Identity | Workspace slug + email + password; tenant members. | Nexa Identity global; one human one identity; buyer relationships can span Tenants. | CONFLICTS_WITH_CURRENT | Need for access clarity. | Revalidate identity journeys. |
| Roles | Account Owner/Operations combined; Company Owner manages technical and business settings. | Company Owner, Tenant Administrator and Business Operations Manager distinct. | CONFLICTS_WITH_CURRENT | Role/task separation clues. | Split responsibilities during DDD. |
| Buyer | Buyer profile/client is mainly tenant-owned. | Buyer may have commercial relationships with multiple Tenants; workforce membership and Buyer relationship separate. | CONFLICTS_WITH_CURRENT | Buyer autonomy and trust evidence. | Explore reusable/global identity and relationship semantics. |
| Customer Account | Client Account tied to provider workspace, credit and conditions. | Customer Account semantics require current domain validation; not automatically a workforce member. | PARTIAL | Credit and commercial relationship tasks. | Language review. |
| Catalog | Refrigerated products/cheese/charcuterie catalog. | Product/SKU direction subject to domain validation; Brand and Category Tenant-scoped; shared product semantics not assumed. | PARTIAL | Product discovery, filters and detail needs. | Revalidate product/SKU, brand/category boundaries. |
| Product/SKU | Product internal code treated as core item identity. | Product/SKU direction remains subject to domain validation. | UNCERTAIN | Need for code, unit, lot and presentation visibility. | Use as collision input only. |
| Brand | Source glossary/product model can imply catalog-owned brand. | Brand Tenant-scoped. | CONFLICTS_WITH_CURRENT where shared/global. | Brand filters and product detail. | Do not reuse global semantics. |
| Category | Product category tied to cold/frozen categories. | Category Tenant-scoped. | CONFLICTS_WITH_CURRENT where global. | Filter/task evidence. | Revalidate tenant ownership. |
| Pricing | Buyer sees net price; Sales reviews credit; plans/discounts/promotions present. | Price Lists V1; Sales cannot arbitrarily override authoritative pricing. | CONFLICTS_WITH_CURRENT | Need for visible conditions and pricing trust. | Preserve need, drop arbitrary override semantics. |
| Purchase Request | Buyer request becomes Purchase Order after commercial validation. | Purchase Request and Sales Order are distinct current concepts; terminology/domain validation required. | CONFLICTS_WITH_CURRENT | Review/observe/reject workflow. | Do not call request a purchase order. |
| Sales Order | Legacy often calls confirmed customer order Purchase Order. | Sales Order is current business concept; buyer-originated request must not be silently renamed. | CONFLICTS_WITH_CURRENT | Confirmation and state visibility. | Resolve in Ubiquitous Language. |
| Inventory | Stock availability often means what can be assigned. | Physical stock differs from sellable availability. | CONFLICTS_WITH_CURRENT | Repeated stock mismatch pain. | Preserve distinction as discovery input. |
| Reservation | Reservation connects request/order to lots before dispatch. | Current reservation semantics require domain validation; no legacy automatic rule accepted. | PARTIAL | Need for committed availability. | Explore event and rule behavior. |
| Lot | Inventory lot supports expiry and FEFO. | Current accepted rule: one physical Lot belongs to one Warehouse at a time; split source batches retain traceability when needed. | PARTIAL | FEFO and traceability evidence. | Carry as evidence; validate full model. |
| FEFO | Core cold-chain dispatch rule, sometimes presented as system automation. | Cold-chain specialization evidence; no claim of full automation without current validation. | PARTIAL | Expiry-driven task pressure. | Explore operational rule later. |
| Warehouse | Camera/warehouse is operational area/workspace in some source language. | Warehouse is a domain concept distinct from Tenant/Workspace. | CONFLICTS_WITH_CURRENT where merged. | Physical preparation and lot evidence. | Clarify term in DDD. |
| Fulfillment | Picking, lot assignment and dispatch grouped under Logistics/Warehouse. | Not yet decomposed into current bounded contexts. | UNCERTAIN | End-to-end workflow evidence. | Input to Capability Mapping/EventStorming only. |
| Dispatch | Dispatch is outbound movement with status and temperature. | Current concept requires domain validation; no legacy BC boundary reused. | PARTIAL | Status, incident and visibility needs. | Keep event candidates; do not decide events now. |
| Delivery | Delivery is final receipt; POD confirms. | POD/delivery behavior requires current V1 validation; mobile future scope. | PARTIAL | Need for closure evidence. | Revalidate proof, actor and evidence. |
| POD | Digital signature/photo evidence expected. | Mobile is runway/future; no unverified signature/GPS capability. | CONFLICTS_WITH_CURRENT_SCOPE | Historical closure pain. | Keep as future/test hypothesis. |
| Cold-chain | Product boundary is refrigerated/frozen distribution. | Strong specialization, not exclusive boundary; current SaaS serves broader importers/distributors. | CONFLICTS_WITH_CURRENT | Useful operational context. | Preserve qualifier. |
| Payments | Payment status/method/card and manual reconciliation often referential/simulated. | Payment is domain concept; Stripe is provider adapter; current V1 boundaries prevail. | CONFLICTS_WITH_CURRENT | Administrative visibility and reconciliation pain. | Do not import provider/model semantics. |
| Documents | XML/PDF invoices/guides described as referential but appear in workflows. | Documents need explicit current contract; no fiscal/tributary assumption. | PARTIAL | Strong usability/traceability findings. | Preserve user need and caveat. |
| Notifications | Alerts, email and WhatsApp support coexist. | Current notification behavior requires product validation; no legacy channels authoritative. | UNCERTAIN | Users need visible state and exception communication. | Explore notification policy later. |
| Analytics | Operational dashboard and reports across orders/stock/dispatch. | Analytics scope not a current bounded context decision. | UNCERTAIN | Need for prioritization and oversight. | Keep task evidence, not module boundary. |
| Mobile | Planned mobile app for field/driver use. | Mobile, IoT, Control Center and SUNAT future scope. | CONFLICTS_WITH_CURRENT_SCOPE | Mobile speed/connectivity adoption constraint. | Preserve as future evidence only. |
| IoT | Temperature sensors and tracking are future integration. | IoT future scope. | CONFLICTS_WITH_CURRENT_SCOPE | Cold-chain monitoring pain. | No V1 inference. |
| Subscriptions | Public plans, Standard/Growth/Enterprise, seats and feature tiers. | Plans, Subscriptions, Entitlements and Feature tiers V2/future. | CONFLICTS_WITH_CURRENT_SCOPE | Pricing/adoption research only. | Do not reuse as V1 contract. |

## Semantic risks explicitly detected

- Tenant treated as Workspace.
- Operations and Account Owner merged.
- Company Owner mixed with operations.
- Purchase Order used for customer sales order.
- Subscription plans treated as current V1.
- Public self-service registration conflicts with approved-assisted provisioning.
- Buyer Profile/client account modeled as tenant-owned rather than global/reusable relationship.
- Brand/Category can appear shared/global despite current Tenant scope.
- Payment and invoice semantics are referential/simulated in parts of the report.
- Cold-chain presented as exclusive product boundary.

No row above creates a current decision.
