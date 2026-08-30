---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-30
---

# Master Mobile Functional Story Registry

This file is the single canonical story-body authority for the Mobile Product
Backlog. It preserves `MOB-US-001..049` and adds only independently valuable
outcomes as `MOB-US-050+`. Release, Sprint and lifecycle views are projections
in [master-mobile-backlog.md](master-mobile-backlog.md),
[release-roadmap.md](release-roadmap.md) and [sprint-plan.md](sprint-plan.md);
they do not duplicate story bodies.

The current Product direction keeps exactly 28 stories in V1. The remaining
historical stories and new outcomes are deliberately classified as V2, V3 or
V4/Future. This is a Product projection over the accepted eleven Bounded
Contexts; Mobile, Driver, Scanner, QR, Device, Push, Location and Offline are
not Bounded Contexts.

## Current Epic model

| Epic | Name | Stories | Scope |
|---|---|---|---|
| MOBILE-EPIC-01 | Safe Access & Work Context | MOB-US-001, MOB-US-002, MOB-US-003 | V1 |
| MOBILE-EPIC-02 | Warehouse Receiving, Identification & Picking | MOB-US-011, MOB-US-012, MOB-US-013, MOB-US-014, MOB-US-015, MOB-US-016, MOB-US-017, MOB-US-019 | V1 |
| MOBILE-EPIC-03 | Dispatch Preparation & Handoff | MOB-US-020, MOB-US-021, MOB-US-022, MOB-US-023, MOB-US-024, MOB-US-025 | V1 |
| MOBILE-EPIC-04 | Driver Delivery Execution & Proof | MOB-US-026, MOB-US-027, MOB-US-028, MOB-US-031, MOB-US-032, MOB-US-033, MOB-US-034 | V1 |
| MOBILE-EPIC-05 | Delivery Handoff, Buyer Receipt & Critical Updates | MOB-US-044, MOB-US-047, MOB-US-048, MOB-US-049 | V1 |
| MOBILE-EPIC-06 | Commercial & Operational Mobile Convenience | MOB-US-004, MOB-US-005, MOB-US-006, MOB-US-007, MOB-US-008, MOB-US-009, MOB-US-010, MOB-US-036, MOB-US-037, MOB-US-038, MOB-US-039, MOB-US-040, MOB-US-041, MOB-US-042, MOB-US-043 | V2+ |
| MOBILE-EPIC-07 | Advanced Field Mobility & Offline Operations | MOB-US-018, MOB-US-029, MOB-US-030, MOB-US-035, MOB-US-045, MOB-US-046 | V2+ |
| MOBILE-EPIC-08 | Warehouse Transfer & Inventory Accuracy | MOB-US-050, MOB-US-051, MOB-US-052, MOB-US-053, MOB-US-054, MOB-US-055, MOB-US-056 | V2/V3 |
| MOBILE-EPIC-09 | Dispatch Exception & Delivery Coordination | MOB-US-057, MOB-US-058, MOB-US-059, MOB-US-060, MOB-US-061, MOB-US-062, MOB-US-063, MOB-US-064, MOB-US-065, MOB-US-066 | V2/V3 |
| MOBILE-EPIC-10 | Buyer Delivery Continuity | MOB-US-067, MOB-US-068, MOB-US-069 | V2 |
| MOBILE-EPIC-11 | Mobile Commercial & Financial Follow-through | MOB-US-070, MOB-US-071, MOB-US-072 | V2/V3 |
| MOBILE-EPIC-12 | Future Intelligent Field Operations | MOB-US-073 | V4/Future |

V1 is online-first. A person may retain a harmless draft, safe read cache or
temporary evidence while disconnected, but no disconnected action creates
authoritative inventory, allocation, dispatch, Delivery, receipt, payment,
credit, Purchase Request or Sales Order truth. Location in V1 means an
external navigation handoff only. Research and Product Acceptance remain open;
these criteria do not claim implementation or production readiness. V2 is
refinement-ready, V3 is roadmap-ready and V4/Future remains hypothesis-level.

## Story catalog

## MOB-US-001 — Continue authorized work safely after returning to Nexa

| Field | Value |
|---|---|
| ID | MOB-US-001 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile; Buyer Mobile |
| Actor | Mobile User |
| Epic | MOBILE-EPIC-01 — Safe Access & Work Context |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Continue authorized work safely after returning to Nexa |
| Owning Bounded Context | BC-01 — Tenant & Access Governance |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance |
| Shared Capability | CAP-01 — Tenant, workspace and access governance |
| Goal / Outcome | Return to permitted work without exposing protected information after identity is checked. |
| Research status | PENDING |
| Connectivity and authority | Connected confirmation is required; local session material is not authority. |

### User Story

As a Mobile User,
I want to continue authorized work safely after returning to Nexa,
so that I can resume my work without exposing protected information.

### Acceptance Criteria

- Scenario: Valid return — Given a valid, non-revoked session, when the person returns to Nexa, then Nexa confirms identity and exposes only permitted work.
- Scenario: Expired return — Given an expired, revoked or malformed session, when the person returns, then Nexa requests identity again and exposes no protected information.
- Scenario: Unavailable confirmation — Given identity cannot be confirmed, when the person returns without a connection, then Nexa states that work is unavailable and exposes no protected information.
- Scenario: Safe retry — Given the person retries the same return, when Nexa processes it, then no business action is duplicated and no secret is revealed.

## MOB-US-002 — Work in the intended company and business context

| Field | Value |
|---|---|
| ID | MOB-US-002 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile; Buyer Mobile |
| Actor | Mobile User |
| Epic | MOBILE-EPIC-01 — Safe Access & Work Context |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Work in the intended company and business context |
| Owning Bounded Context | BC-01 — Tenant & Access Governance |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-01 — Tenant, workspace and access governance |
| Goal / Outcome | Make the selected Tenant, Workspace or Buyer Relationship explicit before work begins. |
| Research status | PENDING |
| Connectivity and authority | Context confirmation is connected and fresh; previous-scope data cannot cross a switch. |

### User Story

As a Mobile User,
I want to work in the intended company and business context,
so that every task concerns the company and relationship I mean to serve.

### Acceptance Criteria

- Scenario: One authorized context — Given one authorized context exists, when the person starts work, then Nexa uses that context for every permitted read and action.
- Scenario: Several authorized contexts — Given several contexts exist, when the person chooses one, then Nexa confirms the choice before showing protected work.
- Scenario: Context no longer valid — Given a context is suspended or unauthorized, when the person chooses it, then Nexa rejects it and exposes no scoped business information.
- Scenario: Context change — Given the person changes context, when the change succeeds, then information from the previous context cannot be used in the new context.

## MOB-US-003 — See only work permitted for the person's role

| Field | Value |
|---|---|
| ID | MOB-US-003 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile; Buyer Mobile |
| Actor | Mobile User |
| Epic | MOBILE-EPIC-01 — Safe Access & Work Context |
| Priority | V1 candidate — Product Acceptance pending |
| Title | See only work permitted for the person's role |
| Owning Bounded Context | BC-01 — Tenant & Access Governance |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance |
| Shared Capability | CAP-02 — Role and capability authorization |
| Goal / Outcome | Expose only work allowed by the person's active role, membership and relationship. |
| Research status | PENDING |
| Connectivity and authority | Permission information is advisory until Nexa confirms the action. |

### User Story

As a Mobile User,
I want to see only work permitted for my role,
so that I do not attempt work that my role or relationship does not allow.

### Acceptance Criteria

- Scenario: Permitted work — Given the person's role permits a task, when Nexa confirms the role, then the person can carry out that task in the active context.
- Scenario: Missing permission — Given the person's role does not permit a task, when the person attempts it, then Nexa refuses it even if old information suggests otherwise.
- Scenario: Permission changes — Given permission changes, when Nexa checks the person's role again, then unavailable work is no longer accepted.
- Scenario: Unconfirmed permission — Given permission cannot be checked, when the person attempts a task, then Nexa blocks the task and states that confirmation is required.

## MOB-US-004 — Review operational work at a glance

| Field | Value |
|---|---|
| ID | MOB-US-004 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Business Operations Manager |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Review operational work at a glance |
| Owning Bounded Context | BC-11 — Business Traceability |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-11 — Business Traceability |
| Shared Capability | CAP-16 — Operational visibility |
| Goal / Outcome | Prioritize work from an accepted, reliable operational view. |
| Research status | PENDING |
| Connectivity and authority | Deferred until the operational projection and freshness rules are accepted. |

### User Story

As a Business Operations Manager,
I want to review operational work at a glance,
so that I can prioritize work from current and trustworthy facts.

### Acceptance Criteria

- Scenario: Future view — Given an accepted future operational view, when the manager reviews it, then every item states its context and freshness.
- Scenario: Incomplete facts — Given source facts are missing or stale, when the manager reviews the view, then the limitation is explicit and no total is invented.
- Scenario: Unauthorized scope — Given the manager lacks scope permission, when the view is requested, then no private operational information is exposed.
- Scenario: Deferral — Given the required view is not accepted, when this story is considered, then it remains outside Mobile V1.

## MOB-US-005 — Notice critical operational exceptions

| Field | Value |
|---|---|
| ID | MOB-US-005 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Business Operations Manager |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Notice critical operational exceptions |
| Owning Bounded Context | BC-11 — Business Traceability |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-11 — Business Traceability |
| Shared Capability | CAP-16 — Operational visibility |
| Goal / Outcome | Notice accepted exceptions that need an authorized operational response. |
| Research status | PENDING |
| Connectivity and authority | Deferred until exception meaning, ownership and response rules are accepted. |

### User Story

As a Business Operations Manager,
I want to notice critical operational exceptions,
so that I can address blocked work before it delays a customer or delivery.

### Acceptance Criteria

- Scenario: Accepted exception — Given a future accepted exception view, when the manager reviews an item, then its scope, severity and owning work are clear.
- Scenario: Incomplete exception — Given exception facts are incomplete, when the item is reviewed, then it is marked incomplete and not treated as a new business state.
- Scenario: Authorized response — Given an exception needs correction, when the manager follows it, then Nexa directs the person to the authorized owning work.
- Scenario: Deferral — Given the exception view is not accepted, when this story is considered, then it remains outside Mobile V1.

## MOB-US-006 — Find a customer and buyer relationship

| Field | Value |
|---|---|
| ID | MOB-US-006 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Find a customer and buyer relationship |
| Owning Bounded Context | BC-02 — Customer & Buyer Relationships |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-03 — Customer accounts and Buyer relationships |
| Goal / Outcome | Open the correct permitted customer relationship for future commercial work. |
| Research status | PENDING |
| Connectivity and authority | Deferred; customer data remains governed by relationship and Tenant scope. |

### User Story

As a Sales Representative,
I want to find a customer and buyer relationship,
so that I can work with the correct customer in a future mobile flow.

### Acceptance Criteria

- Scenario: Authorized customer — Given an authorized relationship, when the representative searches, then only permitted customers are returned.
- Scenario: Unrelated customer — Given a customer is unrelated or suspended, when the representative opens it, then protected work is unavailable.
- Scenario: No reliable result — Given the search is empty or unavailable, when it completes, then no customer is guessed or exposed.
- Scenario: Deferral — Given commercial access is not part of V1, when this story is considered, then it remains deferred.

## MOB-US-007 — Review products, prices and availability

| Field | Value |
|---|---|
| ID | MOB-US-007 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Review products, prices and availability |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-05 — Inventory Availability |
| Shared Capability | CAP-04 — Catalog and commercial policy |
| Goal / Outcome | Prepare future demand from current product, commercial and availability information. |
| Research status | PENDING |
| Connectivity and authority | Deferred; price and availability remain separate authoritative concerns. |

