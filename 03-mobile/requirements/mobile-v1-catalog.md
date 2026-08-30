---
status: planned
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-29
---

# Mobile V1 product catalog

Canonical Mobile requirement catalog after the 2026-08-29 reconciliation.
Product direction is `OWNER-ACCEPTED`; every story remains
`PROPOSED / RESEARCH VALIDATION PENDING` until actor research and Product
Acceptance are completed. Backend support is partial and evidenced by API
v0.17.0; no Mobile client, framework or runtime is claimed.

Operations Mobile and Buyer Mobile are projections of the shared Nexa product.
They use the eleven accepted Bounded Contexts and do not create Mobile,
Scanner, QR, Device, Cold Chain or Analytics contexts. See the [shared
capability model](../../01-shared/product/capability-map.md), [reconciliation
matrix](reconciliation.md) and [live compatibility baseline](../../04-delivery/compatibility-baseline-2026-08-29.md).

## Catalog rules

- 49 historical IDs are retained. There are 42 V1 candidates and 7 explicitly
  deferred V2 candidates; no new ID was necessary.
- `Offline expectation` describes safe cache/draft/queue behavior only. A
  queued operation is not an authoritative success.
- API v0.17.0 supports identifier/lot/FEFO/picking, handoff, Buyer
  receipt/discrepancy and push-subscription foundations. It does not prove a
  Mobile client or all target workflows.
- QR is a bounded, ephemeral handoff mechanism, not acceptance. Driver outcome,
  Buyer receipt and Buyer discrepancy are separate facts.
- Every command is tenant/relationship scoped, idempotent where retryable and
  explicit about stale, permission, offline and technical failure behavior.

# MOBILE-EPIC-01 — Identity, Context & Device Foundation

## MOB-US-001 — Restore an authenticated Mobile session

| Field | Value |
|---|---|
| ID | MOB-US-001 |
| Title | Restore an authenticated Mobile session |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile; Buyer Mobile |
| App | Operations Mobile; Buyer Mobile |
| Actor | Mobile User |
| Epic | MOBILE-EPIC-01 — Identity, Context & Device Foundation |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-01 — Tenant & Access Governance |
| Primary Bounded Context | BC-01 — Tenant & Access Governance |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance |
| Shared Capability | CAP-02 — Workforce access and governance |
| Goal / Outcome | Re-enter a valid session without exposing protected data before server authorization. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Secure session reference may be read; protected data and mutations require valid server context. |
| Idempotency expectation | Session refresh is safe to retry; no business command is created. |
| Authorization implication | Authentication, revocation, Tenant/Workspace or Buyer Relationship scope are server decisions. |
| Evidence / device implication | Platform secure storage is required; token/credential storage and device attestation remain technical decisions. |
| Dependencies | API authentication/session contract; secure device storage; tenant isolation. |
| Classification | V1 candidate; backend foundation exists, client NOT STARTED. |

### User Story

As a Mobile User,
I want to restore an authenticated Mobile session,
so that I can prove my identity before the app exposes protected Nexa data.

### Acceptance Criteria

- Given a valid non-revoked session, when the app starts, then it restores only the authorized context and renders protected data after server validation.
- Given an expired, revoked or malformed session, when restoration runs, then the app clears protected local state and requires authentication without revealing business data.
- Given a device or network failure, when restoration cannot be validated, then the app shows an explicit unavailable state and never reports authenticated success.
- Given a retry, when the same refresh is submitted, then it is safe and does not create a duplicate business command or log credentials/tokens.

## MOB-US-002 — Resolve an active business context

| Field | Value |
|---|---|
| ID | MOB-US-002 |
| Title | Resolve an active business context |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile; Buyer Mobile |
| App | Operations Mobile; Buyer Mobile |
| Actor | Mobile User |
| Epic | MOBILE-EPIC-01 — Identity, Context & Device Foundation |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-01 — Tenant & Access Governance |
| Primary Bounded Context | BC-01 — Tenant & Access Governance |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-02 — Workforce access and governance; CAP-03 — Customer accounts and buyer relationships |
| Goal / Outcome | Select the intended Tenant/Workspace or authorized Buyer Relationship before work begins. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Last context may be displayed as a hint; server must revalidate before protected reads or writes. |
| Idempotency expectation | Context selection is a replaceable client preference, not a business mutation. |
| Authorization implication | A missing, suspended or cross-tenant context fails closed; switching context clears incompatible projections. |
| Evidence / device implication | Context version and scope are visible in diagnostics without secrets or unnecessary Tenant data. |
| Dependencies | BC-01 access context; BC-02 relationship resolution; secure local session reference. |
| Classification | V1 candidate; backend contract partial, client NOT STARTED. |

### User Story

As a Mobile User,
I want to resolve an active business context,
so that every read and action uses the Tenant, Workspace or Buyer Relationship I intend.

### Acceptance Criteria

- Given multiple authorized contexts, when the user selects one, then the app shows the selected scope and requests fresh server authorization before protected work.
- Given a suspended, missing or unauthorized context, when selected, then the server rejects it and the app exposes no scoped business data.
- Given a context switch, when it succeeds, then cached data from the previous scope is hidden or discarded and cannot be submitted under the new scope.
- Given stale or unavailable context metadata, when the app is offline, then it marks the context unverified and blocks critical commands rather than assuming authority.

## MOB-US-003 — Render capability-authorized Mobile work

| Field | Value |
|---|---|
| ID | MOB-US-003 |
| Title | Render capability-authorized Mobile work |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile; Buyer Mobile |
| App | Operations Mobile; Buyer Mobile |
| Actor | Mobile User |
| Epic | MOBILE-EPIC-01 — Identity, Context & Device Foundation |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-01 — Tenant & Access Governance |
| Primary Bounded Context | BC-01 — Tenant & Access Governance |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance |
| Shared Capability | CAP-02 — Workforce access and governance |
| Goal / Outcome | See only work and navigation permitted by the active role, capability and relationship. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Cached navigation may remain visible with freshness state; protected actions require current capability. |
| Idempotency expectation | Navigation evaluation has no business side effect. |
| Authorization implication | Hidden UI is not security; every route and command is rechecked server-side. |
| Evidence / device implication | Capability version and denial reason may be shown safely; no sensitive policy payload in logs. |
| Dependencies | BC-01 capabilities; shared surface-role matrix; API authorization. |
| Classification | V1 candidate; client architecture NOT STARTED. |

### User Story

As a Mobile User,
I want to see capability-authorized Mobile work,
so that the app exposes only work allowed by my active role and relationship.

### Acceptance Criteria

- Given an authorized capability, when the app resolves navigation, then the corresponding work is available under the active scope.
- Given a missing or revoked capability, when the user opens a route or submits a command, then the server denies it even if a stale menu is visible.
- Given a capability version change, when the app refreshes, then stale routes are removed or marked unavailable and the user sees an explicit explanation.
- Given offline state, when a cached route is opened, then the app labels data freshness and blocks any command whose authority cannot be verified.

# MOBILE-EPIC-02 — Field Sales & Commercial Access

## MOB-US-004 — Review operational visibility

| Field | Value |
|---|---|
| ID | MOB-US-004 |
| Title | Review operational visibility |
| Status | DEFERRED / PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Business Operations Manager |
| Epic | MOBILE-EPIC-02 — Field Sales & Commercial Access |
| Priority | V2 / deferred — no V1 commitment |
| Owning Bounded Context | BC-11 — Business Traceability |
| Primary Bounded Context | BC-11 — Business Traceability |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-16 — Operational visibility |
| Goal / Outcome | Review a compact operational overview from authorized current facts. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | No V1 offline overview authority; a future projection must show freshness and partial-source state. |
| Idempotency expectation | Query only. |
| Authorization implication | Executive/operations visibility is Tenant-scoped and capability-filtered. |
| Evidence / device implication | Requires an accepted mobile analytics/read projection; API v0.17.0 does not establish it. |
| Dependencies | Operational analytics contract; BC-11 projection; research and API contract. |
| Classification | V2 / deferred; explicit BOM projection gate. |

### User Story

As a Business Operations Manager,
I want to review operational visibility,
so that I can prioritize work using current facts from the relevant Tenant.

### Acceptance Criteria

- Given an accepted analytics/read contract and authorized scope, when this story is reactivated, then the overview identifies source versions and freshness.
- Given missing, stale or partial source facts, when the overview is rendered, then it shows the limitation and never invents totals.
- Given an unauthorized role or Tenant, when the projection is requested, then the server denies or filters it completely.
- This story remains outside Mobile V1 until Product research, API contract and acceptance evidence explicitly close the deferral.

## MOB-US-005 — Review critical operational exceptions

| Field | Value |
|---|---|
| ID | MOB-US-005 |
| Title | Review critical operational exceptions |
| Status | DEFERRED / PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Business Operations Manager |
| Epic | MOBILE-EPIC-02 — Field Sales & Commercial Access |
| Priority | V2 / deferred — no V1 commitment |
| Owning Bounded Context | BC-11 — Business Traceability |
| Primary Bounded Context | BC-11 — Business Traceability |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-16 — Operational visibility |
| Goal / Outcome | Identify actionable exceptions without changing source business state from a projection. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | No V1 exception authority; future cache must be explicitly stale. |
| Idempotency expectation | Query only; any correction is a source-BC command. |
| Authorization implication | Exception visibility and authority are separate grants. |
| Evidence / device implication | Requires accepted exception taxonomy and read contract; not established by API v0.17.0. |
| Dependencies | CAP-16 analytics contract; BC-11; Product research. |
| Classification | V2 / deferred; not a generic Mobile dashboard. |

### User Story

