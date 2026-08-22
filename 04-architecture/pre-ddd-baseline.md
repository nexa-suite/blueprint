---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-18
---

# Pre-Strategic-DDD baseline (historical boundary)

## Purpose

This document closes the architecture baseline before Strategic DDD. It answers only: **what do we know before beginning Strategic DDD?** It does not design bounded contexts, reopen AS-IS investigation or authorize product implementation.

## Product identity

Nexa is a fast, role-focused B2B multi-tenant SaaS platform for importers and distributors, particularly cold-chain businesses. It coordinates commercial operations, inventory, fulfillment and delivery while providing buyers with a simple purchasing experience.

Canonical source: [Product vision](../01-product/vision.md).

Product / Business V1 input: **FROZEN / CLOSED**. No major Product blocker remains. This baseline is ready for Capability Mapping; it does not create strategic boundaries.

## V1 system boundary

V1 includes:

- Public Website.
- Internal Web Platform.
- Buyer Portal.
- Application API.
- PostgreSQL.
- Object Storage abstraction.
- Payment, email and maps/geolocation integrations.

Mobile, Delivery Driver, Control Center, Support, subscriptions, plans, entitlements, feature tiers and IoT remain runway or V2/future according to [V1 scope](../01-product/scope/v1-scope.md).

## Primary personas

The eight V1 personas are canonicalized in [Primary personas](../01-product/personas/primary-personas.md): Prospective Customer Representative, Tenant Administrator, Company Owner, Business Operations Manager, Sales Representative, Warehouse Operator, Dispatch Coordinator and B2B Buyer.

## C4 L1/L2 status

- C4 L1 V1: BASELINED.
- C4 L2 V1: BASELINED.
- C4 Architecture Runway: BASELINED.
- C4 L3/L4 were intentionally not created at the time of this baseline. The current proposal superseding this boundary is indexed in [Architecture README](README.md) and remains review-gated.
- Workspace is not a C4 Container.
- PostgreSQL Database is a C4 Container and runtime service.
- Object Storage is a C4 Container abstraction.
- MinIO is a local runtime implementation.

Canonical C4 rationale: [Canonical C4 model](c4/README.md). Canonical source: [Structurizr workspace](c4/structurizr/workspace.dsl).

The pre-DDD logical principles are recorded separately in [Logical system layering](layering/logical-system-layering.md), [API layering principles](layering/api-layering-principles.md) and [Multi-tenant context propagation](multi-tenancy/context-propagation.md). These documents do not define strategic boundaries or final data/security architecture.

## Architecture drivers

The accepted drivers are Strong Tenant Isolation, Role-Focused Simplicity, High Perceived Responsiveness, Operational Traceability and Cold-Chain Awareness. See [Initial architecture drivers](architecture-drivers/initial-drivers.md).

## Known domain rules

The accepted rules include Tenant isolation, Tenant 1:1 Workspace in V1, single-Warehouse physical lots, source-batch traceability, Purchase Request adjustment and bounded expiry, cart non-reservation, authoritative pricing protection, credit hard block and explicit/auditable Sales Order changes. See [Known domain rules](../02-domain/business-rules/known-rules.md).

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

The following remain OPEN — REQUIRES STRATEGIC DDD or subsequent architecture work:

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

No solution is inferred here.

## Known production gaps

Production gates remain open for deployment architecture, secrets/key management, backup/restore, disaster recovery, provider staging, production observability, SLI/SLO, alerting, rollback and operational runbooks. These are operational gaps, not a claim that Strategic DDD is universally required before every deployment activity.

## Explicitly deferred

- Additional C4 L3/L4 beyond the current selective, review-gated proposal.
- Mobile and Delivery Driver implementation.
- IoT/sensor implementation.
- Control Center and Support.
- Subscription, plan, entitlement and feature-tier implementation.
- Advanced BI/data warehouse.
- Broad microservice decomposition.

## Evidence available

- [V1 readiness baseline](../11-reference/as-is/v1-readiness-baseline-2026-08-12.md).
- [Current state](../00-governance/current-state.md).
- [Current accepted decisions](../00-governance/current-decisions.md).
- [C4 Structurizr source](c4/structurizr/workspace.dsl).
- [Technology baseline](../07-engineering/technology-baseline.md).
- [Local runtime baseline](../08-operations/containers/local-runtime-baseline.md).

## Closure

Pre-Strategic-DDD Architecture Baseline: **READY FOR CAPABILITY MAPPING**.

The next architecture activity is:

```text
Capability Mapping
-> Big Picture EventStorming
-> Process-Level EventStorming
-> Domain Storytelling
-> Ubiquitous Language
-> Strategic DDD
```