### User Story

As a Sales Representative,
I want to review products, prices and availability,
so that I can prepare future customer demand from trustworthy information.

### Acceptance Criteria

- Scenario: Authorized product — Given an authorized customer relationship, when a product is reviewed, then permitted price and availability information is shown with freshness.
- Scenario: Unavailable product — Given a product is hidden or unavailable, when it is requested, then it cannot be treated as a commitment.
- Scenario: Changed information — Given price or availability changes, when the representative continues, then Nexa requires current confirmation.
- Scenario: Deferral — Given commercial review is outside V1, when this story is considered, then it remains deferred.

## MOB-US-008 — Prepare a customer request

| Field | Value |
|---|---|
| ID | MOB-US-008 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Prepare a customer request |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy |
| Shared Capability | CAP-05 — Buyer shopping and drafts |
| Goal / Outcome | Assemble a future customer intention without turning preparation into a commitment. |
| Research status | PENDING |
| Connectivity and authority | Deferred; a draft never reserves stock or confirms an order. |

### User Story

As a Sales Representative,
I want to prepare a customer request,
so that I can organize an intention before an authorized submission.

### Acceptance Criteria

- Scenario: Draft preparation — Given permitted products are known, when the representative prepares a request, then quantities remain an intention and create no commitment.
- Scenario: Changed information — Given product or customer information changes, when the request is reviewed, then the change is visible before submission.
- Scenario: Local draft — Given the person loses connection, when the request is edited, then it remains an unconfirmed draft.
- Scenario: Deferral — Given field commercial preparation is outside V1, when this story is considered, then it remains deferred.

## MOB-US-009 — Submit a purchase request from field work

| Field | Value |
|---|---|
| ID | MOB-US-009 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Submit a purchase request from field work |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-07 — Credit & Receivables |
| Shared Capability | CAP-06 — Purchase Requests and Sales Orders |
| Goal / Outcome | Send field demand through the same authoritative commitment rules used elsewhere. |
| Research status | PENDING |
| Connectivity and authority | Deferred; no disconnected Purchase Request success is allowed. |

### User Story

As a Sales Representative,
I want to submit a purchase request from field work,
so that customer demand enters an authorized commitment process.

### Acceptance Criteria

- Scenario: Valid request — Given an accepted request and authorized relationship, when the representative submits it, then one Purchase Request is recorded.
- Scenario: Invalid request — Given information is stale or authorization is missing, when the representative submits it, then no partial commitment is recorded.
- Scenario: Uncertain result — Given the outcome is unknown, when the representative retries, then Nexa resolves the first result without creating a second request.
- Scenario: Deferral — Given field submission is outside V1, when this story is considered, then it remains deferred.

## MOB-US-010 — Follow customer commitments and credit

| Field | Value |
|---|---|
| ID | MOB-US-010 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Follow customer commitments and credit |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-07 — Credit & Receivables; BC-11 — Business Traceability |
| Shared Capability | CAP-06 — Purchase Requests and Sales Orders |
| Goal / Outcome | Follow authorized customer commercial progress without making a credit decision locally. |
| Research status | PENDING |
| Connectivity and authority | Deferred; credit and commitment authority remain outside the mobile surface. |

### User Story

As a Sales Representative,
I want to follow customer commitments and credit,
so that I understand authorized customer progress while away from Platform.

### Acceptance Criteria

- Scenario: Authorized progress — Given an authorized relationship, when progress is reviewed, then commitment and relevant credit facts show their freshness.
- Scenario: Incomplete finance facts — Given financial facts are stale or incomplete, when they are reviewed, then the limitation is explicit and no decision is invented.
- Scenario: Relationship loss — Given the relationship is no longer authorized, when progress is requested, then protected facts are not exposed.
- Scenario: Deferral — Given this convenience is outside V1, when this story is considered, then it remains deferred.

## MOB-US-011 — Identify a product from a package or label code

| Field | Value |
|---|---|
| ID | MOB-US-011 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Identify a product from a package or label code |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-03 — Catalog & Commercial Policy |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Identify the correct product before the warehouse operator handles stock. |
| Research status | PENDING |
| Connectivity and authority | Online confirmation is required before physical facts are recorded. |

### User Story

As a Warehouse Operator,
I want to identify a product from a package or label code,
so that I handle the correct product during warehouse work.

### Acceptance Criteria

- Scenario: One match — Given a permitted package or label code has one match, when the operator provides it, then Nexa identifies the product before any stock action.
- Scenario: Unknown code — Given the code is unknown, ambiguous or outside the person's scope, when the operator provides it, then Nexa rejects it and does not guess.
- Scenario: Camera unavailable — Given the camera or scanner is unavailable, when the operator cannot provide a code, then the operator can use the manual product search.
- Scenario: Repeat identification — Given the operator provides the same code again, when Nexa resolves it, then no receipt or pick fact is created by identification alone.

## MOB-US-012 — Find a product manually when scanning is unavailable

| Field | Value |
|---|---|
| ID | MOB-US-012 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Find a product manually when scanning is unavailable |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-03 — Catalog & Commercial Policy |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Continue safe product identification when a package or label cannot be scanned. |
| Research status | PENDING |
| Connectivity and authority | Manual selection remains unverified until Nexa confirms the product. |

### User Story

As a Warehouse Operator,
I want to find a product manually when scanning is unavailable,
so that I can continue safe work without guessing the product.

### Acceptance Criteria

- Scenario: Exact match — Given an exact permitted product is found, when the operator selects it, then Nexa identifies the product for the next step.
- Scenario: Ambiguous match — Given several products could match, when the operator searches, then Nexa requires a clear choice and records no stock fact.
- Scenario: No connection — Given the operator has no connection, when a product cannot be confirmed, then Nexa marks the choice unverified and blocks authoritative stock work.
- Scenario: Repeat selection — Given the operator selects the same product again, when the selection is repeated, then no receipt or pick fact is duplicated.

## MOB-US-013 — Record stock that has just arrived

| Field | Value |
|---|---|
| ID | MOB-US-013 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Record stock that has just arrived |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Make a valid inbound arrival part of authoritative stock only after warehouse checks. |
| Research status | PENDING |
| Connectivity and authority | Connected confirmation is required; an unconfirmed arrival cannot increase sellable stock. |

### User Story

As a Warehouse Operator,
I want to record stock that has just arrived,
so that the warehouse has a trustworthy record of received stock.

### Acceptance Criteria

- Scenario: Valid arrival — Given the operator has permission and provides a product, lot and positive quantity, when the arrival is recorded, then Nexa records one received-stock fact.
- Scenario: Invalid arrival — Given required arrival information is missing or invalid, when the operator records it, then Nexa records no partial stock change.
- Scenario: Uncertain result — Given the outcome is unknown, when the operator retries the same arrival, then Nexa returns the original result without doubling stock.
- Scenario: No connection — Given the operator has no connection, when the arrival cannot be confirmed, then Nexa shows an unconfirmed state and does not report received stock as authoritative.

## MOB-US-014 — Record the actual lot, expiry and quantity

| Field | Value |
|---|---|
| ID | MOB-US-014 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Record the actual lot, expiry and quantity |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations; CAP-15 — Business traceability |
| Goal / Outcome | Preserve the physical lot facts needed for safe availability and FEFO. |
| Research status | PENDING |
| Connectivity and authority | The arrival is not sellable until Nexa confirms the lot facts. |

### User Story

As a Warehouse Operator,
I want to record the actual lot, expiry and quantity,
so that future picking uses what physically arrived.

### Acceptance Criteria

- Scenario: Complete lot facts — Given the operator provides a valid lot, expiry and positive quantity, when the arrival is confirmed, then Nexa preserves those facts for the received stock.
- Scenario: Invalid expiry — Given expiry is missing, malformed or not acceptable, when the operator records it, then Nexa rejects the arrival and creates no sellable stock.
- Scenario: Duplicate arrival — Given the same arrival is submitted again, when Nexa receives it, then one arrival remains recorded and quantity is not doubled.
- Scenario: Local preparation — Given the operator loses connection, when lot facts are drafted, then they remain unconfirmed and cannot make stock sellable.

## MOB-US-015 — Check current lot and stock condition before physical work

| Field | Value |
|---|---|
| ID | MOB-US-015 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Check current lot and stock condition before physical work |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability |
| Shared Capability | CAP-07 — Availability and inventory reservation |
| Goal / Outcome | Distinguish physical, sellable, held and quarantined stock before handling it. |
| Research status | PENDING |
| Connectivity and authority | Read information carries freshness; a stale view cannot authorize physical work. |

### User Story

As a Warehouse Operator,
I want to check the current lot and stock condition before physical work,
so that I choose stock that is safe and available for the task.

### Acceptance Criteria

- Scenario: Current stock — Given the operator has permission, when stock is checked, then physical quantity, sellable quantity, lot and condition are distinct.
- Scenario: Restricted lot — Given stock is expired, held, quarantined or allocated, when it is checked, then it is not treated as freely sellable.
- Scenario: Stale information — Given stock information is stale or unavailable, when the operator begins work, then Nexa requires a current confirmation.
- Scenario: Other scope — Given the lot belongs to another company or warehouse, when it is checked, then no quantity or lot fact is exposed.

## MOB-US-016 — Pick the correct lot and quantity for prepared work

| Field | Value |
|---|---|
| ID | MOB-US-016 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Pick the correct lot and quantity for prepared work |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Pick the allocated lot by FEFO without exceeding the prepared quantity. |
| Research status | PENDING |
| Connectivity and authority | Nexa confirms allocation, lot eligibility and remaining quantity before the pick is authoritative. |

### User Story

As a Warehouse Operator,
I want to pick the correct lot and quantity for prepared work,
so that the delivery receives the stock that was actually prepared.

### Acceptance Criteria

- Scenario: FEFO pick — Given an active allocation and eligible lots, when the operator picks the earliest suitable lot, then Nexa records the pick against that lot and quantity.
- Scenario: Unsafe pick — Given a lot is unknown, expired, quarantined or not allocated, when the operator picks it, then Nexa rejects the pick without consuming stock.
- Scenario: Too much stock — Given the requested quantity exceeds the remaining allocation, when the operator picks it, then Nexa rejects the excess and preserves the remaining quantity.
- Scenario: Repeat pick — Given the outcome is unknown, when the operator retries the same pick, then Nexa returns one result and does not consume stock twice.

## MOB-US-017 — Report a physical discrepancy or authorized stock disposition

| Field | Value |
|---|---|
| ID | MOB-US-017 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Report a physical discrepancy or authorized stock disposition |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations; CAP-15 — Business traceability |
| Goal / Outcome | Preserve a physical difference or authorized disposition without erasing stock history. |
| Research status | PENDING |
| Connectivity and authority | A disconnected note may be staged, but stock changes require confirmation. |

### User Story

As a Warehouse Operator,
I want to report a physical discrepancy or authorized stock disposition,
so that an exception remains visible without erasing what happened.

### Acceptance Criteria

- Scenario: Observed difference — Given the operator observes a difference, when the authorized report is accepted, then offered, picked and remaining quantities stay separately recorded.
- Scenario: Missing authority — Given permission, reason or required evidence is missing, when the operator reports the difference, then Nexa records no unauthorized stock change.
- Scenario: Repeat report — Given the outcome is unknown, when the operator retries the same report, then Nexa preserves one discrepancy fact.
- Scenario: Disconnected note — Given the operator has no connection, when a report is drafted, then it is marked unconfirmed and cannot change sellable stock.

