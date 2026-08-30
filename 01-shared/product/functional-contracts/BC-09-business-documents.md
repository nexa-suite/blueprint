---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-09 — Business Documents functional contract

**Purpose:** issue, store metadata for and authorize access to immutable
commercial documents and evidence references.

| Contract element | Definition |
|---|---|
| Concepts / roots | Business Document, Number Series, Document Snapshot, Revision, Object Storage Reference, Generation Request |
| Value objects | DocumentId, DocumentNumber, DocumentType, ContentHash, StorageReference, EvidenceReference |
| Boundary | Owns issued document history and object metadata; never owns source order, payment, delivery or fiscal authority. |
| Commands | RequestDocument, IssueDocument, ReplaceDocument, RegisterEvidenceReference, PublishAvailability |
| Queries | ReadDocumentHistory, ReadDocumentMetadata, DownloadAuthorizedDocument |
| Invariants | Issued artifact is immutable; replacement links rather than overwrites; bytes are private Object Storage metadata, not business authority. |
| Actors / surfaces | Company Owner, Business Operations Manager, Sales Representative, Dispatch Coordinator, Customer Buyer; Platform, Buyer Portal, Mobile. |
| Synchronous dependencies | Source snapshot from BC-04/06/07/08; authorization from BC-01/02. |
| Events / consumers | `BusinessDocumentIssued.v1`; consumers include Portal, Mobile, Notifications and Traceability. |
| Trace / idempotency / concurrency | issuance/generation key, number-series lock, generation lease/fencing, immutable evidence hash and actor. |
| Scope | V1: commercial document history and evidence references. V2/Future: richer fiscal/SUNAT and print workflows. |
| AS-IS evidence | API invoicing/business-document V42/V52/V58/V81 and v0.17 mobile evidence contract; fiscal production gate remains open. |
