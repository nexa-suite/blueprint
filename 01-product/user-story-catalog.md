---
status: accepted
maturity: FROZEN
scope: v1
owner: product
last-reviewed: 2026-08-23
---

# V1 User Story Catalog

This catalog is the actor/value contract for Nexa PRE-V1. Stories are business slices, not buttons, endpoints or technical tasks. `Story Points` intentionally remains `TBD — DELIVERY REFINEMENT` for every story.

## Actor notation

Story actors use V1 personas from [Primary personas](personas/primary-personas.md), accepted capability roles, or explicit system/external actors. `Catalog Manager` maps to an authorized Company Owner or Business Operations Manager with catalog capability; `Sales`, `Warehouse`, `Fulfillment`, `Dispatch`, `Finance` and `Credit & Receivables` operators map to corresponding V1 workforce responsibilities; `expiry worker`, `Payment/Reconciliation operator`, `Sales Commitment / Credit service` and `Payment provider` identify system or external actors, not new personas, Bounded Contexts or Human Identities. `authorized Buyer`, `internal workforce actor` and `Buyer through direct order` are contextual labels for the canonical B2B Buyer or authorized V1 workforce personas.

## Epic index

| Epic | Name | Stories |
|---|---|---|
| EP01 | SaaS Onboarding | US-001 |
| EP02 | Workforce & Governance | US-002, US-003 |
| EP03 | Customer Accounts | US-004 |
| EP04 | Buyer Relationships | US-005, US-006 |
| EP05 | Catalog | US-007, US-008 |
| EP06 | Pricing & Commercial Policy | US-009, US-010 |
| EP07 | Buyer Shopping | US-011, US-012 |
| EP08 | Purchase Requests | US-013, US-014, US-015 |
| EP09 | Sales Orders | US-016, US-017 |
| EP10 | Inventory Availability | US-018, US-019 |
| EP11 | Receiving & Warehouse | US-020, US-021 |
| EP12 | Fulfillment | US-022, US-023 |
| EP13 | Dispatch & Delivery | US-024, US-025, US-026 |
| EP14 | Cold Chain | US-027 |
| EP15 | Credit | US-028, US-029 |
| EP16 | Receivables & Payments | US-030, US-031, US-032 |
| EP17 | Business Documents | US-033 |
| EP18 | Notifications | US-034 |
| EP19 | Business Traceability | US-035 |
| EP20 | Operational Visibility | US-036 |
| EP21 | Website / Commercial Acquisition | US-037 |

## Story contracts

### EP01 — SaaS Onboarding

#### US-001 — Request a Nexa evaluation

- **Actor:** Prospective Customer Representative
- **User Story:** As a prospective customer representative, I want to request contact or a demo, so that Nexa can evaluate and initiate assisted onboarding.
- **Business Value:** Qualified acquisition without anonymous tenant creation.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Public Website does not expose tenant catalog or create an active Tenant automatically.
- **Preconditions:** Public Website is reachable.
- **Acceptance Criteria:**
  - Given valid contact and company information, when the request is submitted, then the request is acknowledged without claiming Tenant activation.
  - Given invalid or incomplete information, when submitted, then validation identifies fields and does not create a Tenant.
- **Dependencies:** Website, public intake boundary, Tenant & Access Governance.
- **Out of Scope:** Anonymous instant signup, plans, subscriptions and production sales workflow.
- **Related Business Events:** ContactRequestReceived, TenantProvisioningRequested.
- **Related Blueprint Decisions:** Product boundaries; BC-01; website capability map.

### EP02 — Workforce & Governance

#### US-002 — Activate a Tenant and Workspace

- **Actor:** Nexa provisioning operator / Company Owner
- **User Story:** As an authorized provisioning actor, I want to activate a Tenant with its V1 Workspace, so that the customer has an isolated operational environment.
- **Business Value:** Safe onboarding and tenant isolation.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Tenant is maximum isolation boundary; V1 Tenant 1:1 Workspace; ICISA is not required.
- **Preconditions:** Assisted approval and provisioning data exist.
- **Acceptance Criteria:**
  - Given approved provisioning data, when activation completes, then one active Tenant and its Workspace are available with scoped authority.
  - Given duplicate activation retry, when the same intention is replayed, then the original result is returned without a second Tenant.
- **Dependencies:** BC-01, persistence, idempotency.
- **Out of Scope:** Multiple Workspaces per Tenant and Control Center.
- **Related Business Events:** TenantActivated, WorkspaceAssociated.
- **Related Blueprint Decisions:** [ADR-0001](../04-architecture/adrs/adr-0001-tenant-workspace-v1.md) Tenant/Workspace; [ADR-0002](../04-architecture/adrs/adr-0002-global-identity-tenant-relationships.md) identity and Tenant relationships.

#### US-003 — Govern workforce access

- **Actor:** Tenant Administrator / Company Owner
- **User Story:** As a governance actor, I want to manage membership, roles and capabilities, so that each workforce member can perform only authorized work.
- **Business Value:** Controlled operations and accountable access.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Exactly one Company Owner; Tenant Administrator governs technical access; authorization is tenant-scoped.
- **Preconditions:** Active Tenant and target Human Identity exist.
- **Acceptance Criteria:**
  - Given a member with a capability, when the member accesses an allowed operation, then server authorization permits it in the selected Tenant context.
  - Given a member without capability or with stale membership, when access is attempted, then the operation is denied and security evidence is retained.
- **Dependencies:** BC-01, RLS, Security Audit.
- **Out of Scope:** Support impersonation without break-glass controls.
- **Related Business Events:** WorkforceMembershipGranted, CapabilityChanged, MembershipSuspended.
- **Related Blueprint Decisions:** [ADR-0001](../04-architecture/adrs/adr-0001-tenant-workspace-v1.md) Tenant scope; [ADR-0017](../04-architecture/adrs/adr-0017-privileged-support-break-glass.md) break-glass boundary.

