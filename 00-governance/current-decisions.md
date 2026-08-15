---
status: accepted
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-12
---

# Current accepted decisions

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
- Tenant Administrator governs technical access and configuration.
- Company Owner governs company identity, sensitive organization data, members, role assignment and executive visibility.
- Business Operations Manager supervises cross-functional day-to-day business operations without owning technical RBAC/security configuration.

## Product boundaries

- Public Website markets Nexa, explains Nexa Buyer, provides login entry points and handles Contact/Request a Demo.
- Public Website does not expose tenant catalogs, products, prices or commercial information without authentication.
- A public request does not automatically create a Tenant.
- Mobile is Architecture Runway, not V1 implementation.
- Nexa Control Center, Platform Administrator, Support, Plans, Subscriptions, Entitlements and Feature tiers are V2/future.

## External systems and assets

- V1 external systems: Payment Provider, Email Delivery Service, Maps & Geolocation Provider.
- TARGET catalog media is tenant-owned binary content in Object Storage.
- Sellable product presentations/SKUs may have independent images.

## Domain rules accepted for V1

- One physical Inventory Lot belongs to exactly one Warehouse at a time; split source batches retain traceability when needed.
- Sales may modify Purchase Requests before order creation; Buyer reconfirmation is not mandatory after Sales adjustments.
- Sales cannot arbitrarily alter authoritative pricing.
- Confirmed Sales Orders cannot be silently edited; exceptional changes must eventually be explicit and auditable.

## Architecture status

- C4 L1 V1: baselined.
- C4 L2 V1: baselined.
- C4 Architecture Runway: baselined.
- C4 L3: blocked until Strategic DDD.
