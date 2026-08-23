---
status: accepted
maturity: FROZEN
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Strategic DDD baseline

## Verdict

**ACCEPTED / PRE-V1.** Strategic DDD, 11 Bounded Contexts, Context Map, ownership, subdomain classification and Core Domain statement are frozen inputs for construction. They are not implementation-completion claims.

## Core Domain

Nexa's Core Domain is the reliable coordination of B2B commercial commitments against real inventory availability, followed by traceable physical fulfillment and delivery under lot, expiry and optional cold-chain constraints.

Nexa is not reduced to order management: commercial commitment, physical truth, operational execution and durable delivery history must remain distinguishable.

## Frozen contexts

| ID | Context | Class | Primary invariant/lifecycle |
|---|---|---|---|
| BC-01 | Tenant & Access Governance | Supporting | Tenant/workspace scope, identity relationship, workforce membership and authorized access |
| BC-02 | Customer & Buyer Relationships | Supporting | Customer Account and Buyer Relationship lifecycle per supplier Tenant |
| BC-03 | Catalog & Commercial Policy | Supporting | Product/SKU offer, visibility and deterministic price/terms/promotion resolution |
| BC-04 | Sales Commitment | Core | PR, Commercial Commitment, SO, commercial snapshots and replacement/cancellation history |
| BC-05 | Inventory Availability | Core | usable physical stock, sellable availability, safety stock, FEFO and physical allocation authority |
| BC-06 | Fulfillment & Delivery | Core | execution, dispatch, delivery attempts, continuation, POD and operational cold-chain evidence |
| BC-07 | Credit & Receivables | Supporting | Credit Reservation, Available Credit, Receivable and financial correction lifecycle |
| BC-08 | Payments | Generic | Payment report/confirmation, provider lifecycle, refund and correction |
| BC-09 | Business Documents | Generic | immutable issued commercial documents, numbering, evidence and replacements |
| BC-10 | Notifications | Generic | notification intent, channel delivery, retry and failure state |
| BC-11 | Business Traceability | Supporting | append-only durable business timeline and cross-context fact representation |

## Acceptance rules

- Notification and Business Traceability are separate strategic contexts. The former 10-context proposal is retained as `SUPERSEDED`, not silently rewritten.
- `Commercial Commitment != Physical Allocation != Physical Stock`. Sales Commitment owns commercial demand and ownership transfer; Inventory Availability owns physical availability and allocation authority; Fulfillment & Delivery executes operational work.
- `Bounded Context != Spring Modulith ApplicationModule != Java package != PostgreSQL schema != deployment unit`.
- Context relationships use stable identifiers, snapshots and explicit contracts. No shared aggregate/entity ownership is implied.
- Product and business semantics in [Current accepted decisions](../../00-governance/current-decisions.md) outrank historical discovery drafts.

## Evidence boundary

Current implementation areas, database schemas and browser surfaces are recorded under [AS-IS evidence](../../11-reference/as-is/README.md). They may show drift or missing capability; they do not reopen accepted TARGET.