As a Business Operations Manager,
I want to review critical operational exceptions,
so that I can address blocked work before it delays a Customer or Delivery.

### Acceptance Criteria

- Given a future accepted exception projection, when an authorized manager opens it, then each item identifies source context, severity, freshness and an owning workflow.
- Given stale or incomplete source data, when the list renders, then it is marked partial and does not imply a new business state.
- Given an exception requiring correction, when the user selects it, then the app routes to an authorized source-BC command rather than mutating the projection.
- This story remains outside Mobile V1 until research, API contract, tenant/security proof and Product Acceptance close the deferral.

## MOB-US-006 — Find a Customer Account and Buyer Relationship

| Field | Value |
|---|---|
| ID | MOB-US-006 |
| Title | Find a Customer Account and Buyer Relationship |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-02 — Field Sales & Commercial Access |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-02 — Customer & Buyer Relationships |
| Primary Bounded Context | BC-02 — Customer & Buyer Relationships |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-03 — Customer accounts and buyer relationships |
| Goal / Outcome | Open the correct authorized customer and buyer relationship for assisted commercial work. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Cached search results require freshness; stale data cannot authorize an order. |
| Idempotency expectation | Query only. |
| Authorization implication | Results are Tenant-scoped and relationship/capability filtered. |
| Evidence / device implication | Search input and result references must avoid unnecessary PII in local logs/cache. |
| Dependencies | BC-01 active context; BC-02 relationship query; API pagination/filter contract. |
| Classification | V1 candidate; backend Web/query evidence exists, client NOT STARTED. |

### User Story

As a Sales Representative,
I want to find a Customer Account and Buyer Relationship,
so that I can open the right authorized Customer without duplicating relationship data.

### Acceptance Criteria

- Given an active Tenant and authorized Sales capability, when the representative searches, then only permitted Customer Accounts and relationships are returned.
- Given a suspended or unrelated Buyer Relationship, when the record is opened, then protected commercial actions are denied and the reason is visible.
- Given stale or empty results, when the query completes, then the app distinguishes no match, unavailable data and authorization filtering.
- Given a retry or repeated search, when the same query is sent, then it has no mutation and does not leak PII across Tenant scopes.

## MOB-US-007 — Review catalog, price and Sellable Availability

| Field | Value |
|---|---|
| ID | MOB-US-007 |
| Title | Review catalog, price and Sellable Availability |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-02 — Field Sales & Commercial Access |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Primary Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability |
| Shared Capability | CAP-04 — Catalog and commercial policy; CAP-07 — Availability and inventory reservation |
| Goal / Outcome | Quote from authoritative SKU, relationship price/terms and current sellable availability inputs. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Read-only cached values show freshness; stale values cannot authorize commitment. |
| Idempotency expectation | Query only. |
| Authorization implication | Relationship eligibility, Tenant catalog visibility and role are server checked. |
| Evidence / device implication | No assumption that camera/scan is available; manual SKU fallback remains required. |
| Dependencies | BC-01/02 context; BC-03 offer resolution; BC-05 availability query; API v0.17.0. |
| Classification | V1 candidate; backend query foundation exists, client NOT STARTED. |

### User Story

As a Sales Representative,
I want to review catalog, price and Sellable Availability,
so that I can prepare demand from current commercial and inventory information.

### Acceptance Criteria

- Given an authorized Customer Relationship, when a SKU is opened, then the app shows the server-resolved price/terms snapshot and sellable availability with source freshness.
- Given an expired, hidden or unavailable SKU, when it is requested, then the app shows the business rejection and cannot add it as an authoritative commitment.
- Given stale availability or price/terms, when the representative submits later, then the API revalidates and returns an explicit conflict rather than trusting the display.
- Given a Tenant or relationship mismatch, when the query is attempted, then no private catalog or price data is returned.

## MOB-US-008 — Prepare assisted commercial intent in a Request Draft

| Field | Value |
|---|---|
| ID | MOB-US-008 |
| Title | Prepare assisted commercial intent in a Request Draft |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-02 — Field Sales & Commercial Access |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Primary Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy; BC-04 — Sales Commitment |
| Shared Capability | CAP-05 — Buyer shopping and drafts |
| Goal / Outcome | Assemble a Customer-specific draft before choosing the authoritative PR or Direct Order path. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Draft may persist locally; no reservation, PR or SO success is implied. |
| Idempotency expectation | Draft saves use a client draft/version and safe retry; submission gets a separate idempotency key. |
| Authorization implication | Customer relationship and line visibility are rechecked when the draft is submitted. |
| Evidence / device implication | Manual entry and optional identifier lookup; no client-owned SKU or price authority. |
| Dependencies | BC-02 relationship; BC-03 offer; BC-04 draft contract; API conflict/version semantics. |
| Classification | V1 candidate; backend contract partial, client NOT STARTED. |

### User Story

As a Sales Representative,
I want to prepare assisted commercial intent in a Request Draft,
so that I can assemble the Customer's intended operation before submitting it authoritatively.

### Acceptance Criteria

- Given an authorized relationship and visible SKU, when lines are added, then the draft records quantities and source references without reserving stock.
- Given a stale draft version, when it is saved or submitted, then the API returns a conflict and preserves both client and server versions for review.
- Given offline state, when the representative edits a draft, then the app labels it local-only and does not call it a PR, SO or accepted order.
- Given a hidden SKU, invalid quantity or relationship loss, when the draft is submitted, then the server rejects the command without a partial commitment.

## MOB-US-009 — Submit a Purchase Request from field workflow

| Field | Value |
|---|---|
| ID | MOB-US-009 |
| Title | Submit a Purchase Request from field workflow |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-02 — Field Sales & Commercial Access |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Primary Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy; BC-04 — Sales Commitment; BC-05 — Inventory Availability; BC-07 — Credit & Receivables |
| Shared Capability | CAP-06 — Purchase Requests and Sales Orders |
| Goal / Outcome | Submit field demand through the same PR rules and authoritative validation as Web. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | A PR may be prepared/queued only if explicitly supported; offline state is never submitted success. |
| Idempotency expectation | Required `Idempotency-Key`; duplicate retry returns the original PR outcome. |
| Authorization implication | Active Tenant/Workspace, Customer Relationship, capability, price, availability and credit are revalidated server-side. |
| Evidence / device implication | Device/network failure exposes pending/unknown state and supports safe status refresh, not invented success. |
| Dependencies | BC-01/02/03/05/07 synchronous contracts; API v0.17.0 OpenAPI/commitment baseline. |
| Classification | V1 candidate; backend commitment exists, Mobile client NOT STARTED. |

### User Story

As a Sales Representative,
I want to submit a Purchase Request from field workflow,
so that field demand enters the same authoritative Purchase Request rules as Web.

### Acceptance Criteria

- Given a valid draft and authorized relationship, when submission is accepted, then exactly one PR is created with the authoritative commercial snapshot and source actor.
- Given stale price, insufficient availability/credit, invalid lines or lost authorization, when submission runs, then the transaction rejects atomically with a business reason.
- Given timeout after the request may have committed, when the same idempotency key is retried, then the app resolves the original result and never creates a second PR.
- Given offline or unknown connectivity, when submission cannot be confirmed, then the app shows pending/unknown and requires server reconciliation before claiming success.

## MOB-US-010 — Review PR/SO and contextual Customer credit

| Field | Value |
|---|---|
| ID | MOB-US-010 |
| Title | Review PR/SO and contextual Customer credit |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-02 — Field Sales & Commercial Access |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Primary Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-04 — Sales Commitment; BC-07 — Credit & Receivables; BC-11 — Business Traceability |
| Shared Capability | CAP-06 — Purchase Requests and Sales Orders; CAP-11 — Credit and receivables |
| Goal / Outcome | Explain the Customer-specific commitment state and credit context without changing either source. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Cached read is labeled stale; no credit decision or order mutation offline. |
| Idempotency expectation | Query only; refresh may safely repeat. |
| Authorization implication | Customer relationship and financial visibility are separately checked. |
| Evidence / device implication | Financial data is minimized and not written to diagnostic logs. |
| Dependencies | BC-02 relationship; BC-04 PR/SO query; BC-07 credit/receivable query; BC-11 history. |
| Classification | V1 candidate; backend read surfaces exist in Web/API, client NOT STARTED. |

### User Story

As a Sales Representative,
I want to review PR/SO and contextual Customer credit,
so that I can follow authorized Customer-specific commercial state while away from Platform.

### Acceptance Criteria

- Given an authorized relationship, when the representative opens the Customer view, then PR/SO status, version and relevant credit freshness are shown from server projections.
- Given stale, unavailable or partial financial data, when the view renders, then the limitation is explicit and no client calculation authorizes a command.
- Given a relationship or Tenant mismatch, when the record is requested, then the API returns no protected commitment or credit data.
- Given a source state transition, when refreshed, then the app preserves the server lifecycle and does not rewrite history locally.

# MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution

## MOB-US-011 — Resolve a SKU by physical identifier

| Field | Value |
|---|---|
| ID | MOB-US-011 |
| Title | Resolve a SKU by physical identifier |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Primary Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy |
| Shared Capability | CAP-04 — Catalog and commercial policy |
| Goal / Outcome | Resolve a scanned EAN/UPC/GTIN or other accepted physical identifier to one SKU. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Cached resolution is advisory and freshness-labeled; unknown/ambiguous identifiers require online resolution. |
| Idempotency expectation | Resolution is a safe query; scan submission is deduped by workflow command key. |
| Authorization implication | Identifier and SKU visibility are Tenant/warehouse scoped; no cross-tenant match. |
| Evidence / device implication | Camera/scanner is an abstraction; permission denial provides manual fallback and does not invent a match. |
| Dependencies | API v0.17.0 `/api/v1/skus/resolve`; BC-03 identifier mapping; device permission contract. |
| Classification | V1 candidate; backend IMPLEMENTED in v0.17.0, client NOT STARTED. |

