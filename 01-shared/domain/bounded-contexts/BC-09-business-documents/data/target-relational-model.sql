-- TARGET / BC-09 Business Documents / shared PostgreSQL
-- Business bytes live in Object Storage; only immutable metadata is relational.

CREATE TABLE document_number_series (
    series_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    document_type varchar(32) NOT NULL,
    series_code varchar(32) NOT NULL,
    next_number bigint NOT NULL CHECK (next_number > 0),
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (tenant_id, workspace_id, document_type, series_code)
);

CREATE TABLE business_document (
    document_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    series_id uuid NOT NULL REFERENCES document_number_series (series_id),
    document_type varchar(32) NOT NULL,
    document_number varchar(80) NOT NULL,
    sales_order_id uuid,
    payment_id uuid,
    receivable_id uuid,
    status varchar(32) NOT NULL CHECK (status IN ('DRAFT','ISSUED','VOID','SUPERSEDED')),
    issued_at timestamptz,
    voided_at timestamptz,
    UNIQUE (tenant_id, document_type, document_number)
);

CREATE TABLE document_snapshot_line (
    line_id uuid PRIMARY KEY,
    document_id uuid NOT NULL REFERENCES business_document (document_id),
    sku_id uuid,
    sku_code varchar(80),
    description varchar(500) NOT NULL,
    quantity numeric(19,6) NOT NULL CHECK (quantity > 0),
    unit_price numeric(19,4) NOT NULL CHECK (unit_price >= 0),
    currency char(3) NOT NULL,
    line_total numeric(19,4) NOT NULL CHECK (line_total >= 0)
);

CREATE TABLE document_revision (
    revision_id uuid PRIMARY KEY,
    document_id uuid NOT NULL REFERENCES business_document (document_id),
    revision_number integer NOT NULL CHECK (revision_number > 0),
    snapshot_hash varchar(128) NOT NULL,
    created_by_identity_id uuid NOT NULL,
    created_at timestamptz NOT NULL,
    UNIQUE (document_id, revision_number),
    UNIQUE (document_id, snapshot_hash)
);

CREATE TABLE object_storage_reference (
    object_reference_id uuid PRIMARY KEY,
    document_id uuid NOT NULL REFERENCES business_document (document_id),
    object_key varchar(500) NOT NULL,
    content_type varchar(160) NOT NULL,
    content_length bigint NOT NULL CHECK (content_length >= 0),
    content_hash varchar(128) NOT NULL,
    created_at timestamptz NOT NULL,
    UNIQUE (object_key),
    UNIQUE (document_id, content_hash)
);

CREATE TABLE document_generation_request (
    generation_request_id uuid PRIMARY KEY,
    document_id uuid NOT NULL REFERENCES business_document (document_id),
    status varchar(32) NOT NULL CHECK (status IN ('QUEUED','PROCESSING','COMPLETED','FAILED')),
    requested_at timestamptz NOT NULL,
    completed_at timestamptz,
    failure_reason varchar(500),
    object_reference_id uuid REFERENCES object_storage_reference (object_reference_id)
);

CREATE INDEX ix_business_document_scope_type ON business_document (tenant_id, workspace_id, document_type, status);
CREATE INDEX ix_document_revision_document ON document_revision (document_id, revision_number);
CREATE INDEX ix_generation_request_status ON document_generation_request (status, requested_at);
