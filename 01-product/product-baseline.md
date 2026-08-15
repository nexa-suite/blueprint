---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-14
---

# Product & Business V1 baseline

## Purpose and status

This is the consolidated accepted product direction. Maturity: **FROZEN**. It records decisions already accepted; it does not create missing business rules or architecture.

## Positioning

Nexa is a multi-tenant B2B SaaS platform with ERP/CRM orientation for importers and distributors, particularly cold-chain businesses. Non-cold-chain distributors may also use the same product. Nexa coordinates catalog, commercial operations, inventory, warehouse, logistics, dispatch, tracking, billing and buyer self-service. It is not defined as a generic ecommerce product.

The product uses one codebase for all Tenants. Tenant is the maximum business/data isolation boundary; V1 keeps `Tenant 1:1 Workspace`. The Website, Internal Web Platform, Buyer Portal and Application API are separate product/runtime surfaces over the same Nexa product.

## Multi-tenant product principles

- All Tenants use the same product and codebase.
- Tenant-specific differences should normally be configuration or policies, not source-code forks.
- V1 preserves Tenant 1:1 Workspace.
- A new Tenant must eventually be provisionable without source changes.
- A new Tenant may begin with zero ICISA business data.
- ICISA should eventually be reproducible through provisioning plus seed/import data.
- ICISA is a reference/demo Tenant, not the definition of Nexa.

## Identity and governance direction

- Nexa has a global human identity.
- Workforce membership and Buyer relationship are different concepts.
- Company Owner owns business and workforce governance.
- Tenant Administrator owns access and technical governance.
- Recommended roles are templates/configurable; they are not product-wide hardcoded role semantics.
- A Customer Account may exist without a Portal identity.
- Sales must not impersonate Buyers.
- A Buyer identity may have commercial relationships with multiple Tenants.
- Workforce membership and the buyer-to-customer commercial relationship remain distinct. A Customer Account may exist without a Portal identity, and Sales does not impersonate a Buyer.

## Catalog, commercial and inventory direction

- Product-to-sellable-SKU is the favored direction; whether a separate Variant concept is needed remains provisional until future discovery.
- A sellable presentation has its own SKU.
- SKU lifecycle, inventory availability and Buyer visibility are distinct concerns.
- Brand and Category are Tenant-scoped.
- Price identity is independent from SKU identity.
- Price Lists belong to V1.
- Promotions apply through commercial policy, not arbitrary Sales price override.
- Physical stock differs from sellable availability.
- Lots, expiry, FEFO, holds and traceability are cold-chain concerns for V1; temperature telemetry and laboratory/QMS scope are runway or future concerns.
- Purchase Request and Sales Order are distinct business concepts. Sales may adjust a request before order creation; a confirmed order is immutable by silent edits.
- Sales pricing authority remains distinct from arbitrary user-entered prices; pricing, promotions and stock availability require explicit policy.

## Cold-chain and provider direction

- Cold-chain specialization includes traceability, lot, expiry, FEFO and hold concepts, subject to later domain validation.
- Payment is a domain concept; Stripe is a provider/adapter.
- Production providers and credentials remain unresolved.
- Mobile and IoT are future/runway, not V1 implementation scope.
- The V1 external-system boundary is Payment Provider, Email Delivery Service and Maps & Geolocation Provider. Provider selection remains an adapter/configuration concern unless separately accepted.

## Authority and boundary

See [Current accepted decisions](../00-governance/current-decisions.md), [V1 scope](scope/v1-scope.md) and [Known domain rules](../02-domain/business-rules/known-rules.md). The future analysis sequence remains `Capability Mapping -> EventStorming -> Domain Storytelling -> Strategic DDD`.
