---
status: accepted
maturity: FROZEN
scope: v1
owner: product
last-reviewed: 2026-08-19
---

# Product & Business V1 baseline

This is the frozen Product authority for Nexa V1. It records accepted product direction; Strategic DDD and construction ownership are linked separately and do not turn this Product record into schemas or implementation contracts.

Product / Business V1 status: **FROZEN / CLOSED**. No major Product V1 decision blocker remains. Detailed sequence, terminology, ownership and exceptions are inputs to Domain Discovery, not reasons to reopen the Product baseline.

## Positioning

Nexa is a generic multi-tenant B2B SaaS platform with ERP/CRM orientation for importers and distributors, with strong cold-chain support. It is not exclusively a cold-chain product and is not a generic ecommerce product. One product, codebase and release line serves every Tenant.

## Generic tenancy and provisioning

- Tenant is the SaaS customer and maximum business/data isolation boundary.
- V1 uses `Tenant 1:1 Workspace`; Tenant and Workspace are different concepts.
- Tenant differences are data, configuration, business policies and role/permission configuration, not source forks, separate Angular builds or `if tenant == ICISA` branches.
- Normal Tenant provisioning must not require manual SQL or a Tenant-specific application fork.
- A newly provisioned normal Tenant MUST contain zero ICISA business data unless an explicit demo/reference seed or import is deliberately selected.
- ICISA is a reproducible reference/demo Tenant through valid product/provisioning mechanisms plus explicit reference data. It is not Nexa's product definition.
- Acceptance requires Fresh Nexa, Generic Tenant and ICISA Reference Tenant states. New Tenants contain no ICISA business-data clone.
- Public Contact / Request Demo does not anonymously create a Tenant. Accepted direction is human/commercial review, approval/agreement, provisioning, designated Tenant Administrator activation/claim/invitation, organization configuration and Tenant ACTIVE. Exact implementation states remain open.
- Control Center UI remains future/V2.

Tenant controls its business information; Nexa processes it to provide the service. Suspension or exit does not immediately delete Tenant business data, and a departing Tenant must have a reasonable way to export it. Exact retention duration, export format, technical mechanism, legal/contractual obligations and deletion procedure remain open.

## Governance axes and identity

Business governance has exactly one Company Owner and may have multiple Business Operations Managers, alongside operational Sales, Warehouse and Dispatch responsibilities. It is not one simple hierarchy. Access/technical governance belongs to Tenant Administrator. Tenant Administrator is not automatically the highest business operator.

Recommended roles are templates or capability-oriented access constructs, not product-wide hardcoded domain enums.

Keep these concepts distinct:

`Human Identity != Workforce Membership != Buyer Relationship != Customer Account != Portal Access`

- One human has one global Nexa identity.
- Workforce membership is tenant-scoped.
- A Buyer may have independent authorized commercial relationships with multiple Tenants.
- A Buyer/Tenant relationship may begin through Tenant invitation or Buyer request; Tenant approval/authorization is required. The Buyer experience remains supplier-context-specific and is not a marketplace.
- A Customer Account may exist without a Buyer identity or Portal access.
- When an existing Customer Account later corresponds to a Nexa identity, Nexa should support linking/claiming that relationship instead of automatically duplicating the customer. Workflow, states and implementation remain open.
- Sales may create/manage offline commercial customer information, but does not impersonate a Buyer or fabricate Buyer credentials.
- V1 direction is one principal Buyer user per Customer Account relationship. Multi-user customer business accounts are V2.

## CRM Lite

V1 includes Customer Accounts, contacts, Sales assignment, commercial history, notes and Buyer relationship. Leads, Opportunities, pipeline management, activity management and forecasting are V2+ unless explicitly accepted later.

## Catalog, availability and pricing

- Accepted direction is `Product -> sellable SKU`. Variant is not mandatory; use it only if future discovery proves a meaningful business variation independent of presentation/SKU.
- Every sellable presentation owns its SKU. Product/SKU media may be independent where useful.
- Brand and Category are Tenant-scoped.
- SKU lifecycle, inventory availability and Buyer visibility are separate concerns. `ACTIVE + VISIBLE + OUT OF STOCK` is valid.
- Conceptual sellable availability considers physical stock minus unavailable/HOLD quantities, safety stock and Commercial Commitments. Inventory Availability protects one commercial demand line through deterministic backing across one or more eligible Warehouses; backing is not Physical Allocation. Safety stock is not a Commercial Commitment. Physical Allocation of Inventory Lot(s) occurs later in Fulfillment. Buyer-facing availability must not expose unsafe raw stock.
- SKU identity is independent from price. Do not create SKU-per-customer-price.
- V1 conceptual pricing precedence is Base Price, Price List, Customer Commercial Terms, then Promotion. Buyer does not manually select a Price List.
- Sales cannot arbitrarily override authoritative prices. No quantity-tier pricing requirement is accepted for V1. Near-expiry inventory does not auto-discount by architecture fiat.

