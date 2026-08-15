---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-12
---

# V1 scope

V1 product scope is FROZEN as an accepted baseline. Detailed implementation completeness is tracked separately as AS-IS evidence.

## V1 product capabilities

- Tenant and workforce administration, global identity and tenant-scoped buyer relationships.
- Product/catalog discovery, sellable SKU presentation, brands, categories, price lists and commercial policy.
- Purchase Request to Sales Order progression with authoritative pricing and auditable confirmation.
- Inventory, warehouses, lots, expiry, FEFO, holds, fulfillment, dispatch, delivery evidence and buyer visibility.
- Public product discovery, contact/demo request, Internal Web Platform and Buyer Portal self-service.

## V1 runtime boundary

- Public Website
- Internal Web Platform
- Buyer Portal
- Application API
- PostgreSQL
- Object Storage
- Payment integration
- Email integration
- Maps/geolocation integration

## Architecture Runway

- Nexa Mobile
- Delivery Driver mobile workflows
- Nexa Control Center, future identity providers and IoT/telemetry integrations.

## Product principles carried by V1

- All Tenants use the same product/codebase; tenant differences are normally configuration/policies.
- V1 preserves Tenant 1:1 Workspace.
- Global human identity is distinct from workforce membership and Buyer relationships.
- Customer Account may exist without a Portal identity; Sales does not impersonate Buyers.
- Price Lists belong to V1; physical stock and sellable availability remain distinct.
- Payment is a domain concept; Stripe remains an adapter/provider decision.

## V2 / Future

- Nexa Control Center
- Nexa Support
- Subscription management
- Plans
- Entitlements
- Feature tiers
- IoT
- Advanced platform administration
- Laboratory/QMS depth and deep telemetry operations

This document does not assert detailed feature completeness beyond accepted architecture.
