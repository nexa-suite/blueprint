---
status: accepted
scope: v1
owner: product
last-reviewed: 2026-08-12
---

# V1 scope

V1 product scope is FROZEN as an accepted baseline. Detailed implementation completeness is tracked separately as AS-IS evidence.

## V1

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

This document does not assert detailed feature completeness beyond accepted architecture.
