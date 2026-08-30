-- TARGET / BC-07 Credit & Receivables / shared PostgreSQL
-- customer_account_id, commitment_id, payment_id and document_id are stable IDs.

CREATE TABLE credit_account (
    credit_account_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    customer_account_id uuid NOT NULL,
    credit_limit numeric(19,4) NOT NULL CHECK (credit_limit >= 0),
    currency char(3) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('PENDING','ACTIVE','SUSPENDED','CLOSED')),
    approved_at timestamptz,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (tenant_id, customer_account_id)
);

CREATE TABLE credit_reservation (
    reservation_id uuid PRIMARY KEY,
    credit_account_id uuid NOT NULL REFERENCES credit_account (credit_account_id),
    commercial_commitment_id uuid NOT NULL,
    amount numeric(19,4) NOT NULL CHECK (amount > 0),
    currency char(3) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('ACTIVE','RELEASED','CONSUMED','EXPIRED')),
    reserved_at timestamptz NOT NULL,
    released_at timestamptz,
    UNIQUE (credit_account_id, commercial_commitment_id)
);

CREATE TABLE receivable (
    receivable_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    customer_account_id uuid NOT NULL,
    sales_order_id uuid,
    business_document_id uuid,
    original_amount numeric(19,4) NOT NULL CHECK (original_amount > 0),
    outstanding_amount numeric(19,4) NOT NULL CHECK (outstanding_amount >= 0 AND outstanding_amount <= original_amount),
    currency char(3) NOT NULL,
    due_at timestamptz NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('OPEN','PARTIALLY_SETTLED','SETTLED','WRITTEN_OFF')),
    issued_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0)
);

CREATE TABLE receivable_application (
    application_id uuid PRIMARY KEY,
    receivable_id uuid NOT NULL REFERENCES receivable (receivable_id),
    payment_id uuid NOT NULL,
    amount numeric(19,4) NOT NULL CHECK (amount > 0),
    currency char(3) NOT NULL,
    applied_at timestamptz NOT NULL,
    reversed_at timestamptz,
    UNIQUE (receivable_id, payment_id)
);

CREATE TABLE financial_adjustment (
    adjustment_id uuid PRIMARY KEY,
    receivable_id uuid NOT NULL REFERENCES receivable (receivable_id),
    kind varchar(32) NOT NULL CHECK (kind IN ('INCREASE','DECREASE','WRITE_OFF','CORRECTION')),
    amount numeric(19,4) NOT NULL CHECK (amount > 0),
    currency char(3) NOT NULL,
    reason varchar(500) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('PENDING','APPROVED','POSTED','REJECTED')),
    created_by_identity_id uuid NOT NULL,
    created_at timestamptz NOT NULL,
    posted_at timestamptz
);

CREATE TABLE financial_ledger_entry (
    entry_id uuid PRIMARY KEY,
    receivable_id uuid NOT NULL REFERENCES receivable (receivable_id),
    adjustment_id uuid REFERENCES financial_adjustment (adjustment_id),
    application_id uuid REFERENCES receivable_application (application_id),
    direction varchar(16) NOT NULL CHECK (direction IN ('DEBIT','CREDIT')),
    amount numeric(19,4) NOT NULL CHECK (amount > 0),
    currency char(3) NOT NULL,
    posted_at timestamptz NOT NULL
);

CREATE INDEX ix_credit_account_scope_status ON credit_account (tenant_id, workspace_id, status);
CREATE INDEX ix_credit_reservation_commitment_status ON credit_reservation (commercial_commitment_id, status);
CREATE INDEX ix_receivable_scope_due_status ON receivable (tenant_id, workspace_id, due_at, status);
CREATE INDEX ix_ledger_receivable_time ON financial_ledger_entry (receivable_id, posted_at);
