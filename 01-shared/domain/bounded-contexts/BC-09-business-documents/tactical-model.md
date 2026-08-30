---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-29
---

# BC-09 Business Documents — Tactical Model

**State:** TARGET generic context. It owns immutable issued document metadata,
numbering, snapshots and Object Storage references. It does not own Sales,
Payment, Delivery or fiscal authority.

## Purpose and product participation

Own issued document identity, immutable snapshots, numbering, generation and
private object references. Platform and Portal consume documents; proposed
Mobile surfaces consume authorized evidence. API remains authority.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `BusinessDocument` | requested/issued/replaced document snapshot and availability metadata | subject type/ID, CustomerAccount ID |
| `DocumentNumberSeries` | scoped numbering allocation | tenant/workspace IDs |
| `DocumentGenerationRequest` | retryable generation intent with idempotency/lease | BusinessDocument ID |
| `ObjectStorageReference` | metadata for private bytes outside PostgreSQL | object key, evidence subject |

Issued document facts are never updated in place. Replacement/revision links
preserve the original.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `BusinessDocument` | Aggregate Root | document ID, type, number, version, status, subject snapshot, issuedAt | `request()`, `issue()`, `replace()`, `void()` | composes snapshot lines/revision links |
| `DocumentNumberSeries` | Aggregate Root | tenant/workspace, document type, next number, version | `reserveNumber()` | one scoped numbering boundary |
| `DocumentSnapshotLine` | Entity | label, quantity, price, source ID | immutable after issue | owned by document |
| `DocumentRevision` | Entity / fact | previous ID, replacement ID, reason, createdAt | `link()` | no overwrite |
| `ObjectStorageReference` | Aggregate Root | key, bucket, content type, size, hash, private flag | `register()`, `markAvailable()` | bytes external |
| `DocumentGenerationRequest` | Entity | idempotency key, attempt count, lease, nextAttemptAt | `claim()`, `retry()`, `complete()`, `fail()` | request lifecycle |
| `DocumentType` / `DocumentStatus` | Enum | V1 document kinds/status | none | Commercial Invoice != SUNAT fiscal doc |
| `StorageReference` / `ContentHash` | Value Objects | object metadata | `matches()` | no BLOB |
| `DocumentNumberingPolicy` | Domain Service | none | `nextNumber(scope, type)` | no table ownership |
| `DocumentIssuePolicy` | Domain Service | none | `validateSnapshot()` | source contracts |
| `BusinessDocumentRepository` | Repository interface | none | `save()`, `byId()` | root only |
| `BusinessDocumentIssued` | Domain Event | document ID/type, issuedAt | immutable fact | existing event catalog only |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `RequestBusinessDocumentHandler` | request document | reads source snapshot, allocates idempotency and queues generation |
| `IssueBusinessDocumentHandler` | issue immutable document | number allocation, renderer, storage metadata and commit |
| `ReplaceBusinessDocumentHandler` | correction/replacement | links new revision; never edits issued record |
| `RegisterEvidenceReferenceHandler` | attach POD/media evidence | metadata/hash/object lifecycle only |
| `RetryDocumentGenerationHandler` | worker retry | lease/fencing, bounded attempts and visible failure |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `BusinessDocumentController` | Platform/Portal document projection/download boundary | AS-IS invoicing controller; KEEP/REFINE |
| `DocumentGenerationConsumer` | internal source context request port | TARGET application interface |
| `DocumentAvailabilityConsumer` | Portal/Mobile read/evidence consumer | TARGET projection interface |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `BusinessDocumentRepositoryAdapter` | PostgreSQL metadata/snapshot persistence | AS-IS V42/V52/V58; KEEP/REFINE |
| `DocumentRendererAdapter` | PDF/CSV/XML generation boundary | AS-IS renderer; provider-neutral |
| `ObjectStorageAdapter` | private object bytes | AS-IS Object Storage port; KEEP |
| `DocumentGenerationWorker` | lease/retry worker | AS-IS V81; KEEP/REFINE |
| `DocumentOutboxAdapter` | committed availability publication | shared technical outbox |

## Invariants and transactions

- Issued documents are immutable; corrections create linked revision/replacement.
- Commercial Invoice is a Nexa document, not automatically a SUNAT fiscal
  document.
- PostgreSQL stores snapshots and metadata only. Object bytes remain in Object
  Storage behind API authorization.
- Number allocation and issuance are idempotent; sequence gaps are explicit,
  not silently reused.

## Events, persistence and evidence

See [BC-09 data model](data/data-model.md), [target SQL](data/target-relational-model.sql)
and [domain UML](diagrams/domain-model.puml). Existing document events remain
within the frozen catalog.

AS-IS evidence at API main: `invoicing` classes and
`business_documents` V42, V52, V58, V81. Classification: document metadata,
rendering and storage references **KEEP/REFINE**, immutable revision semantics
**REFINE**, fiscal integration **OUT OF SCOPE / NOT IMPLEMENTED**.

## Mobile v0.17 reconciliation

Mobile evidence is represented as an `EvidenceReference`/`MobileEvidenceReference`
application value: object key/reference, content hash, media kind, capturedAt,
subject and authorization metadata. It is not a Mobile-owned aggregate and does
not move Business Document authority to the client. API v0.17.0 hardens
evidence references for handoff/receipt flows; issued documents remain
immutable and private Object Storage bytes remain behind API authorization.