## Sales and order policy

- Purchase Request is commercial intent. A PR Draft creates no commitment; PR Submitted creates the Commercial Inventory Commitment for each SKU and quantity plus complete Inventory Reservation backing. Withdrawal, rejection or expiry releases both protections. When the PR becomes a Sales Order, the commitment and its backing continue into the confirmed commercial obligation.
- V1 Tenant policy supports `DIRECT_ORDER` and `APPROVAL_REQUIRED` conceptual modes. Approval flow is Buyer, Purchase Request, Sales review, Sales Order. Direct flow is Buyer, authoritative validation, confirmed Order/Sales Order.
- Cart does not reserve inventory.
- `DIRECT_ORDER` requires availability validation, successful full Inventory Reservation backing, Commercial Inventory Commitment and Sales Order confirmation as one accepted commercial outcome. One commercial line may use multiple eligible Warehouses; if required quantity cannot be fully protected, return a deterministic current/insufficient-availability result; do not create a partial order or backorder.
- Backend revalidates authoritative sellable availability transactionally. V1 accepts no oversell/backorder behavior; competing buyers for the final unit require concurrency-correct conflict handling.
- Sales may adjust a submitted Purchase Request before Sales Order creation, but the Buyer does not freely mutate submitted content. No universal system-enforced re-accept click is required after every Sales modification; changes requiring business consent preserve evidence. Material agreed modification resets the request validity window and atomically revalidates/replaces affected commitment, Inventory Reservation backing and Credit Reservation. If requirements fail, the prior authoritative state remains. Sales rejection requires a reason; Buyer withdrawal may omit a reason.
- Purchase Request states are `SUBMITTED`, `CHANGES_PROPOSED`, `CONVERTED`, `REJECTED`, `WITHDRAWN` and `EXPIRED`. Default expiry is 72 hours; Tenant configuration is 1–7 integer days; store UTC absolute `expiresAt: Instant` and reject conversion at `now >= expiresAt` even before worker materialization.
- Manual/assisted direct-order capture is valid without fabricating Buyer identity; it is not a persisted Draft Sales Order. Cart never reserves inventory, no automatic backorder is accepted, and competing final-unit claims resolve with one success and one availability conflict.
- Substitution requires Buyer approval by default. Operational exceptions require escalation; Buyer-selected items are never silently replaced.
- Confirmed Sales Orders are commercial commitments. Significant changes are not silent mutation; explicit cancel/void/replace/correction semantics preserve history in V1.
- Buyer and Sales cannot directly cancel a confirmed Sales Order; they may request cancellation. Exceptional cancellation authority belongs to Company Owner or Business Operations Manager.
- Order-time prices require historical snapshot semantics.

## Inventory, warehouse and fulfillment

V1 direction includes multiple Warehouses, deterministic multi-Warehouse backing for commercial demand, operational Zones where useful, receiving (including partial receiving), basic traceable Warehouse transfers, manual inventory adjustments, Source Batch and physical Inventory Lot traceability, expiration, FEFO, Safety Stock, distinct HOLD/QUARANTINE states where justified, Commercial Commitments, sellable availability, picking, packing, staging and waste/merma.

Fulfillment is broader than Picking: Allocate, Pick, Pack, Stage, Handover and Ready for Dispatch. No ownership or Bounded Context is assigned here.

## Dispatch, delivery and cold-chain

