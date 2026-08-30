-- TARGET / BC-02 Customer & Buyer Relationships / shared PostgreSQL
-- human_identity_id, tenant_id and workspace_id are stable non-owning references.

CREATE TABLE customer_account (
    customer_account_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    legal_name varchar(200) NOT NULL,
    tax_identifier varchar(80),
    status varchar(32) NOT NULL CHECK (status IN ('PROSPECT','ACTIVE','SUSPENDED','CLOSED')),
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (tenant_id, tax_identifier)
);

CREATE TABLE customer_contact (
    contact_id uuid PRIMARY KEY,
    customer_account_id uuid NOT NULL REFERENCES customer_account (customer_account_id),
    human_identity_id uuid NOT NULL,
    role varchar(32) NOT NULL CHECK (role IN ('BUYER','BILLING','RECEIVING','ADMIN','OTHER')),
    status varchar(32) NOT NULL CHECK (status IN ('ACTIVE','REMOVED')),
    created_at timestamptz NOT NULL,
    UNIQUE (customer_account_id, human_identity_id, role)
);

CREATE TABLE customer_address (
    address_id uuid PRIMARY KEY,
    customer_account_id uuid NOT NULL REFERENCES customer_account (customer_account_id),
    kind varchar(32) NOT NULL CHECK (kind IN ('BILLING','SHIPPING','REGISTERED','OTHER')),
    line1 varchar(240) NOT NULL,
    line2 varchar(240),
    district_code varchar(32),
    province_code varchar(32),
    department_code varchar(32),
    postal_code varchar(32),
    recipient_name varchar(200),
    is_default boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL
);

CREATE TABLE buyer_relationship (
    relationship_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    customer_account_id uuid NOT NULL REFERENCES customer_account (customer_account_id),
    human_identity_id uuid NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('PENDING','ACTIVE','SUSPENDED','REVOKED')),
    requested_at timestamptz NOT NULL,
    approved_at timestamptz,
    revoked_at timestamptz,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (tenant_id, customer_account_id, human_identity_id)
);

CREATE TABLE buyer_relationship_history (
    history_id uuid PRIMARY KEY,
    relationship_id uuid NOT NULL REFERENCES buyer_relationship (relationship_id),
    from_status varchar(32),
    to_status varchar(32) NOT NULL,
    reason varchar(500),
    changed_by_identity_id uuid,
    changed_at timestamptz NOT NULL
);

CREATE INDEX ix_customer_account_scope_status ON customer_account (tenant_id, workspace_id, status);
CREATE INDEX ix_buyer_relationship_customer ON buyer_relationship (customer_account_id, status);
CREATE INDEX ix_customer_address_account_kind ON customer_address (customer_account_id, kind);
