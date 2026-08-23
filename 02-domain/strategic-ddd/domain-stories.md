---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Domain Stories

Stories below clarify responsibility, authority or exceptional handoff. The complete actor-value catalog lives in [V1 User Story Catalog](../../01-product/user-story-catalog.md).

## Story 1 — Buyer submits commercial intent

```text
B2B Buyer
  selects visible SKU and Customer Account context
  prepares Cart
  requests price and availability preview
  submits direct order or Purchase Request
Sales Commitment
  validates authoritative price, current availability, credit and policy
  establishes commitment or returns a conflict
```

Authority notes: Cart has no commitment. Catalog / Commercial Policy owns price inputs. Inventory owns sellability. Credit owns hard-block decision. Sales Commitment owns the commercial outcome. Buyer must never silently receive a substituted SKU.

## Story 2 — Sales changes a Purchase Request

```text
Sales
  reviews submitted Purchase Request
  changes commercial content under controlled review
  records evidence when a change requires business consent
  confirms Sales Order, rejects with reason, or leaves request unresolved
Buyer
  may withdraw before Sales Order
Sales Commitment
  preserves revision/history and recalculates commitment when material content changes
```

Accepted policy: Buyer does not freely mutate submitted PR; no universal system-enforced re-accept click follows every Sales modification; consent-required changes preserve evidence; Product substitution requires explicit Buyer acceptance; material agreed modification resets validity; Sales rejection requires reason; Buyer withdrawal may omit reason. Expiry is 72 hours by default, Tenant configurable 1–7 days, with absolute `expiresAt: Instant`.

## Story 3 — Warehouse makes stock sellable

```text
Warehouse Operator
  receives quantity and records source Batch / Inventory Lot
  records required receiving temperature
Inventory Availability
  accepts, holds, returns or disposes lot after evaluation
  exposes sellable availability by SKU and Warehouse
Sales Commitment
  consumes availability without selecting a physical lot
Fulfillment
  later selects one or more valid lots for allocation
```

Authority notes: physical truth wins. Rejected receiving remains evidence. A temperature excursion starts as HOLD plus evaluation; it is not automatically Waste.

## Story 4 — Partial delivery creates continuation

```text
Dispatch Coordinator
  schedules Delivery within a time window
Delivery actor
  records actual attempt and delivered quantity
Fulfillment & Delivery
  keeps a failed attempt on the same Delivery for another attempt
  closes Delivery as partial when only part is delivered
  creates Continuation Delivery for remaining existing Sales Order obligation
Buyer
  sees delivered result and remaining obligation
```

The continuation is not another attempt of the original Delivery and is not a new backorder. Returned or rejected goods go to Warehouse HOLD pending inspection.

## Story 5 — Global identity with independent Tenant relationships

```text
Human Identity
  authenticates once
Tenant & Access
  resolves authorized Workforce Membership for Tenant A
Customer / Buyer Relationships
  resolves independent Buyer Relationship for Tenant B when present
Application API
  creates one current Tenant context per request
  applies authorization and persistence isolation
```

One person may be workforce and Buyer in one Tenant. Relationship types remain independent. No relationship grants another Tenant's data.

## Story 6 — Captured payment with failed order creation

```text
Buyer
  starts prepaid online checkout
Payment
  obtains provider authorization/capture
Sales Commitment
  fails to create final Sales Order
Payment
  records UNALLOCATED / RECONCILIATION_REQUIRED
  attempts automatic refund
Operations
  resolves refund failure without erasing financial history
```

Provider details remain behind an adapter. Payment is the business concept; Stripe is the selected V1 provider direction.

## Story 7 — Security audit versus buyer timeline

```text
Business source context
  commits meaningful business fact
Business Traceability
  projects reduced Buyer timeline
Notifications
  sends configured notifications
Security layer
  records authorization/security audit fact separately
Buyer
  sees only authorized business progress and documents
```

Internal lot changes, security audit details and worker notes are not Buyer timeline content. Business Traceability and Notifications remain separate Bounded Contexts.
