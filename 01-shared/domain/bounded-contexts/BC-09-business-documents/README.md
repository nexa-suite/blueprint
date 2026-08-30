---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-09 Business Documents

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Owns immutable issued commercial document history and evidence metadata; Generic. Strategic importance: preserves durable business evidence without owning source facts. |
| Language / actors | Sales Order Document, Delivery Note, Commercial Invoice, Payment Receipt, Financial Adjustment, numbering, snapshot, replacement, evidence reference. Actors: Business Operations Manager, Sales Representative, B2B Buyer. |
| Responsibilities / data | Numbering, issued snapshots, document metadata, object references, replacement/addendum links and authorized availability. |
| Invariants | Issued artifacts immutable; corrections are linked; Commercial Invoice != SUNAT fiscal integration; source business state remains upstream. |
| Commands | RequestDocument, IssueDocument, ReplaceDocument, AddEvidenceReference, PublishDocumentAvailability. |
| Domain / published events | Internal: DocumentRequested, DocumentIssued, DocumentReplaced. Published: BusinessDocumentIssued.v1. |
| Upstream / downstream | Upstream: Sales, Fulfillment, Payments, Credit and Financial Adjustment facts. Downstream: Portal, Buyer Mobile, Notifications and Traceability. Sync: issue snapshot; async: availability. |
| Failure / transaction | Missing source snapshot blocks issue; object-storage failure leaves reviewable pending state; replacement never mutates issued history. |
| Security / tenant | Documents and evidence are tenant-owned; authorized download goes through API policy and object ACL; no secrets in metadata. |
| Web / Mobile consumers | Web: Platform and Portal documents. Mobile: Buyer Mobile document/payment evidence; Operations Mobile delivery evidence references only. |
| Out of scope | Source order/payment state, fiscal SUNAT authority, object storage provider lifecycle and a Documents Mobile BC. |

## Tactical DDD target

Aggregate Root: BusinessDocument. Entities: DocumentLineSnapshot, ReplacementLink, EvidenceReference. Value Objects: DocumentId, DocumentNumber, DocumentType, IssuedSnapshot. Domain Services: DocumentNumberingPolicy, DocumentIssuePolicy. Repositories: BusinessDocumentRepository. Lifecycle: requested → issued → available → replaced/linked without mutation.

## Tactical wave artifacts

- [Tactical model](tactical-model.md)
- [Domain UML source](diagrams/domain-model.puml)
- [Rendered UML SVG](diagrams/BC09_BusinessDocuments.svg)
- [Rendered UML PNG](diagrams/BC09_BusinessDocuments.png)
- [Target data model](data/data-model.md)
- [Target SQL](data/target-relational-model.sql)
- [Database ERD SVG](data/database-diagram.svg) · [PNG](data/database-diagram.png)
