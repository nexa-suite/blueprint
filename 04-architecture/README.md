# Architecture

## Purpose

Index accepted architecture decisions, the defensible C4 L1/L2 baseline, logical layering principles, multi-tenant context propagation and the pre-Strategic-DDD boundary.

## Authoritative content

- [Pre-Strategic-DDD baseline](pre-ddd-baseline.md) — current architecture boundary and explicit non-decisions.
- [Initial architecture drivers](architecture-drivers/initial-drivers.md).
- [ADR index](adrs/README.md) and accepted ADRs.
- [Canonical C4 model](c4/README.md) — L1/L2 rationale, exact containers, exclusions and runway semantics.
- [C4 Structurizr source](c4/structurizr/README.md) — canonical DSL and four views.
- [Logical system layering](layering/logical-system-layering.md) — system-level responsibility flow.
- [API layering principles](layering/api-layering-principles.md) — evidence-based internal API layering; no refactor implied.
- [Multi-tenant context propagation](multi-tenancy/context-propagation.md) — global identity, authorized relationship and tenant-aware persistence concept.
- [Future architecture readiness](future-architecture-readiness.md) — index only; no TARGET boundaries.

## Current status

C4 Level 1 and Level 2 are BASELINED and synchronized with the closed Product / Business V1 input. The Architecture Runway is BASELINED. Logical layering and multi-tenant propagation are conceptual pre-DDD architecture principles, not final domain/data/security architecture. The pre-DDD baseline is READY FOR CAPABILITY MAPPING. Future application, tenant and integration architecture are NOT STARTED. C4 Level 3 is BLOCKED and intentionally not created.

## Expected artifacts

Accepted ADRs, architecture drivers, C4 L1/L2 source, future application/tenant/integration indexes, and later C4 L3 only after Strategic DDD and ownership decisions.

## What must not live here

Final module boundaries inferred from code, Bounded Contexts before Strategic DDD, TARGET data/security/cloud architecture or copied application source.

## Related areas

[Governance](../00-governance/README.md), [Domain discovery readiness](../02-domain/README.md), [AS-IS evidence](../11-reference/as-is/README.md), [Operations](../08-operations/README.md).