## MOB-US-018 — Move stock between warehouse locations

| Field | Value |
|---|---|
| ID | MOB-US-018 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-07 — Advanced Field Mobility & Offline Operations |
| Priority | V2 / deferred — no V1 commitment |
| Title | Move stock between warehouse locations |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Move stock between authorized locations while preserving source, destination, lot and quantity facts. Cycle counts are tracked separately in MOB-US-053. |
| Research status | PENDING |
| Connectivity and authority | Deferred; no disconnected movement or count correction is authoritative. |

### User Story

As a Warehouse Operator,
I want to move stock between warehouse locations,
so that physical movement remains attributable from source to destination.

### Acceptance Criteria

- Scenario: Authorized movement — Given an authorized source, destination, lot and quantity exist, when the operator starts a transfer, then Nexa preserves those facts for review.
- Scenario: Missing transfer fact — Given a required source, destination, lot or reason is missing, when the operator starts a transfer, then Nexa leaves stock unchanged.
- Scenario: Destination mismatch — Given the destination cannot accept the transfer, when the operator records it, then Nexa keeps the transfer unresolved and does not claim receipt.
- Scenario: Retry — Given the transfer result is unknown, when the operator retries the same movement, then one transfer remains traceable.

## MOB-US-019 — Record temperature evidence for relevant stock

| Field | Value |
|---|---|
| ID | MOB-US-019 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Record temperature evidence for relevant stock |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-11 — Business Traceability |
| Shared Capability | CAP-10 — Cold-chain evidence and disposition; CAP-15 — Business traceability |
| Goal / Outcome | Preserve an attributable temperature fact for a lot or warehouse decision. |
| Research status | PENDING |
| Connectivity and authority | Manual evidence is supported; continuous telemetry is not a V1 promise. |

### User Story

As a Warehouse Operator,
I want to record temperature evidence for relevant stock,
so that cold-chain decisions use an attributable physical reading.

### Acceptance Criteria

- Scenario: Valid reading — Given the operator has permission and a lot or warehouse is known, when a valid reading is recorded, then Nexa preserves value, unit, time, person and subject.
- Scenario: Concerning reading — Given a reading is outside the accepted range, when it is recorded, then Nexa keeps the evidence and makes no silent release decision.
- Scenario: Incomplete reading — Given the subject or unit is missing, when the reading is recorded, then Nexa rejects it without creating incomplete evidence.
- Scenario: Temporary failure — Given the reading cannot be confirmed, when the operator stages the evidence, then it remains pending and no final stock disposition is claimed.

## MOB-US-020 — See deliveries ready for dispatch preparation

| Field | Value |
|---|---|
| ID | MOB-US-020 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-03 — Dispatch Preparation & Handoff |
| Priority | V1 candidate — Product Acceptance pending |
| Title | See deliveries ready for dispatch preparation |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Start dispatch work only for deliveries that have passed preparation gates. |
| Research status | PENDING |
| Connectivity and authority | Read information is freshness-labeled; dispatch action requires current confirmation. |

### User Story

As a Dispatch Coordinator,
I want to see deliveries ready for dispatch preparation,
so that I prepare only deliveries that are ready to leave the warehouse.

### Acceptance Criteria

- Scenario: Ready delivery — Given a delivery meets its preparation conditions, when the coordinator checks it, then it is identified as ready for dispatch work.
- Scenario: Not ready — Given allocation, picking or evidence is incomplete, when the coordinator checks the delivery, then it is not presented as ready.
- Scenario: Stale readiness — Given readiness information is stale, when the coordinator starts preparation, then Nexa requires a current check.
- Scenario: Wrong scope — Given a delivery belongs to another company or warehouse, when it is checked, then it is not exposed.

## MOB-US-021 — Assign a driver to a ready delivery

| Field | Value |
|---|---|
| ID | MOB-US-021 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-03 — Dispatch Preparation & Handoff |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Assign a driver to a ready delivery |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Put an eligible driver in clear responsibility for a prepared delivery. |
| Research status | PENDING |
| Connectivity and authority | Assignment requires current permission, delivery state and one safe result. |

### User Story

As a Dispatch Coordinator,
I want to assign a driver to a ready delivery,
so that responsibility for the delivery is clear before handoff.

### Acceptance Criteria

- Scenario: Eligible driver — Given a delivery is ready and a driver is eligible, when the coordinator assigns the driver, then Nexa records one assignment.
- Scenario: Ineligible assignment — Given the delivery or driver is not eligible, when the coordinator assigns the driver, then Nexa rejects the assignment and changes no delivery responsibility.
- Scenario: Stale assignment — Given the delivery changed after it was read, when the coordinator assigns the driver, then Nexa asks for current information instead of overwriting the change.
- Scenario: Repeat assignment — Given the coordinator repeats the same assignment, when Nexa receives it, then the delivery has one assignment result.

## MOB-US-022 — Check outgoing goods against the prepared delivery

| Field | Value |
|---|---|
| ID | MOB-US-022 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-03 — Dispatch Preparation & Handoff |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Check outgoing goods against the prepared delivery |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Confirm outgoing goods match the physical allocation before handoff. |
| Research status | PENDING |
| Connectivity and authority | Current allocation and quantity are required; local checks cannot authorize dispatch. |

### User Story

As a Dispatch Coordinator,
I want to check outgoing goods against the prepared delivery,
so that the driver receives what the delivery actually requires.

### Acceptance Criteria

- Scenario: Matching goods — Given outgoing goods match the current allocation, when the coordinator checks them, then Nexa records that the handoff preparation matches.
- Scenario: Mismatch — Given a lot or quantity differs from the allocation, when the coordinator checks it, then Nexa stops the handoff and preserves the discrepancy.
- Scenario: Changed allocation — Given the allocation changed after preparation, when the coordinator checks the goods, then Nexa requires a fresh preparation decision.
- Scenario: Repeat check — Given the same goods are checked again, when the coordinator repeats the check, then no second stock movement is created by the check.

## MOB-US-023 — Preserve warehouse-to-driver handoff evidence

| Field | Value |
|---|---|
| ID | MOB-US-023 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-03 — Dispatch Preparation & Handoff |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Preserve warehouse-to-driver handoff evidence |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-09 — Business Documents; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Keep attributable evidence that prepared goods moved from warehouse control to the driver. |
| Research status | PENDING |
| Connectivity and authority | Temporary evidence staging is allowed; handoff authority requires confirmation. |

### User Story

As a Dispatch Coordinator,
I want to preserve warehouse-to-driver handoff evidence,
so that the movement of prepared goods remains reviewable.

### Acceptance Criteria

- Scenario: Complete evidence — Given the delivery, goods and responsible people are known, when the handoff is recorded, then Nexa preserves the evidence with time and delivery identity.
- Scenario: Missing evidence — Given required evidence is missing, when the coordinator records the handoff, then Nexa leaves the handoff unconfirmed.
- Scenario: Evidence failure — Given evidence cannot be confirmed, when the coordinator retries, then Nexa shows the unresolved state and does not claim completed handoff.
- Scenario: Repeat handoff — Given the same handoff is submitted again, when Nexa receives it, then one handoff fact remains and prior evidence is not erased.

## MOB-US-024 — Reliably identify a dispatch handoff

| Field | Value |
|---|---|
| ID | MOB-US-024 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-03 — Dispatch Preparation & Handoff |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Reliably identify a dispatch handoff |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Give the warehouse and driver a stable way to identify the prepared delivery handoff. |
| Research status | PENDING |
| Connectivity and authority | The identity is bounded to the delivery; it is not Buyer acceptance. |

### User Story

As a Dispatch Coordinator,
I want to reliably identify a dispatch handoff,
so that the right delivery and driver remain linked throughout the handoff.

### Acceptance Criteria

- Scenario: Known handoff — Given a prepared delivery and assigned driver, when the coordinator identifies the handoff, then Nexa links it to that delivery and assignment.
- Scenario: Wrong handoff — Given an identifier belongs to another delivery, when it is used, then Nexa rejects it and changes no delivery fact.
- Scenario: Expired identity — Given the handoff identity is no longer valid, when it is used, then Nexa requires a new authorized handoff.
- Scenario: Separate meanings — Given the handoff is identified, when the identity is resolved, then Nexa does not treat it as Driver outcome or Buyer receipt.

## MOB-US-025 — Confirm goods left warehouse control

| Field | Value |
|---|---|
| ID | MOB-US-025 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-03 — Dispatch Preparation & Handoff |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Confirm goods left warehouse control |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Move a prepared delivery into dispatch only after required checks and handoff evidence pass. |
| Research status | PENDING |
| Connectivity and authority | Dispatch is a connected authoritative transition; it cannot be claimed from a local draft. |

### User Story

As a Dispatch Coordinator,
I want to confirm goods left warehouse control,
so that everyone can rely on the delivery's dispatch state.

### Acceptance Criteria

- Scenario: Complete handoff — Given allocation, outgoing checks, driver assignment and handoff evidence are complete, when the coordinator confirms dispatch, then Nexa records the delivery as dispatched.
- Scenario: Incomplete handoff — Given any required check is incomplete, when the coordinator confirms dispatch, then Nexa leaves the delivery undispatched.
- Scenario: Changed delivery — Given the delivery changed after preparation, when the coordinator confirms dispatch, then Nexa requires current checks instead of overwriting the change.
- Scenario: Uncertain result — Given confirmation may have succeeded, when the coordinator retries, then Nexa resolves one dispatch result without a duplicate transition.

## MOB-US-026 — See deliveries assigned to the driver

| Field | Value |
|---|---|
| ID | MOB-US-026 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-04 — Driver Delivery Execution & Proof |
| Priority | V1 candidate — Product Acceptance pending |
| Title | See deliveries assigned to the driver |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Know which authorized deliveries the driver is responsible for. |
| Research status | PENDING |
| Connectivity and authority | Cached assignments are labeled with freshness and cannot authorize a new delivery action alone. |

### User Story

As a Driver or Delivery Operator,
I want to see deliveries assigned to me,
so that I know which deliveries I am responsible for today.

### Acceptance Criteria

- Scenario: Current assignments — Given the driver is authorized, when assigned deliveries are checked, then only the driver's current deliveries are shown.
- Scenario: Removed assignment — Given an assignment is removed, when the driver checks again, then the delivery is no longer treated as assigned.
- Scenario: Stale list — Given the assignment list is stale, when the driver starts work, then Nexa requires a current confirmation.
- Scenario: Other driver's delivery — Given a delivery belongs to another driver, when it is requested, then no protected delivery information is exposed.

## MOB-US-027 — Begin an assigned delivery

| Field | Value |
|---|---|
| ID | MOB-US-027 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-04 — Driver Delivery Execution & Proof |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Begin an assigned delivery |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Start an authorized Delivery Attempt with a clear driver and delivery context. |
| Research status | PENDING |
| Connectivity and authority | Starting an Attempt requires current assignment and connected confirmation. |

### User Story

As a Driver or Delivery Operator,
I want to begin an assigned delivery,
so that the Delivery Attempt has a clear and authorized start.

### Acceptance Criteria

- Scenario: Assigned start — Given the delivery is assigned and ready, when the driver begins it, then Nexa records one active Delivery Attempt.
- Scenario: Unassigned start — Given the delivery is not assigned to the driver, when the driver begins it, then Nexa rejects it and records no Attempt.
- Scenario: Already started — Given an Attempt already exists, when the driver begins it again, then Nexa returns the current Attempt without creating another one.
- Scenario: No connection — Given the start cannot be confirmed, when the driver tries to begin, then Nexa shows an unconfirmed state and does not claim an active Attempt.

