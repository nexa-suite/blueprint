# Architecture

## Purpose

Index accepted PRE-V1 architecture decisions, C4 L1/L2 and selective L3 TARGET views, logical layering, multi-tenant context propagation, event contracts and AS-IS evidence.

## Authoritative content

- [Accepted architecture decisions](../00-governance/current-decisions.md) — accepted PRE-V1 architecture boundary and explicit production-gate separation.
- [Initial architecture drivers](architecture-drivers/initial-drivers.md).
- [ADR index](adrs/README.md) and accepted ADRs.
- [Canonical C4 model](c4/README.md) — L1/L2 rationale, exact containers, exclusions and runway semantics.
- [C4 L3/L4 technical views](c4/l3-l4-views.md) — selective API, Platform and Portal TARGET lenses; technical only, baselined for PRE-V1 and not BC claims.
- [C4 Structurizr source](c4/structurizr/README.md) — canonical DSL, L1/L2 views and selective L3 views.
- [AS-IS implementation audit](as-is-implementation-audit.md) and [AS-IS/TARGET fit](as-is-target-fit.md).
- [Application TARGET](application-architecture-target.md), [tactical DDD guidance](tactical-ddd-guidance.md), [API TARGET](api-architecture-target.md), [integration/event TARGET](integration-event-architecture.md) and [frontend TARGET](frontend-application-architecture.md).
- [Design convergence interface](design-convergence-interface.md).
- [Logical system layering](layering/logical-system-layering.md) — system-level responsibility flow.
- [API layering principles](layering/api-layering-principles.md) — evidence-based internal API layering; no refactor implied.
- [Multi-tenant context propagation](multi-tenancy/context-propagation.md) — global identity, authorized relationship and tenant-aware persistence concept.
- [Future architecture readiness](future-architecture-readiness.md) — construction closure and Production Gate register.

## Current status

C4 Level 1 and Level 2 are BASELINED. Selective C4 Level 3 TARGET components and Level 4 code views are BASELINED where they explain accepted ownership and invariant boundaries; they remain technical lenses, not Bounded Contexts. Application, data, security, integration and frontend construction targets are CLOSED for PRE-V1. Production cloud/deployment remains an OPEN-NON-BLOCKER Production Gate.

## Historical context

- [Pre-Strategic-DDD baseline](pre-ddd-baseline.md) — superseded discovery-era boundary and non-decisions, retained as historical evidence.

## Expected artifacts

Accepted ADRs, architecture drivers, C4 L1/L2 source, selective L3/L4 TARGET views, application/data/security/integration guidance and later implementation decisions under KEEP/REFINE/REWORK.

## What must not live here

Final module boundaries inferred from code, claims that technical modules equal Bounded Contexts, copied application source or production cloud/provider claims.

## Related areas

[Governance](../00-governance/README.md), [Domain discovery readiness](../02-domain/README.md), [AS-IS evidence](../11-reference/as-is/README.md), [Operations](../08-operations/README.md).
