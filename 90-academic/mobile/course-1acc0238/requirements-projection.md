---
status: planned
maturity: BASELINED
scope: runway
owner: academic
last-reviewed: 2026-08-30
---

# 1ACC0238 Mobile requirements projection

> GENERATED ACADEMIC PROJECTION — DO NOT EDIT DIRECTLY

Canonical source: [Mobile V1 catalog](../../../03-mobile/requirements/mobile-v1-catalog.md).
Product runway source (not part of this course backlog): [Master Mobile Product
Backlog](../../../03-mobile/requirements/master-mobile-backlog.md).
This projection preserves only the 28 Mobile V1 stories selected by the Product
Surface Scope Amendment / Rebaseline. Every row repeats the functional story
description and Gherkin scenarios so the academic artifact is readable without
delegating its required fields to a link. Research, implementation and Product
Acceptance remain open; no client, device, interview or provider evidence is
invented.

## Scope and course constraints

- Historical Mobile inventory: 49 retained IDs; final Product registry: 73;
  this course projection remains exactly 28 V1 rows.
- Academic V1 Epics: five. Product runway: twelve Epics across V1–V4/Future.
  The Epic model is outcome-based.
- V1 is online-first. Local persistence may support safe reads, harmless drafts,
  temporary evidence and retry metadata; it is not business authority.
- The academic native constraint is Android/Kotlin. A cross-platform option
  remains open for SPIKE-002; no framework is silently selected.
- The source course statement and rubric are intentionally excluded from the
  publishable Blueprint tree. This projection contains only derived planning.

## V1 backlog order

