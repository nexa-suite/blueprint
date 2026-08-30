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
    next_attempt_at timestamptz,
    last_error varchar(500),
    dead_lettered_at timestamptz
);

CREATE TABLE inbox_deduplication (
    inbox_id uuid PRIMARY KEY,
    consumer_name varchar(160) NOT NULL,
    message_id uuid NOT NULL,
    tenant_id uuid,
    workspace_id uuid,
    received_at timestamptz NOT NULL,
    processed_at timestamptz,
    next_attempt_at timestamptz,
    lease_until timestamptz,
    claim_token varchar(240),
    attempt_count integer NOT NULL DEFAULT 0 CHECK (attempt_count >= 0),
    last_error varchar(500),
    dead_lettered_at timestamptz,
    status varchar(32) NOT NULL CHECK (status IN ('RECEIVED','PROCESSING','PROCESSED','FAILED','DEAD_LETTER')),
    UNIQUE (consumer_name, message_id)
);

CREATE TABLE idempotency_record (
    idempotency_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid,
    actor_id uuid,
    scope_key varchar(240) NOT NULL,
    operation_name varchar(160) NOT NULL,
    idempotency_key varchar(240) NOT NULL,
    request_hash varchar(128) NOT NULL,
    state varchar(32) NOT NULL CHECK (state IN ('PROCESSING','COMPLETED','FAILED','CONFLICT','EXPIRED')),
    response_status integer,
    response_snapshot jsonb,
    failure_code varchar(160),
    created_at timestamptz NOT NULL,
    completed_at timestamptz,
    expires_at timestamptz NOT NULL,
    UNIQUE (scope_key, operation_name, idempotency_key)
);

CREATE TABLE worker_lease (
    lease_id uuid PRIMARY KEY,
    worker_name varchar(160) NOT NULL,
    queue_name varchar(160) NOT NULL,
    item_id uuid NOT NULL,
    tenant_id uuid,
    workspace_id uuid,
    lease_token varchar(240) NOT NULL,
    fencing_version bigint NOT NULL CHECK (fencing_version > 0),
    status varchar(32) NOT NULL CHECK (status IN ('CLAIMED','RELEASED','EXPIRED','DEAD_LETTER')),
    acquired_at timestamptz NOT NULL,
    expires_at timestamptz NOT NULL,
    attempt_count integer NOT NULL DEFAULT 0 CHECK (attempt_count >= 0),
    next_attempt_at timestamptz,
    last_error varchar(500),
    UNIQUE (queue_name, item_id)
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
CREATE INDEX ix_outbox_retry ON outbox_event (published_at, next_attempt_at, occurred_at);
CREATE INDEX ix_inbox_consumer_status ON inbox_deduplication (consumer_name, status, next_attempt_at, received_at);
CREATE INDEX ix_idempotency_scope_operation ON idempotency_record (scope_key, operation_name, state, expires_at);
CREATE INDEX ix_lease_claimable ON worker_lease (queue_name, status, next_attempt_at, expires_at);
CREATE INDEX ix_security_audit_scope_time ON security_audit_event (tenant_id, occurred_at);
