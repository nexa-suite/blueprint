---
status: deprecated
maturity: SUPERSEDED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# Pre-Strategic-DDD baseline (historical boundary)

## Purpose

This document is preserved as the historical boundary before Strategic DDD. It answers only: **what was known before Strategic DDD acceptance?** It does not override the accepted PRE-V1 target or authorize product implementation.

## Product identity

Nexa is a fast, role-focused B2B multi-tenant SaaS platform for importers and distributors, particularly cold-chain businesses. It coordinates commercial operations, inventory, fulfillment and delivery while providing buyers with a simple purchasing experience.

Canonical source: [Product vision](../../01-product/vision/product-vision.md).

Product / Business V1 input: **FROZEN / CLOSED**. No major Product blocker remains. This historical record did not create strategic boundaries; the accepted result now lives in [Strategic DDD](../../02-domain/strategic-ddd-index.md).

## V1 system boundary

V1 includes:

- Public Website.
- Internal Web Platform.
- Buyer Portal.
- Application API.
- PostgreSQL.
- Object Storage abstraction.
- Payment, email and maps/geolocation integrations.

Mobile, Delivery Driver, Control Center, Support, subscriptions, plans, entitlements, feature tiers and IoT remain runway or V2/future according to [V1 scope](../../01-product/vision/v1-scope.md).

## Primary personas

The eight V1 personas are canonicalized in [Primary personas](../../01-product/audiences/web-personas.md): Prospective Customer Representative, Tenant Administrator, Company Owner, Business Operations Manager, Sales Representative, Warehouse Operator, Dispatch Coordinator and B2B Buyer.

## C4 L1/L2 status

- C4 L1 V1: BASELINED.
- C4 L2 V1: BASELINED.
- C4 Architecture Runway: BASELINED.
- C4 L3/L4 were intentionally not created at the time of this baseline. Selective PRE-V1 TARGET views now supersede this limitation and are indexed in [Architecture README](README.md).
- Workspace is not a C4 Container.
- PostgreSQL Database is a C4 Container and runtime service.
- Object Storage is a C4 Container abstraction.
- MinIO is a local runtime implementation.

Canonical C4 rationale: [Canonical C4 model](../c4/README.md). Canonical source: [Structurizr workspace](../c4/structurizr/workspace.dsl).

The pre-DDD logical principles are recorded separately in [Logical system layering](layering/logical-system-layering.md), [API layering principles](layering/api-layering-principles.md) and [Multi-tenant context propagation](../security/multi-tenancy/context-propagation.md). These documents do not define strategic boundaries or final data/security architecture.

## Architecture drivers

The accepted drivers are Strong Tenant Isolation, Role-Focused Simplicity, High Perceived Responsiveness, Operational Traceability and Cold-Chain Awareness. See [Initial architecture drivers](drivers/initial-drivers.md).

## Known domain rules

The accepted rules include Tenant isolation, Tenant 1:1 Workspace in V1, single-Warehouse physical lots, source-batch traceability, Purchase Request adjustment and bounded expiry, cart non-reservation, authoritative pricing protection, credit hard block and explicit/auditable Sales Order changes. See [Known domain rules](../../02-domain/business-rules.md).

## Current implementation strengths — AS-IS evidence

- Spring Boot modular monolith with Spring Modulith and ArchUnit.
- PostgreSQL/Flyway persistence foundation.
- IAM/session security, tenant-aware access context and dynamic authorization.
- Catalog, Purchase Requests, Sales Orders and manual ordering.
- FEFO, inventory reservations, concurrency and idempotency controls.
- Dispatch/POD, business documents and object-storage abstraction.
- ClamAV and Stripe adapters.
- Runtime/static OpenAPI parity.
- OpenTelemetry and local Docker runtime.
- CI, CodeQL, Trivy, SBOM/provenance, ZAP and k6 tooling.

These strengths are evidence of current implementation, not automatic TARGET architecture.

## Known architectural uncertainties

The following were OPEN at time of this historical snapshot and are superseded by the accepted PRE-V1 records:

- Final strategic meaning of current implementation modules.
- Final Bounded Context boundaries.
- Context Map.
- Ownership of shared infrastructure.
- Warehouse versus Dispatch/Delivery boundaries.
- Catalog versus Pricing boundaries.
- Credit, Receivables and Payments boundaries.
- Business Documents ownership.
- Analytics ownership.
- Buyer global identity ownership and tenant relationships.
- Final Workspace implementation semantics.
- Complete RLS ownership policy.
- Data ownership.
- Event and integration ownership.

This historical document intentionally contains no accepted solution; read it only as provenance.

## Known production gaps

Production gates remain open for deployment architecture, secrets/key management, backup/restore, disaster recovery, provider staging, production observability, SLI/SLO, alerting, rollback and operational runbooks. These are operational gaps, not a claim that Strategic DDD is universally required before every deployment activity.

## Explicitly deferred

- Additional C4 L3/L4 beyond the current selective PRE-V1 target views.
- Mobile and Delivery Driver implementation.
- IoT/sensor implementation.
- Control Center and Support.
- Subscription, plan, entitlement and feature-tier implementation.
- Advanced BI/data warehouse.
- Broad microservice decomposition.

## Evidence available

- [V1 readiness baseline](../../06-delivery/as-is/v1-readiness-baseline-2026-08-12.md).
- [Current state](../../00-start-here/current-status.md).
- [Current accepted decisions](../../00-start-here/current-decisions.md).
- [C4 Structurizr source](../c4/structurizr/workspace.dsl).
- [Technology baseline](technology-baseline.md).
- [Local runtime baseline](../../06-delivery/as-is/local-runtime-baseline.md).

## Closure

Pre-Strategic-DDD Architecture Baseline: **SUPERSEDED BY PRE-V1 CLOSURE**.

The next architecture activity is:

```text
Capability Mapping
-> Big Picture EventStorming
-> Process-Level EventStorming
-> Domain Storytelling
-> Ubiquitous Language
-> Strategic DDD
```
