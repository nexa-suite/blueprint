# Security

## Purpose

Index current security evidence and unresolved security architecture concerns while preserving tenant isolation as a non-negotiable product driver.

## Authoritative content

- [Security architecture readiness](security-architecture-readiness.md).
- [AS-IS implementation baseline](../11-reference/as-is/v1-implementation-baseline.md).
- [Architecture readiness gaps](../11-reference/as-is/architecture-readiness-gaps.md).
- Accepted identity and role decisions in [Current accepted decisions](../00-governance/current-decisions.md).

## Current status

Authentication and authorization mechanisms, tenant-context controls and RLS evidence are BASELINED as AS-IS evidence. TARGET Security Architecture is NOT DEFINED. No final threat model is claimed.

## Expected artifacts

Authentication, authorization, tenant isolation, RLS policy, security audit, threat model, secrets/provider and operational security architecture.

## What must not live here

Secrets, credentials, a false final threat model, inferred Bounded Context security ownership or production provider claims without evidence.

## Related areas

[Domain](../02-domain/README.md), [Data](../05-data/README.md), [Operations](../08-operations/README.md), [Architecture](../04-architecture/README.md).
