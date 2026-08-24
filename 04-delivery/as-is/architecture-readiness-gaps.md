---
status: reference
maturity: HISTORICAL
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# Architecture readiness gaps — historical AS-IS evidence register

This document describes AS-IS evidence and must not be interpreted as the TARGET domain or technical architecture.

The register preserves questions that the earlier code, tests, runtime and
governance evidence did not resolve. Accepted PRE-V1 domain, data, security
and application baselines now answer the documentation-closure questions;
implementation and production gaps remain separate gates. This record does not
override the accepted TARGET.

| Classification | Gap / observed evidence | Why evidence is insufficient | Future activity that should resolve it |
|---|---|---|---|
| BLOQUEO | Global Buyer identity/profile: current IAM user, Buyer role, client-account membership and Portal profile exist. | No complete evidence establishes the global identity model, lifecycle, profile ownership or privacy behavior across tenants. | Strategic DDD |
| BLOQUEO | Buyer-to-tenant/customer relationships and account selector semantics: memberships, client accounts and workspace preview exist. | Current flows do not establish whether selection is tenant, workspace, client account or a composed relationship, nor all authorization consequences. | EventStorming; Strategic DDD; Security Architecture |
| BLOQUEO | Tenant vs Workspace long-term semantics: governance accepts V1 1:1. | Current database/RLS/frontend code cannot establish post-V1 multiplicity or whether the current selector is a durable business concept. | Domain Storytelling; Strategic DDD |
| HECHO / BLOQUEO | Executive Overview/KPI ownership: permission keys and Platform overview routes exist. | Current read models, KPI definitions, source-of-truth and ownership are not comprehensively evidenced. | Capability Mapping; Data Architecture |
| BLOQUEO | Catalog media ownership/storage/delivery: product asset references, MinIO and accepted decisions exist. | Binary lifecycle, tenant ownership, variants, CDN/public delivery and authorization are not proven end to end. | Domain Storytelling; Data Architecture; Cloud/Deployment Architecture |
| BLOQUEO | Comprehensive RLS model: migrations and runtime tenant/workspace settings prove mechanisms. | Coverage, worker/bootstrap behavior, every table policy and operational bypass policy are not established as complete. | Security Architecture; Data Architecture |
| BLOQUEO | Worker/bootstrap/cross-tenant security: outbox, reservation, document, payment and cleanup workers exist. | Worker identity, tenant context propagation, system-operator scope and failure isolation require a dedicated threat/security review. | Security Architecture |
| OBSERVACIÓN | Angular browser delivery and future deployment contract. | Current evidence describes browser builds served by Nginx; no accepted SSR requirement exists. Production deployment and security constraints remain future Cloud/Deployment and Security Architecture work. | Cloud/Deployment Architecture; Security Architecture |
| BLOQUEO | Production providers and credentials: local Mailpit, MinIO, ClamAV, Stripe mock and OpenTelemetry services are healthy. | Local mocks do not prove production email, object storage, antivirus, payment, maps, observability credentials, SLAs or rotation. | Cloud/Deployment Architecture; Security Architecture |
| BLOQUEO | Warehouse versus Dispatch/Delivery boundary: current controllers/tables/events cover both. | Current implementation coupling and lifecycle terms do not establish final business ownership or handoff semantics. | EventStorming; Domain Storytelling; Strategic DDD |
| BLOQUEO | Pricing and Commercial Terms: pricing, promotions, previews and authoritative-pricing tests exist. | Effective price, negotiated terms, approvals, snapshots and order-time invariants are not fully resolved as business behavior. | Capability Mapping; EventStorming; Strategic DDD |
| BLOQUEO | Payments, Credit, Receivables and Invoicing: current schemas, APIs, Stripe mock and document flows exist. | Provider, fiscal, credit decisioning, receivable allocation, invoice authority and reconciliation boundaries remain incomplete. | EventStorming; Strategic DDD; Data Architecture |
| BLOQUEO | Document ownership: generated documents, evidence objects, object storage and scanning are present. | No final ownership, retention, legal/fiscal status or cross-lifecycle authority is established. | Domain Storytelling; Data Architecture |
| BLOQUEO | Notifications ownership: inbox, outbox projection, Mailpit and frontend services exist. | Business/security notification ownership, preferences, delivery guarantees and retry/dead-letter policy are not fully specified. | Capability Mapping; EventStorming |
| BLOQUEO | Audit ownership: audit events and viewer exist. | Completeness, immutable retention, privacy, tenant scope and responsibility for emitting events are not closed. | Security Architecture; Data Architecture |
| BLOQUEO | Analytics/projection ownership: overview, logistics analytics, change feed and event infrastructure exist. | No canonical projection inventory, freshness/SLA, KPI definitions or ownership is evidenced. | Capability Mapping; Data Architecture |
| HECHO / BLOQUEO | Static/runtime documentation drift: historical readiness says 223/223 paths; current static/runtime are 224/224 with equal path sets. | Historical documentation was not rewritten; drift policy and ownership are not established. | Documentation governance follow-up |
| HECHO / BLOQUEO | Authenticated browser evidence: Platform 52 cases yielded 2 passed/50 credential-blocked; Portal 16 yielded 2 passed/14 credential-blocked. | Approved local credentials/fixtures are absent in this run; authenticated UX, provider behavior and visual/runtime evidence cannot be claimed. | Security Architecture; Cloud/Deployment Architecture |
| HECHO / BLOQUEO | Website publication/CI status: static form and API endpoint exist, but external publication and CI evidence are unavailable. | Publication gate, external notification and CI evidence are not available. | Cloud/Deployment Architecture; documentation governance |

## Explicit non-decisions

This register does not define capabilities, subdomains, Bounded Contexts, aggregates, context maps, data architecture, security architecture, cloud architecture or C4 L3. It does not decide the gaps above.