| Order | Story ID | User / Actor | Priority | Epic | Title | Owning BC | Points | Sprint | Scope |
|---:|---|---|---|---|---|---|---:|---|---|
| 1 | MOB-US-001 | Mobile User | P1 | MOBILE-EPIC-01 — Safe Access & Work Context | Continue authorized work safely after returning to Nexa | BC-01 — Tenant & Access Governance | 2 | S1 | V1 |
| 2 | MOB-US-002 | Mobile User | P1 | MOBILE-EPIC-01 — Safe Access & Work Context | Work in the intended company and business context | BC-01 — Tenant & Access Governance | 3 | S1 | V1 |
| 3 | MOB-US-003 | Mobile User | P1 | MOBILE-EPIC-01 — Safe Access & Work Context | See only work permitted for the person's role | BC-01 — Tenant & Access Governance | 3 | S1 | V1 |
| 4 | MOB-US-011 | Warehouse Operator | P1 | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking | Identify a product from a package or label code | BC-03 — Catalog & Commercial Policy | 3 | S1 | V1 |
| 5 | MOB-US-012 | Warehouse Operator | P1 | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking | Find a product manually when scanning is unavailable | BC-03 — Catalog & Commercial Policy | 2 | S1 | V1 |
| 6 | MOB-US-013 | Warehouse Operator | P1 | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking | Record stock that has just arrived | BC-05 — Inventory Availability | 5 | S1 | V1 |
| 7 | MOB-US-014 | Warehouse Operator | P1 | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking | Record the actual lot, expiry and quantity | BC-05 — Inventory Availability | 3 | S1 | V1 |
| 8 | MOB-US-015 | Warehouse Operator | P1 | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking | Check current lot and stock condition before physical work | BC-05 — Inventory Availability | 3 | S1 | V1 |
| 9 | MOB-US-016 | Warehouse Operator | P1 | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking | Pick the correct lot and quantity for prepared work | BC-05 — Inventory Availability | 5 | S1 | V1 |
| 10 | MOB-US-017 | Warehouse Operator | P1 | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking | Report a physical discrepancy or authorized stock disposition | BC-05 — Inventory Availability | 5 | S1 | V1 |
| 11 | MOB-US-019 | Warehouse Operator | P1 | MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking | Record temperature evidence for relevant stock | BC-06 — Fulfillment & Delivery | 3 | S1 | V1 |
| 12 | MOB-US-020 | Dispatch Coordinator | P1 | MOBILE-EPIC-03 — Dispatch Preparation & Handoff | See deliveries ready for dispatch preparation | BC-06 — Fulfillment & Delivery | 3 | S2 | V1 |
| 13 | MOB-US-021 | Dispatch Coordinator | P1 | MOBILE-EPIC-03 — Dispatch Preparation & Handoff | Assign a driver to a ready delivery | BC-06 — Fulfillment & Delivery | 3 | S2 | V1 |
| 14 | MOB-US-022 | Dispatch Coordinator | P1 | MOBILE-EPIC-03 — Dispatch Preparation & Handoff | Check outgoing goods against the prepared delivery | BC-06 — Fulfillment & Delivery | 5 | S2 | V1 |
| 15 | MOB-US-023 | Dispatch Coordinator | P1 | MOBILE-EPIC-03 — Dispatch Preparation & Handoff | Preserve warehouse-to-driver handoff evidence | BC-06 — Fulfillment & Delivery | 3 | S2 | V1 |
| 16 | MOB-US-024 | Dispatch Coordinator | P1 | MOBILE-EPIC-03 — Dispatch Preparation & Handoff | Reliably identify a dispatch handoff | BC-06 — Fulfillment & Delivery | 2 | S2 | V1 |
| 17 | MOB-US-025 | Dispatch Coordinator | P1 | MOBILE-EPIC-03 — Dispatch Preparation & Handoff | Confirm goods left warehouse control | BC-06 — Fulfillment & Delivery | 5 | S2 | V1 |
| 18 | MOB-US-026 | Driver or Delivery Operator | P1 | MOBILE-EPIC-04 — Driver Delivery Execution & Proof | See deliveries assigned to the driver | BC-06 — Fulfillment & Delivery | 2 | S2 | V1 |
| 19 | MOB-US-027 | Driver or Delivery Operator | P1 | MOBILE-EPIC-04 — Driver Delivery Execution & Proof | Begin an assigned delivery | BC-06 — Fulfillment & Delivery | 3 | S2 | V1 |
| 20 | MOB-US-028 | Driver or Delivery Operator | P1 | MOBILE-EPIC-04 — Driver Delivery Execution & Proof | Open directions to the authorized delivery destination | BC-06 — Fulfillment & Delivery | 2 | S2 | V1 |
| 21 | MOB-US-031 | Driver or Delivery Operator | P1 | MOBILE-EPIC-04 — Driver Delivery Execution & Proof | Record the delivery attempt outcome | BC-06 — Fulfillment & Delivery | 5 | S2 | V1 |
| 22 | MOB-US-032 | Driver or Delivery Operator | P1 | MOBILE-EPIC-04 — Driver Delivery Execution & Proof | Record a partial or rejected delivery and what remains | BC-06 — Fulfillment & Delivery | 5 | S2 | V1 |
| 23 | MOB-US-033 | Driver or Delivery Operator | P1 | MOBILE-EPIC-04 — Driver Delivery Execution & Proof | Preserve proof of delivery | BC-06 — Fulfillment & Delivery | 5 | S2 | V1 |
| 24 | MOB-US-034 | Driver or Delivery Operator | P1 | MOBILE-EPIC-04 — Driver Delivery Execution & Proof | Present a bounded delivery handoff code | BC-06 — Fulfillment & Delivery | 3 | S2 | V1 |
| 25 | MOB-US-044 | Customer Buyer | P1 | MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates | Know when a delivery needs attention | BC-10 — Notifications | 3 | S3 | V1 |
| 26 | MOB-US-047 | Customer Buyer | P1 | MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates | Verify a delivery through the handoff code | BC-06 — Fulfillment & Delivery | 3 | S3 | V1 |
| 27 | MOB-US-048 | Customer Buyer | P1 | MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates | Confirm the quantities actually received | BC-06 — Fulfillment & Delivery | 5 | S3 | V1 |
| 28 | MOB-US-049 | Customer Buyer | P1 | MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates | Report a discrepancy without erasing the facts | BC-06 — Fulfillment & Delivery | 5 | S3 | V1 |

## Visible V1 field registry

### MOB-US-001 - Continue authorized work safely after returning to Nexa

- **ID:** MOB-US-001
- **Product:** Mobile
- **App:** Operations Mobile; Buyer Mobile
- **Surface:** Operations Mobile; Buyer Mobile
- **User / Actor:** Mobile User
- **Epic:** MOBILE-EPIC-01 — Safe Access & Work Context
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Continue authorized work safely after returning to Nexa
- **Owning Bounded Context:** BC-01 — Tenant & Access Governance
- **Secondary Bounded Contexts:** BC-01 — Tenant & Access Governance
- **Shared Capability:** CAP-02 — Workforce access and governance
- **Business Goal / Impact:** I can resume my work without exposing protected information.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — access/context compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 — Tenant & Access Governance; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Mobile User, I want to continue authorized work safely after returning to Nexa, so that I can resume my work without exposing protected information.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Valid return — Given a valid, non-revoked session, when the person returns to Nexa, then Nexa confirms identity and exposes only permitted work.
  - Scenario: Expired return — Given an expired, revoked or malformed session, when the person returns, then Nexa requests identity again and exposes no protected information.
  - Scenario: Unavailable confirmation — Given identity cannot be confirmed, when the person returns without a connection, then Nexa states that work is unavailable and exposes no protected information.
  - Scenario: Safe retry — Given the person retries the same return, when Nexa processes it, then no business action is duplicated and no secret is revealed.