## MOB-US-028 — Open directions to the authorized delivery destination

| Field | Value |
|---|---|
| ID | MOB-US-028 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-04 — Driver Delivery Execution & Proof |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Open directions to the authorized delivery destination |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Hand the authorized delivery destination to a navigation service without changing Delivery truth. |
| Research status | PENDING |
| Connectivity and authority | V1 hands off to external navigation; Nexa does not store continuous driver location. |

### User Story

As a Driver or Delivery Operator,
I want to open directions to the authorized delivery destination,
so that I can travel to the right destination without changing the Delivery record.

### Acceptance Criteria

- Scenario: Authorized destination — Given an active authorized delivery has a destination, when the driver asks for directions, then Nexa hands that destination to the chosen navigation service.
- Scenario: Missing destination — Given the destination is missing or not authorized, when directions are requested, then Nexa does not disclose an unverified location.
- Scenario: Navigation unavailable — Given the navigation service is unavailable, when directions are requested, then the Delivery Attempt remains unchanged and the failure is clear.
- Scenario: No stored tracking — Given directions are opened, when the handoff completes, then Nexa stores no continuous or background driver location from this action.

## MOB-US-029 — Share a delivery location during an active delivery

| Field | Value |
|---|---|
| ID | MOB-US-029 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile; Buyer Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-07 — Advanced Field Mobility & Offline Operations |
| Priority | V2 / deferred — no V1 commitment |
| Title | Share a delivery location during an active delivery |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Consider a future bounded location capability with explicit consent and retention. |
| Research status | PENDING |
| Connectivity and authority | Stored, periodic, background and live location are deferred; V1 uses navigation handoff only. |

### User Story

As a Driver or Delivery Operator,
I want to share a delivery location during an active delivery,
so that a future accepted location service can support a bounded delivery need.

### Acceptance Criteria

- Scenario: Future consent — Given a future location policy is accepted, when the driver shares a location, then consent, scope and retention are explicit.
- Scenario: No active delivery — Given no active delivery exists, when location is requested, then no location is shared.
- Scenario: Privacy boundary — Given the person withdraws permission, when location sharing is requested, then no new location is disclosed.

## MOB-US-030 — Contact the buyer during delivery

| Field | Value |
|---|---|
| ID | MOB-US-030 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-07 — Advanced Field Mobility & Offline Operations |
| Priority | V2 / deferred — no V1 commitment |
| Title | Contact the buyer during delivery |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-10 — Notifications |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Resolve an arrival question through a future authorized channel. |
| Research status | PENDING |
| Connectivity and authority | Deferred until channel, consent and audit rules are accepted. |

### User Story

As a Driver or Delivery Operator,
I want to contact the buyer during delivery,
so that I can resolve an arrival question through an authorized channel.

### Acceptance Criteria

- Scenario: Future channel — Given an accepted contact policy exists, when the driver contacts the buyer, then only the authorized channel is used and its use is recorded.
- Scenario: Missing consent — Given consent or assignment is missing, when contact is requested, then no personal contact is initiated.
- Scenario: Separate outcome — Given contact occurs, when it ends, then it does not change Delivery outcome or Buyer receipt by itself.
- Scenario: Deferral — Given no contact channel is accepted for V1, when this story is considered, then it remains deferred.

## MOB-US-031 — Record the delivery attempt outcome

| Field | Value |
|---|---|
| ID | MOB-US-031 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-04 — Driver Delivery Execution & Proof |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Record the delivery attempt outcome |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Preserve what happened during an authorized Delivery Attempt. |
| Research status | PENDING |
| Connectivity and authority | The outcome is authoritative only after connected confirmation. |

### User Story

As a Driver or Delivery Operator,
I want to record the delivery attempt outcome,
so that the supplier knows what physically happened at the destination.

### Acceptance Criteria

- Scenario: Allowed outcome — Given an active assigned Attempt, when the driver records an allowed outcome, then Nexa preserves the outcome, person and time.
- Scenario: Invalid outcome — Given the Attempt is not active or the driver is not authorized, when an outcome is recorded, then Nexa changes no Delivery state.
- Scenario: Required evidence — Given the outcome needs evidence that is missing, when the driver records it, then Nexa leaves the outcome unconfirmed.
- Scenario: Repeat outcome — Given the outcome is unknown, when the driver retries the same outcome, then Nexa returns one result and does not overwrite history.

## MOB-US-032 — Record a partial or rejected delivery and what remains

| Field | Value |
|---|---|
| ID | MOB-US-032 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-04 — Driver Delivery Execution & Proof |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Record a partial or rejected delivery and what remains |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Keep delivered, rejected and remaining quantities visible for the next authorized decision. |
| Research status | PENDING |
| Connectivity and authority | Continuation and completion require connected confirmation; a local note cannot create them. |

### User Story

As a Driver or Delivery Operator,
I want to record a partial or rejected delivery and what remains,
so that no physical outcome or remaining obligation is lost.

### Acceptance Criteria

- Scenario: Partial delivery — Given the driver provides valid delivered and remaining quantities, when the partial outcome is recorded, then Nexa preserves delivered, rejected and remaining quantities separately.
- Scenario: Rejected delivery — Given goods are rejected with a reason, when the rejection is recorded, then Nexa preserves the reason and does not call the delivery complete.
- Scenario: Continuation — Given quantity remains for future delivery, when the outcome is confirmed, then Nexa creates only the authorized continuation.
- Scenario: Uncertain result — Given the outcome is unknown, when the driver retries, then Nexa returns one result and does not overwrite prior facts.

## MOB-US-033 — Preserve proof of delivery

| Field | Value |
|---|---|
| ID | MOB-US-033 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-04 — Driver Delivery Execution & Proof |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Preserve proof of delivery |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-09 — Business Documents; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Keep the required proof that makes the Delivery outcome reviewable. |
| Research status | PENDING |
| Connectivity and authority | Evidence may be temporarily staged; proof is authoritative only after confirmation. |

### User Story

As a Driver or Delivery Operator,
I want to preserve proof of delivery,
so that the Delivery outcome can be reviewed without losing its history.

### Acceptance Criteria

- Scenario: Required proof — Given the Attempt and evidence requirements are valid, when the driver provides the required proof, then Nexa preserves its identity, person and time.
- Scenario: Missing proof — Given required proof is missing or invalid, when the driver finishes the Attempt, then Nexa does not claim completed proof.
- Scenario: Temporary failure — Given proof cannot be confirmed, when the driver retries, then Nexa keeps a visible unresolved state and does not falsely complete the Delivery.
- Scenario: Repeat proof — Given the same proof is provided again, when Nexa receives it, then one proof fact remains and earlier evidence is not erased.

## MOB-US-034 — Present a bounded delivery handoff code

| Field | Value |
|---|---|
| ID | MOB-US-034 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-04 — Driver Delivery Execution & Proof |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Present a bounded delivery handoff code |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Let the buyer identify the correct Delivery without treating the code as acceptance. |
| Research status | PENDING |
| Connectivity and authority | The code is short-lived and bounded; it is not Buyer receipt, POD or Delivery completion. |

### User Story

As a Driver or Delivery Operator,
I want to present a bounded delivery handoff code,
so that the buyer can identify the correct delivery safely.

### Acceptance Criteria

- Scenario: Valid code — Given an active authorized Delivery, when the driver presents its code, then Nexa binds the code to that Delivery and Attempt.
- Scenario: Expired or wrong code — Given a code is expired, reused or belongs to another Delivery, when it is checked, then Nexa rejects it without changing Delivery state.
- Scenario: Code unavailable — Given the code cannot be presented, when the driver uses the approved fallback, then the handoff remains explicit and no false acceptance is recorded.
- Scenario: Separate facts — Given the buyer verifies the code, when verification succeeds, then it does not by itself create receipt, POD, payment or Delivery completion.

## MOB-US-035 — Continue delivery evidence after connection loss

| Field | Value |
|---|---|
| ID | MOB-US-035 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-07 — Advanced Field Mobility & Offline Operations |
| Priority | V2 / deferred — no V1 commitment |
| Title | Continue delivery evidence after connection loss |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Explore a future evidence recovery flow without making disconnected Delivery success authoritative. |
| Research status | PENDING |
| Connectivity and authority | Generic offline evidence queues and synchronization are deferred; V1 permits only safe temporary staging. |

### User Story

As a Driver or Delivery Operator,
I want to continue delivery evidence after connection loss,
so that a future recovery flow can protect evidence without claiming false success.

### Acceptance Criteria

- Scenario: Future evidence recovery — Given a future recovery policy is accepted, when evidence is captured without a connection, then its pending state and minimum protected content are clear.
- Scenario: Later confirmation — Given staged evidence is later reviewed, when Nexa accepts it, then only the exact accepted fact becomes authoritative.
- Scenario: Rejection — Given staged evidence is rejected, when it is reviewed, then the reason remains clear and no Delivery success is implied.
- Scenario: Deferral — Given V1 has no generic offline mutation authority, when this story is considered, then it remains deferred.

## MOB-US-036 — Browse supplier products

| Field | Value |
|---|---|
| ID | MOB-US-036 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Browse supplier products |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-04 — Catalog and commercial policy |
| Goal / Outcome | Let a buyer explore permitted supplier products in a future convenience flow. |
| Research status | PENDING |
| Connectivity and authority | Deferred; cached product information is advisory and never a commitment. |

### User Story

As a Customer Buyer,
I want to browse supplier products,
so that I can explore products offered through my supplier relationship.

### Acceptance Criteria

- Scenario: Authorized catalog — Given an active buyer relationship, when products are browsed, then only permitted products are shown.
- Scenario: Suspended relationship — Given the buyer relationship is suspended, when products are browsed, then private product information is not exposed.
- Scenario: Stale information — Given product information is stale, when it is browsed, then it is marked advisory and creates no order authority.
- Scenario: Deferral — Given Buyer commerce is outside V1, when this story is considered, then it remains deferred.

## MOB-US-037 — Review product price and availability

| Field | Value |
|---|---|
| ID | MOB-US-037 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Review product price and availability |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-05 — Inventory Availability |
| Shared Capability | CAP-04 — Catalog and commercial policy |
| Goal / Outcome | Prepare future buying decisions from current price and availability facts. |
| Research status | PENDING |
| Connectivity and authority | Deferred; current price and availability must be checked again before commitment. |

### User Story

As a Customer Buyer,
I want to review product price and availability,
so that I can make a future request using current supplier information.

### Acceptance Criteria

- Scenario: Current product — Given an authorized relationship, when a product is reviewed, then its price, terms and sellable availability are shown with freshness.
- Scenario: Stale product — Given product facts are stale, when the buyer continues, then current confirmation is required.
- Scenario: Unavailable product — Given a product is hidden or unavailable, when it is requested, then it cannot be treated as a commitment.
- Scenario: Deferral — Given Buyer commerce is outside V1, when this story is considered, then it remains deferred.

## MOB-US-038 — Prepare a purchase request

| Field | Value |
|---|---|
| ID | MOB-US-038 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Prepare a purchase request |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy |
| Shared Capability | CAP-05 — Buyer shopping and drafts |
| Goal / Outcome | Prepare a buyer intention without reserving stock or confirming an order. |
| Research status | PENDING |
| Connectivity and authority | Deferred; a draft is not a Purchase Request or Sales Order. |

### User Story

