---
status: accepted
maturity: FROZEN
scope: cross-cutting
owner: governance
last-reviewed: 2026-08-29
---

# Current accepted decisions

This document is the accepted Product, business and PRE-V1 architecture input. It outranks implementation evidence. AS-IS evidence records what exists; it never silently changes TARGET.

## Product and business closure

- Nexa V1 is a fast, role-focused B2B multi-tenant SaaS platform for importers, distributors and wholesalers, particularly cold-chain businesses.
- Product and Business V1 is **FROZEN / CLOSED**. This closure does not claim V1 implementation complete.
- Fresh Nexa, Generic Tenant and ICISA Reference Tenant use the same product and release line. ICISA is explanatory evidence, never a required seed.
- Tenant is the maximum business/data isolation boundary. V1 uses `Tenant 1:1 Workspace`; Workspace is the Tenant's operational environment, not a C4 Container.
- Public Website handles acquisition and onboarding initiation only. Internal Web Platform serves workforce operations. Buyer Portal serves an authorized Buyer relationship for the current supplier Tenant.
- Mobile product direction is OWNER-ACCEPTED for a two-app projection, while the Mobile client, research validation and production acceptance remain open; IoT automation, SUNAT fiscal integration, multi-currency, full returns/RMA, Control Center, Support, Plans, Subscriptions, Entitlements and Feature tiers are deferred or runway items, not implemented V1 claims.

The UPC course projection is isolated under `90-academic/mobile/course-1acc0238/`.
Its requirements, milestones, technology constraints, evidence obligations and
rubric statuses are academic planning evidence; they do not alter Product,
Domain, C4 or production authority. The owner delivery goal is an Android-native
Mobile foundation and representative core flow within approximately four weeks;
this is a delivery target, not an implementation claim. Native Android/Kotlin
and cross-platform Flutter/Dart or Kotlin Multiplatform remain evaluated
options, not a silently selected Mobile architecture.

## Identity, relationship and governance language

- Human Identity, Workforce Membership, Buyer Relationship and Customer Account are distinct concepts.
- One human has one Nexa identity. A human may have independent workforce and Buyer relationships with multiple Tenants; data remains tenant-scoped.
- A Customer Account may exist without Portal identity. V1 allows one principal active Buyer Identity per Customer Account; multi-user Buyer organizations are future scope.
- Buyer Relationship states are `PENDING / INVITED`, `ACTIVE`, `SUSPENDED` and `REVOKED`.
- V1 has one Company Owner, zero or more Business Operations Managers and one Internal Web Platform. Tenant Administrator governs technical access; Company Owner governs company identity, sensitive organization data and workforce roles; Business Operations Manager governs cross-functional operations.

## Mobile rebaseline

Operations Mobile and Buyer Mobile are the two accepted-for-planning product
projections over the shared domain. They do not add a Bounded Context, C4
Container, deployment unit, framework or alternate authority. The canonical
story inventory retains 49 IDs: 28 V1 candidates and 21 V2/deferred candidates;
all remain `PROPOSED / RESEARCH VALIDATION PENDING`.

API v0.17.0 is backend candidate evidence for SKU/GTIN/lot resolution,
FEFO/picking validation, bounded handoff tokens, immutable Buyer
receipt/discrepancy facts and provider-neutral push subscription reliability.
It does not prove a Mobile client, generic offline synchronization, continuous
tracking, advanced transfer/receiving, GS1, provider credentials or Product
Acceptance. Offline queues may preserve safe drafts/evidence only; payment,
credit, PR/SO, authorization, inventory and Delivery-finalization success stay
server-authoritative.

## Accepted Strategic DDD

The V1 TARGET has **11 frozen Bounded Contexts**. Existing Java packages, Spring Modulith modules, PostgreSQL schemas, endpoints and frontend folders are AS-IS implementation evidence only.

| ID | Bounded Context | Classification | Conceptual authority |
|---|---|---|---|
| BC-01 | Tenant & Access Governance | Supporting | Tenant lifecycle, Workspace relationship, identity access, workforce membership, roles, capabilities and access eligibility |
| BC-02 | Customer & Buyer Relationships | Supporting | Customer Account, Buyer Relationship, contacts, addresses, lifecycle and supplier/customer relationship |
| BC-03 | Catalog & Commercial Policy | Supporting | Product, SKU, visibility, Base Price, Price Lists, Customer Terms, Promotions and SKU cold-chain requirement |
| BC-04 | Sales Commitment | Core | Purchase Request, Commercial Commitment, Sales Order, commercial snapshots and cancellation/replacement semantics |
| BC-05 | Inventory Availability | Core | Physical stock, lots, sellable availability, safety stock, Inventory Reservation/Warehouse Backing, holds, movements, transfers, Physical Allocation authority and FEFO |
| BC-06 | Fulfillment & Delivery | Core | Fulfillment, allocation execution, picking, packing, staging, dispatch, delivery, attempts, continuation, POD and operational cold-chain evidence |
| BC-07 | Credit & Receivables | Supporting | Credit Account, limit, reservation, available credit, receivable, balance and financial adjustments affecting obligation/exposure |
| BC-08 | Payments | Generic | Payment, report, provider lifecycle, Stripe translation, confirmation/failure, refund and correction |
| BC-09 | Business Documents | Generic | Sales Order Document, Delivery Note, Commercial Invoice, Payment Receipt, Financial Adjustment, numbering and immutable issued history |
| BC-10 | Notifications | Generic | Notification intent, template, recipient, channel, preference, attempt, retry and delivery state |
| BC-11 | Business Traceability | Supporting | Durable consultable representation of business facts, actors, reasons, evidence, correlation and timeline |

