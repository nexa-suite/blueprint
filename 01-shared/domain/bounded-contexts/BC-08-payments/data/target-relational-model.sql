-- TARGET / BC-08 Payments / shared PostgreSQL
-- Provider payload is immutable evidence; external commercial/financial IDs are not FKs.

CREATE TABLE payment (
    payment_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    customer_account_id uuid NOT NULL,
    commercial_commitment_id uuid,
    receivable_id uuid,
    amount numeric(19,4) NOT NULL CHECK (amount > 0),
    currency char(3) NOT NULL,
    method varchar(32) NOT NULL CHECK (method IN ('CARD','TRANSFER','CASH','OTHER')),
    status varchar(32) NOT NULL CHECK (status IN ('INITIATED','AUTHORIZED','CONFIRMED','FAILED','CANCELLED','REFUNDED','PARTIALLY_REFUNDED')),
    initiated_at timestamptz NOT NULL,
    confirmed_at timestamptz,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0)
);

CREATE TABLE payment_attempt (
    attempt_id uuid PRIMARY KEY,
    payment_id uuid NOT NULL REFERENCES payment (payment_id),
    provider_code varchar(80) NOT NULL,
    provider_reference varchar(200),
    status varchar(32) NOT NULL CHECK (status IN ('STARTED','AUTHORIZED','DECLINED','ERROR')),
    attempted_at timestamptz NOT NULL,
    completed_at timestamptz
);

CREATE TABLE payment_provider_event (
    event_id uuid PRIMARY KEY,
    payment_id uuid REFERENCES payment (payment_id),
    provider_code varchar(80) NOT NULL,
    provider_event_id varchar(240) NOT NULL,
    event_type varchar(120) NOT NULL,
    payload jsonb NOT NULL,
    payload_hash varchar(128) NOT NULL,
    received_at timestamptz NOT NULL,
    UNIQUE (provider_code, provider_event_id)
);

CREATE TABLE payment_refund (
    refund_id uuid PRIMARY KEY,
    payment_id uuid NOT NULL REFERENCES payment (payment_id),
    amount numeric(19,4) NOT NULL CHECK (amount > 0),
    currency char(3) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('REQUESTED','PROCESSING','COMPLETED','FAILED')),
    reason varchar(500) NOT NULL,
    requested_at timestamptz NOT NULL,
    completed_at timestamptz
);

CREATE TABLE payment_correction (
    correction_id uuid PRIMARY KEY,
    payment_id uuid NOT NULL REFERENCES payment (payment_id),
    amount_delta numeric(19,4) NOT NULL CHECK (amount_delta <> 0),
    reason varchar(500) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('PENDING','APPROVED','POSTED','REJECTED')),
    created_by_identity_id uuid NOT NULL,
    created_at timestamptz NOT NULL,
    posted_at timestamptz
);

CREATE TABLE payment_reconciliation_case (
    case_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    payment_id uuid NOT NULL REFERENCES payment (payment_id),
    reason varchar(500) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('OPEN','INVESTIGATING','RESOLVED','CLOSED')),
    opened_at timestamptz NOT NULL,
    resolved_at timestamptz
);

CREATE INDEX ix_payment_scope_status ON payment (tenant_id, workspace_id, status);
CREATE INDEX ix_payment_attempt_payment ON payment_attempt (payment_id, attempted_at);
CREATE INDEX ix_provider_event_payment_time ON payment_provider_event (payment_id, received_at);
CREATE INDEX ix_reconciliation_scope_status ON payment_reconciliation_case (tenant_id, workspace_id, status);