- **Story Points:** 2
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-001 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-002 - Work in the intended company and business context

- **ID:** MOB-US-002
- **Product:** Mobile
- **App:** Operations Mobile; Buyer Mobile
- **Surface:** Operations Mobile; Buyer Mobile
- **User / Actor:** Mobile User
- **Epic:** MOBILE-EPIC-01 — Safe Access & Work Context
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Work in the intended company and business context
- **Owning Bounded Context:** BC-01 — Tenant & Access Governance
- **Secondary Bounded Contexts:** BC-01 — Tenant & Access Governance
- **Shared Capability:** CAP-02 — Workforce access and governance
- **Business Goal / Impact:** every task concerns the company and relationship I mean to serve.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — access/context compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 — Tenant & Access Governance; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Mobile User, I want to work in the intended company and business context, so that every task concerns the company and relationship I mean to serve.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: One authorized context — Given one authorized context exists, when the person starts work, then Nexa uses that context for every permitted read and action.
  - Scenario: Several authorized contexts — Given several contexts exist, when the person chooses one, then Nexa confirms the choice before showing protected work.
  - Scenario: Context no longer valid — Given a context is suspended or unauthorized, when the person chooses it, then Nexa rejects it and exposes no scoped business information.
  - Scenario: Context change — Given the person changes context, when the change succeeds, then information from the previous context cannot be used in the new context.
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-002 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-003 - See only work permitted for the person's role

- **ID:** MOB-US-003
- **Product:** Mobile
- **App:** Operations Mobile; Buyer Mobile
- **Surface:** Operations Mobile; Buyer Mobile
- **User / Actor:** Mobile User
- **Epic:** MOBILE-EPIC-01 — Safe Access & Work Context
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** See only work permitted for the person's role
- **Owning Bounded Context:** BC-01 — Tenant & Access Governance
- **Secondary Bounded Contexts:** BC-01 — Tenant & Access Governance
- **Shared Capability:** CAP-02 — Workforce access and governance
- **Business Goal / Impact:** I do not attempt work that my role or relationship does not allow.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — access/context compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 — Tenant & Access Governance; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Mobile User, I want to see only work permitted for my role, so that I do not attempt work that my role or relationship does not allow.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Permitted work — Given the person's role permits a task, when Nexa confirms the role, then the person can carry out that task in the active context.
  - Scenario: Missing permission — Given the person's role does not permit a task, when the person attempts it, then Nexa refuses it even if old information suggests otherwise.
  - Scenario: Permission changes — Given permission changes, when Nexa checks the person's role again, then unavailable work is no longer accepted.
  - Scenario: Unconfirmed permission — Given permission cannot be checked, when the person attempts a task, then Nexa blocks the task and states that confirmation is required.
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-003 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-011 - Identify a product from a package or label code

- **ID:** MOB-US-011
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Identify a product from a package or label code
- **Owning Bounded Context:** BC-03 — Catalog & Commercial Policy
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-08 — Receiving and warehouse operations
- **Business Goal / Impact:** I handle the correct product during warehouse work.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-03 — Catalog & Commercial Policy; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Warehouse Operator, I want to identify a product from a package or label code, so that I handle the correct product during warehouse work.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: One match — Given a permitted package or label code has one match, when the operator provides it, then Nexa identifies the product before any stock action.
  - Scenario: Unknown code — Given the code is unknown, ambiguous or outside the person's scope, when the operator provides it, then Nexa rejects it and does not guess.
  - Scenario: Camera unavailable — Given the camera or scanner is unavailable, when the operator cannot provide a code, then the operator can use the manual product search.
  - Scenario: Repeat identification — Given the operator provides the same code again, when Nexa resolves it, then no receipt or pick fact is created by identification alone.
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-011 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-012 - Find a product manually when scanning is unavailable

- **ID:** MOB-US-012
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Find a product manually when scanning is unavailable
- **Owning Bounded Context:** BC-03 — Catalog & Commercial Policy
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-08 — Receiving and warehouse operations
- **Business Goal / Impact:** I can continue safe work without guessing the product.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-03 — Catalog & Commercial Policy; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Warehouse Operator, I want to find a product manually when scanning is unavailable, so that I can continue safe work without guessing the product.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Exact match — Given an exact permitted product is found, when the operator selects it, then Nexa identifies the product for the next step.
  - Scenario: Ambiguous match — Given several products could match, when the operator searches, then Nexa requires a clear choice and records no stock fact.
  - Scenario: No connection — Given the operator has no connection, when a product cannot be confirmed, then Nexa marks the choice unverified and blocks authoritative stock work.
  - Scenario: Repeat selection — Given the operator selects the same product again, when the selection is repeated, then no receipt or pick fact is duplicated.
