-- TARGET / BC-11 Business Traceability / shared PostgreSQL
-- Append-only business facts; source aggregate IDs and evidence references are stable IDs.

CREATE TABLE business_traceability_record (
    traceability_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid,
    event_id uuid NOT NULL,
    event_type varchar(160) NOT NULL,
    aggregate_type varchar(120) NOT NULL,
    aggregate_id uuid NOT NULL,
    actor_id uuid,
    payload jsonb NOT NULL,
    occurred_at timestamptz NOT NULL,
    recorded_at timestamptz NOT NULL,
    payload_hash varchar(128) NOT NULL,
    UNIQUE (tenant_id, event_id),
    UNIQUE (tenant_id, aggregate_type, aggregate_id, event_id)
);

CREATE TABLE traceability_evidence_reference (
    evidence_reference_id uuid PRIMARY KEY,
    traceability_id uuid NOT NULL REFERENCES business_traceability_record (traceability_id),
    evidence_kind varchar(32) NOT NULL CHECK (evidence_kind IN ('DOCUMENT','OBJECT','API_REQUEST','USER_ACTION','PROVIDER_EVENT','OTHER')),
    source_reference varchar(500) NOT NULL,
    content_hash varchar(128),
    created_at timestamptz NOT NULL
);

CREATE INDEX ix_traceability_scope_time ON business_traceability_record (tenant_id, occurred_at);
CREATE INDEX ix_traceability_aggregate_time ON business_traceability_record (aggregate_type, aggregate_id, occurred_at);
CREATE INDEX ix_traceability_evidence_record ON traceability_evidence_reference (traceability_id);
