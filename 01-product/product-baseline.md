---
status: accepted
maturity: FROZEN
scope: v1
owner: product
last-reviewed: 2026-08-18
---

# Product & Business V1 baseline

This is the frozen Product authority for Nexa V1. It records accepted product direction; it does not create Strategic DDD, final ownership, schemas or implementation contracts.

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

## Governance axes and identity

Business governance follows Company Owner, Business Operations Manager, then operational Sales, Warehouse and Dispatch responsibilities. Access/technical governance belongs to Tenant Administrator. Tenant Administrator is not automatically the highest business operator.

Recommended roles are templates or capability-oriented access constructs, not product-wide hardcoded domain enums.

Keep these concepts distinct:

`Nexa Identity != Workforce Membership != Buyer Profile/Relationship != Customer Account != Portal Access`

- One human has one global Nexa identity.
- Workforce membership is tenant-scoped.
- A Buyer may have independent authorized commercial relationships with multiple Tenants.
- A Customer Account may exist without a Buyer identity or Portal access.
- Sales may create/manage offline commercial customer information, but does not impersonate a Buyer or fabricate Buyer credentials.
- V1 direction is one principal Buyer user per Customer Account relationship. Multi-user customer business accounts are V2.

## CRM Lite

V1 includes Customer Accounts, contacts, Sales assignment, commercial history, notes and Buyer relationship. Leads, Opportunities, pipeline management, activity management and forecasting are V2+ unless explicitly accepted later.

## Catalog, availability and pricing

- Accepted direction is `Product -> sellable SKU`. Variant is not mandatory; use it only if future discovery proves a meaningful business variation independent of presentation/SKU.
- Every sellable presentation owns its SKU. Product/SKU media may be independent where useful.
- Brand and Category are Tenant-scoped.
- SKU lifecycle, inventory availability and Buyer visibility are separate concerns. `ACTIVE + VISIBLE + OUT OF STOCK` is valid.
- Conceptual sellable availability considers physical stock minus unavailable/hold quantities, safety stock and committed/reserved quantities. Safety stock is not a reservation. Buyer-facing availability must not expose unsafe raw stock.
- SKU identity is independent from price. Do not create SKU-per-customer-price.
- V1 conceptual pricing precedence is Base Price, Price List, Customer Commercial Terms, then Promotion. Buyer does not manually select a Price List.
- Sales cannot arbitrarily override authoritative prices. No quantity-tier pricing requirement is accepted for V1. Near-expiry inventory does not auto-discount by architecture fiat.

## Sales and order policy

- Purchase Request is commercial intent; Sales may review or adjust it before Sales Order creation.
- V1 Tenant policy supports `DIRECT_ORDER` and `APPROVAL_REQUIRED` conceptual modes. Approval flow is Buyer, Purchase Request, Sales review, Sales Order. Direct flow is Buyer, authoritative validation, confirmed Order/Sales Order.
- Cart does not reserve inventory.
- Backend revalidates authoritative sellable availability transactionally. V1 accepts no oversell/backorder behavior; competing buyers for the final unit require concurrency-correct conflict handling.
- Sales may adjust a Purchase Request before Sales Order creation. Nexa does not require a universal system-enforced reconfirmation ceremony; commercially required Buyer agreement is recorded as the accepted business result.
- Active Purchase Requests expire after a default 3 days and a configurable maximum of 7 days; expiry releases related inventory commitment.
- Manual/assisted Sales order capture is valid without fabricating Buyer identity. Cart never reserves inventory, no automatic backorder is accepted, and competing final-unit claims resolve with one success and one availability conflict.
- Substitution requires Buyer approval by default. Operational exceptions require escalation; Buyer-selected items are never silently replaced.
- Confirmed Sales Orders are commercial commitments. Significant changes are not silent mutation; cancel/void/replace semantics are preferred where appropriate. Formal amendment machinery remains V2 unless discovery proves V1 need.
- Buyer and Sales may request cancellation, but exceptional cancellation authority belongs to Company Owner or Business Operations Manager.
- Order-time prices require historical snapshot semantics.

## Inventory, warehouse and fulfillment

V1 direction includes multiple Warehouses, operational Zones where useful, receiving (including partial receiving), basic traceable Warehouse transfers, manual inventory adjustments, Source Batch and physical Inventory Lot traceability, expiration, FEFO, Safety Stock, holds/quarantine where justified, commitments, sellable availability, picking, packing, staging and waste/merma.

Fulfillment is broader than Picking: Allocate, Pick, Pack, Stage, Handover and Ready for Dispatch. No ownership or Bounded Context is assigned here.

## Dispatch, delivery and cold-chain

- Warehouse/Fulfillment eventually hands responsibility to Dispatch.
- Delivery can exist independently of a Route; Route can group deliveries.
- Minimum POD direction includes photo and signature, subject to later UX/domain refinement.
- Partial delivery, total/partial rejection, basic operational return and post-delivery issue communication/traceability are V1; Nexa does not adjudicate the commercial dispute or become a full RMA system.
- `Dispatch Blocked`, `Delivery Attempt Failed` and `Delivery Completed` remain distinct concepts.
- Cold-chain specialization cuts across relevant V1 work: expiration, FEFO, storage constraints, holds/quarantine, traceability, temperature incident awareness where justified and delivery evidence.
- IoT automatic telemetry and laboratory/QMS depth are future. No ColdChain Bounded Context is created.
- Manual temperature recording is V1; an excursion requires evaluation and may result in release, hold, quarantine or disposition. IoT remains future.

## Basic Finance, documents, notifications and dashboard

- V1 Finance is basic: Tenant-specific credit limit/exposure/available credit, hard credit block, payment terms, payment recording, Stripe-backed Nexa online payment direction and external/manual payment representation where needed. Payment reported is not payment confirmed.
- Full accounting, reconciliation, bank reconciliation, advanced receivables, statements and allocation/accounting depth are V2 unless later required.
- V1 includes basic business documents. Historical document meaning must not depend on mutable master data; document snapshots/history preserve truth at issuance time. PDF may be regenerated from historical snapshot. SUNAT remains future.
- Business policy determines notification WHAT, WHO and WHEN; infrastructure determines HOW. Business traceability and security/audit evidence remain distinct.
- Operational dashboard capability belongs to V1. This does not imply full BI or a data warehouse; KPI ownership and projections remain future architecture work.

## Market and configuration

Peru may be the first operational market without making Peru the only possible country. Country, jurisdiction, timezone, locale, currency, address semantics and branding/configuration remain distinguishable where future architecture needs them. No unnecessary global complexity is created now.

## V2 and future

Deferred items include full Procurement, advanced CRM, advanced Finance, formal order amendments where not required, backorders, advanced BI/data warehouse, SUNAT integration, Control Center, advanced warehouse optimization, predictive inventory, multi-user customer accounts, plans/subscriptions/entitlements, Mobile, Driver application, IoT/automatic telemetry, deep QMS workflows and complex carrier integrations.

## Authority boundary

See [Current accepted decisions](../00-governance/current-decisions.md), [V1 scope](scope/v1-scope.md), [Known domain rules](../02-domain/business-rules/known-rules.md) and [Unresolved decisions](unresolved-decisions.md). Product completeness remains distinct from AS-IS implementation evidence.
