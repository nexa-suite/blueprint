# Architecture

## Purpose

Index accepted architecture decisions, the defensible C4 L1/L2 baseline, proposed selective L3/L4 views, logical layering principles, multi-tenant context propagation and the Strategic DDD review boundary.

## Authoritative content

- [Pre-Strategic-DDD baseline](pre-ddd-baseline.md) — current architecture boundary and explicit non-decisions.
- [Initial architecture drivers](architecture-drivers/initial-drivers.md).
- [ADR index](adrs/README.md) and accepted ADRs.
- [Canonical C4 model](c4/README.md) — L1/L2 rationale, exact containers, exclusions and runway semantics.
- [C4 Structurizr source](c4/structurizr/README.md) — canonical DSL, L1/L2 views and selective L3 views.
- [AS-IS implementation audit](as-is-implementation-audit.md) and [AS-IS/TARGET fit](as-is-target-fit.md).
- [Application TARGET](application-architecture-target.md), [tactical DDD guidance](tactical-ddd-guidance.md), [API TARGET](api-architecture-target.md), [integration/event TARGET](integration-event-architecture.md) and [frontend TARGET](frontend-application-architecture.md).
- [Design convergence interface](design-convergence-interface.md).
- [Logical system layering](layering/logical-system-layering.md) — system-level responsibility flow.
- [API layering principles](layering/api-layering-principles.md) — evidence-based internal API layering; no refactor implied.
- [Multi-tenant context propagation](multi-tenancy/context-propagation.md) — global identity, authorized relationship and tenant-aware persistence concept.
- [Future architecture readiness](future-architecture-readiness.md) — index only; no TARGET boundaries.

## Current status

C4 Level 1 and Level 2 remain BASELINED and synchronized with the closed Product / Business V1 input. Selective C4 Level 3 components and Level 4 code views are now PROPOSED / REVIEW-GATED, grounded in the read-only AS-IS audit and Strategic DDD proposal. Logical layering and multi-tenant propagation remain constraints, not accepted final domain/data/security ownership. Application, data, security, integration and frontend TARGET documents are proposed. Production cloud/deployment remains deferred.

## Expected artifacts

Accepted ADRs, architecture drivers, C4 L1/L2 source, selective L3/L4 proposals, application/data/security/integration guidance and later implementation decisions after Business Architect review.

## What must not live here

Final module boundaries inferred from code, accepted Bounded Contexts before review, copied application source or production cloud/provider claims.

## Related areas

[Governance](../00-governance/README.md), [Domain discovery readiness](../02-domain/README.md), [AS-IS evidence](../11-reference/as-is/README.md), [Operations](../08-operations/README.md).