### EP03 — Customer Accounts

#### US-004 — Maintain a Customer Account

- **Actor:** Sales Representative / Business Operations Manager
- **User Story:** As an internal operator, I want to maintain a Tenant-scoped Customer Account with contacts and addresses, so that commercial work can exist even before Portal identity.
- **Business Value:** Supports phone, WhatsApp and offline-assisted commercial capture without identity fabrication.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Customer Account is not Human Identity or Buyer Relationship; history is tenant-scoped.
- **Preconditions:** Authorized workforce context.
- **Acceptance Criteria:**
  - Given valid account data, when saved, then the account is available only in the owning Tenant.
  - Given an account with no Portal identity, when Sales uses it, then commercial capture remains possible without creating a fake identity.
- **Dependencies:** BC-01, BC-02.
- **Out of Scope:** Public marketplace customer discovery.
- **Related Business Events:** CustomerAccountCreated, CustomerAccountUpdated.
- **Related Blueprint Decisions:** Customer/Buyer/Identity distinctions.

### EP04 — Buyer Relationships

#### US-005 — Approve a Buyer Relationship

- **Actor:** Company Owner / Business Operations Manager
- **User Story:** As a Tenant authority, I want to approve or reject a Buyer Relationship, so that Portal access reflects an authorized commercial relationship.
- **Business Value:** Safe supplier/customer relationship onboarding.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Approval required; states are PENDING/INVITED, ACTIVE, SUSPENDED, REVOKED.
- **Preconditions:** Customer Account or Buyer request exists.
- **Acceptance Criteria:**
  - Given an eligible pending relationship, when approved, then it becomes ACTIVE for that supplier Tenant and a notification candidate is created.
  - Given a rejected relationship, when the Buyer attempts Portal access, then access is denied and the rejection remains traceable.
- **Dependencies:** BC-01, BC-02, Notifications.
- **Out of Scope:** Multi-user Buyer organization.
- **Related Business Events:** BuyerRelationshipApproved, BuyerRelationshipRejected.
- **Related Blueprint Decisions:** BC-02; one principal active Buyer Identity.

#### US-006 — Use an independent Buyer relationship

- **Actor:** B2B Buyer
- **User Story:** As a Buyer, I want to access each approved supplier relationship independently, so that data and credit remain isolated per Tenant.
- **Business Value:** One human can buy from multiple suppliers without cross-tenant leakage.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Human Identity is global; Buyer Relationship and tenant scope are independent.
- **Preconditions:** Active relationship with selected supplier Tenant.
- **Acceptance Criteria:**
  - Given two active supplier relationships, when the Buyer switches context, then only selected Tenant data, prices, orders and credit are shown.
  - Given no active relationship for a Tenant, when access is attempted, then it fails closed.
- **Dependencies:** BC-01, BC-02, RLS.
- **Out of Scope:** Global cross-Tenant balance or catalog.
- **Related Business Events:** BuyerContextSelected, AccessDenied.
- **Related Blueprint Decisions:** Tenant isolation; context propagation.

### EP05 — Catalog

#### US-007 — Publish a sellable Product and SKU

- **Actor:** Catalog Manager
- **User Story:** As a catalog manager, I want to define Product/SKU identity, visibility and cold-chain requirement, so that Buyers see the correct sellable offer.
- **Business Value:** Clear and safe commercial presentation.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Product != SKU; lifecycle != visibility != availability.
- **Preconditions:** Authorized Tenant catalog context.
- **Acceptance Criteria:**
  - Given an active visible SKU with valid Product data, when Buyer catalog loads, then the SKU is shown in the current supplier context.
  - Given an inactive or hidden SKU, when catalog loads, then it is not offered for purchase.
- **Dependencies:** BC-01, BC-03, Portal.
- **Out of Scope:** Advanced product variant engine.
- **Related Business Events:** ProductPublished, SKUVisibilityChanged.
- **Related Blueprint Decisions:** BC-03; Product/SKU language.

#### US-008 — Manage catalog media metadata

- **Actor:** Catalog Manager
- **User Story:** As a catalog manager, I want to associate tenant-owned media with Product/SKU presentations, so that the offer is understandable without exposing unauthorized files.
- **Business Value:** Trustworthy product presentation.
- **Priority:** SHOULD
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Object Storage holds bytes; API owns metadata and authorization.
- **Preconditions:** Active SKU and authorized storage workflow.
- **Acceptance Criteria:**
  - Given authorized media metadata, when the SKU is viewed, then only current Tenant-authorized media is returned.
  - Given failed scanning or unauthorized access, when media is requested, then the file is not served and failure is visible.
- **Dependencies:** BC-03, Object Storage, security scanning.
- **Out of Scope:** CDN/vendor selection and production storage policy.
- **Related Business Events:** ProductMediaAssociated, MediaQuarantined.
- **Related Blueprint Decisions:** [ADR-0005](../04-architecture/adrs/adr-0005-object-storage-for-binary-assets.md) Object Storage; Production Gate.

### EP06 — Pricing & Commercial Policy

#### US-009 — Resolve authoritative price

- **Actor:** B2B Buyer / Sales Representative
- **User Story:** As a commercial actor, I want a deterministic price resolution for the current Customer Account, so that commercial decisions use approved policy.
- **Business Value:** Consistent and auditable pricing.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Base Price -> Price List -> Customer Terms -> one Promotion; no stacking or arbitrary Sales override.
- **Preconditions:** Active SKU, relationship and applicable Tenant policy.
- **Acceptance Criteria:**
  - Given eligible pricing inputs, when price is resolved, then precedence is applied and the resolution can be snapshotted.
  - Given a stale cart price, when submit/checkout occurs, then authoritative revalidation returns current price or a material-change result.