### User Story

As a Warehouse Operator,
I want to resolve a SKU by physical identifier,
so that physical work uses the correct Product/SKU without manual duplication.

### Acceptance Criteria

- Given one authorized identifier match, when it is scanned, then the app displays the resolved SKU and source version before a mutation is prepared.
- Given an unknown, ambiguous, expired or Tenant-inaccessible identifier, when it is scanned, then the app rejects it with a recoverable reason and offers safe manual lookup.
- Given camera/scanner permission denial or malformed input, when resolution runs, then the app does not guess and records no false inventory action.
- Given repeated scans, when the same resolution is retried, then it remains query-safe and cannot create duplicate receipt/pick facts.

## MOB-US-012 — Resolve a known SKU manually

| Field | Value |
|---|---|
| ID | MOB-US-012 |
| Title | Resolve a known SKU manually |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Primary Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy |
| Shared Capability | CAP-04 — Catalog and commercial policy |
| Goal / Outcome | Continue authorized warehouse work when no physical scan is available. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Known cached SKU may be selected for preparation, but server freshness is required for mutation. |
| Idempotency expectation | Query/selection only; receipt/pick command owns its own idempotency key. |
| Authorization implication | SKU visibility, warehouse scope and role are server checked. |
| Evidence / device implication | Manual fallback must record operator input without treating it as identifier proof. |
| Dependencies | BC-03 SKU query; MOB-US-011 scan abstraction; active BC-01 context. |
| Classification | V1 candidate; client NOT STARTED. |

### User Story

As a Warehouse Operator,
I want to resolve a known SKU manually,
so that I can continue safe work when scanning is unavailable.

### Acceptance Criteria

- Given an exact authorized SKU search result, when selected, then the app shows the SKU identity and requires confirmation before a physical mutation.
- Given a partial, ambiguous, hidden or nonexistent match, when selected, then the app asks for disambiguation or rejects without creating inventory truth.
- Given offline selection, when the operator prepares work, then the app marks it unverified and blocks authoritative receipt/pick completion until server validation.
- Given repeated manual selection, when retried, then no duplicate business fact is created.

## MOB-US-013 — Record an inbound inventory receipt

| Field | Value |
|---|---|
| ID | MOB-US-013 |
| Title | Record an inbound inventory receipt |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Primary Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Create an authoritative inbound receipt for a valid Tenant warehouse and SKU. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Receipt can be drafted/queued only if explicitly supported; no offline stock success. |
| Idempotency expectation | Receipt uses a durable operation/idempotency key; retry resolves original result. |
| Authorization implication | Warehouse membership, capability, Tenant and lot/SKU relationship are rechecked. |
| Evidence / device implication | Optional scan/evidence references are attached safely; object upload failure remains visible. |
| Dependencies | BC-01 context; BC-03 SKU; BC-05 receiving contract; API v0.17.0 lot/receipt support. |
| Classification | V1 candidate; backend partial/implemented foundation, client NOT STARTED. |

### User Story

As a Warehouse Operator,
I want to record an inbound inventory receipt,
so that received stock becomes authoritative only after warehouse validation.

### Acceptance Criteria

- Given an authorized warehouse operation with valid SKU, lot and quantity, when receipt is accepted, then BC-05 records one receipt and updated stock facts.
- Given invalid quantity, missing lot data, unauthorized warehouse or rejected disposition, when receipt is submitted, then no partial stock mutation occurs.
- Given timeout or retry, when the same idempotency key is reused, then the original receipt result is returned without duplicate stock.
- Given offline or storage failure, when evidence/receipt cannot be finalized, then the app shows pending/rejected and never reports stock success locally.

## MOB-US-014 — Capture received Lot, expiry and quantity

| Field | Value |
|---|---|
| ID | MOB-US-014 |
| Title | Capture received Lot, expiry and quantity |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Primary Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations; CAP-15 — Business traceability |
| Goal / Outcome | Capture the immutable lot identity, UTC expiry and received quantity needed for safe availability. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Form draft may survive connectivity loss; server validates before receipt success. |
| Idempotency expectation | Lot/receipt operation has a durable idempotency key; duplicate capture is visible/deduped. |
| Authorization implication | Operator may record only in authorized Tenant/warehouse scope. |
| Evidence / device implication | Expiry is normalized to UTC; camera/label evidence is reference metadata, not authority. |
| Dependencies | BC-03 SKU; BC-05 lot/disposition; BC-11 traceability; API v0.17.0 lot resolution. |
| Classification | V1 candidate; backend partial/implemented foundation, client NOT STARTED. |

### User Story

As a Warehouse Operator,
I want to capture received Lot, expiry and quantity,
so that FEFO and Sellable Availability use the actual physical receipt.

### Acceptance Criteria

- Given a valid lot, positive quantity and expiry, when the receipt is accepted, then the server stores normalized UTC expiry and attributable source facts.
- Given missing, malformed, past or inconsistent expiry, when submitted, then the server rejects it with a business reason and does not create sellable stock.
- Given a duplicate lot/receipt retry, when the same operation key is used, then the original result is returned and no quantity is doubled.
- Given offline capture, when the app queues a draft, then it displays unverified state and cannot claim FEFO-eligible stock until server acceptance.

## MOB-US-015 — Review physical and sellable stock/Lots

| Field | Value |
|---|---|
| ID | MOB-US-015 |
| Title | Review physical and sellable stock/Lots |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Primary Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-05 — Inventory Availability |
| Shared Capability | CAP-07 — Availability and inventory reservation |
| Goal / Outcome | Inspect current lot, disposition and sellable availability before physical work. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Cached read is advisory and freshness-labeled; no local availability authority. |
| Idempotency expectation | Query only. |
| Authorization implication | Warehouse and Tenant scope filter all quantities and lots. |
| Evidence / device implication | Expiry/disposition display must make HOLD, QUARANTINE and expired states unmistakable. |
| Dependencies | BC-05 availability/lot query; BC-03 SKU identity; API version/freshness contract. |
| Classification | V1 candidate; backend read foundation exists, client NOT STARTED. |

### User Story

As a Warehouse Operator,
I want to review physical and sellable stock and Lots,
so that I can select safe work from current inventory truth.

### Acceptance Criteria

- Given an authorized warehouse, when stock is queried, then physical quantity, sellable quantity, lot, disposition and freshness are shown separately.
- Given expired, held, quarantined or allocated stock, when displayed, then it cannot be silently treated as sellable.
- Given stale or unavailable data, when the operator attempts follow-on work, then the app requires refresh or server validation.
- Given another Tenant or warehouse scope, when queried, then no quantity or lot data is returned.

## MOB-US-016 — Validate FEFO scan and execute an allocated pick

| Field | Value |
|---|---|
| ID | MOB-US-016 |
| Title | Validate FEFO scan and execute an allocated pick |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Primary Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-07 — Availability and inventory reservation; CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Pick the allocated lot only when identifier, FEFO policy, quantity and version are valid. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Scan may prepare evidence; authoritative allocation/pick result requires server response. |
| Idempotency expectation | Pick/scan operation key is reused on retry; duplicate scans are safe and visible. |
| Authorization implication | Warehouse capability, allocation binding, lot disposition and assigned work are server checked. |
| Evidence / device implication | Scanner/camera is optional input; controlled override requires explicit authorized actor/reason. |
| Dependencies | API v0.17.0 FEFO/picking scan validation; BC-05 allocation; BC-06 fulfillment binding. |
| Classification | V1 candidate; backend IMPLEMENTED in v0.17.0, client NOT STARTED. |

### User Story

As a Warehouse Operator,
I want to validate a FEFO scan and execute an allocated pick,
so that fulfillment consumes the correct physical lot without over-picking.

### Acceptance Criteria

- Given an active allocation and eligible FEFO lot, when the scan and quantity are accepted, then the server binds the pick to that lot and records the result.
- Given an unknown SKU/lot, expired or quarantined lot, stale allocation or quantity above remaining, when submitted, then the server rejects without over-picking.
- Given an authorized override, when policy permits it, then the app requires reason/actor evidence and records the exception without rewriting the original allocation.
- Given duplicate retry or network timeout, when the operation key is reused, then the original result is returned and no quantity is consumed twice.

## MOB-US-017 — Record a picking discrepancy or authorized inventory disposition

| Field | Value |
|---|---|
| ID | MOB-US-017 |
| Title | Record a picking discrepancy or authorized inventory disposition |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Primary Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations; CAP-10 — Cold-chain evidence and disposition; CAP-15 — Business traceability |
| Goal / Outcome | Preserve a physical discrepancy or authorized disposition as an attributable fact. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Draft/evidence may queue; inventory truth waits for server acceptance. |
| Idempotency expectation | Discrepancy/adjustment key is durable and deduped. |
| Authorization implication | Adjustment/override authority is stronger than ordinary pick permission. |
| Evidence / device implication | Reason, affected lot/quantity, actor and evidence references are mandatory where policy requires. |
| Dependencies | BC-05 adjustment/disposition; BC-06 pick discrepancy; BC-11 traceability. |
| Classification | V1 candidate; backend foundation partial, client NOT STARTED. |

### User Story

As a Warehouse Operator,
I want to record a picking discrepancy or authorized inventory disposition,
so that physical exceptions remain visible without silently rewriting stock history.

### Acceptance Criteria

