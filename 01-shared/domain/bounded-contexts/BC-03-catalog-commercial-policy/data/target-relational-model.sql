-- TARGET / BC-03 Catalog & Commercial Policy / shared PostgreSQL
-- customer_account_id and sku references to other BCs are stable IDs, not FKs.

CREATE TABLE product (
    product_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    code varchar(80) NOT NULL,
    name varchar(200) NOT NULL,
    description text,
    status varchar(32) NOT NULL CHECK (status IN ('DRAFT','ACTIVE','RETIRED')),
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (tenant_id, code)
);

CREATE TABLE sku (
    sku_id uuid PRIMARY KEY,
    product_id uuid NOT NULL REFERENCES product (product_id),
    code varchar(80) NOT NULL,
    name varchar(200) NOT NULL,
    unit_of_measure varchar(32) NOT NULL,
    gtin varchar(14),
    temperature_band varchar(64) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('DRAFT','ACTIVE','RETIRED')),
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    version integer NOT NULL DEFAULT 0 CHECK (version >= 0),
    UNIQUE (product_id, code),
    CHECK (gtin IS NULL OR gtin ~ '^[0-9]{8,14}$')
);

CREATE TABLE catalog_media (
    media_id uuid PRIMARY KEY,
    product_id uuid NOT NULL REFERENCES product (product_id),
    object_key varchar(500) NOT NULL,
    media_kind varchar(32) NOT NULL CHECK (media_kind IN ('IMAGE','DATASHEET','CERTIFICATE','OTHER')),
    content_hash varchar(128),
    sort_order integer NOT NULL DEFAULT 0 CHECK (sort_order >= 0),
    created_at timestamptz NOT NULL
);

CREATE TABLE price_list (
    price_list_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    code varchar(80) NOT NULL,
    name varchar(160) NOT NULL,
    currency char(3) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('DRAFT','ACTIVE','RETIRED')),
    valid_from timestamptz,
    valid_to timestamptz,
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    UNIQUE (tenant_id, code),
    CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to > valid_from)
);

CREATE TABLE price_list_item (
    item_id uuid PRIMARY KEY,
    price_list_id uuid NOT NULL REFERENCES price_list (price_list_id),
    sku_id uuid NOT NULL REFERENCES sku (sku_id),
    unit_price numeric(19,4) NOT NULL CHECK (unit_price >= 0),
    currency char(3) NOT NULL,
    valid_from timestamptz,
    valid_to timestamptz,
    UNIQUE (price_list_id, sku_id),
    CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to > valid_from)
);

CREATE TABLE base_price (
    base_price_id uuid PRIMARY KEY,
    sku_id uuid NOT NULL REFERENCES sku (sku_id),
    amount numeric(19,4) NOT NULL CHECK (amount >= 0),
    currency char(3) NOT NULL,
    valid_from timestamptz NOT NULL,
    valid_to timestamptz,
    created_at timestamptz NOT NULL,
    CHECK (valid_to IS NULL OR valid_to > valid_from)
);

CREATE TABLE customer_terms (
    terms_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    customer_account_id uuid NOT NULL,
    price_list_id uuid REFERENCES price_list (price_list_id),
    credit_days integer NOT NULL DEFAULT 0 CHECK (credit_days >= 0),
    currency char(3) NOT NULL,
    valid_from timestamptz NOT NULL,
    valid_to timestamptz,
    created_at timestamptz NOT NULL,
    CHECK (valid_to IS NULL OR valid_to > valid_from)
);

CREATE TABLE promotion (
    promotion_id uuid PRIMARY KEY,
    tenant_id uuid NOT NULL,
    workspace_id uuid NOT NULL,
    code varchar(80) NOT NULL,
    name varchar(160) NOT NULL,
    status varchar(32) NOT NULL CHECK (status IN ('DRAFT','SCHEDULED','ACTIVE','EXPIRED','RETIRED')),
    starts_at timestamptz NOT NULL,
    ends_at timestamptz NOT NULL,
    max_stackable boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL,
    updated_at timestamptz NOT NULL,
    UNIQUE (tenant_id, code),
    CHECK (ends_at > starts_at)
);

CREATE TABLE promotion_sku (
    promotion_sku_id uuid PRIMARY KEY,
    promotion_id uuid NOT NULL REFERENCES promotion (promotion_id),
    sku_id uuid NOT NULL REFERENCES sku (sku_id),
    discount_kind varchar(32) NOT NULL CHECK (discount_kind IN ('PERCENT','FIXED')),
    discount_value numeric(19,4) NOT NULL CHECK (discount_value > 0),
    UNIQUE (promotion_id, sku_id)
);

CREATE INDEX ix_sku_product_status ON sku (product_id, status);
CREATE INDEX ix_sku_gtin_resolution ON sku (gtin, sku_id) WHERE status = 'ACTIVE';
CREATE INDEX ix_price_list_item_sku ON price_list_item (sku_id);
CREATE INDEX ix_base_price_sku_validity ON base_price (sku_id, valid_from, valid_to);
CREATE INDEX ix_promotion_scope_status ON promotion (tenant_id, status, starts_at, ends_at);