- **Dependencies:** BC-02, BC-03, Sales Commitment.
- **Out of Scope:** Multi-currency and stacked promotions.
- **Related Business Events:** PriceResolved, CommercialPolicyChanged.
- **Related Blueprint Decisions:** Pricing precedence.

#### US-010 — Configure commercial policy

- **Actor:** Company Owner / Catalog Manager
- **User Story:** As an authorized policy actor, I want to configure Price Lists, Customer Terms and Promotions, so that each Tenant can operate its commercial rules.
- **Business Value:** Controlled Tenant-specific commercial flexibility.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** One operational currency per Tenant V1; effective resolution is authoritative at submit.
- **Preconditions:** Authorized Tenant policy context.
- **Acceptance Criteria:**
  - Given a valid policy with effective dates, when a matching Customer Account requests price, then the applicable rule is used.
  - Given conflicting promotions, when resolution occurs, then at most one permitted transformation applies and conflict is deterministic.
- **Dependencies:** BC-01, BC-03.
- **Out of Scope:** Arbitrary workflow-builder pricing.
- **Related Business Events:** PriceListActivated, CustomerTermsChanged, PromotionActivated.
- **Related Blueprint Decisions:** Pricing precedence; tenant policy.

### EP07 — Buyer Shopping

#### US-011 — Build a Cart without reservation

- **Actor:** B2B Buyer
- **User Story:** As a Buyer, I want to prepare a Cart from visible SKUs, so that I can review intent before making an authoritative request.
- **Business Value:** Low-friction purchasing without false stock promises.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Cart creates no commitment or reservation; displayed availability is informative.
- **Preconditions:** Active Buyer Relationship and visible catalog.
- **Acceptance Criteria:**
  - Given visible SKUs, when added to Cart, then the Cart stores intent without reducing sellable availability.
  - Given an unavailable or hidden SKU, when added, then the action is rejected with a clear business message.
- **Dependencies:** BC-02, BC-03, BC-05, Portal.
- **Out of Scope:** Automatic backorder or cart reservation.
- **Related Business Events:** CartDraftCreated, CartItemChanged.
- **Related Blueprint Decisions:** [ADR-0007](../04-architecture/adrs/adr-0007-commercial-commitment-reservation-ownership.md) Cart/commitment/reservation separation.

#### US-012 — Choose direct order or approval request

- **Actor:** B2B Buyer
- **User Story:** As a Buyer, I want to choose the configured commercial path, so that my intent is processed as a direct order or Purchase Request.
- **Business Value:** Supports Tenant-specific commercial operating models.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Direct order and approval-required paths have authoritative validation and complete Inventory Reservation backing; no partial order/backorder.
- **Preconditions:** Cart and active relationship.
- **Acceptance Criteria:**
  - Given direct mode and sufficient current conditions, when checkout is confirmed, then the atomic SO decision is attempted.
  - Given approval-required mode, when submitted, then a PR is created only with full required commitment and applicable credit reservation.
- **Dependencies:** BC-03, BC-04, BC-05, BC-07.
- **Out of Scope:** Draft SO persistence.
- **Related Business Events:** DirectOrderRequested, PurchaseRequestSubmitted.
- **Related Blueprint Decisions:** [ADR-0006](../04-architecture/adrs/adr-0006-atomic-commercial-confirmation-boundary.md) atomic commercial confirmation; [ADR-0007](../04-architecture/adrs/adr-0007-commercial-commitment-reservation-ownership.md) commitment/reservation ownership.

### EP08 — Purchase Requests

#### US-013 — Submit a Purchase Request

- **Actor:** B2B Buyer
- **User Story:** As a Buyer, I want to submit a Purchase Request, so that Sales can review an all-or-nothing commercial commitment.
- **Business Value:** Reliable commercial demand without physical lot selection.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Submit creates Warehouse-neutral Commercial Commitment, complete Inventory Reservation backing and Credit Reservation when applicable in one logical transaction; expiry starts.
- **Preconditions:** Authoritative price, active relationship, valid Cart and sufficient availability/credit.
- **Acceptance Criteria:**
  - Given all required validations pass, when submit is accepted, then PR is SUBMITTED with complete commitment, complete deterministic Warehouse Backing, applicable credit reservation, `expiresAt` and traceability.
  - Given insufficient availability or credit, when submit is attempted, then no partial commitment, Warehouse Backing or reservation remains and rejection is visible.
  - Given a repeated idempotency key after timeout, when retried, then the original outcome is returned without duplicate effects.
- **Dependencies:** BC-02, BC-03, BC-04, BC-05, BC-07, outbox/inbox.
- **Out of Scope:** Lot selection and automatic backorder.
- **Related Business Events:** PurchaseRequestSubmitted, CommercialCommitmentEstablished, CreditReservationEstablished.
- **Related Blueprint Decisions:** [ADR-0006](../04-architecture/adrs/adr-0006-atomic-commercial-confirmation-boundary.md) atomic confirmation; [ADR-0007](../04-architecture/adrs/adr-0007-commercial-commitment-reservation-ownership.md) ownership; [ADR-0014](../04-architecture/adrs/adr-0014-time-driven-purchase-request-expiration.md) expiry; [ADR-0015](../04-architecture/adrs/adr-0015-business-idempotency-and-duplicate-suppression.md) idempotency.

#### US-014 — Review and respond to material change

- **Actor:** Sales Representative / B2B Buyer
- **User Story:** As Sales, I want to propose a material PR change and as Buyer I want to accept or reject it, so that commercial consent is explicit and historical truth is preserved.
- **Business Value:** Controlled negotiation without silent mutation.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** PR can enter CHANGES_PROPOSED; Buyer does not freely mutate submitted content; material agreed change resets validity; accepted material change requires Buyer acceptance, revalidation and atomic replacement/adjustment of affected commitment, complete Warehouse Backing and applicable credit; substitution is never silent.
- **Preconditions:** PR is SUBMITTED and not terminal/expired.
- **Acceptance Criteria:**
  - Given a material change, when Sales proposes it, then a revision and evidence are stored and Buyer sees the change.
  - Given Buyer accepts, when dependencies are revalidated, then the accepted revision atomically replaces/adjusts affected commitment, Warehouse Backing and applicable credit before it can continue; on failure, prior authoritative state remains and no partial new state leaks.
  - Given Buyer rejects the proposed change, when response commits, then no new commitment/backing/credit state is applied and original/terminal policy is explicit and traceable.
  - Given stale revision, when an actor responds, then CONFLICT / STALE_STATE is returned and no silent overwrite occurs.
