---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Bounded Context Canvases

Compact canvases record language, authority, invariants and contracts. They do not prescribe technical modules.

## BC-01 — Tenant & Access Governance

- **Language:** Tenant, Workspace, Human Identity, Workforce Membership, Company Owner, capability, access context.
- **Owns:** tenant lifecycle, scope eligibility and workforce authority.
- **Invariants:** Tenant is isolation boundary; Tenant 1:1 Workspace V1; one Company Owner; missing scope fails closed.
- **Consumes/publishes:** identity/session inputs; membership and capability facts to tenant-scoped contexts.

## BC-02 — Customer & Buyer Relationships

- **Language:** Customer Account, Buyer Relationship, Buyer Identity, contact, address, claim/link.
- **Owns:** account and relationship lifecycle per supplier Tenant.
- **Invariants:** Customer Account may exist without Portal identity; one principal active Buyer Identity per account V1; approval required.
- **Consumes/publishes:** Tenant access context; active relationship and eligibility to Catalog/Sales/Portal.

## BC-03 — Catalog & Commercial Policy

- **Language:** Product, SKU, visibility, Base Price, Price List, Customer Terms, Promotion.
- **Owns:** sellable offer and authoritative commercial input resolution.
- **Invariants:** Product != SKU; promotions do not stack; one operational currency per Tenant; price is revalidated at authoritative submit/checkout.
- **Consumes/publishes:** relationship eligibility and Tenant policy; resolved snapshots to Sales Commitment.

## BC-04 — Sales Commitment

- **Language:** Purchase Request, Commercial Commitment, Sales Order, revision, material change, replacement.
- **Owns:** commercial lifecycle and SKU + quantity demand commitment.
- **Invariants:** submitted PR is all-or-nothing; PR-to-SO transfers ownership without release gap; SO is born CONFIRMED; no Draft SO V1.
- **Consumes/publishes:** catalog/customer/availability/credit sync decisions; committed facts to Inventory, Credit, Fulfillment, Notifications and Traceability.

## BC-05 — Inventory Availability

- **Language:** physical stock, Inventory Lot, Sellable Availability, Safety Stock, HOLD, QUARANTINE, FEFO, Physical Allocation.
- **Owns:** physical truth, sellability and allocation authority by SKU + Warehouse.
- **Invariants:** sellable = usable on-hand - active commitments - safety stock; in-transit is not sellable twice; no expired/quarantined allocation.
- **Consumes/publishes:** Commercial Commitment demand; availability, allocation, movement and shortage facts.

## BC-06 — Fulfillment & Delivery

- **Language:** Fulfillment, pick, pack, stage, dispatch, Delivery, Attempt, Continuation Delivery, POD, excursion.
- **Owns:** operational execution and delivery evidence; Inventory remains physical authority.
- **Invariants:** attempts stay on one Delivery; partial delivery creates continuation; POD immutable; no silent substitution.
- **Consumes/publishes:** confirmed SO, allocation and routes; progress, delivery, POD and cold-chain evidence.

## BC-07 — Credit & Receivables

- **Language:** Credit Account, Credit Limit, Credit Reservation, Available Credit, Receivable, Financial Adjustment.
- **Owns:** credit risk and formal obligation.
- **Invariants:** Available Credit formula; reservations and receivables do not double count; correction is explicit.
- **Consumes/publishes:** commercial/payment facts; credit decisions, receivable and adjustment facts.

## BC-08 — Payments

- **Language:** Payment, Payment Report, provider event, confirmation, refund, correction.
- **Owns:** payment/provider lifecycle and translation.
- **Invariants:** Payment != Receivable/Credit/Stripe; callback dedupe; payment history is never erased.
- **Consumes/publishes:** payment commands/provider ACL; confirmed/rejected/refunded facts to Credit and Traceability.

## BC-09 — Business Documents

- **Language:** issued document, numbering, snapshot, replacement, addendum, evidence reference.
- **Owns:** issued Business Document history and metadata.
- **Invariants:** issued artifacts immutable; corrections are linked; Commercial Invoice is not SUNAT fiscal integration.
- **Consumes/publishes:** source facts and document requests; authorized document availability.

## BC-10 — Notifications

- **Language:** Notification, candidate, template, recipient, channel, attempt, retry, failure.
- **Owns:** delivery state for in-app/email channels.
- **Invariants:** at-least-once delivery; retryable failure; notification failure never changes source business state.
- **Consumes/publishes:** source event candidates; delivery outcome to Traceability where relevant.

## BC-11 — Business Traceability

- **Language:** business fact, actor, reason, evidence, correlation, timeline, before/after.
- **Owns:** durable transversal representation, not source fact.
- **Invariants:** append-only, tenant-scoped, consultable; excludes secrets and unnecessary sensitive payloads; Security Audit remains separate.
- **Consumes/publishes:** significant facts from every source context; timeline projections to authorized surfaces.
