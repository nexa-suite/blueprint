-- TARGET / BC-05 Inventory Availability / shared PostgreSQL
-- commitment_id and sku_id are stable non-owning references; local FKs are warehouse-owned.

CREATE TABLE warehouse (
    warehouse_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    code varchar(80) NOT NULL,
    name varchar(160) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('ACTIVE','INACTIVE')),
    timezone varchar(80) NOT NULL,
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (tenant_id, code)
);

CREATE TABLE inventory_lot (
    lot_id uuid PRIMARY KEY,
    warehouse_id uuid NOT NULL REFERENCES warehouse (warehouse_id),
    sku_id uuid NOT NULL,
    lot_code varchar(120) NOT NULL,
    expires_at timestamptz,
    on_hand_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (on_hand_quantity >= 0),
    held_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (held_quantity >= 0),
    status varchar(32) NOT NULL CHECK (status IN ('AVAILABLE','HOLD','QUARANTINE','DAMAGED','WASTE','EXPIRED','IN_TRANSIT')),
    received_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (warehouse_id, lot_code)
);

CREATE TABLE inventory_position (
    position_id uuid PRIMARY KEY,
    warehouse_id uuid NOT NULL REFERENCES warehouse (warehouse_id),
    sku_id uuid NOT NULL,
    on_hand_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (on_hand_quantity >= 0),
    reserved_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (reserved_quantity >= 0),
    held_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (held_quantity >= 0),
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (warehouse_id, sku_id),
    CHECK (reserved_quantity <= on_hand_quantity),
    CHECK (held_quantity <= on_hand_quantity)
);

CREATE TABLE inventory_movement (
    movement_id uuid PRIMARY KEY,
    warehouse_id uuid NOT NULL REFERENCES warehouse (warehouse_id),
    lot_id uuid REFERENCES inventory_lot (lot_id),
    sku_id uuid NOT NULL,
    kind varchar(32) NOT NULL CHECK (kind IN ('RECEIPT','RESERVATION','RELEASE','PICK','ADJUSTMENT','TRANSFER_OUT','TRANSFER_IN','DISPOSAL')),
    quantity numeric(19,6) NOT NULL CHECK (quantity > 0),
    reference_type varchar(80),
    reference_id uuid,
    occurred_at timestamptz NOT NULL
);

CREATE TABLE safety_stock_policy (
    policy_id uuid PRIMARY KEY,
    warehouse_id uuid NOT NULL REFERENCES warehouse (warehouse_id),
    sku_id uuid NOT NULL,
    minimum_quantity numeric(19,6) NOT NULL CHECK (minimum_quantity >= 0),
    valid_from timestamptz NOT NULL,
    valid_to timestamptz,
    UNIQUE (warehouse_id, sku_id, valid_from),
    CHECK (valid_to IS NULL OR valid_to > valid_from)
);

CREATE TABLE inventory_backing (
    backing_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    commercial_commitment_id uuid NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('REQUESTED','BACKED','RELEASED','CONSUMED','FAILED')),
    requested_at timestamptz NOT NULL,
    completed_at timestamptz,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (commercial_commitment_id)
);

CREATE TABLE inventory_backing_line (
    line_id uuid PRIMARY KEY,
    backing_id uuid NOT NULL REFERENCES inventory_backing (backing_id),
    sku_id uuid NOT NULL,
    requested_quantity numeric(19,6) NOT NULL CHECK (requested_quantity > 0),
    backed_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (backed_quantity >= 0 AND backed_quantity <= requested_quantity),
    UNIQUE (backing_id, sku_id)
);

CREATE TABLE physical_allocation (
    allocation_id uuid PRIMARY KEY,
    backing_id uuid NOT NULL REFERENCES inventory_backing (backing_id),
    status varchar(32) NOT NULL CHECK (status IN ('ALLOCATED','RELEASED','CONSUMED')),
    allocated_at timestamptz NOT NULL,
    released_at timestamptz
);

CREATE TABLE physical_allocation_line (
    line_id uuid PRIMARY KEY,
    allocation_id uuid NOT NULL REFERENCES physical_allocation (allocation_id),
    lot_id uuid NOT NULL REFERENCES inventory_lot (lot_id),
    sku_id uuid NOT NULL,
    quantity numeric(19,6) NOT NULL CHECK (quantity > 0),
    consumed_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (consumed_quantity >= 0 AND consumed_quantity <= quantity),
    UNIQUE (allocation_id, lot_id)
);

CREATE TABLE inventory_adjustment (
    adjustment_id uuid PRIMARY KEY,
    warehouse_id uuid NOT NULL REFERENCES warehouse (warehouse_id),
    lot_id uuid REFERENCES inventory_lot (lot_id),
    sku_id uuid NOT NULL,
    quantity_delta numeric(19,6) NOT NULL CHECK (quantity_delta <> 0),
    reason varchar(500) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('PENDING','APPROVED','APPLIED','REJECTED')),
    requested_by_identity_id uuid NOT NULL,
    approved_at timestamptz,
    applied_at timestamptz
);

CREATE TABLE warehouse_transfer (
    transfer_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    source_warehouse_id uuid NOT NULL REFERENCES warehouse (warehouse_id),
    destination_warehouse_id uuid NOT NULL REFERENCES warehouse (warehouse_id),
    status varchar(32) NOT NULL CHECK (status IN ('REQUESTED','IN_TRANSIT','RECEIVED')),
    requested_at timestamptz NOT NULL,
    in_transit_at timestamptz,
    received_at timestamptz,
    CHECK (source_warehouse_id <> destination_warehouse_id)
);

CREATE TABLE warehouse_transfer_line (
    line_id uuid PRIMARY KEY,
    transfer_id uuid NOT NULL REFERENCES warehouse_transfer (transfer_id),
    sku_id uuid NOT NULL,
    quantity numeric(19,6) NOT NULL CHECK (quantity > 0),
    received_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (received_quantity >= 0 AND received_quantity <= quantity),
    UNIQUE (transfer_id, sku_id)
);

CREATE TABLE lot_disposition (
    disposition_id uuid PRIMARY KEY,
    lot_id uuid NOT NULL REFERENCES inventory_lot (lot_id),
    kind varchar(32) NOT NULL CHECK (kind IN ('HOLD','RELEASE','DISPOSE','RETURN')),
    reason varchar(500) NOT NULL,
    quantity numeric(19,6) NOT NULL CHECK (quantity > 0),
    created_by_identity_id uuid NOT NULL,
    created_at timestamptz NOT NULL
);

CREATE INDEX ix_inventory_lot_fefo ON inventory_lot (warehouse_id, sku_id, expires_at, status);
CREATE INDEX ix_inventory_position_sku ON inventory_position (warehouse_id, sku_id);
CREATE INDEX ix_inventory_movement_reference ON inventory_movement (reference_type, reference_id);
CREATE INDEX ix_backing_commitment_status ON inventory_backing (commercial_commitment_id, status);
CREATE INDEX ix_transfer_scope_status ON warehouse_transfer (tenant_id, workspace_id, status);