- **Dependencies:** BC-04, BC-03, BC-05, BC-07.
- **Out of Scope:** Universal reconfirmation ceremony after every non-material change.
- **Related Business Events:** PurchaseRequestChangesProposed, BuyerChangeAccepted, BuyerChangeRejected.
- **Related Blueprint Decisions:** [ADR-0006](../04-architecture/adrs/adr-0006-atomic-commercial-confirmation-boundary.md) atomic replacement boundary; [ADR-0008](../04-architecture/adrs/adr-0008-concurrency-control-by-invariant.md) concurrency; [ADR-0009](../04-architecture/adrs/adr-0009-historical-facts-reversals-corrections.md) historical snapshots.

#### US-015 — Withdraw, reject or expire a PR

- **Actor:** B2B Buyer / Sales / expiry worker
- **User Story:** As an authorized actor, I want terminal PR transitions to release active effects exactly once, so that stale demand cannot consume availability or credit.
- **Business Value:** Correct lifecycle closure and recoverable capacity.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** First valid terminal transition wins; terminal PR never reopens; `now >= expiresAt` blocks conversion; worker is idempotent.
- **Preconditions:** PR is active and within authority.
- **Acceptance Criteria:**
  - Given active PR and valid withdrawal/rejection, when transition commits, then PR becomes terminal and Commercial Inventory Commitment, complete Warehouse Backing and applicable credit effects are released once.
  - Given current time at or after `expiresAt`, when conversion is attempted before worker runs, then conversion fails and the expiry outcome is materialized safely.
  - Given duplicate worker delivery, when expiry runs again, then no duplicate release or event occurs.
- **Dependencies:** BC-04, BC-05, BC-07, worker lease/fencing.
- **Out of Scope:** Scheduler punctuality as a correctness requirement.
- **Related Business Events:** PurchaseRequestWithdrawn, PurchaseRequestRejected, PurchaseRequestExpired.
- **Related Blueprint Decisions:** [ADR-0014](../04-architecture/adrs/adr-0014-time-driven-purchase-request-expiration.md) expiry; [ADR-0006](../04-architecture/adrs/adr-0006-atomic-commercial-confirmation-boundary.md) transaction boundary; [ADR-0015](../04-architecture/adrs/adr-0015-business-idempotency-and-duplicate-suppression.md) idempotency.

### EP09 — Sales Orders

#### US-016 — Confirm a Sales Order

- **Actor:** Sales Representative / Buyer through direct order
- **User Story:** As a commercial actor, I want a Sales Order confirmed only after authoritative validation, so that the confirmed obligation is reliable and immutable.
- **Business Value:** Stable commercial truth for downstream operations.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** SO born CONFIRMED; commitment ownership transfers PR -> SO without release/re-reserve gap; direct order is atomic with complete inventory backing and required credit effects.
- **Preconditions:** Valid direct order or eligible PR; no stale/expired state.
- **Acceptance Criteria:**
  - Given eligible commercial intent, when confirmation commits, then SO is CONFIRMED with frozen price/terms/line snapshots and no release gap.
  - Given expired PR, stale revision, insufficient availability or credit, when confirmation occurs, then SO is not created and rejection/conflict is visible.
- **Dependencies:** BC-03, BC-04, BC-05, BC-07.
- **Out of Scope:** Draft SO and financial settlement claim.
- **Related Business Events:** SalesOrderConfirmed, CommitmentOwnershipTransferred.
- **Related Blueprint Decisions:** [ADR-0006](../04-architecture/adrs/adr-0006-atomic-commercial-confirmation-boundary.md) atomic confirmation; [ADR-0007](../04-architecture/adrs/adr-0007-commercial-commitment-reservation-ownership.md) ownership; [ADR-0009](../04-architecture/adrs/adr-0009-historical-facts-reversals-corrections.md) immutable history.

#### US-017 — Correct or cancel a confirmed SO

- **Actor:** Company Owner / Business Operations Manager
- **User Story:** As an authorized exceptional actor, I want to cancel, replace or correct a confirmed SO explicitly, so that history and downstream effects remain auditable.
- **Business Value:** Safe change handling without silent mutation.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Confirmed SO is immutable; authority is exceptional; releases and financial corrections are explicit.
- **Preconditions:** Confirmed SO and authorized actor/reason.
- **Acceptance Criteria:**
  - Given an authorized correction, when applied, then original SO remains historical and linked replacement/Financial Adjustment records the change.
  - Given unauthorized or stale request, when attempted, then it is denied/conflicted without modifying SO.
- **Dependencies:** BC-04, BC-05, BC-07, BC-09, traceability.
- **Out of Scope:** Silent edit and automatic erasure of payment history.
- **Related Business Events:** SalesOrderCancelled, SalesOrderReplaced, FinancialAdjustmentIssued.
- **Related Blueprint Decisions:** [ADR-0009](../04-architecture/adrs/adr-0009-historical-facts-reversals-corrections.md) historical facts and corrections.

### EP10 — Inventory Availability

#### US-018 — View safe sellable availability

