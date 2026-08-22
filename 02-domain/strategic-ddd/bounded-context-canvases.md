---
status: draft
maturity: DISCOVERY
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Proposed Bounded Context Canvases

Each canvas is a boundary hypothesis. Aggregate candidates are deliberately small and must be tested in Process EventStorming; they are not a JPA design.

## Tenant & Access Governance

| Field | Proposal |
|---|---|
| Responsibility | Tenant lifecycle, Workspace relationship, Human Identity access relationship, Workforce Membership, roles/capabilities, session-facing access context |
| Owned capabilities | establish Tenant, govern workforce access, authorize current Tenant relationship |
| Subdomain | Supporting |
| Language | Tenant, Workspace, Human Identity, Workforce Membership, Capability, Company Owner, Tenant Administrator |
| Authority / information | Tenant status, membership lifecycle, capability assignment, access-context eligibility |
| Aggregate candidates | Tenant, Workforce Membership, capability policy; Human Identity may remain identity-provider-owned |
| Invariants | Tenant isolation boundary; exactly one Company Owner; status blocks operations; active membership and surface capability required |
| Commands / events | activate Tenant, invite member, suspend membership; TenantActivated, MembershipSuspended, AccessRevoked |
| Read models | active membership/capability view, Tenant selector, administration view |
| Dependencies | Customer/Buyer relationships for approved relationship; all business contexts for authorization |
| Integrations | identity/session adapter, email invitations; no support impersonation V1 |
| Hotspots | Workspace multiplicity, identity privacy, role template versus capability policy |

## Customer & Buyer Relationships

| Field | Proposal |
|---|---|
| Responsibility | Tenant-scoped Customer Account and relationship between Buyer and supplier Tenant; contacts, addresses, account link/claim |
| Owned capabilities | manage account, approve relationship, grant/revoke Portal Access |
| Subdomain | Supporting / possible core |
| Language | Customer Account, Buyer, Buyer Relationship, Contact, Delivery Address, Portal Access |
| Authority / information | account identity within Tenant, relationship status, primary Sales Representative, allowed Buyer account scope |
| Aggregate candidates | Customer Account, Buyer Relationship; Contact/Address may be entities inside Account or separate lifecycle records |
| Invariants | Customer Account may exist without identity/portal; Buyer relationship requires Tenant approval; no public supplier marketplace; one Buyer may relate to multiple Tenants |
| Commands / events | create account, request relationship, approve, suspend, link account; BuyerRelationshipApproved, AccountLinked |
| Read models | Buyer account view, relationship selector, account/contact/address view |
| Dependencies | Tenant & Access for authorized actor; Catalog/Sales Commitment for order eligibility |
| Integrations | email invitation, Portal API projections |
| Hotspots | global Buyer profile ownership, account claim conflict, address approval policy |

## Catalog & Commercial Policy

| Field | Proposal |
|---|---|
| Responsibility | Sellable Product/SKU definition and deterministic commercial inputs |
| Owned capabilities | define offer, manage Price List, terms, promotions and media references |
| Subdomain | Supporting |
| Language | Product, SKU, Price List, Commercial Terms, Promotion, Currency, Temperature Requirement |
| Authority / information | sellable presentation, price validity, promotion eligibility and catalog visibility |
| Aggregate candidates | Product/SKU, Price List, Promotion; do not force a single giant Catalog aggregate |
| Invariants | one fixed sellable presentation/UOM per SKU V1; no UOM engine; non-overlapping pricing scope; promotions do not stack; no arbitrary Sales price |
| Commands / events | publish SKU, schedule Price List, resolve price; SKUPublished, PricePolicyChanged |
| Read models | Buyer catalog, pricing preview, Customer-specific price view |
| Dependencies | Customer relationships for account terms; Inventory for availability read only |
| Integrations | Object Storage for media through authorization boundary |
| Hotspots | Product versus SKU/Variant, Customer-specific assortment deferred, pricing snapshot timing |

## Sales Commitment

| Field | Proposal |
|---|---|
| Responsibility | Convert buyer/sales intent into controlled commercial commitment and immutable Sales Order history |
| Owned capabilities | cart intent, Purchase Request lifecycle, negotiation evidence, commitment and order confirmation |
| Subdomain | Core candidate |
| Language | Cart, Purchase Request, Commercial Commitment, Sales Order, substitution, material change |
| Authority / information | commercial obligation, order snapshots, commitment quantity and status |
| Aggregate candidates | Purchase Request, Sales Order, Commitment; keep Cart outside commitment aggregate |
| Invariants | cart no reserve; direct order atomic; submitted request controlled; no silent substitution; confirmed Sales Order immutable; no backorder |
| Commands / events | submit request, review, change, confirm, withdraw, reject, expire; CommitmentEstablished, SalesOrderConfirmed |
| Read models | request queue, order detail, buyer order timeline |
| Dependencies | Customer/Buyer, Catalog/Commercial Policy, Inventory availability, Credit |
| Integrations | Payment adapter for prepaid flow; outbox for secondary facts |
| Hotspots | commitment expiry policy, material agreement evidence, order cancellation semantics |

## Inventory Availability