As a Customer Buyer,
I want to prepare a purchase request,
so that I can organize a future purchase without falsely confirming it.

### Acceptance Criteria

- Scenario: Draft — Given permitted products are available, when the buyer prepares a request, then it remains a draft and creates no reservation.
- Scenario: Changed product — Given price or availability changes, when the buyer reviews the draft, then the change is clear before submission.
- Scenario: Local preparation — Given the buyer loses connection, when the draft is edited, then it remains unconfirmed.
- Scenario: Deferral — Given Buyer commerce is outside V1, when this story is considered, then it remains deferred.

## MOB-US-039 — Repeat a previous purchase

| Field | Value |
|---|---|
| ID | MOB-US-039 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Repeat a previous purchase |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy |
| Shared Capability | CAP-05 — Buyer shopping and drafts |
| Goal / Outcome | Prepare a new request from prior history while rechecking current commercial facts. |
| Research status | PENDING |
| Connectivity and authority | Deferred; history never bypasses current authorization or availability. |

### User Story

As a Customer Buyer,
I want to repeat a previous purchase,
so that I can prepare a new request more quickly in a future flow.

### Acceptance Criteria

- Scenario: Reused history — Given the buyer can access prior history, when it is reused, then Nexa creates a new draft and rechecks current product facts.
- Scenario: Changed product — Given a prior product is no longer available, when history is reused, then Nexa marks it and creates no silent order.
- Scenario: Repeat action — Given the buyer repeats the action, when Nexa processes it, then no second commitment is created.
- Scenario: Deferral — Given reorder convenience is outside V1, when this story is considered, then it remains deferred.

## MOB-US-040 — Submit a request or place a direct order

| Field | Value |
|---|---|
| ID | MOB-US-040 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Submit a request or place a direct order |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-07 — Credit & Receivables |
| Shared Capability | CAP-06 — Purchase Requests and Sales Orders |
| Goal / Outcome | Choose an explicit future commitment path under the buyer's policy. |
| Research status | PENDING |
| Connectivity and authority | Deferred; no disconnected commitment success is allowed. |

### User Story

As a Customer Buyer,
I want to submit a request or place a direct order,
so that my chosen commitment path is explicit and authorized.

### Acceptance Criteria

- Scenario: Purchase Request — Given a valid draft and policy, when the buyer submits a request, then one Purchase Request is recorded.
- Scenario: Direct order — Given direct ordering is permitted, when the buyer chooses it, then one Sales Order path is recorded without inventing a Purchase Request.
- Scenario: Changed facts — Given price, availability, credit or permission changed, when the buyer submits, then no partial commitment is recorded.
- Scenario: Deferral — Given Buyer commitment is outside V1, when this story is considered, then it remains deferred.

## MOB-US-041 — Respond to a material change

| Field | Value |
|---|---|
| ID | MOB-US-041 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Respond to a material change |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-07 — Credit & Receivables |
| Shared Capability | CAP-06 — Purchase Requests and Sales Orders |
| Goal / Outcome | Let a buyer explicitly accept or reject a future material change without rewriting the original commitment. |
| Research status | PENDING |
| Connectivity and authority | Deferred; response requires current commitment authority. |

### User Story

As a Customer Buyer,
I want to respond to a material change,
so that my future commitment reflects an explicit decision.

### Acceptance Criteria

- Scenario: Accept change — Given a current authorized change exists, when the buyer accepts it, then Nexa records the versioned change.
- Scenario: Reject change — Given the buyer rejects it, when Nexa records the decision, then the original commitment remains intact.
- Scenario: Stale change — Given the change is no longer current, when the buyer responds, then Nexa asks for the current decision and changes nothing silently.
- Scenario: Deferral — Given material-change response is outside V1, when this story is considered, then it remains deferred.

## MOB-US-042 — Follow requests and orders

| Field | Value |
|---|---|
| ID | MOB-US-042 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Follow requests and orders |
| Owning Bounded Context | BC-04 — Sales Commitment |
| Relevant Bounded Contexts | BC-09 — Business Documents; BC-11 — Business Traceability |
| Shared Capability | CAP-13 — Business documents; CAP-15 — Business traceability |
| Goal / Outcome | Understand authorized Purchase Request and Sales Order progress without changing commitment truth. |
| Research status | PENDING |
| Connectivity and authority | Deferred; issued documents remain immutable and access-controlled. |

### User Story

As a Customer Buyer,
I want to follow requests and orders,
so that I can understand authorized commercial progress.

### Acceptance Criteria

- Scenario: Authorized history — Given an authorized relationship, when progress is reviewed, then request and order state and history remain distinct.
- Scenario: Current progress — Given an authorized relationship, when the buyer reviews progress, then Purchase Request and Sales Order state remain distinct.
- Scenario: Revoked access — Given access is revoked, when progress is requested, then private information is not exposed.
- Scenario: Stale progress — Given displayed progress is stale, when the buyer refreshes it, then Nexa exposes the current result or a truthful unavailable state.

## MOB-US-070 — View business documents linked to a request or order

| Field | Value |
|---|---|
| ID | MOB-US-070 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile; Operations Mobile |
| Actor | Customer Buyer or Sales Representative |
| Epic | MOBILE-EPIC-11 — Mobile Commercial & Financial Follow-through |
| Priority | V2 — refinement-ready; no V1 commitment |
| Title | View business documents linked to a request or order |
| Owning Bounded Context | BC-09 — Business Documents |
| Relevant Bounded Contexts | BC-04 — Sales Commitment; BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-13 — Business documents |
| Goal / Outcome | Retrieve the authorized document that explains a commercial request or order. |
| Research status | PENDING |
| Connectivity and authority | Issued documents remain immutable and access-controlled; local copies are not authority. |

### User Story

As a Customer Buyer or Sales Representative,
I want to view a business document linked to a request or order,
so that I can use the authorized evidence for the commercial work.

### Acceptance Criteria

- Scenario: Authorized document — Given an issued document belongs to the permitted relationship, when the person requests it, then Nexa provides the document identity and authorized content.
- Scenario: Missing document — Given no issued document exists, when the person requests it, then Nexa states that it is unavailable and changes no commitment.
- Scenario: Revoked access — Given permission is revoked, when the person requests the document, then Nexa exposes no private content.

## MOB-US-043 — Review credit and payment status

| Field | Value |
|---|---|
| ID | MOB-US-043 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-06 — Commercial & Operational Mobile Convenience |
| Priority | V2 / deferred — no V1 commitment |
| Title | Review credit and payment status |
| Owning Bounded Context | BC-07 — Credit & Receivables |
| Relevant Bounded Contexts | BC-08 — Payments; BC-11 — Business Traceability |
| Shared Capability | CAP-11 — Credit and receivables; CAP-12 — Payments and correction |
| Goal / Outcome | Understand what is due and whether reported payment evidence has been reviewed. |
| Research status | PENDING |
| Connectivity and authority | Deferred; Payment Reported is separate from Payment Confirmed. |

### User Story

As a Customer Buyer,
I want to review credit and payment status,
so that I understand what is due without treating reported evidence as confirmation.

### Acceptance Criteria

- Scenario: Current credit — Given an authorized relationship, when credit is reviewed, then amount, currency, freshness and source are clear.
- Scenario: Payment status — Given payment evidence exists, when the buyer reviews it, then reported, confirmed and rejected states remain distinct.
- Scenario: Stale status — Given payment status is stale, when the buyer refreshes it, then Nexa exposes current status or a truthful unavailable state.
- Scenario: Deferral — Given Buyer finance is outside V1, when this story is considered, then it remains deferred.

## MOB-US-071 — Report payment evidence and see its review outcome

| Field | Value |
|---|---|
| ID | MOB-US-071 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-11 — Mobile Commercial & Financial Follow-through |
| Priority | V2 — refinement-ready; no V1 commitment |
| Title | Report payment evidence and see its review outcome |
| Owning Bounded Context | BC-08 — Payments |
| Relevant Bounded Contexts | BC-07 — Credit & Receivables; BC-11 — Business Traceability |
| Shared Capability | CAP-12 — Payments and correction |
| Goal / Outcome | Report permitted payment evidence and understand whether the owning process accepted or rejected it. |
| Research status | PENDING |
| Connectivity and authority | Payment Reported is not Payment Confirmed; provider and financial authority remain outside the client. |

### User Story

As a Customer Buyer,
I want to report payment evidence and see its review outcome,
so that I can follow a payment without claiming confirmation myself.

### Acceptance Criteria

- Scenario: Evidence reported — Given a permitted reference, amount and evidence are available, when the buyer reports them, then Nexa records the report as unconfirmed.
- Scenario: Evidence reviewed — Given the owning process reviews the report, when the buyer checks status, then Nexa shows the review outcome without rewriting the report.
- Scenario: Duplicate report — Given the same report is submitted again, when Nexa receives it, then it does not apply the evidence twice.

## MOB-US-044 — Know when a delivery needs attention

| Field | Value |
|---|---|
| ID | MOB-US-044 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Know when a delivery needs attention |
| Owning Bounded Context | BC-10 — Notifications |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-14 — Critical business notifications |
| Goal / Outcome | Help the buyer notice a relevant Delivery change without changing Delivery truth. |
| Research status | PENDING |
| Connectivity and authority | Critical updates are provider-neutral; the buyer can refresh the Delivery facts. |

### User Story

As a Customer Buyer,
I want to know when a delivery needs attention,
so that I can respond to a relevant delivery change in time.

### Acceptance Criteria

- Scenario: Relevant update — Given a permitted Delivery fact needs buyer attention, when Nexa sends an update, then the buyer can identify the relevant Delivery.
- Scenario: Unrelated update — Given the Delivery is outside the buyer's relationship, when an update is prepared, then no private Delivery information is disclosed.
- Scenario: Delivery failure — Given an update cannot be delivered, when the buyer opens Nexa, then current Delivery facts remain available for refresh and no Delivery fact changes.
- Scenario: Update retry — Given an update is repeated, when the buyer receives it, then it does not create a second Delivery, receipt or discrepancy fact.

## MOB-US-045 — See an active driver on a map

| Field | Value |
|---|---|
| ID | MOB-US-045 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-07 — Advanced Field Mobility & Offline Operations |
| Priority | V2 / deferred — no V1 commitment |
| Title | See an active driver on a map |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Consider a future consented location experience for an active Delivery. |
| Research status | PENDING |
| Connectivity and authority | Stored, periodic and live location, map tracking and ETA are deferred. |

### User Story

As a Customer Buyer,
I want to see an active driver on a map,
so that a future authorized service can help me understand arrival timing.

### Acceptance Criteria

- Scenario: Future location — Given a future location policy is accepted, when the buyer opens an active Delivery, then only bounded consented location is shown.
- Scenario: No active Delivery — Given no active Delivery exists, when the buyer requests a map, then no driver location is disclosed.
- Scenario: Privacy boundary — Given permission or relationship is missing, when the buyer requests a map, then no location is disclosed.

## MOB-US-046 — Contact the driver

| Field | Value |
|---|---|
| ID | MOB-US-046 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-07 — Advanced Field Mobility & Offline Operations |
| Priority | V2 / deferred — no V1 commitment |
| Title | Contact the driver |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-10 — Notifications |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Resolve a future arrival question through an authorized Delivery channel. |
| Research status | PENDING |
| Connectivity and authority | Deferred until provider, consent, privacy and audit rules are accepted. |

### User Story

As a Customer Buyer,
I want to contact the driver,
so that I can resolve an arrival question through an authorized Delivery channel.

### Acceptance Criteria