- **Actor:** B2B Buyer / Sales Representative
- **User Story:** As a commercial actor, I want availability by SKU and Warehouse policy, so that I can make a reliable decision without seeing unsafe raw stock.
- **Business Value:** Prevents oversell and misleading availability.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** usable on-hand - active commitments - Safety Stock; Inventory Reservation backing distributes demand deterministically across SKU+Warehouse without double counting; excluded states are not sellable; tenant-wide totals are projections.
- **Preconditions:** Authorized relationship/context.
- **Acceptance Criteria:**
  - Given physical stock with holds, expiry, transit or safety stock, when availability is calculated, then only sellable quantity is presented.
  - Given concurrent commitment of final unit, when one attempt wins, then another receives deterministic conflict/shortage rather than stale success.
- **Dependencies:** BC-05, BC-04, RLS.
- **Out of Scope:** Automatic backorder.
- **Related Business Events:** AvailabilityChanged, AvailabilityConflict.
- **Related Blueprint Decisions:** [ADR-0007](../04-architecture/adrs/adr-0007-commercial-commitment-reservation-ownership.md) availability ownership; [ADR-0008](../04-architecture/adrs/adr-0008-concurrency-control-by-invariant.md) concurrency.

#### US-019 — Allocate physical lots under FEFO

- **Actor:** Warehouse Operator / Fulfillment operator
- **User Story:** As an operations actor, I want valid lots allocated against a commitment, so that physical execution respects expiry and traceability.
- **Business Value:** Safe, traceable stock movement.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Inventory Availability owns deterministic Warehouse Backing and later Physical Allocation authority; one SO line may span eligible Warehouses; FEFO default; override requires reason; expired/quarantined lots cannot be selected.
- **Preconditions:** Confirmed SO/fulfillment and usable lots.
- **Acceptance Criteria:**
  - Given multiple eligible lots, when allocation runs, then FEFO is selected unless authorized reasoned override exists.
  - Given insufficient usable stock, when allocation runs, then shortage is explicit and commitment is not silently deleted or over-allocated.
- **Dependencies:** BC-05, BC-06.
- **Out of Scope:** Silent substitution.
- **Related Business Events:** PhysicalAllocationCreated, FEFOOverrideRecorded, FulfillmentShortage.
- **Related Blueprint Decisions:** [ADR-0007](../04-architecture/adrs/adr-0007-commercial-commitment-reservation-ownership.md) commitment vs allocation; [ADR-0008](../04-architecture/adrs/adr-0008-concurrency-control-by-invariant.md) invariant protection.

### EP11 — Receiving & Warehouse

#### US-020 — Receive stock with lot traceability

- **Actor:** Warehouse Operator
- **User Story:** As a warehouse operator, I want to receive quantities into traceable Inventory Lots, so that physical truth and source batches remain auditable.
- **Business Value:** Reliable stock foundation.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** one physical lot belongs to one Warehouse at a time; partial receiving and adjustments require reason/actor/history.
- **Preconditions:** Authorized Warehouse and receiving record.
- **Acceptance Criteria:**
  - Given received quantity and source batch, when recorded, then lot, warehouse, quantity and evidence are persisted.
  - Given partial receiving, when accepted, then received and remaining quantities remain distinct and traceable.
- **Dependencies:** BC-05, Business Traceability.
- **Out of Scope:** Full procurement and supplier Purchase Orders.
- **Related Business Events:** StockReceived, InventoryLotCreated.
- **Related Blueprint Decisions:** Inventory ownership.

#### US-021 — Transfer or adjust inventory safely

- **Actor:** Warehouse Operator / Business Operations Manager
- **User Story:** As an authorized operations actor, I want traceable transfers and adjustments, so that physical truth can be corrected without hiding history.
- **Business Value:** Recoverable warehouse operations.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Transfer `REQUESTED -> IN_TRANSIT -> RECEIVED`; adjustment has actor/reason; in-transit is not double-sellable.
- **Preconditions:** Authorized scope and valid lot/warehouse state.
- **Acceptance Criteria:**
  - Given a valid transfer, when dispatched and received, then source/destination quantities and movement history are consistent.
  - Given repeated dispatch/receive or stale version, when retried, then idempotent result or conflict is returned without duplicate movement.
- **Dependencies:** BC-05, concurrency, idempotency.
- **Out of Scope:** Automatic cross-tenant transfer.
- **Related Business Events:** TransferRequested, TransferDispatched, TransferReceived, InventoryAdjusted.
- **Related Blueprint Decisions:** Transaction/concurrency.

### EP12 — Fulfillment

#### US-022 — Progress a Fulfillment

- **Actor:** Warehouse Operator
- **User Story:** As a warehouse operator, I want to progress a Fulfillment from plan through handover, so that committed quantities become dispatch-ready with traceability.
- **Business Value:** Controlled physical execution.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** explicit lifecycle; multiple Fulfillments per SO; quantity cannot exceed commitment/allocation.
- **Preconditions:** Confirmed SO and valid allocation.
- **Acceptance Criteria:**
  - Given valid state and authorized actor, when each step completes, then the next lifecycle state and actor/time evidence are recorded.
  - Given stale state or quantity overrun, when progression is attempted, then CONFLICT or business rejection prevents invalid mutation.
- **Dependencies:** BC-04, BC-05, BC-06.
- **Out of Scope:** Delivery completion inside warehouse workflow.
- **Related Business Events:** FulfillmentPlanned, PickingCompleted, FulfillmentPacked, ReadyForDispatch.
- **Related Blueprint Decisions:** Fulfillment state machine.

#### US-023 — Resolve a shortage

- **Actor:** Warehouse Operator / Sales Representative
- **User Story:** As an operations actor, I want shortage to trigger reallocation or explicit commercial resolution, so that no quantity is silently substituted or lost.
- **Business Value:** Honest resolution of physical constraints.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** detect, reallocate across eligible Warehouses if possible, partially fulfill only after explicit physical shortage, retain unresolved commercial remainder; Sales authority decides cancellation.
- **Preconditions:** Fulfillment allocation cannot satisfy committed quantity.
- **Acceptance Criteria:**
  - Given a shortage, when reallocation is possible, then a new valid allocation is recorded with reason.
  - Given unresolved shortage, when fulfillment continues, then affected quantity remains visible and any commercial cancellation is explicit.
