---
status: accepted
maturity: FROZEN
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Known Business Rules

Canonical V1 invariants. Ownership and lifecycle details are in [Strategic DDD](../strategic-ddd/README.md); observed implementation remains AS-IS evidence.

## Identity, tenancy and relationships

- `Tenant != Workspace`; V1 uses Tenant 1:1 Workspace and Tenant is the maximum business/data isolation boundary.
- Human Identity, Workforce Membership, Buyer Relationship and Customer Account are distinct. One human may hold independent relationships with multiple Tenants.
- Customer Account may exist without Portal identity. V1 has one principal active Buyer Identity per Customer Account.
- Buyer Relationship requires Tenant approval and uses `PENDING / INVITED`, `ACTIVE`, `SUSPENDED`, `REVOKED`.
- Tenant Administrator controls technical access; Company Owner controls organization/workforce authority; Business Operations Manager controls day-to-day operations.

## Catalog, pricing and commercial intent

- Product, SKU, Price, Customer Terms and visibility are distinct concepts.
- Cart/Request Draft creates no Commercial Inventory Commitment or Physical Allocation. Cart price is informative until authoritative revalidation.
- Pricing precedence is Base Price, applicable Price List, permitted Customer Terms, then maximum one applicable Promotion. Promotions do not stack.
- Submitted PR freezes historical pricing. New attempts after rejection, withdrawal or expiry resolve current authoritative pricing.
- No silent product substitution.

## Purchase Request, commitment and Sales Order

- Approval-required PR submission is all-or-nothing: required Commercial Commitment and Credit Reservation are established in one logical transaction when applicable.
- PR states: `SUBMITTED`, `CHANGES_PROPOSED`, `CONVERTED`, `REJECTED`, `WITHDRAWN`, `EXPIRED`. UI “Under review” is not a persisted state.
- Submitted means validation succeeded, full commitment exists, expiry started and Sales can review. Buyer accepts material changes explicitly; Sales rejection has reason; Buyer can withdraw before conversion.
- Default expiry is 72 hours. Tenant may configure 1–7 integer days. Store UTC absolute `expiresAt: Instant`; conversion fails at `now >= expiresAt` even before worker transition. Expiry releases Commercial Inventory Commitment and applicable Credit Reservation atomically and durably.
- Commercial Commitment is persistent SKU + quantity demand with stable `CommitmentId`. PR-to-SO transfers ownership; no release/re-reserve gap. It selects no Warehouse/Lot.
- Sales Order is born `CONFIRMED`; no Draft SO V1. Confirmed SO history is immutable. Material changes use explicit cancellation/replacement/correction semantics.

## Inventory, fulfillment and delivery

- Sellable Availability = usable physical on-hand - active Commercial Commitments - Safety Stock.
- HOLD, QUARANTINE, DAMAGED/WASTE, EXPIRED and IN_TRANSIT are not sellable. Primary authority is SKU + Warehouse. Tenant-wide views are projections.
- FEFO is default for expiry-tracked SKU. Override requires reason and never selects expired/quarantined stock.
- Warehouse Transfer states: `REQUESTED`, `IN_TRANSIT`, `RECEIVED`. In-transit stock cannot be sellable at origin and destination simultaneously.
- Physical Allocation selects Inventory Lot(s) under Inventory Availability authority. Fulfillment & Delivery executes the operational work; allocation cannot exceed commitment or usable stock.
- Fulfillment states: `PLANNED`, `ALLOCATED`, `PICKING`, `PICKED`, `PACKED`, `STAGED`, `READY_FOR_DISPATCH`, `HANDED_OVER`, `COMPLETED`, plus explicit shortage/hold/cancel exceptions.
- Delivery Attempt is part of one Delivery. Failed attempt does not create a new Delivery and has no universal numeric exhaustion limit. Partial delivery creates a Continuation Delivery for remaining obligation.
- POD is immutable; amendment/addendum is linked. Photo/signature requirements are policy-driven, not universal.

## Cold-chain, credit, payments and finance

- Cold-chain is optional per Tenant/SKU. V1 temperature capture is manual. Excursion places affected quantity on HOLD pending Release, CONTINUE_HOLD, REJECT or WASTE disposition; no automatic destruction.
- Available Credit = Credit Limit - Active Credit Reservations - Outstanding Receivable Balances. Reservations and receivables must not double count.
- Credit purchase reserves at PR submission; direct order reserves during same SO confirmation. Commitment and credit reservation are all-or-nothing.
- Credit/net Receivable posts at Sales Order confirmation. Delivery or document issuance is not a universal trigger.
- PREPAID requires Payment Confirmed before Sales Order confirmation and physical fulfillment. IMMEDIATE permits SO before payment. Payment is distinct from Receivable, Credit and Stripe.
- Historical obligation is corrected only by explicit Financial Adjustment and valid Payment/Refund effects. Payment history is never erased.

## Documents, notifications and traceability

- V1 Business Documents: Sales Order Document, Delivery Note, Commercial Invoice, Payment Receipt and Financial Adjustment. Commercial Invoice is not a SUNAT fiscal document.
- Issued documents are immutable; replacements/addenda preserve links and history. No destructive retention deletion before Production/Legal Gate policy.
- Notifications use in-app/email V1. Delivery failure retries and never changes source business state. WhatsApp is external/manual.
- Business Traceability is append-only durable business history, separate from Notifications and Security Audit. Significant facts retain actor, time, reason, correlation and evidence where relevant.

## Deferred boundaries

IoT telemetry, full RMA/returns, multi-currency, SUNAT, advanced accounting, Mobile, full Procurement, Control Center, Support, Plans and subscriptions are not V1 implementation claims.
