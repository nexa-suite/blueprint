---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Context Map

Relationships describe authority and translation. They do not imply deployment, package dependency or shared database ownership.

| Upstream | Downstream | Relationship | Contract / translation | Interaction | Translation / ACL | Consistency |
|---|---|---|---|---|---|---|
| Tenant & Access Governance | all tenant-scoped BCs | upstream authorization context | verified Tenant/Workspace scope, membership and capability decision | synchronous query/decision | no translation; fail-closed ACL | immediate for authorization; projections may be stale but cannot grant |
| Customer & Buyer Relationships | Catalog & Commercial Policy | relationship policy supplier | active relationship and eligibility reference | synchronous lookup | stable relationship ID; no shared Customer entity | current relationship required |
| Customer & Buyer Relationships | Sales Commitment | account/actor supplier | Customer Account, Buyer Relationship and principal Buyer identity reference | synchronous command input | identity/reference translation | atomic with submit validation |
| Catalog & Commercial Policy | Sales Commitment | Published Language / offer supplier | resolved price, terms, promotion and SKU cold-chain snapshot | synchronous resolution | commercial snapshot | snapshot immutable after acceptance |
| Sales Commitment | Inventory Availability | demand contract | Commercial Commitment ID, SKU, quantity, active/released status | synchronous decision | stable IDs; no Warehouse/Lot selection | atomic protection |
| Inventory Availability | Sales Commitment | availability decision supplier | full-protection result with Reservation/Warehouse Backing references | synchronous decision | availability contract | atomic with commitment |
| Sales Commitment | Credit & Receivables | credit demand contract | amount, terms, commitment reference and reservation intent | synchronous decision | amount/terms snapshot | atomic when applicable |
| Credit & Receivables | Sales Commitment | credit decision supplier | reservation accepted/rejected, Available Credit and receivable status | synchronous decision | credit result, no shared aggregate | atomic with commitment |
| Sales Commitment | Fulfillment & Delivery | commercial obligation supplier | immutable confirmed SO snapshot and remaining quantities | published fact + projection | Sales Order contract | async after commit |
| Inventory Availability | Fulfillment & Delivery | physical truth supplier | usable lots/quantities and Physical Allocation authority | published fact + command | lot/allocation contract | async announcement; source mutation explicit |
| Fulfillment & Delivery | Inventory Availability | physical mutation contract | pick/pack/dispatch movement, shortage and disposition facts | synchronous mutation / async fact | movement/evidence references | source execution stays separate |
| Fulfillment & Delivery | Business Documents | evidence supplier | Delivery/POD facts and document request | async event | immutable evidence snapshot | eventual after source commit |
| Credit & Receivables | Payments | payment target supplier | Receivable/payment application contract | synchronous command input | provider-neutral payment reference | explicit reconciliation |
| Payments | Credit & Receivables | payment fact supplier | confirmed/rejected/refunded Payment with idempotent provider reference | async published event | provider ACL translation | eventual, deduplicated |
| all source BCs | Notifications | published fact consumers | candidate with recipient, template, channel and correlation | async event | notification candidate translation | at-least-once |
| all source BCs | Business Traceability | published durable fact consumers | append-only fact with actor, reason, evidence and source reference | async event | traceability projection | eventual, replayable |
| Notifications | Business Traceability | delivery evidence consumer | delivery outcome only; never replaces source fact | async event | delivery result translation | eventual |

## Atomic boundary

PR submission and required Commercial Commitment, complete Inventory Reservation backing and applicable Credit Reservation are one logical PostgreSQL transaction. Direct order confirmation follows the same rule. Published events announce committed facts after commit; they do not create atomic protection later. Internal Warehouse backing distribution remains owned by Inventory Availability and does not create a new Published Integration Event.

## Context-map rules

- Stable IDs, snapshots and versioned contracts cross boundaries.
- No downstream writes upstream state directly.
- At-least-once event delivery requires inbox/deduplication; no exactly-once transport claim.
- Business Traceability is a transversal representation. Source BCs retain authority for facts.
- A technical ACL may translate Stripe, legacy identifiers or current schema terms without changing canonical language.