- Warehouse/Fulfillment eventually hands responsibility to Dispatch.
- Delivery can exist independently of a Route; Route can group deliveries.
- POD is immutable outcome evidence. Photo/signature requirements are Tenant/customer/SKU policy-driven; neither is universally mandatory. Amendments create linked addenda and never overwrite original evidence.
- Partial delivery, total/partial rejection and post-delivery issue communication/traceability are V1; rejected/not-delivered goods return under HOLD pending disposition. Full Returns/RMA remains V2. A Failed Delivery Attempt remains the same Delivery and may be attempted again. A Partial Delivery closes the performed Delivery as partial and creates a new Continuation Delivery for the remaining existing Sales Order obligation.
- `Dispatch Blocked`, `Delivery Attempt Failed` and `Delivery Completed` remain distinct concepts.
- Cold-chain specialization cuts across relevant V1 work: expiration, FEFO, storage constraints, distinct HOLD/QUARANTINE states, traceability, temperature incident awareness where justified and delivery evidence.
- IoT automatic telemetry and laboratory/QMS depth are future. No ColdChain Bounded Context is created.
- Manual temperature recording is V1. An out-of-range receiving temperature creates `HOLD` plus a pending `Temperature Excursion` evaluation; it does not automatically create `QUARANTINE`. `ColdChainDisposition` may produce `RELEASE`, `CONTINUE_HOLD`, `REJECT` or `WASTE`; `RETURN_TO_SUPPLIER` is a possible physical action after `REJECT`. IoT remains future.

## Basic Finance, documents, notifications and dashboard

- V1 Finance is basic: Tenant-specific Credit Limit, Credit Reserved, Outstanding Receivables and Available Credit, hard credit block, payment terms, payment recording, Stripe-backed Nexa online payment direction and external/manual payment representation where needed. `Available Credit = Credit Limit - Credit Reserved - Outstanding Receivables`; transition from Credit Reserved to Outstanding Receivables must not double-count. If online money is captured but Sales Order creation fails, record `UNALLOCATED / RECONCILIATION_REQUIRED`, attempt an automatic refund, resolve on refund success or require operational intervention on refund failure, and retain financial history. Payment reported is not payment confirmed. Payment is not Stripe; V1 is not an arbitrary bring-your-own-online-gateway platform. Commercial credit, bank transfer, cash/COD and other direct Tenant-supported arrangements remain valid business methods.
- Buyer Portal exposes live Tenant-specific Credit Limit, Credit Reserved, Outstanding Receivables and Available Credit for the current supplier relationship. Buyer has no global Nexa-wide credit balance. Insufficient Available Credit remains a hard block. Existing implementation fields named `exposure` or `used` are AS-IS vocabulary, not the final Product model.
- Full accounting, reconciliation, bank reconciliation, advanced receivables, statements and allocation/accounting depth are V2 unless later required.
- V1 includes basic business documents. Historical document meaning must not depend on mutable master data; document snapshots/history preserve truth at issuance time. PDF may be regenerated from historical snapshot. SUNAT remains future.
- Business policy determines notification WHAT, WHO and WHEN; infrastructure determines HOW. Business traceability and security/audit evidence remain distinct.
- Operational dashboard capability belongs to V1. This does not imply full BI or a data warehouse; KPI ownership and projections remain future architecture work.

## Market and configuration

Peru may be the first operational market without making Peru the only possible country. Country, jurisdiction, timezone, locale, currency, address semantics and branding/configuration remain distinguishable where future architecture needs them. No unnecessary global complexity is created now.

V1 Tenant customization is limited to Nexa-supported configuration/policies and light branding. Nexa is not an arbitrary workflow-builder platform. Exceptional enterprise customization may be evaluated in future versions without changing the generic V1 product model.

A capability presented as V1 must close coherently end-to-end. If it cannot be delivered solidly, reduce its V1 scope or defer it to V2/Future; do not preserve decorative or nominal functionality merely to claim broader scope.

## V2 and future

Deferred items include full Procurement, advanced CRM, advanced Finance, formal order amendments where not required, backorders, advanced BI/data warehouse, SUNAT integration, Control Center, advanced warehouse optimization, predictive inventory, multi-user customer accounts, plans/subscriptions/entitlements, Mobile, Driver application, IoT/automatic telemetry, deep QMS workflows and complex carrier integrations.

## Closure reconciliation

This file remains the single Product / Business V1 authority. The Strategic DDD package in [02-domain](../02-domain/README.md) accepts business boundaries without changing frozen scope. Commitment existence, expiry, consent semantics, Credit formula, delivery continuation and payment/order failure handling are closed here.

## Authority boundary

See [Current accepted decisions](../00-start-here/current-decisions.md), [V1 scope](vision/v1-scope.md), [Known domain rules](../02-domain/business-rules.md) and [Unresolved decisions](rules/future-scope.md). Product completeness remains distinct from AS-IS implementation evidence.
