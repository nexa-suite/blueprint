---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# BC-09 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Table | PK / local FK | Integrity |
|---|---|---|
| `document_number_series` | `series_id` | scoped type/series unique; monotonic number and version |
| `business_document` | `document_id`; series FK | immutable number; scoped type/number unique |
| `document_snapshot_line` | `line_id`; document FK | frozen description/price/quantity snapshot |
| `document_revision` | `revision_id`; document FK | revision/hash unique; append-only |
| `object_storage_reference` | `object_reference_id`; document FK | object key/hash unique; metadata only |
| `document_generation_request` | `generation_request_id`; document/object refs | generation retry lifecycle |

SQL defines PK/FK, NOT NULL, non-negative/positive checks, uniques and issue,
revision and generation indexes. RLS scopes tenant/workspace. Object Storage
holds bytes; PostgreSQL carries key, content type, size and hash—never BLOB.

Sales order, payment, receivable and SKU IDs are stable non-owning references.
Issued documents and snapshots are immutable; correction means revision or
void. AS-IS anchors: `business_documents.business_document`, generation,
evidence and object storage tables.
