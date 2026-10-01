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

## Accepted Operations workflows — 2026-10-01

[Owner closure](../../product/owner-decisions-2026-10-01-mobile-operations.md) refines existing BC workflows without adding contexts or changing Inventory/Delivery/financial authority. Operational exception reporting is separate from resolution authority; its attributable lifecycle reaches CLOSED only through an authorized response. Simple loads validate compatible origin, readiness, windows, route, temperature, handling, capacity and restrictions. Dispatch confirmation plus explicit assigned Driver whole-load acceptance records operational responsibility; Buyer Receipt remains later and separate. Critical current instructions require versioned Driver acknowledgment. Manual out-of-range temperature requires real photo, evidence, exception and preventive affected-stock HOLD; final disposition still requires authorized actor/evidence. Chat messages and live location are coordination, never implicit business commands.

Owner clarification 2026-10-01: chat is exclusively Sales ↔ Buyer in an authorized relationship. Driver ↔ Buyer and other chat participant pairs are excluded from this scope.
