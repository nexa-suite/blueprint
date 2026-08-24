# Security

## Purpose

Index current security evidence and the accepted PRE-V1 security construction target while preserving tenant isolation as a non-negotiable product driver.

## Authoritative content

- [Security architecture readiness](security-architecture-readiness.md).
- [PRE-V1 security architecture](security-architecture-target.md), [authorization matrix](authorization-matrix.md) and [threat model](threat-model.md).
- [AS-IS implementation baseline](../../06-delivery/as-is/v1-implementation-baseline.md).
- [Architecture readiness gaps](../../06-delivery/as-is/architecture-readiness-gaps.md).
- Accepted identity and role decisions in [Current accepted decisions](../../00-start-here/current-decisions.md).

## Current status

Authentication and authorization mechanisms, tenant-context controls and RLS evidence are BASELINED as AS-IS evidence. PRE-V1 Security Architecture is BASELINED for construction, including fail-closed tenant scope and break-glass constraints. Production security proof remains a gate.

## Expected artifacts

Authentication, authorization, tenant isolation, RLS policy, security audit, threat model, secrets/provider and operational security architecture.

## What must not live here

Secrets, credentials, a false final threat model, inferred Bounded Context security ownership or production provider claims without evidence.

## Related areas

[Domain](../../02-domain/README.md), [Data](../data/README.md), [Operations](../../06-delivery/README.md), [Architecture](../README.md).
