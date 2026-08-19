---
status: draft
maturity: DISCOVERY
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# EventStorming synthesis

This textual synthesis is self-contained enough to review without the Miro board. It records candidate events and hotspots; it does not pretend to close scenario-specific policy where the Product baseline deliberately leaves discovery open.

## Big Picture EventStorming

| Macro stage | Candidate business events | Principal actors / authority |
|---|---|---|
| Establish relationship | Demo request received; Tenant approved; Tenant provisioned; Tenant activated; workforce invited; Buyer Relationship approved | Prospective Customer, Company Owner, Tenant Administrator, Buyer; Tenant controls business admission |
| Prepare offer | Product published; SKU made sellable; Price List scheduled; Customer Terms applied; catalog visibility granted | Catalog/commercial policy authority; Tenant configuration |
| Form intent | Cart prepared; direct order requested; Purchase Request submitted; manual order drafted | Buyer, Sales; cart has no commitment |
| Commit demand | availability validated; credit checked; commitment established; Purchase Request rejected/withdrawn/expired; Sales Order confirmed | Sales Commitment authority; atomic invariant owner to be confirmed |
| Make stock sellable | receiving recorded; lot accepted; temperature excursion held; inventory released; availability recalculated | Warehouse / qualified disposition authority |
| Fulfill | Fulfillment planned; lot allocated; pick completed; fulfillment ready | Warehouse / Fulfillment authority |
| Deliver | Dispatch planned; Delivery scheduled; attempt recorded; partial Delivery completed; continuation created; POD recorded | Dispatch Coordinator, Delivery actor; actual outcome authority |
| Recognize money | financial posting recorded; receivable created; payment reported; payment confirmed; payment reversed; refund reconciled | Credit/Receivables and Payment authority |
| Evidence and visibility | business document issued; notification delivered; timeline projection updated; audit event recorded | Document, Notification and Security/Traceability authorities |

## P1 — Commercial Intent to Sales Commitment

| Element | Candidate result |
|---|---|
| Actors | Buyer, Sales, Company Owner / Business Operations Manager for exceptional authority |
| Commands/actions | build cart, price preview, submit direct order, create/update/submit Purchase Request, review, negotiate, accept substitution, reject, withdraw, confirm Sales Order |
| Domain events | CartPrepared, PurchaseRequestSubmitted, CommercialContentChanged, BuyerAcceptanceRecorded, PurchaseRequestRejected, PurchaseRequestWithdrawn, PurchaseRequestExpired, CommitmentEstablished, SalesOrderConfirmed |
| Policies/invariants | cart never reserves; authoritative price resolution; no silent substitution; no automatic backorder; direct order validates availability and creates commitment atomically; confirmed Sales Order preserves immutable commercial truth |
| Read models | catalog/pricing preview, request work queue, current availability, credit summary, order detail/timeline |
| External systems | Payment Provider only when prepaid online flow is selected; email/in-app notifications |
| Exceptions/compensation | stale version, last-unit conflict, insufficient credit, expired request, payment capture with failed order creation; reconcile/refund without erasing payment history |
| Authority | Proposed Sales Commitment context; Customer Relationship supplies account relationship; Catalog/Commercial Policy supplies price; Inventory supplies availability; Credit supplies hard-block decision |
| Consistency | Same transaction for final commitment decision, availability/credit checks and Sales Order creation where owned; asynchronous notifications after commit |
| Hotspots | material-change consent, exact expiry policy, commitment storage versus reservation terminology, payment/order boundary |

## P2 — Receiving to Sellable Availability to Commitment to Fulfillment

| Element | Candidate result |
|---|---|
| Actors | Warehouse Operator, qualified disposition actor, Sales, Fulfillment actor |
| Commands/actions | receive, record lot/batch, capture temperature, hold/release/waste/return, adjust, transfer, compute sellability, establish commitment, allocate lot, pick |
| Domain events | ReceivingRecorded, LotAccepted, TemperatureExcursionDetected, LotHeld, LotReleased, LotDisposed, StockAdjusted, TransferReceived, AvailabilityChanged, CommitmentEstablished, LotAllocated, PickCompleted |
| Policies/invariants | physical truth wins; expired/quarantined/held stock is not sellable; FEFO recommendation may be overridden only with capability and reason; one line may consume multiple lots but not multiple warehouses V1; no backorder |
| Read models | sellable availability by SKU/warehouse, lot status, commitment shortage, fulfillment readiness |
| External systems | Object Storage/ClamAV for evidence; maps not required for receiving |
| Exceptions/compensation | rejected receiving remains evidence; negative adjustment creates shortage incident and downstream resolution; transfer/allocations race requires retry or conflict |
| Authority | Proposed Inventory Availability owns physical stock/sellability; Sales Commitment owns demand commitment; Fulfillment owns physical allocation; final split requires review |
| Consistency | DB constraints/locks per SKU-warehouse availability and commitment; event projection for read models; no global lock pattern |
| Hotspots | reservation versus commitment naming, source batch versus lot, disposition authority, shortage recovery |

## P3 — Ready for Dispatch to Delivery / POD / Exception

