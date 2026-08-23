---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-23
---

# Frontend Product Contract

This is the minimum observable V1 workflow contract. API/domain authority remains server-side; frontend surfaces present authorized state and never invent source truth.

## Shared contract

- Resolve authentication, selected Tenant/Workspace or Buyer Relationship context before tenant-scoped data.
- Show Product/SKU, Cart/Draft, Purchase Request, Sales Order, Fulfillment, Delivery, credit, payment, documents, notifications and traceability using canonical vocabulary.
- For authoritative operations, revalidate current price, availability, credit, revision and idempotency. Never show optimistic irreversible success.
- Distinguish validation error, business rejection, technical failure, conflict/stale state and permission denied.
- Preserve i18n, keyboard access, responsive behavior, reduced motion, readable status and Design Lab public API boundaries.

## Buyer Portal

| Workflow | Minimum observable behavior |
|---|---|
| Auth/context selection | authenticate, select an active authorized supplier relationship and fail closed on missing scope |
| Catalog | browse visible Product/SKU, policy-safe media, cold-chain indication and current sellable availability presentation |
| Cart/Draft | add/remove intent without reservation; show informative pricing and availability caveat |
| Checkout | authoritative revalidation, choose direct order or approval-required path, show validation/business rejection/conflict |
| Purchase Request | view `SUBMITTED`, `CHANGES_PROPOSED`, `CONVERTED`, `REJECTED`, `WITHDRAWN`, `EXPIRED`; submit, withdraw and respond to material changes |
| Sales Orders | view immutable confirmed snapshots, roll-up status and explicit cancellation/replacement outcome |
| Fulfillment | view progress, shortage and remaining quantity without claiming lot authority |
| Delivery tracking | view schedule, attempts, partial delivery, Continuation Delivery, POD and final outcome |
| Credit/receivables | view Tenant-specific Credit Limit, Credit Reserved, Outstanding Receivables and Available Credit |
| Payment | distinguish report, pending, confirmed, failed, refund/correction and provider-pending states |
| Manual payment evidence | submit/see evidence state without claiming confirmation before authorization |
| Documents | retrieve authorized immutable business documents and replacements |
| Notifications | view in-app notification state and delivery failures without changing source business state |
| Business traceability | view authorized timeline facts, actor/time/reason/evidence appropriate to Buyer |

## Internal Web Platform

| Workflow | Minimum observable behavior |
|---|---|
| Tenant operations | Tenant/Workspace configuration, company information, workforce membership and access context |
| Customers and Buyers | Customer Accounts, contacts/addresses, Buyer Relationship approval/suspension/revocation |
| Catalog and policy | Product/SKU, visibility, media metadata, Price Lists, Customer Terms and Promotions |
| PR/SO review | review PR, propose material changes, capture consent/rejection reason, confirm/reject/withdraw/expire outcomes |
| Receiving/warehouse | receive partial quantities, lots, source batches, Safety Stock, holds, adjustments and transfers |
| Inventory | show sellable availability, commitments, allocation authority, FEFO and shortage exceptions |
| Fulfillment | allocate execution, pick, pack, stage, ready for dispatch and shortage resolution |
| Dispatch/delivery | schedule, dispatch, attempts, reschedule, partial/continuation Delivery and immutable POD/addendum |
| Cold-chain | manual temperature evidence, excursions, HOLD and disposition |
| Credit/receivables | configure/view credit, reservations, receivables, Financial Adjustments and correction state |
| Payment review | manual payment evidence, provider status, callback/reconciliation and refund/correction state |
| Documents | issue/retrieve immutable documents and linked replacements |
| Traceability | consult business timeline and separate security audit permissions |
| Operational visibility | current projections with source version/time and stale/technical state |

## Public Website

Public product acquisition, login entry and Contact/Request Demo initiation only. Website does not own Tenant activation, catalog, pricing, operational data or Buyer relationship truth.

## Product contract boundary

This contract does not freeze Angular component names, tokens or backend endpoints. Design Lab owns visual evidence; API owns domain and authorization; current implementations are AS-IS until verified.
