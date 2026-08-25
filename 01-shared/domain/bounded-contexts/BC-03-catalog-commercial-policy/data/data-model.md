---
status: draft
maturity: DRAFT
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# BC-03 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Table group | Tables | Local integrity |
|---|---|---|
| Catalog | `product`, `sku`, `catalog_media` | product -> SKU/media composition; scoped codes; status checks |
| Price | `price_list`, `price_list_item`, `base_price` | price list/SKU FKs; non-negative money; validity windows |
| Terms | `customer_terms` | customer ID is BC-02 stable reference; optional local price-list FK |
| Promotion | `promotion`, `promotion_sku` | promotion/SKU FKs; active window; discount checks |

Every tenant/workspace-owned table has explicit scope columns. SQL carries PK,
NOT NULL, unique keys, validity/price checks and indexes for SKU, price and
promotion resolution. RLS must scope tenant/workspace at runtime. `jsonb` is
not used: product and commercial policy data remains relational.

`customer_account_id` is a non-owning BC-02 ID. Product is not SKU; SKU is the
sellable variant. AS-IS anchors: `catalog_management.product`, family,
variant, sellable SKU, prices, visibility, promotion and asset tables. V40,
V48, V54 and V65 are historical evolution evidence, not target schema
authority. See [product participation](../../../../data/product-data-participation.md).
