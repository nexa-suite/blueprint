---
status: planned
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-08-29
---

# V1 system acceptance plan

Run against named release refs and a controlled tenant fixture. Record command,
environment, actor, tenant/workspace, expected result, actual result and
artifact link. Do not convert static evidence into runtime proof.

| Area | Scenario | Required result |
|---|---|---|
| Identity/context | authenticate, select Tenant/Workspace or Buyer Relationship, switch scope | unauthorized or missing scope fails closed; no cross-tenant data |
| Commercial | resolve SKU/price/terms, create draft, submit PR, confirm Direct Order where policy allows | authoritative revalidation, idempotent duplicate behavior, explicit stale/conflict rejection |
| Inventory | receive lot, preserve UTC expiry, resolve identifier, FEFO pick, handle shortage/override | no expired/quarantined over-allocation; allocation and discrepancy facts are attributable |
| Fulfillment | verify allocation, dispatch handoff, assign/start attempt, partial/rejected outcome | Driver outcome, Buyer receipt and continuation are distinct immutable facts |
| Buyer handoff | issue/scan bounded handoff token, authorize relationship, record receipt/discrepancy | QR is one-time/expired-safe and does not itself equal acceptance |
| Finance | view credit/receivable, report payment, confirm/reconcile payment | Payment Reported != Payment Confirmed; immutable corrections only |
| Documents/trace | issue/download authorized document; view durable business timeline | object authorization and append-only history; no secret leakage |
| Notifications | register/rotate/disable subscription; retry transient failure; terminal dead-letter | source state unchanged by delivery failure; duplicate delivery is visible/deduped |
| Mobile safety | disconnect during draft/evidence flow and retry | only safe cache/queue; no offline authoritative success; explicit stale/conflict/retry state |
| Recovery | worker crash, provider outage, replay outbox/inbox, restore backup | fenced/idempotent recovery; no duplicate SO/payment/notification side effects |

## Exit criteria

All critical scenarios pass for authorized and negative paths; API/consumer
contracts are compatible; isolation, RLS and recovery are evidenced; Product
Owner accepts product scenarios; and the separate Production Gate is closed.