- Given an observed discrepancy, when the authorized command is accepted, then offered, picked and remaining quantities plus reason are preserved as separate facts.
- Given insufficient permission, invalid quantity or missing reason/evidence, when submitted, then the server rejects without an inventory adjustment.
- Given a retry, when the same idempotency key is used, then one discrepancy/adjustment fact exists and its result is returned.
- Given offline state, when the operator records a draft, then it is marked pending and cannot change sellable availability until server acceptance.

## MOB-US-018 — Execute transfer or inventory-count operations

| Field | Value |
|---|---|
| ID | MOB-US-018 |
| Title | Execute transfer or inventory-count operations |
| Status | DEFERRED / PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution |
| Priority | V2 / deferred — no V1 commitment |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Primary Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-05 — Inventory Availability |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Perform advanced transfers or counts after their workflow, authority and contract are accepted. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | No V1 offline transfer/count authority. |
| Idempotency expectation | Future transfer/count commands require durable operation keys. |
| Authorization implication | Source/destination warehouse and adjustment authority must be explicit. |
| Evidence / device implication | Advanced scan/count UX and conflict handling require field research. |
| Dependencies | API v0.17.0 explicitly excludes advanced transfer/receiving scanning; BC-05 contract. |
| Classification | V2 / deferred; no silent promotion from existing target tables. |

### User Story

As a Warehouse Operator,
I want to execute transfer or inventory-count operations,
so that physical movements and count corrections are controlled when the workflow is ready.

### Acceptance Criteria

- Given a future accepted workflow and authority, when this story is reactivated, then source/destination, lot, quantity, reason and version rules are explicit.
- Given stale inventory, insufficient permission or conflicting count, when submitted, then the server rejects or exposes a review outcome without last-write-wins.
- Given retry or interruption, when the same operation is resumed, then it is idempotent and never doubles a movement or adjustment.
- This story remains outside Mobile V1 until Product research, API contract, isolation/concurrency proof and Product Acceptance close the deferral.

## MOB-US-019 — Record receiving or warehouse temperature evidence

| Field | Value |
|---|---|
| ID | MOB-US-019 |
| Title | Record receiving or warehouse temperature evidence |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Primary Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-10 — Cold-chain evidence and disposition |
| Goal / Outcome | Record manual temperature evidence against the relevant lot or fulfillment context. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Evidence draft/queue may survive loss; disposition and HOLD require server acceptance. |
| Idempotency expectation | Evidence submission uses a durable key and does not duplicate readings on retry. |
| Authorization implication | Warehouse scope, actor capability and subject lot/delivery are checked. |
| Evidence / device implication | Manual reading and timestamp are V1; continuous sensors/IoT are Future. |
| Dependencies | BC-05 disposition; BC-06 delivery evidence; BC-11 traceability; Object Storage reference. |
| Classification | V1 candidate; backend evidence foundation partial, client NOT STARTED. |

### User Story

As a Warehouse Operator,
I want to record receiving or warehouse temperature evidence,
so that cold-chain decisions have attributable facts without claiming automatic telemetry.

### Acceptance Criteria

- Given an authorized lot/warehouse context, when a valid reading is submitted, then the server stores value, unit, UTC timestamp, actor and subject reference.
- Given an out-of-range reading, when submitted, then the app shows the explicit HOLD/disposition workflow and does not silently destroy or release stock.
- Given missing subject, invalid unit or duplicate retry, when submitted, then the server rejects or dedupes without duplicate evidence.
- Given offline or upload failure, when evidence is queued, then it remains pending and no final disposition or stock state is claimed.

# MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution

## MOB-US-020 — Review Fulfillment-ready Deliveries

| Field | Value |
|---|---|
| ID | MOB-US-020 |
| Title | Review Fulfillment-ready Deliveries |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | See only deliveries whose fulfillment and allocation evidence permits dispatch preparation. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Cached queue is advisory; dispatch authority requires fresh server state. |
| Idempotency expectation | Query only. |
| Authorization implication | Dispatch capability, Tenant and delivery ownership are server filtered. |
| Evidence / device implication | Read view distinguishes missing handoff/POD/temperature evidence and source version. |
| Dependencies | BC-05 allocation; BC-06 fulfillment/delivery query; API v0.17.0 fulfillment paths. |
| Classification | V1 candidate; backend read foundation exists, client NOT STARTED. |

### User Story

As a Dispatch Coordinator,
I want to review Fulfillment-ready Deliveries,
so that I prepare dispatch only from current allocation and evidence facts.

### Acceptance Criteria

- Given an authorized dispatch scope, when the list loads, then each Delivery shows readiness, allocation/source version and missing required evidence.
- Given an incomplete, stale or shortage state, when opened, then dispatch is blocked or clearly marked not ready.
- Given another Tenant or unauthorized Delivery, when queried, then it is not returned.
- Given offline cache, when displayed, then freshness is explicit and no dispatch completion is implied.

## MOB-US-021 — Assign a Driver

| Field | Value |
|---|---|
| ID | MOB-US-021 |
| Title | Assign a Driver |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Assign an authorized Driver to a ready Delivery with explicit version control. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Assignment is online-authoritative; offline draft is not an assignment. |
| Idempotency expectation | Assignment/reassignment command uses idempotency key and delivery version. |
| Authorization implication | Dispatch authority and Driver eligibility are server checked. |
| Evidence / device implication | Assignment reason/history is traceable; no personal contact data is required. |
| Dependencies | BC-01 membership/capability; BC-06 Delivery; assignment/version contract. |
| Classification | V1 candidate; backend contract partial, client NOT STARTED. |

### User Story

As a Dispatch Coordinator,
I want to assign a Driver,
so that an eligible Delivery Operator receives only the Delivery work assigned to them.

### Acceptance Criteria

- Given a ready Delivery and eligible Driver, when assignment is accepted, then the Delivery records one current assignment and version.
- Given a non-ready Delivery, unauthorized Driver or stale version, when submitted, then assignment is rejected without overwriting a newer assignment.
- Given timeout or retry, when the same idempotency key is reused, then the original assignment result is returned.
- Given offline state, when the coordinator attempts assignment, then the app shows pending/unavailable and does not report an assignment.

## MOB-US-022 — Verify outgoing goods against allocation

| Field | Value |
|---|---|
| ID | MOB-US-022 |
| Title | Verify outgoing goods against allocation |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Confirm outgoing quantities and lots match the authoritative physical allocation before handoff. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Verification may collect evidence; dispatch/handoff success waits for server acceptance. |
| Idempotency expectation | Verification command is keyed by fulfillment/version and safe to retry. |
| Authorization implication | Dispatch/warehouse capabilities and allocation binding are required. |
| Evidence / device implication | Scan or manual verification is input evidence, not a new allocation authority. |
| Dependencies | BC-05 physical allocation; BC-06 fulfillment; API v0.17.0 picking/allocation contract. |
| Classification | V1 candidate; backend foundation partial, client NOT STARTED. |

### User Story

As a Dispatch Coordinator,
I want to verify outgoing goods against allocation,
so that dispatch cannot silently substitute or overstate the physical Delivery.

### Acceptance Criteria

- Given a current allocation, when quantities/lots are verified, then the server records the match against the allocation version.
- Given a missing, changed, over-picked or mismatched lot/quantity, when verification runs, then dispatch is blocked and a discrepancy reason is visible.
- Given duplicate verification retry, when the same operation is submitted, then one result is retained and no allocation is changed twice.
- Given offline state, when verification is only local, then the app marks it unconfirmed and cannot complete the handoff.

## MOB-US-023 — Record dispatch handoff evidence

| Field | Value |
|---|---|
| ID | MOB-US-023 |
| Title | Record dispatch handoff evidence |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-09 — Business Documents; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Preserve the required dispatch handoff evidence before goods leave the controlled workflow. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Evidence can queue/upload safely; handoff completion requires authoritative server acceptance. |
| Idempotency expectation | Handoff/evidence operation uses a durable key and immutable evidence references. |
| Authorization implication | Dispatch authority, Delivery scope and evidence policy are server checked. |
| Evidence / device implication | Photographic/evidence metadata and hash are captured per policy; bytes remain private Object Storage. |
| Dependencies | BC-06 handoff; BC-09 evidence reference; BC-11 trace; API v0.17.0 handoff foundation. |
| Classification | V1 candidate; backend partial/implemented foundation, client NOT STARTED. |

### User Story

As a Dispatch Coordinator,
I want to record dispatch handoff evidence,
so that the transfer from warehouse control to Delivery execution is attributable.

### Acceptance Criteria

- Given a ready Delivery and required evidence, when handoff is accepted, then the server stores actor, time, Delivery reference and immutable evidence metadata.
- Given missing required evidence, allocation mismatch or unauthorized actor, when submitted, then handoff is rejected without dispatching the Delivery.
- Given an Object Storage or network failure, when evidence upload is incomplete, then the handoff remains pending/failed and is not presented as complete.
- Given retry with the same key, when the handoff is already accepted, then the original result is returned and evidence is not duplicated.

## MOB-US-024 — Record a stable Dispatch Handoff identifier

| Field | Value |
|---|---|
| ID | MOB-US-024 |
| Title | Record a stable Dispatch Handoff identifier |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Associate a stable handoff reference with the Delivery without confusing it with Buyer acceptance QR. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Identifier may be displayed from accepted server state; generation/registration is online-authoritative. |
| Idempotency expectation | Registration is one-time/idempotent per Delivery handoff version. |
| Authorization implication | Only authorized Dispatch/Delivery workflow may issue or expose the reference. |
| Evidence / device implication | QR/token presentation is bounded and ephemeral; stable dispatch reference is separate from one-time Buyer token. |
| Dependencies | BC-06 handoff; API v0.17.0 handoff-token contract; BC-02 relationship for Buyer presentation. |
| Classification | V1 candidate; backend IMPLEMENTED foundation, client NOT STARTED. |