The former proposal combining Notification and Business Traceability is **SUPERSEDED**. The 10-to-11 decision is recorded in the Strategic DDD decision register and ADR set; history is preserved.

BC-07 owns the Financial Adjustment effect on obligation and exposure. BC-09 owns any issued Financial Adjustment document snapshot, numbering and immutable document history; document rendering does not mutate the financial authority.

## Commercial and operational semantics

- Cart and Request Draft create no commitment.
- Approval-required flow: `SUBMIT -> Purchase Request SUBMITTED + Commercial Inventory Commitment + Credit Reservation when applicable -> review -> optional CHANGES_PROPOSED -> Buyer acceptance of material changes -> Sales Order CONFIRMED`.
- Direct order validates authoritatively and confirms Sales Order with Commercial Inventory Commitment and required Credit Reservation in one logical atomic commercial decision.
- PR submission is all-or-nothing. A submitted PR has full required commitment, starts expiry and is visible to Sales.
- Purchase Request states are `SUBMITTED`, `CHANGES_PROPOSED`, `CONVERTED`, `REJECTED`, `WITHDRAWN` and `EXPIRED`. No persisted `UNDER_REVIEW` state is introduced for a UI label.
- Default PR expiry is 72 hours. Tenant policy may be 1–7 integer days. Store absolute UTC `expiresAt: Instant`; `now >= expiresAt` rejects conversion even before a worker materializes `EXPIRED`. Expiry atomically releases Commercial Inventory Commitment, Inventory Reservation backing and applicable Credit Reservation, with durable outbox evidence.
- Commercial Inventory Commitment is persistent, stable by `CommitmentId`, owns SKU + quantity demand and selects no Warehouse/Lot. Inventory Availability protects that demand through deterministic Warehouse backing, which may span multiple eligible Warehouses. Ownership transfers PR to SO without release/re-reserve gap. Physical Allocation selects Inventory Lot(s) later.
- Accepted material PR changes affecting SKU, quantity, authoritative price, inventory requirement or credit requirement require Buyer acceptance, authoritative revalidation and one atomic replacement/adjustment of affected Commercial Commitment, Inventory Reservation backing and applicable Credit Reservation. Failed requirements preserve prior authoritative state; no partial new state or leaked reservation.
- Sales Order is born `CONFIRMED`. Commercial roll-up states are `CONFIRMED`, `IN_FULFILLMENT`, `PARTIALLY_FULFILLED`, `FULFILLED`, `PARTIALLY_DELIVERED`, `COMPLETED` and `CANCELLED`. Completion means no unresolved quantity, not financial settlement.
- Price resolution is Base Price, applicable Price List, permitted Customer Terms, then at most one Promotion transformation. Submitted PR pricing is historical evidence; new attempts resolve current authoritative pricing.
- Sellable Availability is usable on-hand minus active Commercial Commitments minus Safety Stock at business scope. Inventory Reservation backing distributes that protected demand across SKU + Warehouse authorities without double counting commitment and backing. HOLD, QUARANTINE, DAMAGED/WASTE, EXPIRED and IN_TRANSIT stock is not sellable.
- Inventory Availability chooses Warehouse backing deterministically from eligible authoritative Sellable Availability. Prefer no split when one Warehouse satisfies demand; otherwise V1 may split across eligible Warehouses. Commercial Commitment remains Warehouse-neutral and backing is not Physical Allocation.
- FEFO is default for expiry-tracked SKU. Override needs reason and never selects expired or quarantined stock. Warehouse Transfer states are `REQUESTED`, `IN_TRANSIT`, `RECEIVED`; in-transit stock is not sellable in both locations.
- Fulfillment supports `PLANNED`, `ALLOCATED`, `PICKING`, `PICKED`, `PACKED`, `STAGED`, `READY_FOR_DISPATCH`, `HANDED_OVER`, `COMPLETED`, plus explicit shortage, hold and cancellation exceptions. Multiple Fulfillments per Sales Order are valid.
- Delivery attempts belong to one Delivery. Failed attempts do not create a new Delivery. Operations decides exhaustion; no universal numeric attempt limit is accepted. Partial delivery closes the current Delivery and creates an idempotent Continuation Delivery for the remaining obligation.
- POD is immutable evidence. Amendments/addenda never overwrite the original. Photo/signature is policy-driven, not universally mandatory.
- Cold-chain is optional per Tenant/SKU. V1 captures temperature manually. Excursion places affected quantity on HOLD pending `ColdChainDisposition`; `REJECT` is an outcome, while `RETURN_TO_SUPPLIER` is a possible physical action after that outcome. It does not automatically mean destruction. IoT automation is deferred.

