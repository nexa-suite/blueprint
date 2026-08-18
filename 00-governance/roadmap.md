---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-15
---

# Architecture roadmap

## Completed baseline

1. Clean project foundation — BASELINED
2. C4 L1/L2 V1 and Runway — BASELINED
3. Initial Architecture Drivers — BASELINED
4. AS-IS evidence baseline — CLOSED WITH CAVEAT
5. Product & Business V1 — FROZEN / CLOSED

## Strategic DDD sequence

6. Capability Mapping — NOT STARTED
7. Big Picture EventStorming — NOT STARTED
8. Process-Level EventStorming — NOT STARTED
9. Domain Storytelling — NOT STARTED
10. Language Collisions / Ubiquitous Language work — NOT STARTED
11. Subdomain classification — NOT STARTED
12. Bounded Context discovery — NOT STARTED
13. Bounded Context canvases — NOT STARTED
14. Context Mapping — NOT STARTED
15. Strategic DDD freeze — NOT STARTED

## Parallel Technical Foundation Wave 0

Business closure does not merge with technical architecture. A separate Technical Architect workstream may execute genuinely business-independent, SCM-authorized foundation work; module realignment, data ownership, broad RLS redesign and other boundary decisions remain gated by the relevant architecture evidence.

## Post-DDD technical architecture maturation

After Strategic DDD, mature technical architecture iteratively as each decision requires:

- Application Architecture.
- Tenant and Provisioning.
- IAM and Security.
- Data and RLS/isolation.
- API and Integration/Events.
- Object Storage.
- Frontend Architecture.
- Runtime, Deployment and Cloud.
- CI/CD, Observability, Reliability and Performance.
- ADRs and Architecture Fitness.

## Later architecture and delivery

16. C4 L3 when accepted component boundaries make it useful — NOT STARTED
17. Implementation Rebaseline — NOT STARTED
18. Production Hardening — NOT STARTED
19. Mobile, Driver, Control Center and IoT runway refinement — FUTURE

## Implementation gate

Implementation may proceed before full Strategic DDD when work is safely independent of unresolved architecture decisions. Examples include read-only audits, deterministic test reliability, documentation validation, nonsemantic tooling and urgent security/integrity fixes.

Module realignment, ownership redesign, Buyer identity redesign, structural Tenant genericization, broad RLS redesign, data ownership migration and frontend architecture restructuring normally wait for the relevant architecture decision. Architecture must be sufficient for the decision being implemented, not infinitely complete.
