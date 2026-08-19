---
status: draft
maturity: DISCOVERY
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Capability Map

The map describes business abilities, not applications, APIs, repositories, Spring modules, database schemas or screens. Labels are proposed discovery language, not technical components.

## L0 to L2 map

| L0 Business Area | L1 Capability | L2 Sub-capabilities |
|---|---|---|
| Tenant and access | Establish and govern Tenant | register, approve, provision, activate, suspend, wind down, close, export |
| Tenant and access | Govern workforce access | invite, activate, suspend, deactivate, assign role, grant capability, revoke access |
| Tenant and access | Manage global identity relationships | authenticate human, maintain sessions, select authorized Tenant relationship |
| Customer relationships | Manage Customer Accounts | create account, maintain contacts, maintain delivery addresses, assign primary Sales Representative |
| Customer relationships | Manage Buyer Relationships | invite/link, receive Buyer request, approve, suspend, revoke, link existing account |
| Customer relationships | Provide Buyer Portal Access | expose authorized account, catalog, orders, credit and documents for current Tenant |
| Catalog and commercial policy | Define sellable offer | maintain Product, SKU, presentation, UOM, media, category and temperature requirement |
| Catalog and commercial policy | Govern commercial pricing | maintain Price List, validity, Customer Commercial Terms, promotions and currency |
| Catalog and commercial policy | Resolve offer | calculate deterministic price, terms, promotion and sellable availability view |
| Sales commitment | Capture commercial intent | cart, direct order intent, Purchase Request draft, manual Sales order draft |
| Sales commitment | Review commercial intent | submit, review, negotiate, record material agreement, reject, withdraw, expire |
| Sales commitment | Establish Sales Commitment | validate availability, credit and policy; create/confirm immutable Sales Order |
| Inventory availability | Receive and qualify stock | receive, record batch/lot, capture temperature, hold, release, waste, return |
| Inventory availability | Maintain physical truth | adjust, transfer, inspect, preserve rejection and shortage evidence |
| Inventory availability | Calculate sellable availability | exclude expired, quarantined, held, safety stock and committed quantity |
| Fulfillment and delivery | Allocate commercial commitment | plan fulfillment, select lots, confirm physical allocation, record FEFO override |
| Fulfillment and delivery | Prepare fulfillment | pick, pack, mark ready, revert exceptional readiness with reason |
| Fulfillment and delivery | Execute Dispatch and Delivery | group dispatches, plan route, schedule window, attempt, partial deliver, continue |
| Fulfillment and delivery | Preserve cold-chain evidence | record temperature, evaluate excursion, approve disposition, attach POD |
| Credit and receivables | Govern Tenant-specific credit | set limit, calculate reserved exposure, hard-block insufficient availability |
| Credit and receivables | Recognize financial obligation | post financial basis, create receivable, set due date, manage partial payment |
| Payments and documents | Record and confirm Payment | initiate online payment, record external report, confirm/reverse, refund/reconcile |
| Payments and documents | Issue business documents | number, render, store, publish, revise/correct without overwriting history |
| Traceability and notification | Notify business significance | choose in-app/email channel, deliver, retry, suppress low-value noise |
| Traceability and notification | Expose business timeline | project buyer-visible flow, operational trace, audit/security record distinction |

## Capability design observations

- Sales Commitment is an ability to create commercial obligation; it is not the same as physical stock, lot allocation or delivery.
- Inventory Availability protects physical truth and sellability; it does not own Customer price or Sales Order meaning.
- Credit and Receivables share exposure language but have different lifecycle authority: reserved exposure is not a formal receivable.
- Payment and Stripe must remain separate vocabulary. Documents are business evidence, not a synonym for receivables or fiscal integration.
- Notifications and analytics are likely supporting projection capabilities; their ownership must follow meaningful business events rather than current listener classes.

## Discovery limits

Capability names do not imply subdomains or Bounded Contexts. Process discovery must test boundaries, actors, information authority, invariants and change coupling.