- **Story Points:** 2
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-012 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-013 - Record stock that has just arrived

- **ID:** MOB-US-013
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record stock that has just arrived
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-08 — Receiving and warehouse operations
- **Business Goal / Impact:** the warehouse has a trustworthy record of received stock.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 — Inventory Availability; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Warehouse Operator, I want to record stock that has just arrived, so that the warehouse has a trustworthy record of received stock.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Valid arrival — Given the operator has permission and provides a product, lot and positive quantity, when the arrival is recorded, then Nexa records one received-stock fact.
  - Scenario: Invalid arrival — Given required arrival information is missing or invalid, when the operator records it, then Nexa records no partial stock change.
  - Scenario: Uncertain result — Given the outcome is unknown, when the operator retries the same arrival, then Nexa returns the original result without doubling stock.
  - Scenario: No connection — Given the operator has no connection, when the arrival cannot be confirmed, then Nexa shows an unconfirmed state and does not report received stock as authoritative.
- **Story Points:** 5
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-013 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-014 - Record the actual lot, expiry and quantity

- **ID:** MOB-US-014
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record the actual lot, expiry and quantity
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-08 — Receiving and warehouse operations
- **Business Goal / Impact:** future picking uses what physically arrived.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 — Inventory Availability; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Warehouse Operator, I want to record the actual lot, expiry and quantity, so that future picking uses what physically arrived.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Complete lot facts — Given the operator provides a valid lot, expiry and positive quantity, when the arrival is confirmed, then Nexa preserves those facts for the received stock.
  - Scenario: Invalid expiry — Given expiry is missing, malformed or not acceptable, when the operator records it, then Nexa rejects the arrival and creates no sellable stock.
  - Scenario: Duplicate arrival — Given the same arrival is submitted again, when Nexa receives it, then one arrival remains recorded and quantity is not doubled.
  - Scenario: Local preparation — Given the operator loses connection, when lot facts are drafted, then they remain unconfirmed and cannot make stock sellable.
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-014 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-015 - Check current lot and stock condition before physical work

- **ID:** MOB-US-015
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Check current lot and stock condition before physical work
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-07 — Availability and inventory reservation
- **Business Goal / Impact:** I choose stock that is safe and available for the task.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 — Inventory Availability; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Warehouse Operator, I want to check the current lot and stock condition before physical work, so that I choose stock that is safe and available for the task.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Current stock — Given the operator has permission, when stock is checked, then physical quantity, sellable quantity, lot and condition are distinct.
  - Scenario: Restricted lot — Given stock is expired, held, quarantined or allocated, when it is checked, then it is not treated as freely sellable.
  - Scenario: Stale information — Given stock information is stale or unavailable, when the operator begins work, then Nexa requires a current confirmation.
  - Scenario: Other scope — Given the lot belongs to another company or warehouse, when it is checked, then no quantity or lot fact is exposed.
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-015 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-016 - Pick the correct lot and quantity for prepared work

- **ID:** MOB-US-016
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Pick the correct lot and quantity for prepared work
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the delivery receives the stock that was actually prepared.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 — Inventory Availability; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Warehouse Operator, I want to pick the correct lot and quantity for prepared work, so that the delivery receives the stock that was actually prepared.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: FEFO pick — Given an active allocation and eligible lots, when the operator picks the earliest suitable lot, then Nexa records the pick against that lot and quantity.
  - Scenario: Unsafe pick — Given a lot is unknown, expired, quarantined or not allocated, when the operator picks it, then Nexa rejects the pick without consuming stock.
  - Scenario: Too much stock — Given the requested quantity exceeds the remaining allocation, when the operator picks it, then Nexa rejects the excess and preserves the remaining quantity.
  - Scenario: Repeat pick — Given the outcome is unknown, when the operator retries the same pick, then Nexa returns one result and does not consume stock twice.
- **Story Points:** 5
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-016 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-017 - Report a physical discrepancy or authorized stock disposition

- **ID:** MOB-US-017
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Report a physical discrepancy or authorized stock disposition
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-08 — Receiving and warehouse operations
- **Business Goal / Impact:** an exception remains visible without erasing what happened.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 — Inventory Availability; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Warehouse Operator, I want to report a physical discrepancy or authorized stock disposition, so that an exception remains visible without erasing what happened.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Observed difference — Given the operator observes a difference, when the authorized report is accepted, then offered, picked and remaining quantities stay separately recorded.
  - Scenario: Missing authority — Given permission, reason or required evidence is missing, when the operator reports the difference, then Nexa records no unauthorized stock change.
  - Scenario: Repeat report — Given the outcome is unknown, when the operator retries the same report, then Nexa preserves one discrepancy fact.
  - Scenario: Disconnected note — Given the operator has no connection, when a report is drafted, then it is marked unconfirmed and cannot change sellable stock.
