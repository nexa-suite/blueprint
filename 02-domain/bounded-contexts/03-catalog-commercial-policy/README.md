---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-03 Catalog & Commercial Policy

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Authoritative sellable offer and commercial input resolution; Supporting. Strategic importance: protects price, terms and SKU meaning. |
| Language / actors | Product, SKU, visibility, Base Price, Price List, Customer Terms, Promotion, operational currency, cold-chain requirement. Actors: Sales Representative, B2B Buyer, Tenant Administrator. |
| Responsibilities / data | Product/SKU lifecycle, media metadata, visibility, price lists, terms, promotions and deterministic resolution. Owns offer inputs, not stock or commitment. |
| Invariants | Product != SKU; promotions do not stack; one operational currency per Tenant; price/terms are revalidated at authoritative submit/checkout; SKU cold-chain requirement is explicit. |
| Commands | CreateProduct, RegisterSku, PublishOffer, SetPriceList, SetCustomerTerms, ConfigurePromotion, ResolveOffer. |
| Domain / published events | Internal: ProductPublished, SkuOfferChanged, CommercialPolicyResolved. Published: resolved snapshots are consumed by Sales Commitment; no new published event added. |
| Upstream / downstream | Upstream: BC-01 context and BC-02 relationship eligibility. Downstream: Sales Commitment, Platform, Portal, Sales Mobile and Buyer Mobile. Sync: offer/price/terms resolution at submit. |
| Failure / transaction | Stale price or terms causes revalidation/conflict; invalid promotion composition rejects without partial offer; missing relationship denies private offer. |
| Security / tenant | Catalog visibility and price policy are Tenant-scoped; buyer sees only authorized resolved projections. |
| Web / Mobile consumers | Web: Platform catalog and Portal shopping. Mobile: Sales field catalog and Buyer Mobile catalog; no mobile price authority. |
| Out of scope | Physical stock, availability, commitment state, payment confirmation, a Promotion BC or a Mobile Catalog BC. |

## Tactical DDD target

Aggregate Roots: Product, SellableOffer. Entities: SKU, PriceListEntry, CustomerTerm, PromotionRule. Value Objects: SkuId, Money, Currency, Visibility, CommercialSnapshot. Domain Services: OfferResolutionPolicy, PromotionStackingPolicy. Repositories: ProductRepository, OfferRepository. Lifecycle: draft → published → retired; snapshots are immutable at commitment boundary.
