---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-18
---

# Current accepted decisions

## Product / Business V1 closure

- Product and Business V1 is **FROZEN / CLOSED**. No major Product V1 decision blocker remains.
- Acceptance covers Fresh Nexa Tenant, Generic Tenant and ICISA Reference Tenant states. Same product, code and release line; ICISA is never required by Nexa.
- Next business architecture activity is Capability Mapping. EventStorming, Domain Storytelling, Ubiquitous Language, subdomains, Bounded Contexts and Context Map remain not started.

## Nexa

Nexa is a fast, role-focused B2B multi-tenant SaaS platform for importers and distributors, particularly cold-chain businesses, designed to coordinate commercial operations, inventory, fulfillment and delivery while providing buyers with a simple and reliable purchasing experience.

## Tenant and Workspace

- `ICISA` is the canonical explanatory Tenant example.
- Tenant is the SaaS customer and maximum business/data isolation boundary.
- Typical V1 interpretation: Tenant is approximately a customer company.
- A Tenant may contain locations, stores, warehouses, employees and B2B customers.
- V1 uses `Tenant 1:1 Workspace`.
- Workspace is the complete Nexa operational environment of that Tenant, not a C4 Container.
- Multiple workspaces per Tenant are deferred beyond V1.

## Identity and roles

- One human has one Nexa identity.
- A Buyer may have independent authorized relationships with multiple Tenants; data remains tenant-scoped.
- V1 has one Internal Web Platform for Tenant Administrator, Company Owner, Business Operations Manager, Sales Representative, Warehouse Operator and Dispatch Coordinator.
- V1 has exactly one Company Owner; multiple Business Operations Managers may exist. These are business-governance roles, not one simple hierarchy.
- Tenant Administrator governs technical access and configuration.
- Company Owner governs company identity, sensitive organization data, members, role assignment and executive visibility.
- Business Operations Manager supervises cross-functional day-to-day business operations without owning technical RBAC/security configuration.

## Product boundaries

- Public Website markets Nexa, explains Nexa Buyer, provides login entry points and handles Contact/Request a Demo.
- Public Website does not expose tenant catalogs, products, prices or commercial information without authentication.
- A public request does not automatically create a Tenant.
- No anonymous instant Tenant signup is required for V1; assisted commercial review, approval, provisioning and activation precede ACTIVE.
- Tenant business data is not immediately deleted on suspension or exit; retention/export policy remains open.
- Mobile is Architecture Runway, not V1 implementation.
- Nexa Control Center, Platform Administrator, Support, Plans, Subscriptions, Entitlements and Feature tiers are V2/future.

## External systems and assets

- V1 external systems: Payment Provider, Email Delivery Service, Maps & Geolocation Provider.
- TARGET catalog media is tenant-owned binary content in Object Storage.
- Sellable product presentations/SKUs may have independent images.
- V1 online payment experience uses Nexa's Stripe direction; Payment remains the business concept and production provider/technical integration decisions remain open.

## Domain rules accepted for V1

- One physical Inventory Lot belongs to exactly one Warehouse at a time; split source batches retain traceability when needed.
- Sales may modify Purchase Requests before Sales Order creation. No universal system-enforced Buyer reconfirmation ceremony is required; where Buyer agreement is commercially needed, Buyer and Sales communicate through Nexa, WhatsApp, phone or another human channel, then Sales records the mutual agreement in Nexa.
- Purchase Requests expire by default after 3 days and never beyond 7 days; expiry releases related commitment.
- Cart never reserves inventory. No automatic backorder. Confirmed Sales Orders are immutable history; cancellation is exceptional Company Owner or Business Operations Manager authority.
- Credit is Tenant-specific and insufficient Available Credit hard-blocks order progression.
- Product substitution is never silent; partial receiving, basic traceable Warehouse transfer, manual inventory adjustment, manual temperature recording and partial/rejected Delivery are V1 product rules.
- Sales cannot arbitrarily alter authoritative pricing.
- Confirmed Sales Orders cannot be silently edited; exceptional changes must eventually be explicit and auditable.

## Architecture status

- C4 L1 V1: baselined.
- C4 L2 V1: baselined.
- C4 Architecture Runway: baselined.
- C4 L3: blocked until Strategic DDD.