### User Story

As a Dispatch Coordinator,
I want to record a stable Dispatch Handoff identifier,
so that the Delivery has a traceable handoff reference before dispatch.

### Acceptance Criteria

- Given accepted handoff evidence, when the identifier is registered, then it is linked to exactly one Delivery/handoff version and is retrievable by authorized actors.
- Given an already registered identifier, when registration is retried, then the existing result is returned and a second handoff identity is not created.
- Given an unauthorized, expired or unrelated Delivery, when the identifier is requested, then it is not exposed or accepted.
- The identifier/QR is never treated as Buyer receipt acceptance; acceptance requires a separate Buyer fact.

## MOB-US-025 — Confirm Delivery dispatch after handoff

| Field | Value |
|---|---|
| ID | MOB-US-025 |
| Title | Confirm Delivery dispatch after handoff |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Move a Delivery to dispatched only after allocation, outgoing verification and handoff evidence pass. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | No offline dispatch authority; pending state must be reconciled server-side. |
| Idempotency expectation | Dispatch command uses Idempotency-Key and Delivery version. |
| Authorization implication | Dispatch capability and valid handoff state are mandatory. |
| Evidence / device implication | Confirmation displays handoff/evidence references and rejects stale state. |
| Dependencies | BC-05 allocation; BC-06 handoff/Delivery; API v0.17.0 dispatch paths. |
| Classification | V1 candidate; backend foundation partial, client NOT STARTED. |

### User Story

As a Dispatch Coordinator,
I want to confirm Delivery dispatch after handoff,
so that the Driver receives only a Delivery that passed the required controls.

### Acceptance Criteria

- Given current allocation, outgoing verification and accepted handoff evidence, when dispatch is confirmed, then the Delivery advances once to dispatched.
- Given missing evidence, stale version, shortage or invalid state, when confirmed, then the command rejects without a partial lifecycle transition.
- Given timeout or duplicate retry, when the same idempotency key is used, then the original dispatch result is returned.
- Given offline state, when confirmation cannot be verified, then the app shows pending/unknown and never claims dispatched.

# MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution

## MOB-US-026 — View assigned Deliveries

| Field | Value |
|---|---|
| ID | MOB-US-026 |
| Title | View assigned Deliveries |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | See current deliveries assigned to the authenticated Driver. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Assigned list may be cached with freshness; stale work cannot imply assignment or completion authority. |
| Idempotency expectation | Query only. |
| Authorization implication | API filters by active Driver membership, assignment and Tenant. |
| Evidence / device implication | Customer data is minimized; route/evidence references are read-only projections. |
| Dependencies | BC-01 identity/context; BC-06 assignment/delivery query; API v0.17.0 delivery paths. |
| Classification | V1 candidate; backend read foundation exists, client NOT STARTED. |

### User Story

As a Driver / Delivery Operator,
I want to view assigned Deliveries,
so that I can execute only the work authorized for me.

### Acceptance Criteria

- Given an authenticated assigned Driver, when the list loads, then only current Tenant-scoped assignments are shown with Delivery version and window.
- Given an unassigned or revoked Delivery, when requested, then the API denies it and the app removes or marks it unavailable.
- Given stale/offline data, when shown, then freshness is explicit and the app blocks commands that require current assignment.
- Given a repeated query, when retried, then no Delivery state or assignment is mutated.

## MOB-US-027 — Start a Delivery Attempt

| Field | Value |
|---|---|
| ID | MOB-US-027 |
| Title | Start a Delivery Attempt |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Begin an assigned Delivery Attempt with an explicit server lifecycle fact. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Start may be drafted/queued only if a future contract permits; no offline attempt success. |
| Idempotency expectation | Attempt start uses Idempotency-Key and Delivery version. |
| Authorization implication | Assigned Driver and valid dispatched state are required. |
| Evidence / device implication | Optional location consent/evidence is bounded to active Delivery; no permanent tracking. |
| Dependencies | BC-06 Delivery/Attempt lifecycle; API v0.17.0 delivery-attempt contract. |
| Classification | V1 candidate; backend contract partial, client NOT STARTED. |

### User Story

As a Driver / Delivery Operator,
I want to start a Delivery Attempt,
so that the Delivery lifecycle records when execution begins.

### Acceptance Criteria

- Given an assigned Driver and dispatch-ready Delivery, when start is accepted, then one Attempt with actor and UTC time is recorded.
- Given an unassigned Driver, invalid lifecycle or stale Delivery version, when start is submitted, then it is rejected without a partial Attempt.
- Given timeout or retry, when the same idempotency key is reused, then the original Attempt result is returned.
- Given offline state, when start cannot be confirmed, then the app shows pending/unknown and does not claim an active authoritative Attempt.

## MOB-US-028 — Launch external navigation from Delivery context

| Field | Value |
|---|---|
| ID | MOB-US-028 |
| Title | Launch external navigation from Delivery context |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Open the Delivery destination in an available external navigation provider without making routing domain authority. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Previously resolved destination may be displayed; external navigation availability is device-dependent. |
| Idempotency expectation | Launch is a local action with no business mutation. |
| Authorization implication | Destination is revealed only for assigned authorized Delivery. |
| Evidence / device implication | Maps provider, permissions and deep-link behavior remain external/device concerns. |
| Dependencies | BC-06 authorized destination; device OS/navigation integration; privacy policy. |
| Classification | V1 candidate; no API/provider implementation claim. |

### User Story

As a Driver / Delivery Operator,
I want to launch external navigation from Delivery context,
so that I can travel to the authorized destination without making a map provider part of Nexa domain authority.

### Acceptance Criteria

- Given an assigned Delivery with an authorized destination, when navigation is requested, then the device offers an external navigation handoff without exposing unrelated Tenant data.
- Given no compatible navigation app or denied location permission, when launch fails, then the Delivery remains unchanged and the error is explicit.
- Given stale or revoked assignment, when the destination is opened, then the app revalidates or hides it.
- No route, ETA or provider result may advance Delivery state or be presented as continuous tracking.

## MOB-US-029 — Capture location only within an active Delivery

| Field | Value |
|---|---|
| ID | MOB-US-029 |
| Title | Capture location only within an active Delivery |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Capture bounded location evidence only for an active authorized Delivery lifecycle. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Location evidence may queue with explicit pending state; no continuous offline stream or completion authority. |
| Idempotency expectation | Location evidence uses event/operation identity and is deduped; it does not create a Delivery transition. |
| Authorization implication | Assigned Driver, active Delivery and location consent are mandatory. |
| Evidence / device implication | API v0.17.0 does not implement continuous tracking; provider, privacy, retention and sampling remain open. |
| Dependencies | BC-06 active lifecycle; BC-11 evidence; device location permission; future API contract. |
| Classification | V1 target candidate; backend NOT IMPLEMENTED, client NOT STARTED; bounded replacement for old continuous tracking seed. |

### User Story

As a Driver / Delivery Operator,
I want to capture location only within an active Delivery,
so that authorized recipients can receive bounded operational evidence without permanent employee tracking.

### Acceptance Criteria

- Given an active assigned Delivery and consent, when a location sample is accepted by an enabled contract, then it is scoped to that Delivery/Attempt with UTC time and retention metadata.
- Given no active Delivery, revoked assignment or denied consent, when capture runs, then no location business fact is created.
- Given offline or provider failure, when a sample is queued, then it is marked pending and cannot imply ETA, completion or continuous tracking.
- This story remains PARTIAL/NOT IMPLEMENTED until API contract, privacy/retention policy, tenant isolation and Product Acceptance are evidenced.

## MOB-US-030 — Contact the Buyer from Delivery context

| Field | Value |
|---|---|
| ID | MOB-US-030 |
| Title | Contact the Buyer from Delivery context |
| Status | DEFERRED / PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V2 / deferred — no V1 commitment |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Contact an authorized Buyer through a controlled Delivery channel. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | No V1 contact authority; future channel must handle consent and audit. |
| Idempotency expectation | Contact launch has no order mutation; any message command needs a durable key. |
| Authorization implication | Driver assignment, Buyer Relationship and approved contact policy are required. |
| Evidence / device implication | Phone/WhatsApp/chat provider and personal-data policy are not established by API v0.17.0. |
| Dependencies | BC-02/06 contract, provider/security/consent decision, research. |
| Classification | V2 / deferred; explicit exclusion from API v0.17.0 client scope. |

### User Story

As a Driver / Delivery Operator,
I want to contact the Buyer from Delivery context,
so that I can resolve an arrival question through an authorized channel.

### Acceptance Criteria

- Given a future accepted contact policy and active assignment, when reactivated, then only the authorized Buyer/Delivery channel is exposed and audited.
- Given missing consent, revoked assignment or unavailable provider, when contact is requested, then no unauthorized personal contact is initiated.
- Contact activity cannot change Delivery outcome, Buyer receipt or payment state without a separate source-BC command.
- This story remains outside Mobile V1 until research, provider/security contract and Product Acceptance close the deferral.

## MOB-US-031 — Record a Delivery Attempt outcome

| Field | Value |
|---|---|
| ID | MOB-US-031 |
| Title | Record a Delivery Attempt outcome |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Record an attributable success, failure or other allowed outcome for the active Attempt. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Outcome may queue only with an explicit pending state; final lifecycle requires server acceptance. |
| Idempotency expectation | Outcome uses Attempt/operation idempotency and is safe to retry. |
| Authorization implication | Assigned Driver and valid Attempt state are mandatory. |
| Evidence / device implication | Timestamp, quantities/reason and policy evidence are captured; location is bounded, not automatic. |
| Dependencies | BC-06 Attempt/outcome contract; BC-09/11 evidence; API v0.17.0 attempts/outcomes. |
| Classification | V1 candidate; backend contract partial, client NOT STARTED. |

