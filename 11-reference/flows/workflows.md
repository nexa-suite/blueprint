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
      -> Availability -> Credit -> Sales Order
```

The Buyer draft builder stops before commitment; no Draft Sales Order is
persisted. Submission creates the SKU + quantity commercial commitment.
Availability and Credit are decision points; Sales Order conversion continues
the commitment.

## 2. Warehouse and delivery flow

```text
Sales Order -> Allocation -> Warehouse -> Picking -> Dispatch
            -> Delivery -> Proof of Delivery (POD)
```

Allocation selects physical lots after commercial demand is known. Dispatch,
Delivery and Route remain distinct. Partial delivery records the actual result
and creates a continuation obligation for the remaining quantity.

## 3. Payment and receivable flow

```text
Buyer -> Payment Report -> Finance Review -> Approval -> Receivable Update
```

Payment Reported is not Payment Confirmed. Credit calculation must avoid double
counting when Credit Reserved becomes Outstanding Receivables.

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
| Domain ownership | ACCEPTED PRE-V1 target; implementation migration remains a construction gate. |
| Technical handoffs | AS-IS evidence plus selective TARGET guidance. |
| Authenticated browser proof | Not claimed by these diagrams. |
