---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-19
---

# Architecture roadmap

## Completed baseline

1. Clean project foundation — BASELINED
2. C4 L1/L2 V1 and Runway — BASELINED
3. Initial Architecture Drivers — BASELINED
4. AS-IS evidence baseline — CLOSED WITH CAVEAT
5. Product & Business V1 — FROZEN / CLOSED

## Strategic DDD sequence — active proposal

6. Capability Mapping — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW
7. Big Picture EventStorming — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW
8. Process-Level EventStorming — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW
9. Domain Storytelling — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW
10. Language Collisions / Ubiquitous Language work — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW
11. Subdomain classification — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW
12. Bounded Context discovery — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW
13. Bounded Context canvases — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW
14. Context Mapping — PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW
15. Strategic DDD acceptance — PENDING BUSINESS ARCHITECT REVIEW

## Parallel Technical Foundation Wave 0 — accepted baseline

Technical Foundation Wave 0 is accepted / baselined for its current purpose in API, Platform and Portal. It is not a claim that every technical foundation is complete. Product repositories remain unchanged by this Blueprint task.

## Technical Architecture Rebaseline — this task

This rebaseline documents proposed application, tactical DDD, data, transaction/concurrency, security, integration/event, API, frontend, runtime/reliability, C4 L3/L4 and construction-readiness guidance. Proposed business boundaries await review; implementation changes do not follow automatically.

## Parallel workstreams and gates

- Design: active parallel workstream; final visual convergence pending.
- Construction: vertical-slice gated; no blind implementation authorization.
- Pre-V1 Architecture Convergence: required before V1 freeze/release.
- Production Architecture / Hardening: later dedicated gate.

## Later technical maturation

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

16. Business Architect review and Strategic DDD acceptance — PENDING
17. Implementation Rebaseline — GATED BY APPROVED BOUNDARIES
18. Production Hardening — NOT STARTED
19. Mobile, Driver, Control Center and IoT runway refinement — FUTURE

## Implementation gate

Implementation may proceed before full Strategic DDD when work is safely independent of unresolved architecture decisions. Examples include read-only audits, deterministic test reliability, documentation validation, nonsemantic tooling and urgent security/integrity fixes.

Module realignment, ownership redesign, Buyer identity redesign, structural Tenant genericization, broad RLS redesign, data ownership migration and frontend architecture restructuring wait for approved decisions. Architecture must be sufficient for the decision being implemented, not infinitely complete.