- Scenario: Future channel — Given an accepted channel policy and active Delivery, when the buyer contacts the driver, then only the authorized channel is used.
- Scenario: No permission — Given consent or active Delivery is missing, when contact is requested, then no personal contact is initiated.
- Scenario: Separate facts — Given contact occurs, when it ends, then it does not change Driver outcome, Buyer receipt or Delivery state.
- Scenario: Deferral — Given no contact channel is accepted for V1, when this story is considered, then it remains deferred.

## MOB-US-047 — Verify a delivery through the handoff code

| Field | Value |
|---|---|
| ID | MOB-US-047 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Verify a delivery through the handoff code |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Verify that the presented code belongs to the Delivery the buyer is receiving. |
| Research status | PENDING |
| Connectivity and authority | Code verification identifies the handoff; it does not confirm receipt. |

### User Story

As a Customer Buyer,
I want to verify a delivery through the handoff code,
so that I can confirm I am reviewing the correct Delivery.

### Acceptance Criteria

- Scenario: Matching code — Given a valid unexpired code and authorized relationship, when the buyer verifies it, then Nexa identifies the matching Delivery and Attempt.
- Scenario: Invalid code — Given the code is expired, reused, malformed or unrelated, when the buyer verifies it, then Nexa rejects it and changes no receipt fact.
- Scenario: No connection — Given the code cannot be confirmed, when the buyer verifies it, then Nexa shows an unconfirmed state and no receipt succeeds.
- Scenario: Verification boundary — Given the code is verified, when the buyer continues, then verification alone does not confirm quantities, POD, payment or Delivery completion.

## MOB-US-048 — Confirm the quantities actually received

| Field | Value |
|---|---|
| ID | MOB-US-048 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Confirm the quantities actually received |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Create a separate truthful Buyer receipt fact for what arrived. |
| Research status | PENDING |
| Connectivity and authority | Receipt confirmation requires connected acceptance; the buyer cannot confirm independently while disconnected. |

### User Story

As a Customer Buyer,
I want to confirm the quantities actually received,
so that the supplier has a truthful record of my receipt.

### Acceptance Criteria

- Scenario: Matching receipt — Given a verified authorized handoff, when the buyer confirms received quantities, then Nexa records one Buyer receipt fact with person, time and Delivery.
- Scenario: Different quantities — Given received quantities differ from the driver's outcome, when the buyer confirms them, then both facts remain separate and the difference is visible.
- Scenario: Stale or reused handoff — Given the handoff is stale, expired or already used, when the buyer confirms quantities, then Nexa rejects the confirmation or returns its original result without a second receipt.
- Scenario: No connection — Given receipt confirmation cannot be checked, when the buyer attempts it, then Nexa shows no receipt success until confirmation is received.

## MOB-US-049 — Report a discrepancy without erasing the facts

| Field | Value |
|---|---|
| ID | MOB-US-049 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates |
| Priority | V1 candidate — Product Acceptance pending |
| Title | Report a discrepancy without erasing the facts |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability |
| Goal / Outcome | Preserve a Buyer discrepancy alongside receipt and Driver facts for operational follow-up. |
| Research status | PENDING |
| Connectivity and authority | A discrepancy draft may be staged; no prior receipt or Delivery fact is rewritten. |

### User Story

As a Customer Buyer,
I want to report a discrepancy without erasing the facts,
so that the supplier can resolve the difference while the history remains trustworthy.

### Acceptance Criteria

- Scenario: Discrepancy recorded — Given a verified handoff or receipt context, when the buyer reports a discrepancy, then Nexa preserves reason, affected quantity, person, time and evidence.
- Scenario: Separate histories — Given the Driver outcome differs from the Buyer receipt, when the discrepancy is recorded, then both original facts remain unchanged and the difference is visible.
- Scenario: Invalid report — Given reason, permission or required evidence is missing, when the buyer reports it, then Nexa records no unauthorized correction.
- Scenario: Temporary failure — Given the report cannot be confirmed, when the buyer retries, then Nexa keeps one pending or accepted result and does not imply a refund, payment change or Delivery completion.

## MOB-US-050 — Handle an inbound receiving discrepancy with evidence

| Field | Value |
|---|---|
| ID | MOB-US-050 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-08 — Warehouse Transfer & Inventory Accuracy |
| Priority | V2 refinement-ready |
| Title | Handle an inbound receiving discrepancy with evidence |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Record an inbound difference such as damage, leakage, wrong product or quantity so receiving can continue with an attributable decision. |
| Research status | PENDING |
| Connectivity and authority | A discrepancy may be prepared locally, but stock and receiving truth require connected confirmation. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 5 |
| Mobile Justification | Warehouse staff can capture the physical difference at the point of inspection, with evidence attached to the receiving decision. |
| Backend Support | PARTIAL |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-011, MOB-US-013, MOB-US-014, MOB-US-017; TS-016 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Warehouse Operator,
I want to record an inbound receiving discrepancy with evidence,
so that the receiving decision reflects what was physically found.

### Acceptance Criteria

- Scenario: Difference captured — Given an inbound delivery is being inspected, when the operator records damage, leakage, wrong product or quantity, then Nexa keeps the reason, affected items and evidence for review.
- Scenario: Receiving remains controlled — Given a discrepancy is recorded, when the operator submits the receiving result, then Nexa does not increase sellable stock beyond the confirmed facts.
- Scenario: Missing evidence — Given a required fact or evidence is missing, when the operator tries to submit the discrepancy, then Nexa explains what is missing and records no incomplete decision.

## MOB-US-051 — Place stock on hold or quarantine and resolve it

| Field | Value |
|---|---|
| ID | MOB-US-051 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-08 — Warehouse Transfer & Inventory Accuracy |
| Priority | V2 refinement-ready |
| Title | Place stock on hold or quarantine and resolve it |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-10 — Cold-chain evidence and disposition |
| Goal / Outcome | Keep questionable stock out of available work until an authorized person records its release, disposition or continued hold. |
| Research status | PENDING |
| Connectivity and authority | Hold, quarantine and release are authoritative only after current permission and connected confirmation. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 5 |
| Mobile Justification | The operator can protect stock immediately at the place where its condition is observed and preserve the reason for later review. |
| Backend Support | PARTIAL |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-015, MOB-US-017, MOB-US-019; TS-018 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Warehouse Operator,
I want to place questionable stock on hold or quarantine and record its resolution,
so that unsafe or uncertain stock is not used before an authorized decision.

### Acceptance Criteria

- Scenario: Protect stock — Given a lot has a condition that prevents normal use, when the operator records a hold or quarantine reason, then Nexa removes the affected quantity from the applicable available work.
- Scenario: Authorized resolution — Given a held lot has been reviewed, when an authorized person releases or disposes of it, then Nexa records the decision, reason and affected quantity without erasing the hold history.
- Scenario: Stale decision — Given the lot changed after it was viewed, when the operator attempts to resolve it, then Nexa rejects the stale decision and shows the current state.

## MOB-US-052 — Confirm destination receipt for an internal warehouse transfer

| Field | Value |
|---|---|
| ID | MOB-US-052 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-08 — Warehouse Transfer & Inventory Accuracy |
| Priority | V2 refinement-ready |
| Title | Confirm destination receipt for an internal warehouse transfer |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Confirm what arrived at the destination of an internal transfer while keeping source, in-transit and destination facts distinct. |
| Research status | PENDING |
| Connectivity and authority | Destination receipt requires current transfer identity and connected confirmation; a local receipt is not authoritative. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 3 |
| Mobile Justification | A destination operator can close the physical loop where the stock arrives and expose quantity or lot differences immediately. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-018, MOB-US-014; TS-019 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Warehouse Operator,
I want to confirm what arrived at the destination of an internal transfer,
so that the stock record reflects the physical movement and any difference.

### Acceptance Criteria

- Scenario: Full receipt — Given an authorized transfer is in transit, when the destination operator confirms the expected lot and quantity, then Nexa records destination receipt and closes the transfer movement.
- Scenario: Partial or different receipt — Given the destination receives a different lot or quantity, when the operator records it, then Nexa keeps the source and destination facts separate and exposes the difference for resolution.
- Scenario: Repeated receipt — Given destination receipt already has an accepted result, when the operator retries, then Nexa returns the original result without a second receipt.

## MOB-US-053 — Perform a cycle count and request a stock correction

| Field | Value |
|---|---|
| ID | MOB-US-053 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-08 — Warehouse Transfer & Inventory Accuracy |
| Priority | V2 refinement-ready |
| Title | Perform a cycle count and request a stock correction |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Compare physical stock with the recorded quantity and request a traceable correction when the difference is confirmed. |
| Research status | PENDING |
| Connectivity and authority | Counting may be prepared locally, but a correction requires authorization, concurrency checks and connected confirmation. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 5 |
| Mobile Justification | Counting at the storage location reduces delay between observing a difference and starting its controlled resolution. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-015, MOB-US-017; TS-019 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Warehouse Operator,
I want to count a storage location and request a stock correction,
so that a physical difference can be resolved without rewriting stock history.

### Acceptance Criteria

- Scenario: Count recorded — Given a permitted location and current stock view, when the operator records the observed lot and quantity, then Nexa preserves the count with person, time and location.
- Scenario: Correction reviewed — Given the count differs from recorded stock, when an authorized correction is approved, then Nexa records corrective evidence and the resulting quantity without deleting prior movements.
- Scenario: Concurrent change — Given stock changed after the count began, when the operator submits the correction, then Nexa rejects or reopens the stale count instead of applying a last-write-wins correction.

## MOB-US-054 — Apply a reasoned lot substitution when FEFO cannot fulfill work

| Field | Value |
|---|---|
| ID | MOB-US-054 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-08 — Warehouse Transfer & Inventory Accuracy |
| Priority | V3 roadmap-ready |
| Title | Apply a reasoned lot substitution when FEFO cannot fulfill work |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-07 — Availability and inventory reservation |
| Goal / Outcome | Request an authorized alternative lot when the expected FEFO lot cannot fulfill prepared work. |
| Research status | PENDING |
| Connectivity and authority | Substitution must be evaluated against current allocation, policy and available quantity; Mobile cannot decide it alone. |
| Target Release | V3 |
| Sprint Planned | UNASSIGNED |
| Story Points | UNESTIMATED |
| Mobile Justification | The operator can surface the physical constraint at the decision point without silently changing allocation policy. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-015, MOB-US-016; TS-019 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Warehouse Operator,
I want to request a permitted lot substitution when the expected lot cannot fulfill the work,
so that the order can be reviewed without bypassing availability policy.

### Acceptance Criteria

- Scenario: Substitution requested — Given the expected lot cannot supply the prepared quantity, when the operator proposes an eligible alternative, then Nexa sends it for an authorized decision with both lots visible.
- Scenario: Decision remains controlled — Given a substitution is rejected or becomes stale, when the operator continues, then Nexa keeps the original allocation and explains the next permitted action.

## MOB-US-055 — Use richer product, package and storage identity information

| Field | Value |
|---|---|
| ID | MOB-US-055 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-08 — Warehouse Transfer & Inventory Accuracy |
| Priority | V3 roadmap-ready |
| Title | Use richer product, package and storage identity information |
| Owning Bounded Context | BC-03 — Catalog & Commercial Policy |
| Relevant Bounded Contexts | BC-05 — Inventory Availability |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Identify products, packages, lots and storage positions from richer permitted identity information before physical work. |
| Research status | PENDING |
| Connectivity and authority | Camera, label and code mechanisms remain replaceable; Catalog confirmation is authoritative. |
| Target Release | V3 |
| Sprint Planned | UNASSIGNED |
| Story Points | UNESTIMATED |
| Mobile Justification | Richer identity reduces handling errors while preserving manual fallback and the same Catalog authority. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-011, MOB-US-012, MOB-US-015; TS-016 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Warehouse Operator,
I want to use richer product, package and storage identity information,
so that I can handle the intended stock with fewer identification errors.

