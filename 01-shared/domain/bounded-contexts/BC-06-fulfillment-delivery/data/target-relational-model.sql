-- TARGET / BC-06 Fulfillment & Delivery / shared PostgreSQL
-- sales_order_id, physical_allocation_id and sku_id are stable non-owning references.

CREATE TABLE fulfillment (
    fulfillment_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    sales_order_id uuid NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('PLANNED','ALLOCATED','PICKING','PICKED','PACKED','STAGED','READY_FOR_DISPATCH','HANDED_OVER','COMPLETED','SHORTAGE','HOLD','CANCELLED')),
    planned_at timestamptz NOT NULL,
    started_at timestamptz,
    completed_at timestamptz,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0)
);

CREATE TABLE fulfillment_line (
    line_id uuid PRIMARY KEY,
    fulfillment_id uuid NOT NULL REFERENCES fulfillment (fulfillment_id),
    sku_id uuid NOT NULL,
    physical_allocation_id uuid NOT NULL,
    planned_quantity numeric(19,6) NOT NULL CHECK (planned_quantity > 0),
    picked_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (picked_quantity >= 0 AND picked_quantity <= planned_quantity),
    UNIQUE (fulfillment_id, sku_id)
);

CREATE TABLE picking_result (
    picking_result_id uuid PRIMARY KEY,
    fulfillment_id uuid NOT NULL REFERENCES fulfillment (fulfillment_id),
    status varchar(32) NOT NULL CHECK (status IN ('STARTED','CONFIRMED','DISCREPANCY')),
    picker_identity_id uuid NOT NULL,
    started_at timestamptz NOT NULL,
    completed_at timestamptz
);

CREATE TABLE picking_discrepancy (
    discrepancy_id uuid PRIMARY KEY,
    picking_result_id uuid NOT NULL REFERENCES picking_result (picking_result_id),
    fulfillment_line_id uuid NOT NULL REFERENCES fulfillment_line (line_id),
    kind varchar(32) NOT NULL CHECK (kind IN ('SHORT','DAMAGED','WRONG_LOT','OTHER')),
    quantity numeric(19,6) NOT NULL CHECK (quantity > 0),
    resolution varchar(500),
    resolved_at timestamptz
);

CREATE TABLE delivery (
    delivery_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    fulfillment_id uuid NOT NULL REFERENCES fulfillment (fulfillment_id),
    status varchar(32) NOT NULL CHECK (status IN ('PLANNED','ASSIGNED','DISPATCHED','IN_TRANSIT','PARTIAL','DELIVERED','FAILED','CANCELLED')),
    destination_snapshot jsonb NOT NULL,
    scheduled_at timestamptz,
    dispatched_at timestamptz,
    delivered_at timestamptz,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0)
);

CREATE TABLE delivery_assignment (
    assignment_id uuid PRIMARY KEY,
    delivery_id uuid NOT NULL REFERENCES delivery (delivery_id),
    operator_id uuid NOT NULL,
    vehicle_reference varchar(120),
    assigned_at timestamptz NOT NULL,
    unassigned_at timestamptz
);

CREATE TABLE delivery_attempt (
    attempt_id uuid PRIMARY KEY,
    delivery_id uuid NOT NULL REFERENCES delivery (delivery_id),
    attempt_number integer NOT NULL CHECK (attempt_number > 0),
    outcome varchar(32) NOT NULL CHECK (outcome IN ('PENDING','DELIVERED','PARTIAL','FAILED','REFUSED','ABSENT')),
    attempted_at timestamptz NOT NULL,
    notes varchar(1000),
    UNIQUE (delivery_id, attempt_number)
);

CREATE TABLE delivery_attempt_line (
    line_id uuid PRIMARY KEY,
    attempt_id uuid NOT NULL REFERENCES delivery_attempt (attempt_id),
    fulfillment_line_id uuid NOT NULL REFERENCES fulfillment_line (line_id),
    sku_id uuid NOT NULL,
    attempted_quantity numeric(19,6) NOT NULL CHECK (attempted_quantity > 0),
    received_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (received_quantity >= 0 AND received_quantity <= attempted_quantity),
    UNIQUE (attempt_id, fulfillment_line_id)
);

CREATE TABLE delivery_quantity_outcome (
    outcome_id uuid PRIMARY KEY,
    attempt_id uuid NOT NULL REFERENCES delivery_attempt (attempt_id),
    sku_id uuid NOT NULL,
    fulfilled_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (fulfilled_quantity >= 0),
    short_quantity numeric(19,6) NOT NULL DEFAULT 0 CHECK (short_quantity >= 0),
    reason varchar(500),
    UNIQUE (attempt_id, sku_id)
);

CREATE TABLE proof_of_delivery (
    pod_id uuid PRIMARY KEY,
    delivery_id uuid NOT NULL REFERENCES delivery (delivery_id),
    status varchar(32) NOT NULL CHECK (status IN ('CAPTURED','SEALED','REJECTED')),
    recipient_name varchar(200),
    signature_object_key varchar(500),
    captured_at timestamptz NOT NULL,
    sealed_at timestamptz,
    UNIQUE (delivery_id)
);

CREATE TABLE proof_of_delivery_addendum (
    addendum_id uuid PRIMARY KEY,
    pod_id uuid NOT NULL REFERENCES proof_of_delivery (pod_id),
    reason varchar(500) NOT NULL,
    evidence_object_key varchar(500),
    appended_by_identity_id uuid NOT NULL,
    appended_at timestamptz NOT NULL
);

CREATE TABLE temperature_evidence (
    evidence_id uuid PRIMARY KEY,
    delivery_id uuid NOT NULL REFERENCES delivery (delivery_id),
    captured_at timestamptz NOT NULL,
    temperature_celsius numeric(8,3) NOT NULL,
    source varchar(80) NOT NULL,
    evidence_metadata jsonb,
    UNIQUE (delivery_id, captured_at, source)
);

CREATE TABLE temperature_excursion (
    excursion_id uuid PRIMARY KEY,
    delivery_id uuid NOT NULL REFERENCES delivery (delivery_id),
    evidence_id uuid REFERENCES temperature_evidence (evidence_id),
    status varchar(32) NOT NULL CHECK (status IN ('OPEN','HOLD','DISPOSITIONED','CLOSED')),
    reason varchar(500) NOT NULL,
    opened_at timestamptz NOT NULL,
    closed_at timestamptz
);

CREATE TABLE continuation_delivery (
    continuation_id uuid PRIMARY KEY,
    parent_delivery_id uuid NOT NULL REFERENCES delivery (delivery_id),
    status varchar(32) NOT NULL CHECK (status IN ('OPEN','DISPATCHED','COMPLETED','CANCELLED')),
    remaining_snapshot jsonb NOT NULL,
    opened_at timestamptz NOT NULL,
    closed_at timestamptz
);

CREATE INDEX ix_fulfillment_scope_status ON fulfillment (tenant_id, workspace_id, status);
CREATE INDEX ix_delivery_scope_status ON delivery (tenant_id, workspace_id, status);
CREATE INDEX ix_delivery_attempt_delivery ON delivery_attempt (delivery_id, attempt_number);
CREATE INDEX ix_temperature_evidence_delivery_time ON temperature_evidence (delivery_id, captured_at);