### User Story

As a Driver / Delivery Operator,
I want to record a Delivery Attempt outcome,
so that the supplier has an explicit physical outcome for the active Delivery.

### Acceptance Criteria

- Given an active assigned Attempt, when an allowed outcome is submitted, then the server records actor, UTC time, outcome and required quantities/reason.
- Given an invalid lifecycle, unauthorized Driver or missing required evidence, when submitted, then no outcome transition is accepted.
- Given timeout or duplicate retry, when the same operation key is reused, then the original outcome is returned and history is not overwritten.
- Given offline state, when outcome is queued, then it is visibly pending and cannot be shown as completed until server acceptance.

## MOB-US-032 — Record partial or rejected Delivery and continuation

| Field | Value |
|---|---|
| ID | MOB-US-032 |
| Title | Record partial or rejected Delivery and continuation |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Preserve delivered, rejected and remaining quantities and create a controlled continuation when required. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Draft/queued evidence only; continuation creation requires authoritative server acceptance. |
| Idempotency expectation | Outcome and continuation keys prevent duplicate continuation deliveries. |
| Authorization implication | Assigned Driver may report; continuation policy/authority belongs to BC-06. |
| Evidence / device implication | Rejection reason, quantities and evidence references are mandatory per policy. |
| Dependencies | BC-06 partial/continuation; BC-11 trace; API v0.17.0 delivery outcomes. |
| Classification | V1 candidate; backend foundation partial, client NOT STARTED. |

### User Story

As a Driver / Delivery Operator,
I want to record partial or rejected Delivery and continuation,
so that remaining obligation is explicit and no physical outcome is silently lost.

### Acceptance Criteria

- Given an active Delivery and valid quantities, when partial/rejection is accepted, then delivered, rejected, remaining and reason facts are preserved separately.
- Given remaining quantity requiring continuation, when the command commits, then one linked continuation is created according to policy and source version.
- Given invalid totals, missing reason, stale Delivery or duplicate retry, when submitted, then it rejects or returns the original result without overwriting prior facts.
- Given offline state, when the outcome is queued, then no continuation or final completion is reported before server reconciliation.

## MOB-US-033 — Capture policy-driven POD evidence

| Field | Value |
|---|---|
| ID | MOB-US-033 |
| Title | Capture policy-driven POD evidence |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-09 — Business Documents; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-13 — Business documents; CAP-15 — Business traceability |
| Goal / Outcome | Attach required immutable proof evidence to the Delivery Attempt/POD. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Evidence can queue/upload; POD finalization requires server acceptance and policy validation. |
| Idempotency expectation | Evidence/POD operation key and content hash prevent duplicate finalization. |
| Authorization implication | Assigned Driver, Attempt state and policy-required fields are checked. |
| Evidence / device implication | Photo/signature/recipient/location references are minimized; object bytes remain private and external. |
| Dependencies | BC-06 POD; BC-09 evidence metadata; BC-11 trace; Object Storage; API v0.17.0 evidence hardening. |
| Classification | V1 candidate; backend evidence foundation partial, client NOT STARTED. |

### User Story

As a Driver / Delivery Operator,
I want to capture policy-driven POD evidence,
so that the Delivery outcome is reviewable without overwriting immutable history.

### Acceptance Criteria

- Given a valid Attempt and policy, when required evidence is uploaded and accepted, then the server stores immutable metadata, hash, actor and UTC capture time.
- Given missing/invalid evidence, unauthorized actor or Object Storage failure, when finalization runs, then POD remains pending/failed and Delivery is not falsely completed.
- Given duplicate upload/finalization retry, when the same key/hash is reused, then the original result is returned without duplicate POD facts.
- Given offline capture, when evidence remains queued, then the app displays pending and never claims authoritative POD success.

## MOB-US-034 — Issue or present an ephemeral Buyer Delivery Handoff QR

| Field | Value |
|---|---|
| ID | MOB-US-034 |
| Title | Issue or present an ephemeral Buyer Delivery Handoff QR |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Present a bounded one-time handoff token that an authorized Buyer can resolve for the Delivery. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Display only an already accepted token; issue/validate is online-authoritative. |
| Idempotency expectation | Token issuance is one-time/idempotent per Delivery/Attempt; resolution rejects replay. |
| Authorization implication | Assigned Driver, Delivery, Buyer Relationship, TTL and token state are server checked. |
| Evidence / device implication | QR is ephemeral, hashed/bounded TTL and not a receipt/acceptance fact; camera is optional. |
| Dependencies | API v0.17.0 handoff-token/validation paths; BC-02 relationship; BC-11 evidence. |
| Classification | V1 candidate; backend IMPLEMENTED foundation, client NOT STARTED. |

### User Story

As a Driver / Delivery Operator,
I want to issue or present an ephemeral Buyer Delivery Handoff QR,
so that the Buyer can resolve the correct Delivery without treating the QR as acceptance.

### Acceptance Criteria

- Given an active authorized Delivery, when a token is issued, then it is bounded to the Delivery/Attempt/relationship, hashed or protected, expires and is one-time.
- Given expired, replayed, unrelated or unauthorized token, when resolved, then the API rejects it without changing Delivery or receipt state.
- Given camera/device failure, when QR presentation is unavailable, then an approved non-QR handoff path remains explicit and no fake acceptance is recorded.
- A successful QR resolution alone never creates Buyer receipt, POD, payment or Delivery completion; those require separate facts/commands.

## MOB-US-035 — Queue and synchronize critical Driver evidence safely

| Field | Value |
|---|---|
| ID | MOB-US-035 |
| Title | Queue and synchronize critical Driver evidence safely |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Operations Mobile |
| App | Operations Mobile |
| Actor | Driver / Delivery Operator |
| Epic | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Recover selected evidence after connectivity loss without fabricating authoritative success. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Selective queue for evidence/drafts only; no generic offline completion or critical authority. |
| Idempotency expectation | Every queued operation carries durable idempotency key, attempt count and server result. |
| Authorization implication | Scope and permission are revalidated on synchronization; missing scope fails closed. |
| Evidence / device implication | Secure local storage, encryption/retention and conflict UI are required; framework remains open. |
| Dependencies | BC-06/11 contracts; outbox/inbox semantics; Object Storage; API v0.17.0 reliability foundation. |
| Classification | V1 candidate; target cross-cutting safety contract, client NOT STARTED. |

### User Story

As a Driver / Delivery Operator,
I want to queue and synchronize critical Driver evidence safely,
so that connectivity loss does not lose evidence or create a false Delivery success.

### Acceptance Criteria

- Given a permitted evidence action while offline, when it is queued, then the app stores only the minimum protected payload with operation key and visible pending state.
- Given synchronization, when the server accepts the operation, then the client marks the exact result; when it rejects/conflicts, then it shows reason and preserves reviewable evidence.
- Given duplicate retry or app restart, when the queue resumes, then the same operation key prevents duplicate business facts.
- Given payment, credit, PR/SO, authorization, inventory or Delivery-finalization action, when offline, then the app never displays authoritative success.

# MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents

## MOB-US-036 — Browse the supplier catalog

| Field | Value |
|---|---|
| ID | MOB-US-036 |
| Title | Browse the supplier catalog |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Primary Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy |
| Shared Capability | CAP-04 — Catalog and commercial policy |
| Goal / Outcome | Browse only the supplier catalog visible to the authorized Buyer Relationship. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Catalog cache is read-only, freshness-labeled and cannot authorize commitment. |
| Idempotency expectation | Query only. |
| Authorization implication | Buyer Relationship and Tenant catalog visibility are server checked. |
| Evidence / device implication | Media/temperature flags are presentation data; no client Product/SKU authority. |
| Dependencies | BC-01 context; BC-02 relationship; BC-03 catalog query; Buyer Portal/API parity. |
| Classification | V1 candidate; backend query foundation exists, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to browse the supplier catalog,
so that I can choose products available through my authorized supplier relationship.

### Acceptance Criteria

- Given an active authorized relationship, when the catalog loads, then only permitted offers/SKUs are shown with freshness and Tenant scope.
- Given a suspended relationship or hidden offer, when requested, then the server denies/filters it and the app shows no private data.
- Given offline or stale cache, when an item is viewed, then it is labeled advisory and cannot imply current price, availability or order authority.
- Given repeated browsing, when queries retry, then no business state changes and no cross-tenant data is cached.

## MOB-US-037 — Review authoritative SKU price and Sellable Availability

| Field | Value |
|---|---|
| ID | MOB-US-037 |
| Title | Review authoritative SKU price and Sellable Availability |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Primary Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability |
| Shared Capability | CAP-04 — Catalog and commercial policy; CAP-07 — Availability and inventory reservation |
| Goal / Outcome | Understand current price/terms and sellable availability before building a request. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Read-only cache with source freshness; stale values cannot confirm a commitment. |
| Idempotency expectation | Query only. |
| Authorization implication | Relationship, catalog and availability policy are server-side. |
| Evidence / device implication | No client-side recomputation of price, availability or cold-chain eligibility. |
| Dependencies | BC-02/03/05 queries; API v0.17.0 SKU/lot/availability foundation. |
| Classification | V1 candidate; backend query foundation exists, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to review authoritative SKU price and Sellable Availability,
so that I can prepare a request using current supplier information.

### Acceptance Criteria