- **Dependencies:** BC-04, BC-05, BC-06, traceability.
- **Out of Scope:** Silent substitution or hidden deletion.
- **Related Business Events:** FulfillmentShortage, AllocationReplanned, CommercialRemainderCreated.
- **Related Blueprint Decisions:** [ADR-0007](../04-architecture/adrs/adr-0007-commercial-commitment-reservation-ownership.md) backing/allocation ownership; [ADR-0008](../04-architecture/adrs/adr-0008-concurrency-control-by-invariant.md) invariant protection.

### EP13 — Dispatch & Delivery

#### US-024 — Schedule and dispatch a Delivery

- **Actor:** Dispatch Coordinator
- **User Story:** As a dispatch coordinator, I want to schedule and dispatch a Delivery, so that the Buyer and operators share the current delivery obligation.
- **Business Value:** Coordinated fulfillment handoff.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Delivery and Delivery Attempt are distinct; Route may group deliveries but does not own them.
- **Preconditions:** Fulfillment ready for dispatch and authorized destination.
- **Acceptance Criteria:**
  - Given ready quantity and valid schedule, when dispatched, then Delivery becomes DISPATCHED/IN_TRANSIT with current quantities.
  - Given stale or canceled fulfillment, when dispatch is attempted, then it is rejected without false delivery state.
- **Dependencies:** BC-06, Maps provider boundary.
- **Out of Scope:** Driver Mobile app.
- **Related Business Events:** DeliveryScheduled, DeliveryDispatched.
- **Related Blueprint Decisions:** Delivery lifecycle.

#### US-025 — Record an attempt and POD

- **Actor:** Delivery actor / Dispatch Coordinator
- **User Story:** As a delivery actor, I want to record an attempt, outcome and POD evidence, so that actual delivery truth is immutable and reviewable.
- **Business Value:** Defensible delivery history.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** same Delivery for retries; POD includes recipient, time, location context, quantities, reasons, actor and evidence; amendments are addenda.
- **Preconditions:** Delivery is scheduled/dispatched and actor authorized.
- **Acceptance Criteria:**
  - Given a delivered or rejected quantity, when POD is finalized, then actual quantities and evidence are immutable.
  - Given repeated finalization with same idempotency key, when retried, then original POD result is returned; given correction, then addendum links to original.
- **Dependencies:** BC-06, BC-09, idempotency, traceability.
- **Out of Scope:** Universal photo/signature and full RMA.
- **Related Business Events:** DeliveryAttempted, DeliveryCompleted, PODIssued, PODAmended.
- **Related Blueprint Decisions:** POD immutability.

#### US-026 — Continue a partial delivery

- **Actor:** Dispatch Coordinator / B2B Buyer
- **User Story:** As an operations actor, I want remaining quantity to continue in a new Delivery, so that the original delivered outcome and remaining obligation are both visible.
- **Business Value:** Accurate partial-delivery recovery.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** partial Delivery closes with historical delivered quantity; Continuation Delivery is not another Attempt or backorder.
- **Preconditions:** Finalized partial POD.
- **Acceptance Criteria:**
  - Given delivered quantity less than obligation, when partial POD commits, then remaining quantity is calculated and one Continuation Delivery is created idempotently.
  - Given duplicate partial POD or continuation request, when retried, then no duplicate continuation or quantity is created.
- **Dependencies:** BC-04, BC-06, BC-09.
- **Out of Scope:** Full returns/RMA.
- **Related Business Events:** PartialDeliveryRecorded, ContinuationDeliveryCreated.
- **Related Blueprint Decisions:** Continuation semantics.

### EP14 — Cold Chain

#### US-027 — Capture and disposition a temperature excursion

- **Actor:** Warehouse Operator / Business Operations Manager
- **User Story:** As a cold-chain operator, I want to record manual temperature evidence and disposition affected quantity, so that unsafe stock is held without automatic destruction.
- **Business Value:** Safe cold-chain operations with reasoned disposition.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** optional per Tenant/SKU; excursion -> HOLD; `ColdChainDisposition` is `RELEASE`, `CONTINUE_HOLD`, `REJECT` or `WASTE`; `REJECT` is not synonymous with automatic `RETURN_TO_SUPPLIER`; IoT deferred.
- **Preconditions:** SKU/lot requires temperature policy or operator records an observation.
- **Acceptance Criteria:**
  - Given out-of-range evidence, when recorded, then affected quantity is HOLD and unavailable for sellable availability.
  - Given authorized disposition, when selected, then the result is traceable and only Release can return quantity to sellable consideration after checks.
- **Dependencies:** BC-05, BC-06, traceability.
- **Out of Scope:** IoT automation and laboratory/QMS.
- **Related Business Events:** TemperatureRecorded, TemperatureExcursionDetected, TemperatureDispositioned.
- **Related Blueprint Decisions:** Cold-chain optional capability; [ADR-0007](../04-architecture/adrs/adr-0007-commercial-commitment-reservation-ownership.md) Inventory ownership.

### EP15 — Credit

#### US-028 — View Tenant-specific credit

- **Actor:** B2B Buyer / Sales Representative
- **User Story:** As a commercial actor, I want live Credit Limit, Credit Reserved, Outstanding Receivables and Available Credit for the current supplier Tenant, so that I know what can progress.
- **Business Value:** Transparent credit decisions without cross-tenant leakage.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Available Credit formula; no global Buyer balance; `exposure`/`used` are AS-IS only.
- **Preconditions:** Active Buyer Relationship or workforce authorization.
- **Acceptance Criteria:**
  - Given current supplier context, when credit is viewed, then all four values and formula-consistent Available Credit are shown.
  - Given another Tenant context, when the same Buyer views credit, then data from the first Tenant is absent.
