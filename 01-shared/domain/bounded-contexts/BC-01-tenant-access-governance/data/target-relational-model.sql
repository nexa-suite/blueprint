-- TARGET / BC-01 Tenant & Access Governance / shared PostgreSQL
-- Same-owner foreign keys only. RLS is a deployment policy over tenant_id/workspace_id.

CREATE TABLE tenant (
    tenant_id uuid PRIMARY KEY,
    legal_name varchar(200) NOT NULL,
    slug varchar(100) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('PENDING','ACTIVE','SUSPENDED','CLOSED')),
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (slug)
);

CREATE TABLE workspace (
    workspace_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL REFERENCES tenant (tenant_id),
    name varchar(160) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('ACTIVE','INACTIVE')),
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (tenant_id),
    UNIQUE (tenant_id, name)
);

CREATE TABLE human_identity (
    human_identity_id uuid PRIMARY KEY,
    email varchar(320) NOT NULL,
    normalized_email varchar(320) NOT NULL,
    display_name varchar(200),
    status varchar(32) NOT NULL CHECK (status IN ('UNVERIFIED','ACTIVE','DISABLED')),
    verified_at timestamptz,
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    UNIQUE (normalized_email)
);

CREATE TABLE company_onboarding_request (
    request_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL REFERENCES tenant (tenant_id),
    requested_by_identity_id uuid NOT NULL REFERENCES human_identity (human_identity_id),
    legal_name varchar(200) NOT NULL,
    registration_number varchar(80),
    status varchar(32) NOT NULL CHECK (status IN ('DRAFT','SUBMITTED','APPROVED','REJECTED')),
    rejection_reason varchar(500),
    submitted_at timestamptz,
    decided_at timestamptz,
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0)
);

CREATE TABLE workforce_membership (
    membership_id uuid PRIMARY KEY,
    workspace_id uuid NOT NULL REFERENCES workspace (workspace_id),
    human_identity_id uuid NOT NULL REFERENCES human_identity (human_identity_id),
    status varchar(32) NOT NULL CHECK (status IN ('INVITED','ACTIVE','REVOKED')),
    invited_at timestamptz,
    activated_at timestamptz,
    revoked_at timestamptz,
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (workspace_id, human_identity_id)
);

CREATE TABLE role_definition (
    role_id uuid PRIMARY KEY,
    workspace_id uuid NOT NULL REFERENCES workspace (workspace_id),
    code varchar(80) NOT NULL,
    name varchar(160) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('ACTIVE','RETIRED')),
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    UNIQUE (workspace_id, code)
);

CREATE TABLE capability_definition (
    capability_id uuid PRIMARY KEY,
    code varchar(120) NOT NULL,
    name varchar(200) NOT NULL,
    description varchar(500),
    created_at timestamptz NOT NULL,
    UNIQUE (code)
);

CREATE TABLE membership_role (
    assignment_id uuid PRIMARY KEY,
    membership_id uuid NOT NULL REFERENCES workforce_membership (membership_id),
    role_id uuid NOT NULL REFERENCES role_definition (role_id),
    assigned_at timestamptz NOT NULL,
    removed_at timestamptz,
    UNIQUE (membership_id, role_id)
);

CREATE TABLE role_capability (
    role_capability_id uuid PRIMARY KEY,
    role_id uuid NOT NULL REFERENCES role_definition (role_id),
    capability_id uuid NOT NULL REFERENCES capability_definition (capability_id),
    granted_at timestamptz NOT NULL,
    UNIQUE (role_id, capability_id)
);

CREATE TABLE membership_capability_override (
    override_id uuid PRIMARY KEY,
    membership_id uuid NOT NULL REFERENCES workforce_membership (membership_id),
    capability_id uuid NOT NULL REFERENCES capability_definition (capability_id),
    effect varchar(16) NOT NULL CHECK (effect IN ('ALLOW','DENY')),
    reason varchar(500) NOT NULL,
    expires_at timestamptz,
    created_at timestamptz NOT NULL,
    UNIQUE (membership_id, capability_id)
);

CREATE INDEX ix_workspace_tenant ON workspace (tenant_id);
CREATE INDEX ix_membership_workspace_status ON workforce_membership (workspace_id, status);
CREATE INDEX ix_onboarding_tenant_status ON company_onboarding_request (tenant_id, status);
