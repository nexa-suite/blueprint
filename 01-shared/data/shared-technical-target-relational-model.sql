-- TARGET / Shared Technical Infrastructure / shared PostgreSQL
-- Technical reliability tables are not a Bounded Context and do not own business aggregates.

CREATE TABLE outbox_event (
    outbox_event_id uuid PRIMARY KEY,
    tenant_id uuid,
    workspace_id uuid,
    event_type varchar(160) NOT NULL,
    aggregate_type varchar(120) NOT NULL,
    aggregate_id uuid NOT NULL,
    payload jsonb NOT NULL,
    occurred_at timestamptz NOT NULL,
    published_at timestamptz,
    attempt_count integer NOT NULL DEFAULT 0 CHECK (attempt_count >= 0),
    UNIQUE (tenant_id, aggregate_type, aggregate_id, event_type, occurred_at)
);

CREATE TABLE inbox_deduplication (
    inbox_id uuid PRIMARY KEY,
    consumer_name varchar(160) NOT NULL,
    message_id uuid NOT NULL,
    received_at timestamptz NOT NULL,
    processed_at timestamptz,
    status varchar(32) NOT NULL CHECK (status IN ('RECEIVED','PROCESSED','FAILED')),
    UNIQUE (consumer_name, message_id)
);

CREATE TABLE idempotency_record (
    idempotency_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid,
    operation_name varchar(160) NOT NULL,
    idempotency_key varchar(240) NOT NULL,
    request_hash varchar(128) NOT NULL,
    response_status integer,
    response_snapshot jsonb,
    created_at timestamptz NOT NULL,
    completed_at timestamptz,
    UNIQUE (tenant_id, operation_name, idempotency_key)
);

CREATE TABLE worker_lease (
    lease_id uuid PRIMARY KEY,
    worker_name varchar(160) NOT NULL,
    lease_token varchar(240) NOT NULL,
    acquired_at timestamptz NOT NULL,
    expires_at timestamptz NOT NULL,
    UNIQUE (worker_name)
);

CREATE TABLE security_audit_event (
    security_audit_event_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid,
    actor_id uuid,
    action varchar(160) NOT NULL,
    resource_type varchar(120),
    resource_id uuid,
    outcome varchar(32) NOT NULL CHECK (outcome IN ('SUCCESS','DENIED','ERROR')),
    metadata jsonb,
    occurred_at timestamptz NOT NULL
);

CREATE INDEX ix_outbox_unpublished ON outbox_event (published_at, occurred_at);
CREATE INDEX ix_inbox_consumer_status ON inbox_deduplication (consumer_name, status, received_at);
CREATE INDEX ix_idempotency_scope_operation ON idempotency_record (tenant_id, operation_name, created_at);
CREATE INDEX ix_lease_expiry ON worker_lease (expires_at);
CREATE INDEX ix_security_audit_scope_time ON security_audit_event (tenant_id, occurred_at);