| Element | Candidate result |
|---|---|
| Actors | Warehouse Operator, Dispatch Coordinator, Delivery actor, Buyer, qualified cold-chain actor |
| Commands/actions | mark ready, revert ready exceptionally, create Dispatch, group Deliveries, schedule window, record attempt, complete partial delivery, create continuation, record POD, record temperature/incident |
| Domain events | FulfillmentReady, DispatchPlanned, DeliveryScheduled, DeliveryAttempted, DeliveryPartiallyCompleted, ContinuationDeliveryCreated, DeliveryCompleted, DeliveryFailed, PODRecorded, TemperatureExcursionRecorded |
| Policies/invariants | Dispatch != Delivery != Route; failed attempt belongs to same Delivery; partial outcome closes performed Delivery and creates continuation; returned goods go to HOLD; buyer sees useful compliance status, not raw internal telemetry |
| Read models | dispatch board, delivery tracking, buyer timeline, POD/document availability, exception queue |
| External systems | Maps/geolocation Provider through adapter; Email/in-app notifications; Object Storage for evidence |
| Exceptions/compensation | failed delivery retry, partial continuation, returned goods inspection, temperature excursion disposition, controlled readiness reversal |
| Authority | Proposed Fulfillment & Delivery context; Inventory remains authority for returned stock; Buyer receives reduced projection |
| Consistency | Delivery outcome and POD evidence atomic within Delivery boundary; notification/document generation asynchronous with durable publication |
| Hotspots | route scope, partial continuation wording, cold-chain disposition rights, document issuance trigger |

## P4 — Tenant Activation to Workforce / Customer Account / Buyer Relationship

| Element | Candidate result |
|---|---|
| Actors | Prospective Customer Representative, system operator, Company Owner, Tenant Administrator, Business Operations Manager, Sales, Buyer |
| Commands/actions | submit demo/registration, approve, provision, activate, invite member, accept invitation, assign capability, create account, invite/link Buyer, approve/suspend relationship |
| Domain events | RegistrationSubmitted, TenantProvisioned, TenantActivated, WorkforceInvited, MembershipActivated, MembershipSuspended, CustomerAccountCreated, BuyerRelationshipRequested, BuyerRelationshipApproved, PortalAccessRevoked |
| Policies/invariants | public form does not create Tenant automatically; one global Human Identity; Workforce Membership and Buyer Relationship are independent; Tenant approval required; suspension stops new business operations while allowed history/control access remains |
| Read models | activation queue, workforce roster, capability view, Customer Account, Buyer Relationship and current Tenant selector |
| External systems | Email Delivery for invitations; identity token/session mechanism; no V1 Nexa support impersonation |
| Exceptions/compensation | duplicate activation, slug conflict, final Company Owner/admin constraint, invitation expiry, relationship revocation, account link conflict |
| Authority | Proposed Tenant & Access and Customer / Buyer Relationships; exact split requires review |
| Consistency | membership/status changes and authorization version must be atomic; invitation/email delivery durable but not part of activation transaction |
| Hotspots | Organization/Company/Tenant language, global Buyer privacy, Tenant versus Workspace selector, role templates versus capabilities |

## P5 — Credit to Financial Posting to Receivable to Payment / Documents

| Element | Candidate result |
|---|---|
| Actors | Company Owner, Business Operations Manager, Sales, Buyer, payment provider, authorized payment confirmer |
| Commands/actions | set limit, reserve credit, release reserved exposure, record financial posting, create receivable, apply payment, initiate online payment, report external payment, confirm/reverse/refund, issue document |
| Domain events | CreditLimitChanged, CreditReserved, CreditReleased, FinancialPostingRecorded, ReceivableCreated, PaymentReported, PaymentConfirmed, PaymentReversed, RefundRequired, RefundCompleted, BusinessDocumentIssued |
| Policies/invariants | Available Credit = Limit - Reserved - Outstanding; no double-counting when reserved becomes receivable; Payment Reported != Confirmed; one Payment allocates one Receivable V1; payment failure enters reconciliation/refund path |
| Read models | live credit summary, receivables, payment status, document list, reconciliation queue |
| External systems | Stripe/payment provider, email, object storage, malware scanner |
| Exceptions/compensation | duplicate provider callback, captured money + failed Sales Order, refund failure, overpayment, incorrect confirmation correction history |
| Authority | Proposed Credit & Receivables, Payments, Business Documents contexts; exact financial posting trigger requires Process EventStorming |
| Consistency | lock Credit/Receivable/Payment rows per invariant; provider callbacks deduplicated by provider event identity; document number uniqueness per Tenant/type |
| Hotspots | Invoice versus basic/commercial document, fiscal deferral, payment allocation, payment/order transaction boundary |

## P6 — Notifications / Business Traceability / Operational Visibility

| Element | Candidate result |
|---|---|
| Actors | Buyer, workforce actor, system worker, security auditor |
| Commands/actions | publish significant fact, project timeline, send in-app/email, mark read, retry delivery, record security audit, query operational projection |
| Domain events | BuyerRelationshipResultNotified, OrderStatusNotified, DeliveryStatusNotified, PaymentStatusNotified, DocumentAvailableNotified, TimelineProjected, SecurityAuditRecorded |
| Policies/invariants | business significance controls notification; buyer sees own business flow; internal lot noise and security audit details stay hidden; duplicate delivery must not duplicate business effect |
| Read models | notification inbox, buyer timeline, Platform dashboards, audit viewer, change feed |
| External systems | Email Delivery, observability backend; SSE is technical delivery, not business authority |
| Exceptions/compensation | retry, deduplicate, dead-letter/manual recovery, expired preference, revoked session, projection lag |
| Authority | Proposed Notification & Traceability supporting context; source contexts own facts |
| Consistency | source fact commits before durable outbox; projections eventually consistent; security audit may require stronger retention/integrity than buyer timeline |
| Hotspots | notification ownership, analytics KPI authority, retention, cross-surface read consistency |

## EventStorming closure

The package identifies business events and hotspots required for boundary review. It intentionally leaves exact event names, aggregate shapes, process variants, expiry values, financial posting triggers and ownership splits as review work.