| Field | Proposal |
|---|---|
| Responsibility | Physical stock truth, lot traceability, sellability and receiving/temperature disposition |
| Owned capabilities | receive, qualify, adjust, transfer, expose availability |
| Subdomain | Core candidate |
| Language | Batch, Inventory Lot, Physical Stock, Sellable Availability, Safety Stock, Hold, Quarantine, Excursion |
| Authority / information | quantity/status in Warehouse, sellability and shortage incident |
| Aggregate candidates | Warehouse, Inventory Lot, Receiving, Stock Adjustment; do not make all stock one aggregate |
| Invariants | one lot one Warehouse; expired/quarantined/held not sellable; physical truth wins; FEFO override needs capability/reason; rejected quantity retained as evidence |
| Commands / events | receive, adjust, transfer, evaluate excursion, release; LotAccepted, StockAdjusted, AvailabilityChanged |
| Read models | availability by SKU/Warehouse, lot queue, shortage incident |
| Dependencies | Catalog SKU identity; Sales Commitment demand; Fulfillment allocation |
| Integrations | Object Storage/ClamAV for evidence; no IoT V1 |
| Hotspots | commitment/physical-allocation handoff, negative adjustment, disposition authority |

## Fulfillment & Delivery

| Field | Proposal |
|---|---|
| Responsibility | Turn commercial commitments into physical allocations and traceable deliveries |
| Owned capabilities | allocation, pick/pack, dispatch, route grouping, delivery, POD, cold-chain execution |
| Subdomain | Core candidate |
| Language | Fulfillment, Allocation, Dispatch, Delivery, Route, POD, Continuation Delivery |
| Authority / information | selected lots, fulfillment readiness, delivery outcome and evidence |
| Aggregate candidates | Fulfillment, Dispatch, Delivery, POD; keep Route as planning entity, not TMS optimizer |
| Invariants | one line not split across Warehouses V1; partial delivery creates continuation; returned goods HOLD; dispatch/delivery/route distinct |
| Commands / events | allocate, mark ready, schedule, attempt, complete partial, record POD; DeliveryCompleted, PODRecorded |
| Read models | fulfillment readiness, dispatch board, buyer tracking |
| Dependencies | Inventory allocation and cold-chain; Sales Order obligation; Customer address |
| Integrations | Maps provider, Object Storage, notifications |
| Hotspots | delivery actor, route ownership, temperature disposition authority, document triggers |

## Credit & Receivables

| Field | Proposal |
|---|---|
| Responsibility | Tenant-specific credit risk and formal commercial debt recognition |
| Owned capabilities | credit limit, Credit Reserved, financial posting, Outstanding Receivables lifecycle |
| Subdomain | Supporting |
| Language | Credit Limit, Credit Reserved, Outstanding Receivable, Available Credit, Financial Posting, Receivable |
| Authority / information | Available Credit and formal Outstanding Receivables |
| Aggregate candidates | Credit Account, Receivable, Financial Posting |
| Invariants | Available = limit - reserved - outstanding; no double count on transform; hard block; partial payments; one Payment one Receivable V1 |
| Commands / events | reserve, release, post, apply payment; CreditReserved, ReceivableCreated |
| Read models | live credit summary, receivable list, credit ledger |
| Dependencies | Customer Account, Sales Commitment, Payments, Documents |
| Integrations | payment provider is not authority for receivable creation; document evidence |
| Hotspots | financial posting trigger, due-date basis, cancellation and partial fulfilment |

## Payments

| Field | Proposal |
|---|---|
| Responsibility | Business Payment state and provider translation, including reconciliation |
| Owned capabilities | initiate, report, confirm, reverse, refund, reconcile |
| Subdomain | Supporting |
| Language | Payment, Payment Report, Payment Confirmation, Provider Reference, Reconciliation |
| Authority / information | Payment lifecycle and immutable corrective history |
| Aggregate candidates | Payment, Payment Attempt, Reconciliation Case |
| Invariants | duplicate callback no double apply; capture failure path preserved; no silent correction; provider details isolated |
| Commands / events | initiate Stripe payment, record report, confirm, refund; PaymentConfirmed, RefundRequired |
| Read models | payment status, reconciliation queue, Buyer payment view |
| Dependencies | Receivable/Sales Commitment; Notifications/Documents |
| Integrations | Stripe adapter; provider event inbox/outbox |
| Hotspots | captured payment/order failure, external duplicate reference, provider production decision |

## Business Documents

| Field | Proposal |
|---|---|
| Responsibility | Issued business document identity, numbering, rendering, storage metadata and correction history |
| Owned capabilities | number, render, store, publish, revise |
| Subdomain | Supporting |
| Language | Sales Order Document, Delivery Note, POD, Basic/Commercial Invoice, Payment Receipt, Revision |
| Authority / information | issued document version and evidence metadata |
| Aggregate candidates | Document, Document Number Sequence, Evidence Object |
| Invariants | Tenant + document type sequence uniqueness; issued document not overwritten; unsafe file fails closed |
| Commands / events | issue, render, attach, correct; BusinessDocumentIssued |
| Read models | document list and secure download |
| Dependencies | Sales Order, Delivery/POD, Payment, Object Storage |
| Integrations | Object Storage, ClamAV, email |
| Hotspots | fiscal semantics deferred, retention/export, document versus receivable |

## Notification & Business Traceability

| Field | Proposal |
|---|---|
| Responsibility | Translate significant source facts into in-app/email notifications, reduced Buyer timeline and operational projections |
| Owned capabilities | choose significance, project, deliver, retry, query |
| Subdomain | Supporting |
| Language | Business Notification, Buyer Timeline, Operational Projection, Security Audit |
| Authority / information | projection state and channel policy; source context retains business truth |
| Aggregate candidates | Notification, Preference; Timeline is projection/read model |
| Invariants | at-most-one business effect per message; audit details hidden from Buyer; notification failure does not roll back source business fact |
| Commands / events | publish significant fact, deliver, mark read; NotificationDelivered, TimelineProjected |
| Read models | inbox, timeline, dashboard/change feed |
| Dependencies | all source contexts; security audit boundary |
| Integrations | email, SSE/change-feed delivery, observability |
| Hotspots | KPI authority, retention, projection lag, channel policy |