- **Story Points:** 5
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-017 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-019 - Record temperature evidence for relevant stock

- **ID:** MOB-US-019
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-02 — Warehouse Receiving, Identification & Picking
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record temperature evidence for relevant stock
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-10 — Cold-chain evidence and disposition
- **Business Goal / Impact:** cold-chain decisions use an attributable physical reading.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Warehouse Operator, I want to record temperature evidence for relevant stock, so that cold-chain decisions use an attributable physical reading.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Valid reading — Given the operator has permission and a lot or warehouse is known, when a valid reading is recorded, then Nexa preserves value, unit, time, person and subject.
  - Scenario: Concerning reading — Given a reading is outside the accepted range, when it is recorded, then Nexa keeps the evidence and makes no silent release decision.
  - Scenario: Incomplete reading — Given the subject or unit is missing, when the reading is recorded, then Nexa rejects it without creating incomplete evidence.
  - Scenario: Temporary failure — Given the reading cannot be confirmed, when the operator stages the evidence, then it remains pending and no final stock disposition is claimed.
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1
- **Canonical traceability:** [MOB-US-019 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-020 - See deliveries ready for dispatch preparation

- **ID:** MOB-US-020
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-03 — Dispatch Preparation & Handoff
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** See deliveries ready for dispatch preparation
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** I prepare only deliveries that are ready to leave the warehouse.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Dispatch Coordinator, I want to see deliveries ready for dispatch preparation, so that I prepare only deliveries that are ready to leave the warehouse.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Ready delivery — Given a delivery meets its preparation conditions, when the coordinator checks it, then it is identified as ready for dispatch work.
  - Scenario: Not ready — Given allocation, picking or evidence is incomplete, when the coordinator checks the delivery, then it is not presented as ready.
  - Scenario: Stale readiness — Given readiness information is stale, when the coordinator starts preparation, then Nexa requires a current check.
  - Scenario: Wrong scope — Given a delivery belongs to another company or warehouse, when it is checked, then it is not exposed.
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-020 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-021 - Assign a driver to a ready delivery

- **ID:** MOB-US-021
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-03 — Dispatch Preparation & Handoff
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Assign a driver to a ready delivery
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** responsibility for the delivery is clear before handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Dispatch Coordinator, I want to assign a driver to a ready delivery, so that responsibility for the delivery is clear before handoff.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Eligible driver — Given a delivery is ready and a driver is eligible, when the coordinator assigns the driver, then Nexa records one assignment.
  - Scenario: Ineligible assignment — Given the delivery or driver is not eligible, when the coordinator assigns the driver, then Nexa rejects the assignment and changes no delivery responsibility.
  - Scenario: Stale assignment — Given the delivery changed after it was read, when the coordinator assigns the driver, then Nexa asks for current information instead of overwriting the change.
  - Scenario: Repeat assignment — Given the coordinator repeats the same assignment, when Nexa receives it, then the delivery has one assignment result.
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-021 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-022 - Check outgoing goods against the prepared delivery

- **ID:** MOB-US-022
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-03 — Dispatch Preparation & Handoff
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Check outgoing goods against the prepared delivery
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the driver receives what the delivery actually requires.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Dispatch Coordinator, I want to check outgoing goods against the prepared delivery, so that the driver receives what the delivery actually requires.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Matching goods — Given outgoing goods match the current allocation, when the coordinator checks them, then Nexa records that the handoff preparation matches.
  - Scenario: Mismatch — Given a lot or quantity differs from the allocation, when the coordinator checks it, then Nexa stops the handoff and preserves the discrepancy.
  - Scenario: Changed allocation — Given the allocation changed after preparation, when the coordinator checks the goods, then Nexa requires a fresh preparation decision.
  - Scenario: Repeat check — Given the same goods are checked again, when the coordinator repeats the check, then no second stock movement is created by the check.
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-022 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-023 - Preserve warehouse-to-driver handoff evidence

- **ID:** MOB-US-023
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-03 — Dispatch Preparation & Handoff
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Preserve warehouse-to-driver handoff evidence
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the movement of prepared goods remains reviewable.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Dispatch Coordinator, I want to preserve warehouse-to-driver handoff evidence, so that the movement of prepared goods remains reviewable.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Complete evidence — Given the delivery, goods and responsible people are known, when the handoff is recorded, then Nexa preserves the evidence with time and delivery identity.
  - Scenario: Missing evidence — Given required evidence is missing, when the coordinator records the handoff, then Nexa leaves the handoff unconfirmed.
  - Scenario: Evidence failure — Given evidence cannot be confirmed, when the coordinator retries, then Nexa shows the unresolved state and does not claim completed handoff.
  - Scenario: Repeat handoff — Given the same handoff is submitted again, when Nexa receives it, then one handoff fact remains and prior evidence is not erased.
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-023 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-024 - Reliably identify a dispatch handoff

- **ID:** MOB-US-024
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-03 — Dispatch Preparation & Handoff
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Reliably identify a dispatch handoff
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the right delivery and driver remain linked throughout the handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Dispatch Coordinator, I want to reliably identify a dispatch handoff, so that the right delivery and driver remain linked throughout the handoff.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Known handoff — Given a prepared delivery and assigned driver, when the coordinator identifies the handoff, then Nexa links it to that delivery and assignment.
  - Scenario: Wrong handoff — Given an identifier belongs to another delivery, when it is used, then Nexa rejects it and changes no delivery fact.
  - Scenario: Expired identity — Given the handoff identity is no longer valid, when it is used, then Nexa requires a new authorized handoff.
  - Scenario: Separate meanings — Given the handoff is identified, when the identity is resolved, then Nexa does not treat it as Driver outcome or Buyer receipt.
- **Story Points:** 2
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-024 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-025 - Confirm goods left warehouse control

- **ID:** MOB-US-025
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-03 — Dispatch Preparation & Handoff
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Confirm goods left warehouse control
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** everyone can rely on the delivery's dispatch state.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Dispatch Coordinator, I want to confirm goods left warehouse control, so that everyone can rely on the delivery's dispatch state.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Complete handoff — Given allocation, outgoing checks, driver assignment and handoff evidence are complete, when the coordinator confirms dispatch, then Nexa records the delivery as dispatched.
  - Scenario: Incomplete handoff — Given any required check is incomplete, when the coordinator confirms dispatch, then Nexa leaves the delivery undispatched.
  - Scenario: Changed delivery — Given the delivery changed after preparation, when the coordinator confirms dispatch, then Nexa requires current checks instead of overwriting the change.
  - Scenario: Uncertain result — Given confirmation may have succeeded, when the coordinator retries, then Nexa resolves one dispatch result without a duplicate transition.
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-025 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-026 - See deliveries assigned to the driver

- **ID:** MOB-US-026
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver or Delivery Operator
- **Epic:** MOBILE-EPIC-04 — Driver Delivery Execution & Proof
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** See deliveries assigned to the driver
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** I know which deliveries I am responsible for today.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Driver or Delivery Operator, I want to see deliveries assigned to me, so that I know which deliveries I am responsible for today.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Current assignments — Given the driver is authorized, when assigned deliveries are checked, then only the driver's current deliveries are shown.
  - Scenario: Removed assignment — Given an assignment is removed, when the driver checks again, then the delivery is no longer treated as assigned.
  - Scenario: Stale list — Given the assignment list is stale, when the driver starts work, then Nexa requires a current confirmation.
  - Scenario: Other driver's delivery — Given a delivery belongs to another driver, when it is requested, then no protected delivery information is exposed.
- **Story Points:** 2
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-026 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-027 - Begin an assigned delivery

- **ID:** MOB-US-027
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver or Delivery Operator
- **Epic:** MOBILE-EPIC-04 — Driver Delivery Execution & Proof
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Begin an assigned delivery
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the Delivery Attempt has a clear and authorized start.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Driver or Delivery Operator, I want to begin an assigned delivery, so that the Delivery Attempt has a clear and authorized start.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Assigned start — Given the delivery is assigned and ready, when the driver begins it, then Nexa records one active Delivery Attempt.
  - Scenario: Unassigned start — Given the delivery is not assigned to the driver, when the driver begins it, then Nexa rejects it and records no Attempt.
  - Scenario: Already started — Given an Attempt already exists, when the driver begins it again, then Nexa returns the current Attempt without creating another one.
  - Scenario: No connection — Given the start cannot be confirmed, when the driver tries to begin, then Nexa shows an unconfirmed state and does not claim an active Attempt.
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-027 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-028 - Open directions to the authorized delivery destination

- **ID:** MOB-US-028
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver or Delivery Operator
- **Epic:** MOBILE-EPIC-04 — Driver Delivery Execution & Proof
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Open directions to the authorized delivery destination
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** I can travel to the right destination without changing the Delivery record.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** External navigation handoff only; no stored or continuous location.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Driver or Delivery Operator, I want to open directions to the authorized delivery destination, so that I can travel to the right destination without changing the Delivery record.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Authorized destination — Given an active authorized delivery has a destination, when the driver asks for directions, then Nexa hands that destination to the chosen navigation service.
  - Scenario: Missing destination — Given the destination is missing or not authorized, when directions are requested, then Nexa does not disclose an unverified location.
  - Scenario: Navigation unavailable — Given the navigation service is unavailable, when directions are requested, then the Delivery Attempt remains unchanged and the failure is clear.
  - Scenario: No stored tracking — Given directions are opened, when the handoff completes, then Nexa stores no continuous or background driver location from this action.
- **Story Points:** 2
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-028 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-031 - Record the delivery attempt outcome

- **ID:** MOB-US-031
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver or Delivery Operator
- **Epic:** MOBILE-EPIC-04 — Driver Delivery Execution & Proof
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record the delivery attempt outcome
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the supplier knows what physically happened at the destination.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Driver or Delivery Operator, I want to record the delivery attempt outcome, so that the supplier knows what physically happened at the destination.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Allowed outcome — Given an active assigned Attempt, when the driver records an allowed outcome, then Nexa preserves the outcome, person and time.
  - Scenario: Invalid outcome — Given the Attempt is not active or the driver is not authorized, when an outcome is recorded, then Nexa changes no Delivery state.
  - Scenario: Required evidence — Given the outcome needs evidence that is missing, when the driver records it, then Nexa leaves the outcome unconfirmed.
  - Scenario: Repeat outcome — Given the outcome is unknown, when the driver retries the same outcome, then Nexa returns one result and does not overwrite history.
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-031 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-032 - Record a partial or rejected delivery and what remains

- **ID:** MOB-US-032
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver or Delivery Operator
- **Epic:** MOBILE-EPIC-04 — Driver Delivery Execution & Proof
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record a partial or rejected delivery and what remains
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** no physical outcome or remaining obligation is lost.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Driver or Delivery Operator, I want to record a partial or rejected delivery and what remains, so that no physical outcome or remaining obligation is lost.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Partial delivery — Given the driver provides valid delivered and remaining quantities, when the partial outcome is recorded, then Nexa preserves delivered, rejected and remaining quantities separately.
  - Scenario: Rejected delivery — Given goods are rejected with a reason, when the rejection is recorded, then Nexa preserves the reason and does not call the delivery complete.
  - Scenario: Continuation — Given quantity remains for future delivery, when the outcome is confirmed, then Nexa creates only the authorized continuation.
  - Scenario: Uncertain result — Given the outcome is unknown, when the driver retries, then Nexa returns one result and does not overwrite prior facts.
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-032 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-033 - Preserve proof of delivery

- **ID:** MOB-US-033
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver or Delivery Operator
- **Epic:** MOBILE-EPIC-04 — Driver Delivery Execution & Proof
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Preserve proof of delivery
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the Delivery outcome can be reviewed without losing its history.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Driver or Delivery Operator, I want to preserve proof of delivery, so that the Delivery outcome can be reviewed without losing its history.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Required proof — Given the Attempt and evidence requirements are valid, when the driver provides the required proof, then Nexa preserves its identity, person and time.
  - Scenario: Missing proof — Given required proof is missing or invalid, when the driver finishes the Attempt, then Nexa does not claim completed proof.
  - Scenario: Temporary failure — Given proof cannot be confirmed, when the driver retries, then Nexa keeps a visible unresolved state and does not falsely complete the Delivery.
  - Scenario: Repeat proof — Given the same proof is provided again, when Nexa receives it, then one proof fact remains and earlier evidence is not erased.
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-033 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-034 - Present a bounded delivery handoff code

- **ID:** MOB-US-034
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver or Delivery Operator
- **Epic:** MOBILE-EPIC-04 — Driver Delivery Execution & Proof
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Present a bounded delivery handoff code
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the buyer can identify the correct delivery safely.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Driver or Delivery Operator, I want to present a bounded delivery handoff code, so that the buyer can identify the correct delivery safely.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Valid code — Given an active authorized Delivery, when the driver presents its code, then Nexa binds the code to that Delivery and Attempt.
  - Scenario: Expired or wrong code — Given a code is expired, reused or belongs to another Delivery, when it is checked, then Nexa rejects it without changing Delivery state.
  - Scenario: Code unavailable — Given the code cannot be presented, when the driver uses the approved fallback, then the handoff remains explicit and no false acceptance is recorded.
  - Scenario: Separate facts — Given the buyer verifies the code, when verification succeeds, then it does not by itself create receipt, POD, payment or Delivery completion.
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2 / TB1
- **Canonical traceability:** [MOB-US-034 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-044 - Know when a delivery needs attention

- **ID:** MOB-US-044
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Know when a delivery needs attention
- **Owning Bounded Context:** BC-10 — Notifications
- **Secondary Bounded Contexts:** BC-06 — Fulfillment & Delivery; BC-02 — Customer & Buyer Relationships
- **Shared Capability:** CAP-14 — Notifications
- **Business Goal / Impact:** I can respond to a relevant delivery change in time.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Critical Delivery awareness; subscription lifecycle remains technical.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-10 — Notifications; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Customer Buyer, I want to know when a delivery needs attention, so that I can respond to a relevant delivery change in time.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Relevant update — Given a permitted Delivery fact needs buyer attention, when Nexa sends an update, then the buyer can identify the relevant Delivery.
  - Scenario: Unrelated update — Given the Delivery is outside the buyer's relationship, when an update is prepared, then no private Delivery information is disclosed.
  - Scenario: Delivery failure — Given an update cannot be delivered, when the buyer opens Nexa, then current Delivery facts remain available for refresh and no Delivery fact changes.
  - Scenario: Update retry — Given an update is repeated, when the buyer receives it, then it does not create a second Delivery, receipt or discrepancy fact.
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** AV2 / TB2
- **Canonical traceability:** [MOB-US-044 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-047 - Verify a delivery through the handoff code

- **ID:** MOB-US-047
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Verify a delivery through the handoff code
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** I can confirm I am reviewing the correct Delivery.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Customer Buyer, I want to verify a delivery through the handoff code, so that I can confirm I am reviewing the correct Delivery.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Matching code — Given a valid unexpired code and authorized relationship, when the buyer verifies it, then Nexa identifies the matching Delivery and Attempt.
  - Scenario: Invalid code — Given the code is expired, reused, malformed or unrelated, when the buyer verifies it, then Nexa rejects it and changes no receipt fact.
  - Scenario: No connection — Given the code cannot be confirmed, when the buyer verifies it, then Nexa shows an unconfirmed state and no receipt succeeds.
  - Scenario: Verification boundary — Given the code is verified, when the buyer continues, then verification alone does not confirm quantities, POD, payment or Delivery completion.
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** AV2 / TB2
- **Canonical traceability:** [MOB-US-047 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-048 - Confirm the quantities actually received

- **ID:** MOB-US-048
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Confirm the quantities actually received
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the supplier has a truthful record of my receipt.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Customer Buyer, I want to confirm the quantities actually received, so that the supplier has a truthful record of my receipt.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Matching receipt — Given a verified authorized handoff, when the buyer confirms received quantities, then Nexa records one Buyer receipt fact with person, time and Delivery.
  - Scenario: Different quantities — Given received quantities differ from the driver's outcome, when the buyer confirms them, then both facts remain separate and the difference is visible.
  - Scenario: Stale or reused handoff — Given the handoff is stale, expired or already used, when the buyer confirms quantities, then Nexa rejects the confirmation or returns its original result without a second receipt.
  - Scenario: No connection — Given receipt confirmation cannot be checked, when the buyer attempts it, then Nexa shows no receipt success until confirmation is received.
- **Story Points:** 5
- **Sprint:** S3
- **Academic Milestone:** AV2 / TB2
- **Canonical traceability:** [MOB-US-048 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

### MOB-US-049 - Report a discrepancy without erasing the facts

- **ID:** MOB-US-049
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-05 — Delivery Handoff, Buyer Receipt & Critical Updates
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Report a discrepancy without erasing the facts
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** the supplier can resolve the difference while the history remains trustworthy.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile-native physical or handoff work; business authority remains in Nexa.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 — Fulfillment & Delivery; shared access, authorization, freshness and retry contracts.
- **Description / User Story:** As a Customer Buyer, I want to report a discrepancy without erasing the facts, so that the supplier can resolve the difference while the history remains trustworthy.
- **Acceptance Criteria:** Four visible Gherkin scenarios; canonical catalog remains the behavior authority.
  - Scenario: Discrepancy recorded — Given a verified handoff or receipt context, when the buyer reports a discrepancy, then Nexa preserves reason, affected quantity, person, time and evidence.
  - Scenario: Separate histories — Given the Driver outcome differs from the Buyer receipt, when the discrepancy is recorded, then both original facts remain unchanged and the difference is visible.
  - Scenario: Invalid report — Given reason, permission or required evidence is missing, when the buyer reports it, then Nexa records no unauthorized correction.
  - Scenario: Temporary failure — Given the report cannot be confirmed, when the buyer retries, then Nexa keeps one pending or accepted result and does not imply a refund, payment change or Delivery completion.
- **Story Points:** 5
- **Sprint:** S3
- **Academic Milestone:** AV2 / TB2
- **Canonical traceability:** [MOB-US-049 in the canonical catalog](../../../03-mobile/requirements/mobile-v1-catalog.md)

## Academic evidence boundary

These are planning projections. `READY` or `STRUCTURE_READY` means that the
document has the required structure and visible content; it does not prove
research, implementation, physical-device execution, distribution, Product
Acceptance or production readiness.