### Acceptance Criteria

- Scenario: Identity resolved — Given a permitted package or storage identifier, when the operator presents it, then Nexa shows the corresponding product and current context before work begins.
- Scenario: Identity unavailable — Given the identifier is unknown or unreadable, when the operator tries to continue, then Nexa offers an explicit fallback or reports that confirmation is required.

## MOB-US-056 — Prepare a batch warehouse operation

| Field | Value |
|---|---|
| ID | MOB-US-056 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-08 — Warehouse Transfer & Inventory Accuracy |
| Priority | V3 roadmap-ready |
| Title | Prepare a batch warehouse operation |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-08 — Receiving and warehouse operations |
| Goal / Outcome | Organize a permitted group of warehouse tasks while keeping each item and final result individually traceable. |
| Research status | PENDING |
| Connectivity and authority | Group preparation can be local, but each authoritative stock result must be confirmed under current state. |
| Target Release | V3 |
| Sprint Planned | UNASSIGNED |
| Story Points | UNESTIMATED |
| Mobile Justification | Grouped work can reduce repeated handling while preserving item-level decisions and safe recovery. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-013, MOB-US-016, MOB-US-018, MOB-US-053; TS-019 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Warehouse Operator,
I want to prepare a group of warehouse tasks,
so that I can work efficiently without losing the result of each item.

### Acceptance Criteria

- Scenario: Group prepared — Given several permitted tasks are available, when the operator groups them, then Nexa shows the items, sequence and required checks clearly.
- Scenario: One item differs — Given one task cannot be completed as prepared, when the operator records the difference, then Nexa leaves the other task results separate and identifies the item needing review.

## MOB-US-057 — Resolve a dispatch discrepancy before handoff

| Field | Value |
|---|---|
| ID | MOB-US-057 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V2 refinement-ready |
| Title | Resolve a dispatch discrepancy before handoff |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Record and route a difference found during dispatch preparation before goods leave warehouse control. |
| Research status | PENDING |
| Connectivity and authority | Dispatch cannot proceed from a stale preparation view; the discrepancy and final decision require confirmation. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 5 |
| Mobile Justification | The coordinator can resolve a handoff blocker at the dock while all responsibilities and facts remain visible. |
| Backend Support | PARTIAL |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-020, MOB-US-022, MOB-US-025; TS-018 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Dispatch Coordinator,
I want to resolve a dispatch discrepancy before handoff,
so that only a reviewed delivery leaves warehouse control.

### Acceptance Criteria

- Scenario: Difference identified — Given outgoing goods do not match the prepared delivery, when the coordinator records the difference, then Nexa identifies the affected delivery, lot or quantity and blocks unsafe handoff.
- Scenario: Authorized resolution — Given the difference has an accepted resolution, when the coordinator confirms the next action, then Nexa updates dispatch readiness with traceable evidence.
- Scenario: Stale preparation — Given the delivery changed after preparation, when the coordinator resolves the discrepancy, then Nexa asks for a fresh decision instead of overwriting current facts.

## MOB-US-058 — Reassign a driver or reschedule dispatch safely

| Field | Value |
|---|---|
| ID | MOB-US-058 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V2 refinement-ready |
| Title | Reassign a driver or reschedule dispatch safely |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-01 — Tenant & Access Governance |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Keep delivery responsibility and timing accurate when the original driver or dispatch plan can no longer proceed. |
| Research status | PENDING |
| Connectivity and authority | Reassignment and rescheduling require current delivery state, authorization and a single accepted result. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 5 |
| Mobile Justification | Dispatch work often changes at the moment of execution; the coordinator needs a controlled recovery path from the field. |
| Backend Support | PARTIAL |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-021, MOB-US-025; TS-019 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Dispatch Coordinator,
I want to reassign a driver or reschedule a dispatch safely,
so that the delivery remains owned by an eligible person at an agreed time.

### Acceptance Criteria

- Scenario: Eligible reassignment — Given a prepared delivery needs a new driver, when the coordinator selects an eligible person, then Nexa records the new responsibility and preserves the prior assignment history.
- Scenario: Timing change — Given dispatch cannot proceed at the planned time, when the coordinator proposes a new time, then Nexa shows the impact and confirms the change only once.
- Scenario: Concurrent change — Given another person changed the delivery first, when the coordinator submits the old plan, then Nexa rejects it and shows the current responsibility and time.

## MOB-US-059 — Prepare grouped and multi-stop delivery loads

| Field | Value |
|---|---|
| ID | MOB-US-059 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V3 roadmap-ready |
| Title | Prepare grouped and multi-stop delivery loads |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Organize compatible deliveries into a load with explicit stops, responsibility and cold-chain constraints. |
| Research status | PENDING |
| Connectivity and authority | Grouping remains a proposal until all delivery, customer and condition rules are confirmed. |
| Target Release | V3 |
| Sprint Planned | UNASSIGNED |
| Story Points | UNESTIMATED |
| Mobile Justification | A coordinator can inspect and adjust a proposed load where physical dispatch decisions happen. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-020, MOB-US-021, MOB-US-022, MOB-US-061; SPIKE-006 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Dispatch Coordinator,
I want to prepare a grouped delivery load with its stops,
so that compatible deliveries can be dispatched with their constraints visible.

### Acceptance Criteria

- Scenario: Compatible load — Given deliveries satisfy the accepted grouping rules, when the coordinator prepares a load, then Nexa shows every delivery, stop and required condition.
- Scenario: Incompatible delivery — Given one delivery violates a customer or cold-chain rule, when the coordinator prepares the load, then Nexa keeps it outside the load and explains why.

## MOB-US-060 — Complete a carrier handoff with traceable responsibility

| Field | Value |
|---|---|
| ID | MOB-US-060 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V3 roadmap-ready |
| Title | Complete a carrier handoff with traceable responsibility |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-09 — Business Documents; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Record when responsibility for a prepared load moves to an authorized carrier and preserve the handoff evidence. |
| Research status | PENDING |
| Connectivity and authority | Carrier selection, evidence and responsibility rules require Product and provider decisions before implementation. |
| Target Release | V3 |
| Sprint Planned | UNASSIGNED |
| Story Points | UNESTIMATED |
| Mobile Justification | The handoff can be captured at the physical transfer point without treating a carrier mechanism as a new domain boundary. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-023, MOB-US-025, MOB-US-059; SPIKE-006 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Dispatch Coordinator,
I want to complete a carrier handoff with clear responsibility,
so that everyone can see who controls the load after it leaves the warehouse.

### Acceptance Criteria

- Scenario: Handoff accepted — Given a prepared load and authorized carrier are present, when the coordinator records the handoff, then Nexa preserves carrier, person, time and delivery responsibility.
- Scenario: Evidence incomplete — Given required handoff evidence is missing, when the coordinator tries to finish, then Nexa leaves responsibility with the current owner and states what is required.

## MOB-US-061 — Record temperature evidence at dispatch

| Field | Value |
|---|---|
| ID | MOB-US-061 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Dispatch Coordinator |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V2 refinement-ready |
| Title | Record temperature evidence at dispatch |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-05 — Inventory Availability; BC-11 — Business Traceability |
| Shared Capability | CAP-10 — Cold-chain evidence and disposition |
| Goal / Outcome | Preserve the temperature fact required to decide whether a prepared delivery can leave under its cold-chain policy. |
| Research status | PENDING |
| Connectivity and authority | Manual evidence is a proposed V2 capability; automatic telemetry remains outside this story. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 3 |
| Mobile Justification | Dispatch staff can capture a required cold-chain check at the point of handoff with person, time and delivery context. |
| Backend Support | PARTIAL |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-019, MOB-US-022, MOB-US-025; TS-018 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Dispatch Coordinator,
I want to record temperature evidence at dispatch,
so that the delivery decision reflects the condition observed before handoff.

### Acceptance Criteria

- Scenario: Evidence recorded — Given a delivery requires a temperature check, when the coordinator records the observation, then Nexa keeps value, unit, person, time and delivery context.
- Scenario: Outside policy — Given the observation is outside the accepted range, when the coordinator submits it, then Nexa prevents an unreviewed dispatch and shows the required decision.
- Scenario: Missing confirmation — Given the observation cannot be confirmed, when the coordinator retries, then Nexa does not imply cold-chain approval.

## MOB-US-062 — Signal arrival for an active delivery

| Field | Value |
|---|---|
| ID | MOB-US-062 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V2 refinement-ready |
| Title | Signal arrival for an active delivery |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-10 — Notifications; BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Let the delivery team and buyer know that the authorized driver has reached the delivery context without completing the delivery. |
| Research status | PENDING |
| Connectivity and authority | Arrival is an explicit delivery fact; it is not continuous location tracking or proof of receipt. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 3 |
| Mobile Justification | A deliberate arrival signal gives the driver and buyer a shared operational moment with minimal field effort. |
| Backend Support | PARTIAL |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-027, MOB-US-044; TS-018 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Driver or Delivery Operator,
I want to signal arrival for an active delivery,
so that the buyer and delivery team know the handoff can begin.

### Acceptance Criteria

- Scenario: Arrival recorded — Given the driver has an authorized active delivery, when the driver signals arrival, then Nexa records the event and makes it visible to permitted recipients.
- Scenario: No active delivery — Given the driver is not assigned to an active delivery, when the driver signals arrival, then Nexa rejects the signal without revealing another delivery.
- Scenario: Delivery remains open — Given arrival was recorded, when the buyer or driver views the delivery, then it remains open until the handoff and receipt outcomes are separately recorded.

## MOB-US-063 — Follow delivery instructions and authorized contact details

| Field | Value |
|---|---|
| ID | MOB-US-063 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V2 refinement-ready |
| Title | Follow delivery instructions and authorized contact details |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Reach the intended delivery contact and follow the permitted instructions for the active delivery. |
| Research status | PENDING |
| Connectivity and authority | Contact details and instructions are access-controlled and may be stale; the driver cannot infer or expose extra personal data. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 3 |
| Mobile Justification | The driver needs the right context at the point of delivery without turning the app into an unrestricted contact directory. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-026, MOB-US-027, MOB-US-030, MOB-US-046; TS-018 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Driver or Delivery Operator,
I want to follow the permitted delivery instructions and contact details,
so that I can coordinate the handoff with the intended person.

### Acceptance Criteria

- Scenario: Authorized context — Given an active delivery includes permitted instructions, when the driver opens them, then Nexa shows only information needed for that delivery.
- Scenario: Instructions changed — Given the delivery instructions are no longer current, when the driver views them, then Nexa marks them stale and requires a fresh confirmation before relying on them.
- Scenario: Restricted information — Given a contact or instruction is not permitted for the driver, when the driver requests it, then Nexa withholds it and explains the permitted path.

## MOB-US-064 — Request a delivery reschedule from the field

| Field | Value |
|---|---|
| ID | MOB-US-064 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V2 refinement-ready |
| Title | Request a delivery reschedule from the field |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-10 — Notifications |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Ask for a different delivery time through the authorized delivery process without changing the schedule directly. |
| Research status | PENDING |
| Connectivity and authority | A request is not an accepted reschedule; the owning delivery process decides and reports the outcome. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 3 |
| Mobile Justification | A buyer can communicate a real availability constraint while preserving the supplier's scheduling authority. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-042, MOB-US-046, MOB-US-068; TS-018 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Customer Buyer,
I want to request a different delivery time,
so that the delivery team can decide how to handle my availability.

