---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: security
last-reviewed: 2026-08-23
---

# ADR-0017: Privileged Support and Break-Glass Security

## Status

Accepted principle; implementation details remain Production Gate.

## Context

Emergency support may require constrained access without turning Support into a universal bypass or confusing Security Audit with Business Traceability.

## Decision

Break-glass requires named operator, independent approval, incident/reason, exact Tenant/object scope, short TTL, least-privilege allowlist, revocation, fencing and immutable Security Audit. It is never implicit in Company Owner or ordinary support access.

## Consequences

Emergency access is accountable and bounded. Production must prove approval, expiry, revocation, evidence retention and post-incident review.

## Alternatives

Rejected permanent admin bypass, blanket impersonation and undocumented database access.

## Evidence

[Security target](../../../security/security-architecture-target.md), [threat model](../../../security/threat-model.md).

## Supersedes / Superseded by

Supersedes generic “authorized support” wording without a control flow. Production implementation ADR may refine this record.