- **Dependencies:** BC-01, BC-02, BC-07, RLS.
- **Out of Scope:** Full accounting statements.
- **Related Business Events:** CreditViewed, AvailableCreditChanged.
- **Related Blueprint Decisions:** Credit formula.

#### US-029 — Reserve and release credit safely

- **Actor:** Sales Commitment / Credit service
- **User Story:** As the commercial system, I want credit reservation to align atomically with commitment and lifecycle, so that orders cannot double-spend or strand credit.
- **Business Value:** Correct risk control under retries and concurrency.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** required inventory/credit effects all-or-nothing; PR submit reserves; SO confirmation posts receivable for credit/net without double count.
- **Preconditions:** Authoritative amount, currency, Tenant and commitment.
- **Acceptance Criteria:**
  - Given sufficient credit and valid commitment, when reservation commits, then Available Credit decreases exactly once.
  - Given concurrent last-credit requests, when both run, then at most allowed credit succeeds and the loser receives deterministic rejection/conflict.
  - Given receivable posting, when reservation transitions, then the same amount is not counted in both active reservation and receivable balance.
- **Dependencies:** BC-04, BC-07, transaction/concurrency/idempotency.
- **Out of Scope:** Global credit bureau or advanced underwriting.
- **Related Business Events:** CreditReservationEstablished, CreditReservationReleased, ReceivablePosted.
- **Related Blueprint Decisions:** [ADR-0006](../04-architecture/adrs/adr-0006-atomic-commercial-confirmation-boundary.md) atomic boundary; [ADR-0008](../04-architecture/adrs/adr-0008-concurrency-control-by-invariant.md) credit concurrency.

### EP16 — Receivables & Payments

#### US-030 — Post and correct a Receivable

- **Actor:** Credit & Receivables operator
- **User Story:** As a finance operator, I want recognized obligation and explicit corrections, so that current debt is accurate without rewriting history.
- **Business Value:** Defensible financial truth.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** credit/net Receivable at SO confirmation; original obligation remains; Financial Adjustment changes current net obligation.
- **Preconditions:** Confirmed SO and accepted terms.
- **Acceptance Criteria:**
  - Given credit/net SO confirmation, when posting succeeds, then Receivable is recorded with amount, due terms and source snapshot.
  - Given later SO reduction/cancellation, when correction is approved, then a linked Financial Adjustment changes outstanding obligation and preserves original Receivable.
- **Dependencies:** BC-04, BC-07, BC-09.
- **Out of Scope:** SUNAT Credit Note and full accounting.
- **Related Business Events:** ReceivablePosted, FinancialAdjustmentIssued.
- **Related Blueprint Decisions:** [ADR-0009](../04-architecture/adrs/adr-0009-historical-facts-reversals-corrections.md) financial corrections.

#### US-031 — Report and confirm a Payment

- **Actor:** B2B Buyer / Finance operator / Payment provider
- **User Story:** As a payment actor, I want a reported payment to be verified and confirmed with provider/manual evidence, so that financial application is controlled.
- **Business Value:** Safe payment recognition and reconciliation.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Payment Report != Payment Confirmed; provider callbacks are deduplicated; Payment != Receivable/Credit.
- **Preconditions:** Valid Payment method/evidence and authorized Tenant scope.
- **Acceptance Criteria:**
  - Given valid signed/provider or manual evidence, when confirmation succeeds, then Payment history and application effect are recorded once.
  - Given duplicate callback or invalid signature/state, when received, then no duplicate financial effect occurs and failure/review state is visible.
- **Dependencies:** BC-08, BC-07, provider ACL, inbox/idempotency.
- **Out of Scope:** Provider vendor selection beyond V1 Stripe direction.
- **Related Business Events:** PaymentReported, PaymentConfirmed, PaymentRejected.
- **Related Blueprint Decisions:** [ADR-0012](../04-architecture/adrs/adr-0012-domain-and-published-event-contracts.md) event contract; [ADR-0009](../04-architecture/adrs/adr-0009-historical-facts-reversals-corrections.md) payment history.

#### US-032 — Recover prepaid payment/order failure

- **Actor:** Payment/Reconciliation operator
- **User Story:** As an operations actor, I want a captured prepaid payment with failed SO creation to be reconciled or refunded, so that money and commercial state never disappear.
- **Business Value:** Recoverability across provider and database failure.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** for PREPAID, Payment Confirmed precedes Sales Order confirmation and physical fulfillment; record `UNALLOCATED / RECONCILIATION_REQUIRED` on failed order creation; attempt refund; retain Payment history.
- **Preconditions:** Provider capture succeeded but SO confirmation failed.
- **Acceptance Criteria:**
  - Given captured payment and failed order creation, when recovery starts, then unallocated payment and correlation are visible and refund is attempted without a second charge.
  - Given refund failure, when retry exhausts, then terminal operational state is visible for intervention; Payment is never erased.
- **Dependencies:** BC-08, BC-04, provider ACL, outbox/inbox.
- **Out of Scope:** Automatic promise of instant refund timing.
- **Related Business Events:** PaymentUnallocated, RefundInitiated, RefundFailed, ReconciliationRequired.
- **Related Blueprint Decisions:** [ADR-0009](../04-architecture/adrs/adr-0009-historical-facts-reversals-corrections.md) financial history; Production Gate.

### EP17 — Business Documents

#### US-033 — Issue and retrieve an immutable business document

- **Actor:** Sales/Finance operator / B2B Buyer
- **User Story:** As an authorized actor, I want issued Sales Order, Delivery, Commercial Invoice, Payment Receipt and Financial Adjustment documents to preserve their historical snapshot, so that commercial evidence remains trustworthy.
- **Business Value:** Auditability and buyer self-service.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** issued documents immutable; corrections linked; Commercial Invoice not SUNAT fiscal document; retention policy is Production/Legal Gate.
- **Preconditions:** Source fact is eligible and authorization exists.
- **Acceptance Criteria:**
  - Given eligible source snapshot, when document is issued, then numbering, version, source reference and immutable content are stored.
  - Given correction, when replacement is issued, then original remains retrievable and linkage explains replacement.
