---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-11 Business Traceability

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Durable transversal representation of significant business facts; Supporting. Strategic importance: makes commercial and physical history explainable. |
| Language / actors | Business fact, actor, reason, evidence, correlation, timeline, before/after. Actors: authorized workforce and Buyer readers. |
| Responsibilities / data | Append-only tenant-scoped facts, actor/time/reason/correlation, before/after and evidence references; source contexts retain authority. |
| Invariants | Append-only; tenant-scoped; consultable by authorized actors; no secrets/unnecessary sensitive payloads; Security Audit remains separate. |
| Commands | TraceBusinessFact, AppendEvidenceReference, ProjectTimeline, RedactProtectedPayload. |
| Domain / published events | Internal: BusinessFactRecorded. Published: BusinessFactTraced.v1. Consumes significant facts from the frozen source contexts and NotificationDeliveryFailed.v1. |
| Upstream / downstream | Upstream: all source BCs and Notifications. Downstream: authorized Platform, Portal, Mobile timeline/evidence projections and operations review. Async after source commit. |
| Failure / transaction | Source commit is not rolled back by trace projection failure; durable outbox/inbox and backlog/replay keep loss visible. |
| Security / tenant | Strict tenant scope, least-privilege timeline reads, separate security audit, evidence references not raw secrets. |
| Web / Mobile consumers | Web: Platform and Portal timelines. Mobile: delivery evidence, Buyer order/delivery history and operational exception views. |
| Out of scope | Source aggregate authority, notification delivery, security audit store, Analytics BC and a Mobile Traceability BC. |

## Tactical DDD target

Aggregate Root: BusinessTimeline. Entities: BusinessFact, EvidenceReference, CorrelationLink. Value Objects: FactId, ActorRef, Reason, SourceReference, TimelineEntry. Domain Services: TraceabilityProjectionPolicy, SensitivePayloadPolicy. Repositories: BusinessFactRepository. Lifecycle: recorded → projected → authorized/reviewed; entries are never silently overwritten.
