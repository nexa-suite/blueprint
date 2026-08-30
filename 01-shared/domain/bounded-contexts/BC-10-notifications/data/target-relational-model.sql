-- TARGET / BC-10 Notifications / shared PostgreSQL
-- event_id and recipient identity references are stable IDs; source business truth stays upstream.

CREATE TABLE notification_template (
    template_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    event_type varchar(160) NOT NULL,
    channel varchar(32) NOT NULL CHECK (channel IN ('EMAIL','SMS','PUSH','IN_APP')),
    version integer NOT NULL CHECK (version > 0),
    content_snapshot jsonb NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('DRAFT','PUBLISHED','RETIRED')),
    created_at timestamptz NOT NULL,
    UNIQUE (tenant_id, workspace_id, event_type, channel, version)
);

CREATE TABLE notification (
    notification_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    template_id uuid REFERENCES notification_template (template_id),
    event_id uuid NOT NULL,
    event_type varchar(160) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('SCHEDULED','PROCESSING','DELIVERED','PARTIAL','FAILED','CANCELLED')),
    scheduled_at timestamptz NOT NULL,
    delivered_at timestamptz,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0)
);

CREATE TABLE notification_recipient (
    recipient_id uuid PRIMARY KEY,
    notification_id uuid NOT NULL REFERENCES notification (notification_id),
    recipient_key varchar(240) NOT NULL,
    channel_address varchar(320) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('PENDING','SENT','FAILED','SUPPRESSED')),
    created_at timestamptz NOT NULL,
    UNIQUE (notification_id, recipient_key)
);

CREATE TABLE notification_preference (
    preference_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    recipient_key varchar(240) NOT NULL,
    event_type varchar(160) NOT NULL,
    channel varchar(32) NOT NULL CHECK (channel IN ('EMAIL','SMS','PUSH','IN_APP')),
    enabled boolean NOT NULL,
    updated_at timestamptz NOT NULL,
    UNIQUE (tenant_id, workspace_id, recipient_key, event_type, channel)
);

CREATE TABLE push_subscription (
    push_subscription_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    recipient_key varchar(240) NOT NULL,
    surface varchar(32) NOT NULL CHECK (surface IN ('PLATFORM','PORTAL')),
    installation_id varchar(160) NOT NULL,
    platform varchar(16) NOT NULL CHECK (platform IN ('IOS','ANDROID')),
    provider_token_hash char(64) NOT NULL CHECK (provider_token_hash ~ '^[0-9a-f]{64}$'),
    status varchar(32) NOT NULL CHECK (status IN ('ENABLED','DISABLED','UNREGISTERED')),
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    last_seen_at timestamptz NOT NULL,
    version bigint NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (tenant_id, workspace_id, recipient_key, installation_id)
);

CREATE TABLE notification_attempt (
    attempt_id uuid PRIMARY KEY,
    notification_id uuid NOT NULL REFERENCES notification (notification_id),
    recipient_id uuid NOT NULL REFERENCES notification_recipient (recipient_id),
    channel varchar(32) NOT NULL CHECK (channel IN ('EMAIL','SMS','PUSH','IN_APP')),
    status varchar(32) NOT NULL CHECK (status IN ('STARTED','SUCCEEDED','FAILED')),
    provider_reference varchar(240),
    failure_reason varchar(500),
    attempted_at timestamptz NOT NULL
);

CREATE INDEX ix_notification_scope_status ON notification (tenant_id, workspace_id, status, scheduled_at);
CREATE INDEX ix_notification_recipient_status ON notification_recipient (notification_id, status);
CREATE INDEX ix_notification_attempt_retry ON notification_attempt (notification_id, attempted_at);
CREATE INDEX ix_push_subscription_recipient ON push_subscription (tenant_id, workspace_id, recipient_key, status);