- Given an authorized Buyer Relationship, when a SKU is opened, then the app shows server-resolved price/terms, sellable availability and freshness.
- Given stale or unavailable data, when the Buyer proceeds, then the app requires refresh and cannot represent a commitment as accepted.
- Given a hidden SKU, insufficient availability or relationship mismatch, when requested, then the API returns an explicit rejection/filter.
- Given repeated query or refresh, when retried, then it is safe and does not mutate catalog or inventory.

## MOB-US-038 — Maintain a Request Draft

| Field | Value |
|---|---|
| ID | MOB-US-038 |
| Title | Maintain a Request Draft |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Primary Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-04 — Sales Commitment |
| Shared Capability | CAP-05 — Buyer shopping and drafts |
| Goal / Outcome | Build and edit a Request Draft without reserving stock or creating a PR/SO. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Local draft is allowed; server revalidates lines and authority on submission. |
| Idempotency expectation | Draft/version saves are safe; PR/Direct Order submission uses separate key. |
| Authorization implication | Relationship, SKU visibility and line policy rechecked at submit. |
| Evidence / device implication | Local data is minimal/protected; no payment credentials or server token in draft. |
| Dependencies | BC-02/03/04; buyer local persistence model; API version/conflict contract. |
| Classification | V1 candidate; backend draft foundation partial, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to maintain a Request Draft,
so that I can prepare a purchase without falsely reserving stock or confirming an order.

### Acceptance Criteria

- Given visible SKUs, when lines are edited, then the draft stores quantities and source references but creates no reservation, PR or SO.
- Given a stale draft version or changed price, when saved/submitted, then the API returns a conflict and preserves reviewable client/server versions.
- Given offline state, when the Buyer edits, then the draft is labeled local-only and critical submission remains blocked.
- Given invalid line, hidden SKU or relationship suspension, when submitted, then no commitment is created and the reason is explicit.

## MOB-US-039 — Reorder a previous purchase

| Field | Value |
|---|---|
| ID | MOB-US-039 |
| Title | Reorder a previous purchase |
| Status | DEFERRED / PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents |
| Priority | V2 / deferred — no V1 commitment |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Primary Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-04 — Sales Commitment |
| Shared Capability | CAP-05 — Buyer shopping and drafts |
| Goal / Outcome | Repopulate a new draft from a prior purchase after advanced reorder policy is accepted. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | No V1 quick-action authority; future result must refresh current price/availability. |
| Idempotency expectation | Reorder creates a new draft key, never duplicates an existing order. |
| Authorization implication | Prior history and current relationship/SKU visibility are rechecked. |
| Evidence / device implication | History may contain sensitive commercial data and requires protected local handling. |
| Dependencies | API v0.17.0 explicitly excludes advanced Buyer quick actions; BC-03/04 research. |
| Classification | V2 / deferred; no silent promotion of repeat-order UX. |

### User Story

As a Customer Buyer,
I want to reorder a previous purchase,
so that I can quickly prepare a new request when the supplier policy supports it.

### Acceptance Criteria

- Given a future accepted reorder policy and authorized history, when reactivated, then the action creates a new draft and re-resolves current SKU, price, terms and availability.
- Given inaccessible history, changed SKU or invalid current offer, when reactivated, then the item is excluded or flagged and no order is created silently.
- Given retry, when the action is repeated, then it does not duplicate a PR/SO and draft identity remains explicit.
- This story remains outside Mobile V1 until research, API contract and Product Acceptance close the deferral.

## MOB-US-040 — Submit a PR or place a Direct Order under policy

| Field | Value |
|---|---|
| ID | MOB-US-040 |
| Title | Submit a PR or place a Direct Order under policy |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Primary Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy; BC-04 — Sales Commitment; BC-05 — Inventory Availability; BC-07 — Credit & Receivables |
| Shared Capability | CAP-06 — Purchase Requests and Sales Orders |
| Goal / Outcome | Choose the explicit PR or policy-authorized Direct Order path with atomic server validation. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | No offline authoritative submit or confirmation; queued intent must remain visibly unconfirmed. |
| Idempotency expectation | Required command Idempotency-Key; retry returns original PR/SO outcome. |
| Authorization implication | Buyer Relationship, policy, price, availability and credit are revalidated. |
| Evidence / device implication | Timeout yields pending/unknown reconciliation; no client-generated order number. |
| Dependencies | BC-02/03/04/05/07; API v0.17.0 PR/direct-order/OpenAPI contract. |
| Classification | V1 candidate; backend commitment foundation exists, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to submit a PR or place a Direct Order under policy,
so that the selected commitment path is explicit and authoritative.

### Acceptance Criteria

- Given a valid draft and policy, when PR is chosen, then exactly one Purchase Request is created; when Direct Order is allowed, then exactly one Sales Order path is confirmed without a fake PR.
- Given stale price/terms, insufficient availability/credit, invalid lines or relationship loss, when submitted, then the transaction rejects atomically.
- Given timeout, when the same Idempotency-Key is retried, then the original outcome is resolved and no duplicate PR/SO exists.
- Given offline or unknown connectivity, when submit cannot be verified, then the app shows pending/unknown and never claims a commitment.

## MOB-US-041 — Respond to a material change

| Field | Value |
|---|---|
| ID | MOB-US-041 |
| Title | Respond to a material change |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Primary Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-04 — Sales Commitment; BC-05 — Inventory Availability; BC-07 — Credit & Receivables |
| Shared Capability | CAP-06 — Purchase Requests and Sales Orders |
| Goal / Outcome | Accept or reject a material change through an explicit versioned commitment decision. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Decision requires online authority; draft/review may be cached. |
| Idempotency expectation | Accept/reject uses command key and commitment version; duplicate result is stable. |
| Authorization implication | Current Buyer Relationship and commitment ownership are required. |
| Evidence / device implication | Changed lines/price/availability/credit summary is shown before decision; no silent replacement. |
| Dependencies | BC-03/04/05/07; API material-change contract; notification deep link may be stale. |
| Classification | V1 candidate; backend partial, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to respond to a material change,
so that my commitment reflects an explicit accept or reject decision.

### Acceptance Criteria

- Given a current authorized proposal, when accepted, then the server applies the exact versioned change atomically and returns the new commitment state.
- Given rejection, stale version, changed credit/availability or relationship loss, when submitted, then the original commitment remains intact and the reason is visible.
- Given duplicate retry or stale notification link, when acted on, then no second transition occurs and the app refreshes current state.
- Given offline state, when a response is attempted, then it is not shown as accepted/rejected until server confirmation.

## MOB-US-042 — Review PR/SO status, history and Business Documents

| Field | Value |
|---|---|
| ID | MOB-US-042 |
| Title | Review PR/SO status, history and Business Documents |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Primary Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-04 — Sales Commitment; BC-09 — Business Documents; BC-11 — Business Traceability |
| Shared Capability | CAP-06 — Purchase Requests and Sales Orders; CAP-13 — Business documents; CAP-15 — Business traceability |
| Goal / Outcome | Review authoritative commitment lifecycle and authorized issued documents. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Cached history is read-only and freshness-labeled; document download reauthorizes online. |
| Idempotency expectation | Queries/download retries do not mutate order or document facts. |
| Authorization implication | Buyer Relationship, document ownership and object access are checked server-side. |
| Evidence / device implication | Private document bytes remain behind API/Object Storage authorization; no unrestricted local copy. |
| Dependencies | BC-02/04/09/11; API document/history contracts; Portal parity. |
| Classification | V1 candidate; backend read/document foundation partial, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to review PR/SO status, history and Business Documents,
so that I can understand authorized commercial progress and retrieve issued evidence.

### Acceptance Criteria

- Given an authorized Buyer Relationship, when history loads, then PR/SO state, version and immutable history are shown without client rewrites.
- Given an issued document, when opened/downloaded, then API authorization is rechecked and metadata/source revision is visible.
- Given stale, unavailable or revoked access, when requested, then the app shows the limitation or denial and never exposes a private object.
- Given repeated refresh/download, when retried, then no order, document or trace fact is duplicated or mutated.

## MOB-US-043 — Review Credit/Receivables and report allowed Payment evidence

| Field | Value |
|---|---|
| ID | MOB-US-043 |
| Title | Review Credit/Receivables and report allowed Payment evidence |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-07 — Credit & Receivables |
| Primary Bounded Context | BC-07 — Credit & Receivables |
| Relevant Bounded Contexts | BC-07 — Credit & Receivables; BC-08 — Payments |
| Shared Capability | CAP-11 — Credit and receivables; CAP-12 — Payments and correction |
| Goal / Outcome | Review financial state and report permitted payment evidence without confusing it with confirmation. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Read may cache; payment report/confirmation requires online authority and provider/manual policy. |
| Idempotency expectation | Payment report/provider event uses durable key and inbox dedupe; retry resolves original state. |
| Authorization implication | Buyer Relationship, financial visibility, amount/currency and payment policy are server checked. |
| Evidence / device implication | No raw payment credentials in local storage/logs; payment evidence is immutable metadata. |
| Dependencies | BC-07/08; API payment/receivable contract; provider/reconciliation production gate. |
| Classification | V1 candidate; backend foundation partial, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to review Credit/Receivables and report allowed Payment evidence,
so that I can understand what is due without falsely confirming a payment.

### Acceptance Criteria

- Given an authorized relationship, when finance is opened, then credit/receivable state, currency, freshness and source are shown with minimized data.
- Given a permitted payment report, when submitted, then the server records `Payment Reported` separately from `Payment Confirmed`.
- Given duplicate provider/manual evidence, stale credit, invalid amount/currency or unauthorized access, when submitted, then it rejects/dedupes without double application.
- Given offline state, when payment or credit action is attempted, then no confirmed payment, credit decision or receivable application is shown.

# MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization

## MOB-US-044 — Register/refresh a Push Subscription and receive critical notifications

| Field | Value |
|---|---|
| ID | MOB-US-044 |
| Title | Register/refresh a Push Subscription and receive critical notifications |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile; Operations Mobile |
| App | Buyer Mobile; Operations Mobile |
| Actor | Mobile User |
| Epic | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-10 — Notifications |
| Primary Bounded Context | BC-10 — Notifications |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-10 — Notifications |
| Shared Capability | CAP-14 — Notifications |
| Goal / Outcome | Manage a provider-neutral device subscription and receive authorized critical notifications. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Subscription registration/disable requires online authority; already delivered notifications may be read locally. |
| Idempotency expectation | Register/rotate/disable/unregister is keyed by device/subscription identity and safe to retry. |
| Authorization implication | Recipient, Tenant/Relationship, device ownership and notification policy are checked. |
| Evidence / device implication | API v0.17.0 provides subscription/retry/dead-letter foundation; native provider/config/credentials remain deferred. |
| Dependencies | BC-01/10; provider-neutral API v0.17.0; secure device storage; notification preferences. |
| Classification | V1 candidate; backend IMPLEMENTED foundation, native client/provider NOT STARTED. |

### User Story

As a Mobile User,
I want to register or refresh a Push Subscription and receive critical notifications,
so that authorized delivery or commitment changes reach the right device without changing business truth.

### Acceptance Criteria

- Given an authorized device and recipient scope, when subscription registration succeeds, then the server stores a safe subscription reference and lifecycle state.
- Given rotation, disable, unregister, invalid token or provider failure, when processed, then the subscription state is explicit and retry/dead-letter is visible.
- Given a source business fact, when notification delivery fails or duplicates, then source PR/SO/payment/Delivery state is unchanged and recipients can refresh.
- Given missing authorization or offline registration, when attempted, then no subscription is activated and no raw token/secret is logged.

## MOB-US-045 — Track an active Driver on a map

| Field | Value |
|---|---|
| ID | MOB-US-045 |
| Title | Track an active Driver on a map |
| Status | DEFERRED / PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization |
| Priority | V2 / deferred — no V1 commitment |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | View bounded active-delivery location when privacy, API and Product policy are accepted. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | No V1 map authority; stale location cannot imply ETA or active tracking. |
| Idempotency expectation | Query/read projection only; location ingestion must be deduped by source. |
| Authorization implication | Buyer Relationship, active Delivery and disclosure consent are required. |
| Evidence / device implication | Superseded for V1 by bounded MOB-US-029; API v0.17.0 excludes GPS/live tracking/ETA/geofencing. |
| Dependencies | MOB-US-029; BC-06/11 location contract; privacy/retention/provider decision. |
| Classification | V2 / deferred; historical seed retained, no V1 continuous tracking. |

### User Story

As a Customer Buyer,
I want to track an active Driver on a map,
so that I can estimate arrival using authorized active Delivery information.

### Acceptance Criteria

- Given a future accepted bounded-location contract, when an authorized Buyer opens an active Delivery, then only scoped location/freshness is shown.
- Given no active Delivery, missing consent, stale data or relationship loss, when opened, then the map is unavailable and no location is disclosed.
- A map or provider result cannot change Delivery, receipt, POD or payment state.
- This story remains outside Mobile V1 until research, API/provider/privacy evidence and Product Acceptance close the deferral; V1 uses bounded MOB-US-029 instead.

## MOB-US-046 — Contact the Driver

| Field | Value |
|---|---|
| ID | MOB-US-046 |
| Title | Contact the Driver |
| Status | DEFERRED / PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization |
| Priority | V2 / deferred — no V1 commitment |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Contact the assigned Driver through a controlled authorized channel. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | No V1 contact channel; future provider must be consented and auditable. |
| Idempotency expectation | Contact launch is not a Delivery mutation; messaging requires a durable key if accepted. |
| Authorization implication | Active Delivery, Buyer Relationship and channel policy are mandatory. |
| Evidence / device implication | API v0.17.0 excludes chat/phone/WhatsApp client UX; personal contact data is protected. |
| Dependencies | BC-02/06, provider/security/consent decision, research. |
| Classification | V2 / deferred; not a hidden Notifications or Chat BC. |

### User Story

As a Customer Buyer,
I want to contact the Driver,
so that I can resolve an arrival question through an authorized Delivery channel.

### Acceptance Criteria

- Given a future accepted channel policy and active Delivery, when reactivated, then only the authorized contact action is available and its use is auditable.
- Given no active Delivery, missing consent or unavailable provider, when requested, then no unauthorized contact is initiated.
- Contact cannot mutate Driver outcome, Buyer receipt, payment or Delivery state without a separate command.
- This story remains outside Mobile V1 until research, provider/security contract and Product Acceptance close the deferral.

## MOB-US-047 — Scan and resolve a Delivery Handoff QR

| Field | Value |
|---|---|
| ID | MOB-US-047 |
| Title | Scan and resolve a Delivery Handoff QR |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Resolve a Driver-presented ephemeral token to the authorized Delivery and handoff context. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | QR scan may parse locally, but token resolution is online-authoritative and replay-safe. |
| Idempotency expectation | Resolution is one-time; repeated token use returns explicit replay/consumed state. |
| Authorization implication | Buyer Relationship, Delivery, expiry, token hash and tenant scope are checked. |
| Evidence / device implication | Camera permission failure offers explicit non-QR path; QR is not acceptance. |
| Dependencies | API v0.17.0 handoff validation; BC-02 relationship; BC-06 token; BC-11 trace. |
| Classification | V1 candidate; backend IMPLEMENTED foundation, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to scan and resolve a Delivery Handoff QR,
so that I can associate the Driver handoff with the Delivery I am receiving.

### Acceptance Criteria

- Given a valid unexpired token and authorized relationship, when scanned, then the app shows the matching Delivery/Attempt context without exposing unrelated data.
- Given expired, replayed, malformed, unrelated or unauthorized token, when scanned, then the API rejects it and changes no receipt/Delivery state.
- Given camera permission denial or offline state, when scanning cannot resolve, then the app shows an explicit retry/manual path and no success.
- QR resolution alone never confirms receipt, accepts quantities, creates POD or confirms payment.

## MOB-US-048 — Review handoff and confirm received quantities

| Field | Value |
|---|---|
| ID | MOB-US-048 |
| Title | Review handoff and confirm received quantities |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Create a separate Buyer receipt fact for quantities actually received after handoff. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Review may cache; receipt confirmation requires online server authority. |
| Idempotency expectation | Buyer receipt key is durable and one-time per Delivery/receipt version. |
| Authorization implication | Buyer Relationship, handoff token and Delivery state are revalidated. |
| Evidence / device implication | Buyer acceptance is separate from Driver offered/POD facts; quantities/reason are immutable evidence. |
| Dependencies | API v0.17.0 Buyer receipt fact; BC-02/06/11; handoff resolution MOB-US-047. |
| Classification | V1 candidate; backend IMPLEMENTED foundation, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to review the handoff and confirm received quantities,
so that the supplier receives a separate truthful Buyer receipt fact.

### Acceptance Criteria

- Given a valid authorized handoff, when quantities are confirmed, then one immutable Buyer receipt fact records accepted quantities, actor, UTC time and Delivery reference.
- Given quantities differ from Driver-offered quantities, when submitted, then accepted/rejected/disputed amounts remain separate and the Driver history is not overwritten.
- Given duplicate, stale, expired handoff or unauthorized relationship, when submitted, then it rejects or returns the original receipt result without a second fact.
- Given offline state, when confirmation is attempted, then no Buyer receipt success is shown until server acceptance.

## MOB-US-049 — Report Buyer discrepancy and preserve receipt fact

| Field | Value |
|---|---|
| ID | MOB-US-049 |
| Title | Report Buyer discrepancy and preserve receipt fact |
| Status | PROPOSED / RESEARCH VALIDATION PENDING |
| Product | Mobile |
| Surface | Buyer Mobile |
| App | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization |
| Priority | V1 candidate — Product Acceptance pending |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Primary Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Record discrepancy/rejection against the Buyer receipt without rewriting offered or delivered history. |
| Research status | PROPOSED / RESEARCH VALIDATION PENDING |
| Offline expectation | Draft may queue; discrepancy fact and any resolution require server acceptance. |
| Idempotency expectation | Discrepancy key is durable/deduped per receipt/Delivery version. |
| Authorization implication | Buyer Relationship, handoff and discrepancy policy are server checked. |
| Evidence / device implication | Reason, quantities and evidence references are append-only; full dispute/returns/RMA remain outside V1. |
| Dependencies | API v0.17.0 Buyer receipt/discrepancy; BC-02/06/11; Object Storage evidence. |
| Classification | V1 candidate; backend IMPLEMENTED foundation, client NOT STARTED. |

### User Story

As a Customer Buyer,
I want to report a Buyer discrepancy and preserve the receipt fact,
so that an operational follow-up can resolve the difference without losing history.

### Acceptance Criteria

- Given an authorized handoff/receipt context, when discrepancy is submitted, then the server records reason, affected quantities, actor, UTC time and evidence references.
- Given a mismatch between Driver outcome and Buyer receipt, when recorded, then both facts remain immutable and the difference is visible for operations follow-up.
- Given duplicate retry, missing reason/evidence, stale token or unauthorized relationship, when submitted, then it rejects/dedupes without mutating prior receipt/POD facts.
- Given offline state, when discrepancy is queued, then it is visibly pending and no resolution, refund, receivable or Delivery completion is implied.