## Finance, documents, notifications and traceability

- Available Credit = Credit Limit - Active Credit Reservations - Outstanding Receivable Balances.
- Credit purchase reserves credit at PR submission, or during the same logical SO confirmation for direct order. Commercial Commitment, complete Inventory Reservation backing and applicable Credit Reservation are all-or-nothing.
- For credit/net terms, Receivable posts at Sales Order confirmation. Delivery completion or invoice issuance is not a universal receivable trigger.
- PREPAID requires Payment Confirmed before Sales Order confirmation and physical fulfillment. IMMEDIATE may confirm SO before payment; payment is immediately due. Exact prepaid timeout is OPEN-NON-BLOCKER policy.
- Historical financial facts are never rewritten: original obligation + explicit Financial Adjustments - valid Payments/Refund effects = current net obligation. A correction does not erase Payment history.
- V1 Business Documents are Sales Order Document, Delivery Note, Commercial Invoice, Payment Receipt and Financial Adjustment. Commercial Invoice is a Nexa document, not a SUNAT fiscal document. Issued documents are immutable; corrections create linked revisions/replacements.
- V1 notification channels are in-app and email. Notification failure retries and never changes source business state. WhatsApp is external/manual.
- Business Traceability is append-only and separate from Notifications and Security Audit. Significant transitions, pricing/terms, inventory disposition, fulfillment/delivery/POD, credit, receivables, payments and document facts retain actor, timestamp, reason, correlation and evidence references. Secrets and unnecessary sensitive payment data are excluded.

## Transaction, concurrency, event and tenant semantics

- Strong consistency is required for last-unit and multi-Warehouse commitment protection, credit reservation, PR terminal transitions, PR-to-SO conversion, ownership transfer, accepted material-change replacement, cancellation/release, physical inventory mutation, Payment-to-Receivable application and tenant authorization/isolation decisions.
- Use optimistic version/CAS for mutable objects; conditional updates or row locks for scarce resources; deterministic lock ordering; explicit stale-state outcomes; never silent last-write-wins.
- Idempotency survives restart for PR submit, material-change acceptance, conversion, direct order, cancellation, inventory adjustment, transfers, fulfillment/POD finalization, payment initiation/reporting/webhooks/application, refund/correction and document issuance.
- Separate internal Domain Events, Published Integration Events and Traceability/Audit facts. Publish only with known consumers. Atomic reservations happen synchronously before commit; events announce committed facts afterward.
- Cross-boundary messages use local state plus durable outbox in one commit. Consumers assume at-least-once delivery and use inbox/deduplication. Exactly-once transport is not claimed.
- PostgreSQL shared infrastructure, server authorization, object authorization and RLS form defense in depth. Workers claim leases, reconstruct explicit SYSTEM Tenant/Workspace context, set transaction-local scope, verify fencing, process, finalize fenced state and clean up. Missing scope fails closed.

## Architecture and production gate

- C4 L1/L2 are baselined. Selective C4 L3 TARGET views are baselined where they explain strategic ownership, synchronous invariant boundaries and asynchronous propagation; they are technical views, not one-container-per-BC claims.
- V1 remains a Spring Boot modular monolith over shared PostgreSQL with Object Storage behind application ports. Strategic BC, Spring Modulith module, Java package, PostgreSQL schema and deployment unit are different concepts.
- Target architecture uses KEEP -> REFINE -> REWORK. REWRITE requires extraordinary evidence. This Blueprint authorizes repository-specific construction planning and implementation under its TARGET; it does not mutate application repositories or authorize production deployment.
- Production/provider decisions remain **OPEN-NON-BLOCKER / PRODUCTION GATE**: cloud, managed PostgreSQL, object storage, email, observability, secret manager, RPO/RTO, retention, SLA/SLO and responder organization. Staging, restore, rollback, migration, outage, rotation, incident, break-glass and failed-worker proof remain required later gates.

## Authority and evidence boundary

Accepted decisions and canonical Blueprint outrank verified implementation evidence. Current repository refs, tests, runtime and browser captures are AS-IS evidence. Legacy is historical evidence. Unverified facts are labeled `UNVERIFIED`; implementation completeness, production readiness and V1 release are not implied by this document.