### Acceptance Criteria

- Scenario: Request submitted — Given the buyer is authorized for an active delivery, when the buyer proposes an alternative time, then Nexa records a request and shows that it is awaiting a delivery decision.
- Scenario: Decision returned — Given the delivery team accepts or rejects the request, when the buyer views the delivery, then Nexa shows the decision and the effective schedule without rewriting prior facts.
- Scenario: Stale request — Given the delivery is already terminal or changed, when the buyer submits the old request, then Nexa rejects it with the current delivery state.

## MOB-US-065 — Record a richer delivery incident

| Field | Value |
|---|---|
| ID | MOB-US-065 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V2 refinement-ready |
| Title | Record a richer delivery incident |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Describe an incident during delivery with enough context for an authorized follow-up decision. |
| Research status | PENDING |
| Connectivity and authority | Incident evidence may be staged temporarily, but accepted delivery facts and follow-up decisions remain connected and attributable. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 5 |
| Mobile Justification | The driver can capture the situation while it is observable, reducing lost context during operational follow-up. |
| Backend Support | PARTIAL |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-031, MOB-US-032, MOB-US-033, MOB-US-049; TS-019 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Driver or Delivery Operator,
I want to record a delivery incident with its relevant details,
so that the delivery team can make an informed follow-up decision.

### Acceptance Criteria

- Scenario: Incident described — Given an active delivery encounters a permitted incident, when the driver records its reason, place in the delivery and evidence, then Nexa preserves the incident for authorized review.
- Scenario: Incident does not rewrite outcome — Given a delivery outcome already exists, when an incident is added, then Nexa keeps the original outcome and links the new evidence to it.
- Scenario: Incomplete incident — Given required details are missing, when the driver tries to submit it, then Nexa identifies the missing information and does not claim a completed follow-up.

## MOB-US-066 — Recover an active delivery through selective offline operation

| Field | Value |
|---|---|
| ID | MOB-US-066 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Driver or Delivery Operator |
| Epic | MOBILE-EPIC-09 — Dispatch Exception & Delivery Coordination |
| Priority | V3 roadmap-ready |
| Title | Recover an active delivery through selective offline operation |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Preserve narrowly defined delivery evidence during a connection loss and make its later review explicit. |
| Research status | PENDING |
| Connectivity and authority | Offline evidence is temporary and bounded; no Delivery, receipt or payment truth is authoritative until Nexa confirms it. |
| Target Release | V3 |
| Sprint Planned | UNASSIGNED |
| Story Points | UNESTIMATED |
| Mobile Justification | A driver can retain critical context during a short coverage gap without confusing stored evidence with accepted business truth. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-035, MOB-US-031, MOB-US-033; TS-015, TS-019, TS-020 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Driver or Delivery Operator,
I want to preserve selected delivery evidence during a connection loss,
so that I can recover the work without claiming an unconfirmed delivery result.

### Acceptance Criteria

- Scenario: Evidence retained — Given a permitted evidence item is captured without connection, when the driver returns to coverage, then Nexa shows its pending state and permits review before submission.
- Scenario: Authoritative recovery — Given the delivery changed while the device was offline, when the evidence is reviewed, then Nexa resolves the conflict explicitly and never applies a stale result silently.

## MOB-US-067 — Provide delivery instructions and an alternate receipt contact

| Field | Value |
|---|---|
| ID | MOB-US-067 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-10 — Buyer Delivery Continuity |
| Priority | V2 refinement-ready |
| Title | Provide delivery instructions and an alternate receipt contact |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-02 — Customer & Buyer Relationships |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Give the delivery team permitted instructions and an authorized alternate contact for receipt. |
| Research status | PENDING |
| Connectivity and authority | Instructions and contacts are scoped to the delivery and require authorization, consent and current confirmation. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 5 |
| Mobile Justification | Buyers can reduce avoidable failed handoffs before the driver arrives while retaining control over shared information. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-042, MOB-US-048; TS-018, TS-020 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Customer Buyer,
I want to provide delivery instructions and an alternate receipt contact,
so that the delivery can reach the right person under the agreed conditions.

### Acceptance Criteria

- Scenario: Instructions provided — Given the buyer is authorized for the delivery, when the buyer saves instructions, then Nexa associates them with that delivery and shows their effective period.
- Scenario: Alternate contact consent — Given an alternate person must receive the delivery, when the buyer provides permitted contact information and consent, then Nexa records it for the defined delivery purpose only.
- Scenario: Change after dispatch — Given the delivery is already in a state that disallows changes, when the buyer edits instructions, then Nexa refuses the change or routes it for an explicit decision.

## MOB-US-068 — Review the delivery timeline and acknowledge completion

| Field | Value |
|---|---|
| ID | MOB-US-068 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-10 — Buyer Delivery Continuity |
| Priority | V2 refinement-ready |
| Title | Review the delivery timeline and acknowledge completion |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-09 — Fulfillment, dispatch and delivery |
| Goal / Outcome | Understand the sequence of delivery facts and acknowledge that the buyer has seen the final outcome without changing it. |
| Research status | PENDING |
| Connectivity and authority | Timeline facts are read from the authoritative delivery history; acknowledgement is distinct from receipt and completion. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 3 |
| Mobile Justification | A clear timeline helps buyers understand what happened when delivery outcomes or discrepancies need follow-up. |
| Backend Support | PARTIAL |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-031, MOB-US-032, MOB-US-044, MOB-US-048; TS-018 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Customer Buyer,
I want to review the delivery timeline and acknowledge its completion,
so that I understand the recorded outcome without changing the delivery history.

### Acceptance Criteria

- Scenario: Timeline visible — Given the buyer can access a delivery, when the buyer opens its timeline, then Nexa shows the ordered authorized facts and their current state.
- Scenario: Acknowledgement separate — Given the delivery has a recorded outcome, when the buyer acknowledges it, then Nexa records the acknowledgement separately from receipt, proof or completion.
- Scenario: History unchanged — Given the buyer acknowledges a delivery, when another permitted person views it, then the underlying delivery facts remain unchanged.

## MOB-US-069 — Attach evidence to a delivery discrepancy

| Field | Value |
|---|---|
| ID | MOB-US-069 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Buyer Mobile |
| Actor | Customer Buyer |
| Epic | MOBILE-EPIC-10 — Buyer Delivery Continuity |
| Priority | V2 refinement-ready |
| Title | Attach evidence to a delivery discrepancy |
| Owning Bounded Context | BC-06 — Fulfillment & Delivery |
| Relevant Bounded Contexts | BC-11 — Business Traceability |
| Shared Capability | CAP-15 — Business traceability |
| Goal / Outcome | Add permitted evidence to a buyer discrepancy so the supplier can review the difference with its original context intact. |
| Research status | PENDING |
| Connectivity and authority | Evidence is access-controlled, may be temporarily staged and never rewrites receipt, Delivery or payment facts. |
| Target Release | V2 |
| Sprint Planned | UNASSIGNED |
| Story Points | 3 |
| Mobile Justification | The buyer can preserve the visible condition of a discrepancy at the time it is reported. |
| Backend Support | PARTIAL |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-049; TS-015, TS-020 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Customer Buyer,
I want to attach evidence to a delivery discrepancy,
so that the supplier can review the reported difference with its context.

### Acceptance Criteria

- Scenario: Evidence attached — Given the buyer has a permitted discrepancy, when the buyer adds evidence, then Nexa links it to that discrepancy with person and time.
- Scenario: Unsupported or unsafe evidence — Given the evidence is unavailable, too large or not permitted, when the buyer tries to add it, then Nexa explains the problem and keeps the discrepancy unchanged.
- Scenario: Original facts preserved — Given evidence is accepted, when the delivery is reviewed, then receipt, Driver outcome and discrepancy facts remain separate.

## MOB-US-072 — Work with a customer through an authorized field visit

| Field | Value |
|---|---|
| ID | MOB-US-072 |
| Status | DEFERRED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Sales Representative |
| Epic | MOBILE-EPIC-11 — Mobile Commercial & Financial Follow-through |
| Priority | V3 roadmap-ready |
| Title | Work with a customer through an authorized field visit |
| Owning Bounded Context | BC-02 — Customer & Buyer Relationships |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Shared Capability | CAP-03 — Customer accounts and Buyer relationships |
| Goal / Outcome | Prepare and record an authorized customer visit with the relationship context and permitted follow-up visible. |
| Research status | PENDING |
| Connectivity and authority | Contact, location and navigation are mechanisms within an authorized relationship; no continuous location history is implied. |
| Target Release | V3 |
| Sprint Planned | UNASSIGNED |
| Story Points | UNESTIMATED |
| Mobile Justification | A sales representative can carry the right customer context into field work and capture the next authorized outcome. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-006, MOB-US-007, MOB-US-009; TS-017, TS-020 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Sales Representative,
I want to work with a customer through an authorized field visit,
so that the visit starts with the right relationship context and ends with a clear follow-up.

### Acceptance Criteria

- Scenario: Authorized visit — Given the representative has permission for the customer relationship, when the representative starts a visit, then Nexa shows the permitted customer context and purpose.
- Scenario: Follow-up captured — Given the visit produces a permitted follow-up, when the representative records it, then Nexa links the outcome to the customer relationship without creating an unapproved commitment.

## MOB-US-073 — Use advanced warehouse automation evidence in controlled work

| Field | Value |
|---|---|
| ID | MOB-US-073 |
| Status | PLANNED |
| Product | Mobile |
| Surface | Operations Mobile |
| Actor | Warehouse Operator |
| Epic | MOBILE-EPIC-12 — Future Intelligent Field Operations |
| Priority | V4 hypothesis |
| Title | Use advanced warehouse automation evidence in controlled work |
| Owning Bounded Context | BC-05 — Inventory Availability |
| Relevant Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability |
| Shared Capability | CAP-08 — Receiving and warehouse operations; CAP-10 — Cold-chain evidence and disposition |
| Goal / Outcome | Explore how richer automated observations could support a warehouse decision while keeping human authorization and historical traceability explicit. |
| Research status | PENDING |
| Connectivity and authority | RFID, industrial scanners, labels, sensors and automation are hypotheses; no device or telemetry source is selected or authoritative. |
| Target Release | V4_FUTURE |
| Sprint Planned | UNASSIGNED |
| Story Points | UNESTIMATED |
| Mobile Justification | A future field surface may help an operator review richer evidence, but the business outcome and trust model must be proven first. |
| Backend Support | OPEN |
| Client Status | NOT_STARTED |
| Dependencies | MOB-US-011, MOB-US-019, MOB-US-050, MOB-US-051; SPIKE-002, SPIKE-004 |
| Introduced In | PR-22 master backlog expansion |
| Sprint Implemented | NOT_IMPLEMENTED |
| Implemented In | NOT_IMPLEMENTED |
| Verified In | NOT_VERIFIED |
| Product Accepted In | NOT_ACCEPTED |

### User Story

As a Warehouse Operator,
I want to review advanced warehouse observations with a controlled decision,
so that future automation can assist work without becoming unexamined stock truth.

### Outcome Conditions

- The Product decision identifies a valuable warehouse outcome before a device or provider is selected.
- Any automated observation remains attributable, reviewable and subordinate to the owning Bounded Context's authorization.
- The release does not promise a specific RFID, scanner, sensor, label or telemetry implementation.
