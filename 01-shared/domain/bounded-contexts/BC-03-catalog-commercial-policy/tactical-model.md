---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# BC-03 Catalog & Commercial Policy — Tactical Model

**State:** TARGET construction model. Product, SKU, price and commercial policy
remain distinct; downstream contexts reference SKU identity, not a Product
aggregate graph.

## Purpose and product participation

Own authoritative offer inputs: Product, SKU, visibility, media metadata, Base
Price, Price List, Customer Terms, Promotion and SKU cold-chain requirement.
Platform manages catalog; Portal and both proposed Mobile surfaces consume safe
projections. API resolves authoritative price.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `Product` | merchandising identity and lifecycle; media and SKU references remain bounded | none to Sales/Inventory |
| `SKU` | sellable identity, packaging and cold-chain policy; independently addressable | Product ID within BC |
| `PriceList` | effective price items and time validity | SKU IDs within BC |
| `CustomerTerms` | permitted terms for one Customer Account reference | CustomerAccount ID from BC-02 |
| `Promotion` | one transformation eligibility/rule; promotions do not stack | SKU and CustomerAccount IDs |

`AuthoritativePriceResolver` is a Domain Service because precedence spans
multiple policy roots without owning any one root.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `Product` | Aggregate Root | product ID, tenant/workspace, name, status, category/brand IDs, version | `publish()`, `changeDescription()`, `archive()` | references SKU IDs; TARGET, AS-IS partial |
| `SKU` | Aggregate Root | SKU ID/code, product ID, presentation, UOM, lifecycle, version | `activate()`, `changePackaging()`, `setColdChainRequirement()`, `discontinue()` | independent downstream identity; REFINE AS-IS |
| `CatalogMedia` | Entity | media ID, storage ref, alt text, hash, sort order | `replaceReference()` | composed by Product; Object Storage bytes external |
| `PriceList` | Aggregate Root | ID/code, scope, validity, status, version | `activate()`, `addPrice()`, `close()` | composes PriceListItem; TARGET |
| `PriceListItem` | Entity | SKU ID, amount, currency, validity | `changeAmount()`, `expire()` | composed by PriceList; TARGET |
| `CustomerTerms` | Aggregate Root | customer account ID, eligibility, payment mode, credit flags | `permit()`, `suspend()`, `changeTerms()` | references BC-02 ID; TARGET |
| `Promotion` | Aggregate Root | ID, eligibility window, transformation, status | `activate()`, `applyOnce()`, `deactivate()` | one transformation; TARGET |
| `Money` | Value Object | amount, currency | `add()`, `multiply()`, `isNonNegative()` | used by prices/snapshots |
| `ColdChainRequirement` | Value Object | required flag, min/max temperature, shelf life | `accepts(reading)` | used by SKU; TARGET |
| `PriceResolver` | Domain Service | none | `resolve(base, list, terms, promotion, instant)` | deterministic precedence; TARGET |
| `ProductRepository` / `SkuRepository` | Repository interfaces | none | `save()`, `byId()`, `search()` | roots only; TARGET |
| `OfferPublished` | Domain Event | SKU/product IDs, effectiveAt | immutable fact | no new published event; TARGET |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `ManageProductHandler` | create/publish/archive Product | coordinates product and media ports; checks tenant capability |
| `ManageSkuHandler` | register/maintain SKU | validates independent SKU identity and cold-chain policy |
| `ResolveCatalogPriceHandler` | preview or authoritative resolution | invokes `PriceResolver`; marks preview as non-commitment |
| `ManagePriceListHandler` | maintain effective list | versioned interval mutation; no overlapping active price |
| `ManagePromotionHandler` | maintain eligibility | prevents stacked transformation and applies policy scope |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `CatalogManagementController` | Platform product/taxonomy mutation | AS-IS; KEEP/REFINE |
| `CatalogQueryController` | Portal/Platform catalog projection | AS-IS; KEEP |
| `CatalogPricingController` | price/terms view | AS-IS; REFINE toward policy language |
| `CatalogSkuController` | SKU lifecycle boundary | AS-IS; KEEP |
| `CatalogProjectionConsumer` | Mobile safe catalog/price cache | TARGET proposed interface |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `CatalogProductRepositoryAdapter` | PostgreSQL Product/media persistence | AS-IS `JdbcCatalogProductAdapter`; KEEP |
| `CatalogSkuRepositoryAdapter` | PostgreSQL SKU/family/variant persistence | AS-IS; REFINE legacy Product/SKU naming |
| `CatalogPricingAdapter` | effective price query | AS-IS `JdbcCatalogPricingAdapter`; KEEP/REFINE |
| `ObjectStorageMediaPort` | media reference/metadata boundary | TARGET; bytes never in PostgreSQL |
| `CatalogAuthorizationPort` | tenant/capability check | AS-IS; KEEP |

## Invariants and transactions

- Product != SKU; SKU is independently referenced by downstream BCs.
- Price precedence is Base Price, applicable Price List, permitted Customer
  Terms, then at most one Promotion transformation.
- Prices and terms are revalidated at authoritative PR/SO decision; previews
  never reserve inventory or credit.
- SKU cold-chain requirement is explicit; no IoT implication.
- Price-list effective intervals do not overlap for same tenant/workspace/SKU.

## Events, persistence and evidence

Internal `OfferPublished` and `PricePolicyChanged` remain distinct from frozen
published events. See [BC-03 data model](data/data-model.md), [target SQL](data/target-relational-model.sql)
and [domain UML](diagrams/domain-model.puml).

AS-IS evidence at API main: `catalogmanagement` domain Product/SKU/family,
pricing/promotion services and `catalog_management` V30–V67. Classification:
catalog query and persistence **KEEP**, Product-family/SKU consolidation
**REFINE**, full Customer Terms/Promotion precedence as one target policy
**PARTIAL / NOT IMPLEMENTED**. Java package remains AS-IS evidence.
