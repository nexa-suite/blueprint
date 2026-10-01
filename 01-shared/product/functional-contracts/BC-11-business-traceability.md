---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-11 — Business Traceability functional contract

**Purpose:** preserve significant business facts and evidence references in an
append-only, authorized timeline without becoming source aggregate authority.

| Contract element | Definition |
|---|---|
| Concepts / roots | Business Traceability Record, Business Object Reference, Evidence Reference, Actor Reference, Correlation |
| Value objects | FactId, SubjectReference, ActorReference, CorrelationId, Reason, ContentHash |
| Boundary | Owns durable business fact/timeline projection; Security Audit remains a distinct technical record. |
| Commands | TraceBusinessFact, AppendEvidenceReference, RecordCorrectionFact, RebuildAuthorizedTimeline |
| Queries | ReadBusinessTimeline, ReadObjectHistory, ReadEvidenceMetadata |
| Invariants | Append-only, Tenant-scoped, attributable and safe; correction appends; source aggregate is never reconstructed as writable state. |
| Actors / surfaces | Authorized workforce and Customer Buyer; Platform, Buyer Portal, Operations Mobile and Buyer Mobile. |
| Synchronous dependencies | Source transaction writes its outbox; trace projection is asynchronous and replayable. |
| Events / consumers | `BusinessFactTraced.v1`; consumes significant source facts and mobile handoff/receipt/push/override evidence. |
| Trace / idempotency / concurrency | event/source version dedupe, inbox, correlation, actor/reason/evidence refs; append avoids last-write-wins. |
| Scope | V1: significant lifecycle, delivery, correction and evidence timeline. V2/Future: richer operational views and retention tooling. |
| AS-IS evidence | API audit/change-feed/outbox classes and v0.17 evidence hardening; full cross-context projection/replay remains partial. |

## Accepted Operational Exception closure

[Owner decision 2026-10-01](../owner-decisions-2026-10-01-mobile-operations.md) accepts WARNING, BLOCKING and CRITICAL exceptions with reporter/detector, responsible actor, timestamps, type/severity, affected object, resolution/outcome, reason and applicable evidence. Lifecycle: OPEN; CLAIMED/ASSIGNED; UNDER_REVIEW/IN_PROGRESS; RESOLVED; CLOSED. Reporting does not grant resolution authority. BLOCKING/CRITICAL closure requires explicit reason; WARNING may use an already preserved sufficiently explicit resolution code. Owning process authorization and business truth remain authoritative. No implemented exception workflow is claimed by this contract update.
