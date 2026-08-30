---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-03 — Catalog & Commercial Policy functional contract

**Purpose:** resolve authoritative sellable product/SKU meaning, visibility,
price, terms and promotion input for an authorized relationship.

| Contract element | Definition |
|---|---|
| Concepts / roots | Product, SKU, Sellable Offer, Price List, Customer Terms, Promotion, Physical Identifier |
| Value objects | ProductId, SkuId, GTIN, PhysicalIdentifier, Money, Currency, CommercialSnapshot |
| Boundary | Owns commercial offer inputs and identifier meaning; never owns physical stock, allocation or commitment. |
| Commands | CreateProduct, RegisterSku, RegisterIdentifier, PublishOffer, SetPriceList, SetCustomerTerms, ConfigurePromotion |
| Queries | ResolveSku, ResolveSkuByPhysicalIdentifier, ResolveOffer, ReadPriceHistory, ReadCatalog |
| Invariants | Product != SKU; identifier resolution is unambiguous or rejected; promotions do not stack; price/terms are revalidated at submit/confirm. |
| Actors / surfaces | Company Owner, Sales Representative, Customer Buyer; Platform, Buyer Portal, Operations Mobile, Buyer Mobile. |
| Synchronous dependencies | BC-01 scope, BC-02 relationship eligibility; BC-04 submits only a fresh commercial snapshot. |
| Events / consumers | Internal offer/identifier facts; `PriceResolved` is a contract fact, not a new published integration event. |
| Trace / idempotency / concurrency | Idempotent SKU/identifier registration; version price/terms; record source/version in commitment snapshot. |
| Scope | V1: SKU/GTIN/physical identifier resolution, price, terms and availability input. V2/Future: advanced GS1 and richer promotion policy. |
| AS-IS evidence | API v0.17.0 `/api/v1/skus/resolve` and SKU/GTIN contract; target identifier mapping remains BC-03-owned. |
