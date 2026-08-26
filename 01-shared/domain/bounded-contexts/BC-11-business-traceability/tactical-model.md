---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# BC-11 Business Traceability — Tactical Model

**State:** TARGET supporting append-oriented context. It records durable,
consultable business facts; source BCs retain aggregate authority. Security
Audit remains distinct technical evidence.

## Purpose and product participation

Own append-only business trace facts and evidence references while source
contexts retain authority. Platform, Portal and proposed Mobile surfaces read
authorized timelines; API remains traceability authority.

## Aggregate boundaries

`BusinessTraceabilityRecord` is a lightweight append-only root. It stores actor,
time, reason, correlation, source reference and safe evidence metadata. It does
not reconstruct source aggregates or provide mutation behavior. A
`TraceabilityEvidenceReference` is a child fact because its lifecycle is tied to
the record, while Object Storage bytes remain external.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `BusinessTraceabilityRecord` | Aggregate Root | fact ID, tenant/workspace, event type, subject type/ID, actor, reason, correlation, occurredAt | `append()` | append-only; source ID references |
| `TraceabilityEvidenceReference` | Entity / fact | evidence ID, object reference, content hash, kind | `attach()` | owned by record; no bytes |
| `BusinessObjectReference` | Value Object | source context, type, ID, version | `pointsTo()` | stable cross-BC reference |
| `ActorReference` | Value Object | actor type, identity/membership ID | `isSystem()` | safe actor identity |
| `CorrelationId` / `Reason` | Value Objects | correlation and bounded reason | `normalize()` | query/timeline semantics |
| `TraceabilityProjectionPolicy` | Domain Service | none | `isSignificant(fact)` | selects durable facts |
| `SensitivePayloadPolicy` | Domain Service | none | `removeSecrets(metadata)` | protects payload |
| `BusinessFactRepository` | Repository interface | none | `append()`, `timeline()` | root append/query port |
| `BusinessFactTraced` | Domain Event | fact ID, subject, occurredAt | immutable fact | existing published event only |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `TraceBusinessFactHandler` | append source transition/fact | validates scope, normalizes safe metadata and writes append-only record |
| `ProjectBusinessTimelineHandler` | build authorized timeline | consumes outbox/inbox facts; does not mutate source state |
| `AppendEvidenceReferenceHandler` | link evidence | stores metadata/hash/reference only |
| `SensitivePayloadReviewHandler` | handle protected metadata | redacts/quarantines per policy; no secret persistence |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `AuditViewerController` | current timeline/audit reader | AS-IS audit controller; REFINE boundary separation |
| `BusinessTimelineController` | TARGET authorized business timeline | logical interface, URI not invented |
| `TraceabilityProjectionConsumer` | Platform/Portal/Mobile reader | TARGET projection contract |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `BusinessFactRepositoryAdapter` | PostgreSQL append/query implementation | AS-IS `JdbcAuditViewerQueryAdapter`; REFINE ownership |
| `TraceabilityInboxAdapter` | at-least-once fact ingestion/dedupe | shared technical inbox |
| `TraceabilityOutboxAdapter` | publishes durable trace fact | shared technical outbox |
| `EvidenceReferenceAdapter` | Object Storage metadata lookup | BC-09 port; no blob persistence |

## Invariants and transactions

- Records are append-only and tenant-scoped; corrections append a new fact.
- Traceability projection failure does not roll back source business commit;
  backlog/replay keeps loss visible.
- Significant state transitions retain actor, timestamp, reason, correlation
  and evidence references where relevant.
- Security Audit is separate and may carry security-specific retention/access;
  neither store contains secrets or raw payment credentials.

## Events, persistence and evidence

See [BC-11 data model](data/data-model.md), [target SQL](data/target-relational-model.sql)
and [domain UML](diagrams/domain-model.puml). Published count remains 14.

AS-IS evidence at API main: `audit.event`, audit viewer service/adapter and
integration outbox/change feed. Classification: append/query evidence **KEEP**,
explicit business-vs-security split **REFINE**, complete cross-context timeline
projection and replay **PARTIAL / NOT IMPLEMENTED**.
