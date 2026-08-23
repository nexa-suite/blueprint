---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Context Map

Relationships describe authority and translation. They do not imply deployment, package dependency or shared database ownership.

| Upstream | Downstream | Relationship | Contract / translation |
|---|---|---|---|
| Tenant & Access Governance | all tenant-scoped BCs | upstream authorization context | verified Tenant/Workspace scope, membership and capability decision; raw client Tenant IDs are never trusted |
| Customer & Buyer Relationships | Catalog & Commercial Policy | relationship policy supplier | active relationship and eligibility reference; no shared Customer entity |
| Customer & Buyer Relationships | Sales Commitment | account/actor supplier | Customer Account, Buyer Relationship and principal Buyer identity reference |
| Catalog & Commercial Policy | Sales Commitment | Published Language / offer supplier | resolved price, terms, promotion and SKU cold-chain snapshot |
| Sales Commitment | Inventory Availability | demand contract | Commercial Commitment ID, SKU, quantity, active/released status; no Warehouse/Lot selection |
| Inventory Availability | Sales Commitment | availability decision supplier | atomic full-protection result with Inventory Reservation/ Warehouse Backing references; availability does not own SO |
| Sales Commitment | Credit & Receivables | credit demand contract | amount, terms, commitment reference and Credit Reservation intent |
| Credit & Receivables | Sales Commitment | credit decision supplier | reservation accepted/rejected, Available Credit result and receivable status |
| Sales Commitment | Fulfillment & Delivery | commercial obligation supplier | immutable confirmed SO snapshot and remaining quantities |
| Inventory Availability | Fulfillment & Delivery | physical truth supplier | usable lots/quantities and Physical Allocation authority; execution remains downstream |
| Fulfillment & Delivery | Inventory Availability | physical mutation contract | pick/pack/dispatch movement, shortage and disposition facts; no silent substitution |
| Fulfillment & Delivery | Business Documents | evidence supplier | Delivery/POD facts and document request; source history remains immutable |
| Credit & Receivables | Payments | payment target supplier | Receivable/payment application contract; no provider terms in credit language |
| Payments | Credit & Receivables | payment fact supplier | confirmed/rejected/refunded Payment fact with idempotent provider reference |
| all source BCs | Notifications | published fact consumers | notification candidate with recipient, template, channel and correlation |
| all source BCs | Business Traceability | published durable fact consumers | append-only business fact with actor, reason, evidence and source reference |
| Notifications | Business Traceability | delivery evidence consumer | Notification delivery outcome only; never replaces source fact |

## Atomic boundary

PR submission and required Commercial Commitment, complete Inventory Reservation backing and applicable Credit Reservation are one logical PostgreSQL transaction. Direct order confirmation follows the same rule. Published events announce committed facts after commit; they do not create atomic protection later. Internal Warehouse backing distribution remains owned by Inventory Availability and does not create a new Published Integration Event.

## Context-map rules

- Stable IDs, snapshots and versioned contracts cross boundaries.
- No downstream writes upstream state directly.
- At-least-once event delivery requires inbox/deduplication; no exactly-once transport claim.
- Business Traceability is a transversal representation. Source BCs retain authority for facts.
- A technical ACL may translate Stripe, legacy identifiers or current schema terms without changing canonical language.
