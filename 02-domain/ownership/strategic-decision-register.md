---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Strategic Decision Register

These decisions close the PRE-V1 domain model. Technical realization remains subject to compatibility and evidence controls.

| ID | Decision | Status | Consequence |
|---|---|---|---|
| DDD-001 | Accept 11 Bounded Contexts | ACCEPTED / FROZEN | use catalog and ownership matrix as strategic authority |
| DDD-002 | Split Notification from Business Traceability | ACCEPTED; old combined proposal SUPERSEDED | separate failure/retry semantics from durable history |
| DDD-003 | Classify Core/Supporting/Generic | ACCEPTED / FROZEN | Core: Sales, Inventory, Fulfillment; Generic does not mean unimportant |
| DDD-004 | Commercial Commitment is Warehouse-neutral demand; Inventory backs it across eligible Warehouses; Physical Allocation selects lots later | ACCEPTED / FROZEN | no release/re-reserve gap during PR-to-SO transfer; backing is not lot allocation |
| DDD-005 | Submitted PR creates all-or-nothing commitment and credit reservation | ACCEPTED / FROZEN | synchronous atomic invariant boundary |
| DDD-006 | PR state machine and expiry | ACCEPTED / FROZEN | 72-hour default, Tenant 1–7 integer days, absolute `expiresAt: Instant` |
| DDD-007 | Sales Order is born CONFIRMED | ACCEPTED / FROZEN | no Draft SO; material changes use replacement/correction semantics |
| DDD-008 | Delivery attempts and continuation | ACCEPTED / FROZEN | no universal attempt count; partial delivery creates continuation |
| DDD-009 | Credit/Receivable lifecycle | ACCEPTED / FROZEN | Available Credit formula; Receivable at SO confirmation for credit/net terms |
| DDD-010 | Payment is distinct from Receivable, Credit and Stripe | ACCEPTED / FROZEN | provider ACL does not redefine business language |
| DDD-011 | Business Documents are immutable commercial evidence | ACCEPTED / FROZEN | corrections create linked replacements/addenda; SUNAT deferred |
| DDD-012 | Cold-chain is optional V1 capability | ACCEPTED / FROZEN | manual measurement; excursion affects quantity through HOLD/disposition |

## 10 -> 11 history

The earlier discovery catalog had 10 proposed contexts and combined **Notification & Business Traceability**. That proposal is preserved as `SUPERSEDED / HISTORICAL`. The accepted model separates:

- Notifications: recipient/channel delivery, retry and failure; source business state is unchanged by delivery failure.
- Business Traceability: append-only durable business facts, actor, reason, evidence, correlation and timeline; source contexts retain authority.

The split is based on different language, invariants, ownership, consumers, lifecycle and change pressure. No history is rewritten.

## Other superseded proposals

| Historical proposal | Accepted replacement |
|---|---|
| arbitrary Delivery attempt limit `3` or configurable `1–5` | Operations-driven exhaustion and `FAILED_FINAL` |
| unresolved commitment timing | submitted PR creates commitment; PR-to-SO transfers ownership |
| `Credit Reserved -> Receivable` ambiguity | explicit transition without double count; Receivable at SO confirmation for credit/net |
| Customer/Buyer multiplicity unresolved | one principal active Buyer Identity per Customer Account in V1 |
| unresolved price precedence | Base Price -> Price List -> Customer Terms -> one Promotion |
| Commercial Commitment treated as physical reservation | commitment is Warehouse-neutral SKU + quantity; Inventory Reservation backing is Inventory-owned; allocation selects lots later |
| Photo and signature always mandatory POD | policy-driven evidence; POD remains immutable |

## Change rule

A future decision may supersede this register only with explicit authority, evidence, impact on user stories/contracts and a linked replacement. Implementation drift is not a decision.