- **Dependencies:** BC-09, Object Storage, source contexts.
- **Out of Scope:** SUNAT integration and destructive retention deletion.
- **Related Business Events:** BusinessDocumentIssued, BusinessDocumentReplaced.
- **Related Blueprint Decisions:** [ADR-0005](../04-architecture/adrs/adr-0005-object-storage-for-binary-assets.md) binary evidence boundary; [ADR-0009](../04-architecture/adrs/adr-0009-historical-facts-reversals-corrections.md) immutable corrections.

### EP18 — Notifications

#### US-034 — Receive relevant business notification

- **Actor:** B2B Buyer / internal workforce actor
- **User Story:** As a recipient, I want in-app and email notification candidates for important commercial and operational facts, so that I can act without polling every surface.
- **Business Value:** Timely coordination with safe failure semantics.
- **Priority:** SHOULD
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** notification failure/retry never changes source state; WhatsApp is external/manual; insufficient credit generally remains immediate rejection.
- **Preconditions:** Source event and recipient preference/relationship are valid.
- **Acceptance Criteria:**
  - Given a configured candidate, when delivery succeeds, then recipient sees the notification with source correlation.
  - Given channel failure, when retry occurs, then source business state remains unchanged and delivery failure is observable.
- **Dependencies:** BC-10, outbox/inbox, Email Delivery Service.
- **Out of Scope:** WhatsApp delivery provider and guaranteed external delivery.
- **Related Business Events:** NotificationCandidateCreated, NotificationDelivered, NotificationDeliveryFailed.
- **Related Blueprint Decisions:** [ADR-0012](../04-architecture/adrs/adr-0012-domain-and-published-event-contracts.md) event contract; [ADR-0011](../04-architecture/adrs/adr-0011-durable-business-traceability.md) Notifications vs Traceability.

### EP19 — Business Traceability

#### US-035 — Consult a durable business timeline

- **Actor:** authorized Buyer / workforce actor
- **User Story:** As an authorized actor, I want to consult significant business facts and evidence, so that commercial and operational history is explainable.
- **Business Value:** Trust, supportability and audit-ready operations.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** append-only; source contexts retain authority; Security Audit is separate; secrets and unnecessary sensitive data are excluded.
- **Preconditions:** Source fact and authorized scope.
- **Acceptance Criteria:**
  - Given a significant PR, commitment, inventory, delivery, payment or document fact, when timeline is queried, then actor/time/correlation and relevant reason/evidence are shown.
  - Given unauthorized scope or sensitive secret material, when queried, then data is denied or redacted without weakening source authority.
- **Dependencies:** BC-11, all source BCs, RLS.
- **Out of Scope:** Security Audit viewer as a Buyer timeline.
- **Related Business Events:** BusinessFactTraced, TimelineProjectionUpdated.
- **Related Blueprint Decisions:** [ADR-0011](../04-architecture/adrs/adr-0011-durable-business-traceability.md) durable traceability.

### EP20 — Operational Visibility

#### US-036 — View current operational work

- **Actor:** Business Operations Manager / Sales / Warehouse / Dispatch
- **User Story:** As an operations actor, I want authorized views of requests, orders, availability, fulfillment, delivery, credit, payment and exceptions, so that I can coordinate work from current source facts.
- **Business Value:** Fast exception handling without inventing a second authority.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** projections are read models; source contexts retain authority; stale/conflict state is explicit.
- **Preconditions:** Active workforce membership and capability.
- **Acceptance Criteria:**
  - Given authorized context, when dashboard data is loaded, then source timestamp/version and relevant states are visible.
  - Given stale projection or source failure, when actor acts, then UI exposes stale/technical state and requires refetch or retry rather than optimistic irreversible success.
- **Dependencies:** BC-01, BC-11, source contexts, change feed.
- **Out of Scope:** Full BI/data warehouse and unowned KPI promises.
- **Related Business Events:** OperationalProjectionUpdated, BusinessExceptionRaised.
- **Related Blueprint Decisions:** Source authority and UI state contract.

### EP21 — Website / Commercial Acquisition

#### US-037 — Understand Nexa and enter an authenticated flow

- **Actor:** Prospective Customer Representative / Buyer
- **User Story:** As a public visitor, I want clear product information and safe login/demo entry points, so that I can evaluate Nexa or continue to an authorized experience.
- **Business Value:** Trustworthy acquisition without leaking tenant commerce.
- **Priority:** MUST
- **Story Points:** TBD — DELIVERY REFINEMENT
- **Business Rules:** Website is public acquisition only; no anonymous tenant catalog, price or operational truth.
- **Preconditions:** Public Website available.
- **Acceptance Criteria:**
  - Given a public visitor, when product pages load, then only public content and safe entry points are visible.
  - Given login/demo action, when selected, then the visitor is routed to the appropriate boundary without anonymous Tenant activation.
- **Dependencies:** Website, authentication/onboarding entry.
- **Out of Scope:** Tenant operational administration and catalog ownership.
- **Related Business Events:** ContactRequestReceived, AuthenticationStarted.
- **Related Blueprint Decisions:** Website boundary; BC-01.

## Catalog totals and acceptance coverage

- **Total:** 37 stories.
- **MUST:** 34.
- **SHOULD:** 3.
- **COULD:** 0.
- **Story Points:** all `TBD — DELIVERY REFINEMENT`.
- **Acceptance Criteria coverage:** happy path, validation, authorization/tenant isolation, business rejection, stale state, concurrency, idempotency/retry, provider failure, partial fulfillment/delivery, financial correction, historical truth, notification failure, traceability, documents and visible infrastructure failure are covered where relevant.
