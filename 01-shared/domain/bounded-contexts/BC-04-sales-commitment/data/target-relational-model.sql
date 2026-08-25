-- TARGET / BC-04 Sales Commitment / shared PostgreSQL
-- buyer_relationship_id and sku_id are stable non-owning BC references.

CREATE TABLE request_draft (
    draft_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    buyer_relationship_id uuid NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('DRAFT','SUBMITTED','ABANDONED')),
    expires_at timestamptz,
    created_by_identity_id uuid NOT NULL,
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0)
);

CREATE TABLE request_draft_line (
    line_id uuid PRIMARY KEY,
    draft_id uuid NOT NULL REFERENCES request_draft (draft_id),
    sku_id uuid NOT NULL,
    quantity numeric(19,6) NOT NULL CHECK (quantity > 0),
    notes varchar(500),
    UNIQUE (draft_id, sku_id)
);

CREATE TABLE purchase_request (
    purchase_request_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    buyer_relationship_id uuid NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('SUBMITTED','CHANGES_PROPOSED','CONVERTED','REJECTED','WITHDRAWN','EXPIRED')),
    submitted_at timestamptz NOT NULL,
    expires_at timestamptz NOT NULL,
    revision integer NOT NULL DEFAULT 0 CHECK (revision >= 0),
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    CHECK (expires_at > submitted_at)
);

CREATE TABLE purchase_request_line (
    line_id uuid PRIMARY KEY,
    purchase_request_id uuid NOT NULL REFERENCES purchase_request (purchase_request_id),
    sku_id uuid NOT NULL,
    requested_quantity numeric(19,6) NOT NULL CHECK (requested_quantity > 0),
    accepted_quantity numeric(19,6) CHECK (accepted_quantity IS NULL OR accepted_quantity > 0),
    price_snapshot jsonb NOT NULL,
    terms_snapshot jsonb NOT NULL,
    UNIQUE (purchase_request_id, sku_id)
);

CREATE TABLE material_change_proposal (
    proposal_id uuid PRIMARY KEY,
    purchase_request_id uuid NOT NULL REFERENCES purchase_request (purchase_request_id),
    proposed_by_identity_id uuid NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('PROPOSED','ACCEPTED','REJECTED','EXPIRED')),
    change_snapshot jsonb NOT NULL,
    proposed_at timestamptz NOT NULL,
    decided_at timestamptz
);

CREATE TABLE commercial_commitment (
    commitment_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    -- Origin discriminator avoids a polymorphic source FK. DIRECT_ORDER is
    -- represented by the confirmed SalesOrder created in the same decision.
    origin_type varchar(32) NOT NULL CHECK (origin_type IN ('PURCHASE_REQUEST','DIRECT_ORDER')),
    purchase_request_id uuid REFERENCES purchase_request (purchase_request_id),
    buyer_relationship_id uuid NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('ESTABLISHED','CONFIRMED','CANCELLED','REPLACED')),
    committed_at timestamptz NOT NULL,
    cancelled_at timestamptz,
    revision integer NOT NULL DEFAULT 0 CHECK (revision >= 0),
    CHECK (
        (origin_type = 'PURCHASE_REQUEST' AND purchase_request_id IS NOT NULL)
        OR (origin_type = 'DIRECT_ORDER' AND purchase_request_id IS NULL)
    ),
    UNIQUE (purchase_request_id)
);

CREATE TABLE commercial_commitment_line (
    line_id uuid PRIMARY KEY,
    commitment_id uuid NOT NULL REFERENCES commercial_commitment (commitment_id),
    sku_id uuid NOT NULL,
    quantity numeric(19,6) NOT NULL CHECK (quantity > 0),
    unit_price numeric(19,4) NOT NULL CHECK (unit_price >= 0),
    currency char(3) NOT NULL,
    terms_snapshot jsonb NOT NULL,
    UNIQUE (commitment_id, sku_id)
);

CREATE TABLE sales_order (
    sales_order_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    commitment_id uuid NOT NULL REFERENCES commercial_commitment (commitment_id),
    status varchar(32) NOT NULL CHECK (status IN ('CONFIRMED','IN_FULFILLMENT','PARTIALLY_FULFILLED','FULFILLED','PARTIALLY_DELIVERED','COMPLETED','CANCELLED')),
    confirmed_at timestamptz NOT NULL,
    cancelled_at timestamptz,
    revision integer NOT NULL DEFAULT 0 CHECK (revision >= 0),
    UNIQUE (commitment_id)
);

CREATE TABLE sales_order_line (
    line_id uuid PRIMARY KEY,
    sales_order_id uuid NOT NULL REFERENCES sales_order (sales_order_id),
    sku_id uuid NOT NULL,
    quantity numeric(19,6) NOT NULL CHECK (quantity > 0),
    unit_price numeric(19,4) NOT NULL CHECK (unit_price >= 0),
    currency char(3) NOT NULL,
    fulfillment_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (fulfillment_quantity >= 0 AND fulfillment_quantity <= quantity),
    UNIQUE (sales_order_id, sku_id)
);

CREATE TABLE commitment_owner_transfer (
    transfer_id uuid PRIMARY KEY,
    commitment_id uuid NOT NULL REFERENCES commercial_commitment (commitment_id),
    from_owner varchar(32) NOT NULL CHECK (from_owner IN ('PURCHASE_REQUEST','COMMERCIAL_COMMITMENT')),
    to_owner varchar(32) NOT NULL CHECK (to_owner IN ('COMMERCIAL_COMMITMENT','SALES_ORDER')),
    transferred_at timestamptz NOT NULL,
    reason varchar(500) NOT NULL
);

CREATE TABLE sales_commitment_adjustment (
    adjustment_id uuid PRIMARY KEY,
    commitment_id uuid NOT NULL REFERENCES commercial_commitment (commitment_id),
    reason varchar(500) NOT NULL,
    quantity_delta numeric(19,6) NOT NULL CHECK (quantity_delta <> 0),
    amount_delta numeric(19,4) NOT NULL,
    created_by_identity_id uuid NOT NULL,
    created_at timestamptz NOT NULL
);

CREATE INDEX ix_request_draft_scope_status ON request_draft (tenant_id, workspace_id, status);
CREATE INDEX ix_purchase_request_scope_status ON purchase_request (tenant_id, workspace_id, status, expires_at);
CREATE INDEX ix_commitment_scope_status ON commercial_commitment (tenant_id, workspace_id, status);
CREATE INDEX ix_sales_order_scope_status ON sales_order (tenant_id, workspace_id, status);
