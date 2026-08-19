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
- Buyer/Tenant relationship requires Tenant approval, whether initiated by Tenant invitation or Buyer request. Existing Customer Account may link/claim to a later Nexa identity instead of being duplicated.
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
- Cart and PR Draft create no commitment. PR Submitted establishes Commercial Inventory Commitment for SKU + quantity; Withdrawn, Rejected or Expired releases it; conversion to Sales Order continues it. Sales may modify submitted content before Sales Order creation, but Buyer does not freely mutate it. No universal system-enforced Buyer re-accept click is required after every Sales modification; consent-required changes preserve evidence, material agreed modification resets validity, Sales rejection requires reason, and Buyer withdrawal may omit reason.
- Purchase Request commitment release transitions are closed; only the numeric expiry policy remains open for Business Architect review. No numeric default or maximum is invented here.
- No oversell and no automatic backorder. Final-unit conflict returns current availability to the losing attempt.
- Substitution is never silent; Buyer explicitly accepts or rejects the alternative.
- Confirmed Sales Order is immutable business history. Buyer and Sales cannot directly cancel it; they may request cancellation. Material change uses explicit cancellation/void and replacement semantics; cancellation authority is exceptional Company Owner or Business Operations Manager authority.

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

- Manual temperature recording is V1. Out-of-range receiving temperature creates `HOLD` plus a pending Temperature Excursion evaluation; it is not automatic Quarantine. Disposition may be Release, continued Hold, Waste or Return to Supplier; IoT telemetry is future.
- Credit is Tenant-specific: `Credit Limit - Credit Reserved - Outstanding Receivables = Available Credit`; Credit Reserved covers relevant commercial commitments before formal Receivable recognition, and transition must not double-count.
- Buyer Portal exposes those four live credit values for current supplier Tenant; no global Nexa-wide Buyer credit balance exists. `exposure`/`used` fields remain AS-IS implementation vocabulary.
- Payment is the business concept; Stripe is Nexa's V1 integrated online-payment provider, not the definition of Payment. V1 is not an arbitrary bring-your-own-online-gateway platform; commercial credit, bank transfer, cash/COD and direct Tenant-supported arrangements remain valid business methods.
- Payment reported is not Payment confirmed.
- Business Document is not SUNAT integration. Business Traceability is not Security Log.

## Discovery intentionally left open

Exact lifecycle states, event/command vocabulary, adjustment evidence, cancellation sequence, ownership, subdomains and context boundaries are proposed in [Strategic DDD](../strategic-ddd/README.md) and require Business Architect review. Numeric Purchase Request expiry remains the only unresolved Product detail. No rule here creates an Aggregate, Bounded Context or technical schema, and closed Product semantics are not reopened.
