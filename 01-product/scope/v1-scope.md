---
status: accepted
maturity: FROZEN
scope: v1
owner: product
last-reviewed: 2026-08-18
---

# V1 scope

V1 scope is frozen product direction. These scope areas are not a Capability Map or Bounded Context model. Detailed implementation completeness remains AS-IS evidence.

## V1 scope areas

### Tenant and provisioning

Tenant isolation, Tenant 1:1 Workspace, assisted approval/provisioning, designated Tenant Administrator activation and organization configuration. No anonymous self-service Tenant creation.

### Organization and workforce

Company identity, locations, stores, warehouses, employees, B2B customer accounts, workforce membership and role/capability-oriented access configuration.

### IAM and access

Global human identity, Tenant Administrator technical governance, Company Owner business/workforce governance, Business Operations Manager cross-functional operations and role-focused internal access. Buyer relationship and workforce membership remain distinct.

### CRM Lite

Customer Accounts, contacts, Sales assignment, commercial history, notes and Buyer relationship. Advanced CRM remains future.

### Catalog

Product and sellable SKU presentation, SKU lifecycle, Brand, Category, product media and Buyer visibility. Variant is not mandatory.

### Pricing and commercial policy

Base Price, Price Lists, Customer Commercial Terms and Promotions as policy concepts. Sales cannot arbitrarily override authoritative prices. Buyer does not manually select a Price List.

### Sales, Purchase Request and Sales Order

Buyer and assisted request capture, Purchase Request review/adjustment, Tenant policy supporting direct or approval-required ordering, authoritative validation, 3-day default/7-day maximum PR expiry, Sales Order confirmation, historical order prices and explicit non-silent change handling. No universal Buyer reconfirmation ceremony is required; commercially necessary agreement is recorded.

### Inventory and availability

Physical stock, unavailable/hold quantities, safety stock, commitments/reservations, sellable availability, concurrency-correct final-unit handling, no accepted oversell/backorder behavior and Buyer-safe availability presentation.

### Warehouse and fulfillment

Multiple Warehouses, operational Zones where useful, partial receiving, basic traceable Warehouse transfers, manual inventory adjustments, Source Batch and physical Inventory Lot traceability, expiration, FEFO, holds/quarantine, Allocate, Pick, Pack, Stage, Handover, Ready for Dispatch and waste/merma.

### Dispatch, delivery and POD

Dispatch handoff, delivery execution, Route grouping where useful, blocked/failed/completed distinctions, partial delivery, total/partial rejection, basic operational return and POD direction including photo/signature and outcome evidence.

### Cold-chain essentials

Expiration, FEFO, storage constraints, holds/quarantine, traceability, manual temperature recording, justified temperature incident awareness and delivery evidence. Automatic IoT telemetry and laboratory/QMS depth are future.

### Basic credit and payments

Tenant-specific Credit Limit, Current Exposure/Used Credit and Available Credit exposed live in Buyer Portal for current supplier relationship, with hard block when unavailable, payment terms, payment recording, Stripe-backed Nexa online-payment direction and external/manual payment representation. No global Buyer credit balance. Full accounting, reconciliation and advanced receivables are future.

### Basic documents

Business document visibility and download with historical snapshot semantics. Fiscal/SUNAT scope is not promoted to V1.

### Notifications and audit/traceability

Policy-driven notification intent, infrastructure delivery, business traceability and security/audit evidence as distinct concerns. Channels and ownership remain to be refined.

### Operational dashboard

Operational dashboard capability for current work. No full BI or data warehouse claim.

### Product guardrails

Tenant customization is limited to Nexa-supported configuration/policies and light branding; arbitrary workflow building is not V1. V1 capabilities must close coherently end-to-end or have scope reduced/deferred to V2/Future.

## V1 product/runtime surfaces

- Public Website: discovery, trust, capability explanation and Contact/Request Demo. No unauthenticated Tenant commerce.
- Internal Web Platform: role-focused workforce administration and operations.
- Buyer Portal: low-cognitive-load catalog, requests/orders and delivery visibility.
- Nexa Application API: modular-monolith authority for application behavior, security and integrations.
- PostgreSQL Database: V1 relational data store.
- Object Storage: tenant-owned binary boundary.
- Abstract external systems: Payment Provider, Email Delivery Service, Maps & Geolocation Provider.

## Explicitly out of V1

- Full Procurement: suppliers, Purchase Orders, supplier agreements, RFQ, vendor comparison and import/customs workflows.
- Advanced CRM: Leads, Opportunities, pipeline, forecasting and advanced activity management.
- Advanced Finance: reconciliation, bank reconciliation, statements and full accounting/allocation.
- Backorders, predictive inventory and advanced warehouse optimization.
- Advanced BI/data warehouse.
- SUNAT integration.
- Multi-user customer business accounts.
- Plans, subscriptions, entitlements, feature tiers, Control Center and Support.
- Mobile, Delivery Driver application, IoT/automatic telemetry, deep QMS and complex carrier integrations.

Architecture Runway is documented separately. This file does not create formal capabilities, subdomains, Bounded Contexts, Context Maps or C4 L3.
