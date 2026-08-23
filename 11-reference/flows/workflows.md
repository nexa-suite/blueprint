---
status: accepted
maturity: BASELINED
scope: v1
owner: product-architecture
last-reviewed: 2026-08-23
---

# Canonical V1 workflows

These cross-layer maps preserve accepted rules and show technical handoffs
against the frozen 11-context target. They are not API contracts or runtime
proof.

## 1. Buyer sales flow

```text
Buyer -> Portal -> API -> Purchase Request -> Commercial Commitment
      -> Inventory Reservation backing across eligible Warehouses
      -> Availability -> Credit -> Sales Order
```

The Buyer draft builder stops before commitment; no Draft Sales Order is
persisted. Submission creates Warehouse-neutral SKU + quantity Commercial
Commitment. Inventory Availability deterministically protects full demand,
possibly across multiple eligible Warehouses. Availability and Credit are
decision points; Sales Order conversion continues commitment and backing.

## 2. Warehouse and delivery flow

```text
Sales Order -> Warehouse Backing -> Fulfillment/Physical Allocation
            -> Warehouse -> Picking -> Dispatch -> Delivery -> POD
```

Warehouse Backing protects demand before lot selection and may span Warehouses.
Physical Allocation later selects lots under Inventory Availability authority.
Dispatch, Delivery and Route remain distinct. Partial delivery records the
actual result and creates a continuation obligation for remaining quantity.

## 3. Payment and receivable flow

```text
Credit/net: SO Confirmed -> Receivable Posted -> Payment Report -> Payment Confirmed -> Payment Applied
PREPAID:   Payment Report -> Payment Confirmed -> SO Confirmed -> physical fulfillment
IMMEDIATE: SO Confirmed -> Payment Report -> Payment Confirmed -> Payment Applied
```

Payment Reported is not Payment Confirmed. Credit/net Receivable posts at Sales
Order confirmation; the Credit Reservation is converted or released without
double counting. PREPAID requires Payment Confirmed before Sales Order
confirmation and physical fulfillment. A captured prepaid payment with failed
Sales Order creation enters `UNALLOCATED / RECONCILIATION_REQUIRED`, with refund
attempt and retained Payment history.

## 4. Durable business events

```text
Domain Action -> Transactional Outbox -> Processor -> Notification
```

The source transaction commits the meaningful fact before durable publication.
Processors must be retryable and idempotent; notifications are projections,
not the source of business truth.

## Workflow status

| Dimension | Status |
| --- | --- |
| Product invariants | ACCEPTED where linked to current decisions/rules. |
| Domain ownership | ACCEPTED PRE-V1 target; construction authorized, implementation migration remains repository-specific evidence work. |
| Technical handoffs | AS-IS evidence plus selective TARGET guidance. |
| Authenticated browser proof | Not claimed by these diagrams. |
