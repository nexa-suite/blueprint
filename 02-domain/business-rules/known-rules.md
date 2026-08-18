---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-18
---

# Known domain rules

This is a curated invariant register, not Strategic DDD. Terminology, sequence, ownership and exceptions remain EventStorming/Domain Storytelling work.

## Identity, tenancy and commercial relationships

- `Tenant != Workspace`; V1 is Tenant 1:1 Workspace and Tenant is maximum business/data isolation boundary.
- One human has one Nexa identity. Workforce membership, Buyer relationship, Customer Account and Portal Access remain distinct.
- Buyer may have separate supplier relationships and commercial state per Tenant. Nexa is not a public marketplace.
- Fresh, Generic and ICISA reference Tenants must be possible with the same product; ICISA data is never an implicit Tenant seed.
- Company Owner and Business Operations Manager hold business authority; Tenant Administrator governs access. They are not one hierarchy.

## Catalog, availability and pricing

- Product and SKU are distinct; Variant is not mandatory.
- SKU lifecycle, stock availability and Buyer visibility are distinct.
- `Physical Stock != Sellable Availability`; expired, quarantined, held, blocked, safety-stock and committed quantities cannot be treated as freely sellable.
- `Safety Stock != Inventory Commitment`.
- Buyer does not choose Price List. Sales cannot arbitrarily alter authoritative pricing.

## Ordering and commercial truth

- Cart never reserves inventory.
- Purchase Request is not Sales Order and not Supplier Purchase Order.
- Sales may modify a Purchase Request before Sales Order creation. No universal system-enforced Buyer reconfirmation ceremony is required; commercially required agreement is recorded.
- Active Purchase Request default expiry is 3 days, maximum 7 days; expiry releases related commitment.
- No oversell and no automatic backorder. Final-unit conflict returns current availability to the losing attempt.
- Substitution is never silent; Buyer accepts or rejects the alternative.
- Confirmed Sales Order is immutable business history. Material change uses explicit cancellation/void and replacement semantics; cancellation authority is exceptional Company Owner or Business Operations Manager authority.

## Inventory, fulfillment and delivery

- Manufacturer/Supplier Batch and Inventory Lot are distinct; one source batch may yield multiple lots.
- One physical Inventory Lot belongs to one Warehouse at a time; traceable basic transfers preserve movement/history.
- Partial receiving and inventory adjustment are allowed with reason, actor and history.
- Expired inventory is not sellable. FEFO governs normal selection; overrides require justification and cannot select non-sellable stock.
- `Hold != Quarantine`; no full QMS is implied.
- Fulfillment is broader than Picking. `Dispatch != Delivery`, `Delivery != Route`.
- Failed delivery attempt is not automatically final delivery failure. Partial delivery and total/partial rejection preserve actual outcome.
- POD records actual outcome and evidence, not only signature.

## Cold-chain, credit, payments and traceability

- Manual temperature recording is V1. Excursion requires evaluation and may lead to release, hold, quarantine or disposition; IoT telemetry is future.
- Credit is Tenant-specific. `Credit Limit`, `Current Exposure` and `Available Credit` are distinct; insufficient Available Credit hard-blocks order progression.
- Payment is the business concept; Stripe is the V1 online-payment direction/provider choice, not the definition of Payment.
- Payment reported is not Payment confirmed.
- Business Document is not SUNAT integration. Business Traceability is not Security Log.

## Discovery intentionally left open

Exact lifecycle states, event/command vocabulary, adjustment evidence, cancellation sequence, ownership, subdomains and context boundaries require Capability Mapping, EventStorming, Domain Storytelling and Strategic DDD. No rule here creates an Aggregate, Bounded Context or technical schema.
