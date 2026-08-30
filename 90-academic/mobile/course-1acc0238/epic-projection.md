---
status: planned
maturity: BASELINED
scope: runway
owner: academic
last-reviewed: 2026-08-30
---

# Academic Epic projection

> GENERATED ACADEMIC PROJECTION — DO NOT EDIT DIRECTLY

This projection maps the seven academic compatibility Epics to the canonical
Mobile catalog. It preserves five V1 Epics and two V2+ projections; it does not
duplicate the full twelve-Epic Product runway. The complete Product Epic index
is [here](../../../03-mobile/requirements/epics/README.md), and future stories
remain outside the academic course backlog. No Mobile Bounded Context or
client implementation is claimed.

## Dependency note

WEB-US-001, WEB-US-002, WEB-US-003, WEB-US-004 and WEB-US-005 Landing Page
stories remain a Sprint 1 dependency in the academic plan. They are not Mobile
stories and remain outside the Mobile Epic count.

## MOBILE-EPIC-01 - Safe Access & Work Context

- **ID / Title:** MOBILE-EPIC-01 / Safe Access & Work Context
- **Purpose / Outcome:** Let a person return to Nexa, select the intended context and use only work permitted by the active role.
- **Actors:** Mobile User
- **Apps:** Operations Mobile; Buyer Mobile
- **Capabilities:** CAP-02 Workforce access and governance
- **Bounded Contexts:** BC-01 Tenant & Access Governance; BC-02 Customer & Buyer Relationships
- **Business Goal / Impact:** Safe, scoped access before operational or Buyer work.
- **V1 Stories:** MOB-US-001, MOB-US-002, MOB-US-003
- **V2 / Deferred Stories:** None
- **Future / Runway:** Later device/session hardening and validated accessibility evidence.
- **Out of Scope:** Client-owned authorization, cross-tenant access and invented identity providers.
- **Success Criteria:** The person reaches the intended work only after identity, context and permission checks.
- **Implementation Evidence:** AS-IS access/context compatibility evidence; client NOT STARTED.
- **Academic Traceability:** Canonical catalog and story-to-design readiness map.

## MOBILE-EPIC-02 - Warehouse Receiving, Identification & Picking

- **ID / Title:** MOBILE-EPIC-02 / Warehouse Receiving, Identification & Picking
- **Purpose / Outcome:** Help Warehouse Operators identify products, record arrivals and lots, inspect safe stock, pick by FEFO and preserve discrepancies or temperature evidence.
- **Actors:** Warehouse Operator
- **Apps:** Operations Mobile
- **Capabilities:** CAP-07 Availability and inventory reservation; CAP-08 Receiving and warehouse operations; CAP-09 Fulfillment, dispatch and delivery; CAP-10 Cold-chain evidence and disposition; CAP-15 Business traceability
- **Bounded Contexts:** BC-03 Catalog & Commercial Policy; BC-05 Inventory Availability; BC-06 Fulfillment & Delivery; BC-11 Business Traceability
- **Business Goal / Impact:** Reduce physical ambiguity while keeping inventory and evidence authoritative.
- **V1 Stories:** MOB-US-011, MOB-US-012, MOB-US-013, MOB-US-014, MOB-US-015, MOB-US-016, MOB-US-017, MOB-US-019
- **V2 / Deferred Stories:** None
- **Future / Runway:** Advanced transfer/count, IoT telemetry and future warehouse optimization.
- **Out of Scope:** Scanner as authority, offline stock success, silent stock correction and a Mobile BC.
- **Success Criteria:** An authorized operator identifies the right product, handles the right lot and leaves a traceable exception record.
- **Implementation Evidence:** AS-IS API v0.17.0 identifier, lot, FEFO and evidence compatibility; client NOT STARTED.
- **Academic Traceability:** Canonical catalog, local-persistence boundary and validation plan.

## MOBILE-EPIC-03 - Dispatch Preparation & Handoff

- **ID / Title:** MOBILE-EPIC-03 / Dispatch Preparation & Handoff
- **Purpose / Outcome:** Prepare a delivery, assign responsibility, compare outgoing goods and preserve the warehouse-to-driver handoff before dispatch.
- **Actors:** Dispatch Coordinator
- **Apps:** Operations Mobile
- **Capabilities:** CAP-09 Fulfillment, dispatch and delivery; CAP-15 Business traceability
- **Bounded Contexts:** BC-05 Inventory Availability; BC-06 Fulfillment & Delivery; BC-11 Business Traceability
- **Business Goal / Impact:** Make dispatch responsibility and physical handoff reviewable.
- **V1 Stories:** MOB-US-020, MOB-US-021, MOB-US-022, MOB-US-023, MOB-US-024, MOB-US-025
- **V2 / Deferred Stories:** None
- **Future / Runway:** Future carrier and route optimization capabilities.
- **Out of Scope:** Dispatch without current allocation, evidence or assignment; handoff identity treated as Buyer acceptance.
- **Success Criteria:** A delivery leaves warehouse control only after the required preparation facts agree.
- **Implementation Evidence:** AS-IS API v0.17.0 fulfillment/handoff compatibility; client NOT STARTED.
- **Academic Traceability:** Canonical catalog and story-to-design readiness map.

## MOBILE-EPIC-04 - Driver Delivery Execution & Proof

- **ID / Title:** MOBILE-EPIC-04 / Driver Delivery Execution & Proof
- **Purpose / Outcome:** Give the Driver a focused flow for assigned deliveries, Attempts, navigation handoff, outcomes, proof and bounded handoff code.
- **Actors:** Driver or Delivery Operator
- **Apps:** Operations Mobile
- **Capabilities:** CAP-09 Fulfillment, dispatch and delivery; CAP-15 Business traceability
- **Bounded Contexts:** BC-01 Tenant & Access Governance; BC-02 Customer & Buyer Relationships; BC-06 Fulfillment & Delivery; BC-09 Business Documents; BC-11 Business Traceability
- **Business Goal / Impact:** Preserve what physically happens during delivery without permanent surveillance.
- **V1 Stories:** MOB-US-026, MOB-US-027, MOB-US-028, MOB-US-031, MOB-US-032, MOB-US-033, MOB-US-034
- **V2 / Deferred Stories:** None
- **Future / Runway:** Stored location, live tracking, contact, maps and full offline operations.
- **Out of Scope:** Driver outcome treated as Buyer receipt, code treated as acceptance, continuous location and generic offline authority.
- **Success Criteria:** An assigned Driver can execute and prove a Delivery with explicit partial, rejected and unresolved outcomes.
- **Implementation Evidence:** AS-IS API v0.17.0 Delivery/POD/handoff compatibility; client NOT STARTED.
- **Academic Traceability:** Canonical catalog, local-persistence boundary and validation plan.

## MOBILE-EPIC-05 - Delivery Handoff, Buyer Receipt & Critical Updates

- **ID / Title:** MOBILE-EPIC-05 / Delivery Handoff, Buyer Receipt & Critical Updates
- **Purpose / Outcome:** Help the Buyer notice a critical Delivery change, verify the handoff, confirm actual quantities and report a discrepancy without erasing facts.
- **Actors:** Customer Buyer
- **Apps:** Buyer Mobile
- **Capabilities:** CAP-09 Fulfillment, dispatch and delivery; CAP-14 Notifications; CAP-15 Business traceability
- **Bounded Contexts:** BC-02 Customer & Buyer Relationships; BC-06 Fulfillment & Delivery; BC-10 Notifications; BC-11 Business Traceability
- **Business Goal / Impact:** Give the Buyer a narrow, truthful delivery handoff and receipt path.
- **V1 Stories:** MOB-US-044, MOB-US-047, MOB-US-048, MOB-US-049
- **V2 / Deferred Stories:** None
- **Future / Runway:** Catalog, orders, finance, documents, reorder, maps and contact remain V2+/Portal.
- **Out of Scope:** Buyer Portal parity, QR-as-acceptance, independent receipt confirmation and notification-driven mutation.
- **Success Criteria:** The Buyer can distinguish update, handoff verification, receipt and discrepancy as separate facts.
- **Implementation Evidence:** AS-IS API v0.17.0 notification/handoff/receipt compatibility; client NOT STARTED.
- **Academic Traceability:** Canonical catalog and story-to-design readiness map.

## MOBILE-EPIC-06 - Commercial & Operational Mobile Convenience

- **ID / Title:** MOBILE-EPIC-06 / Commercial & Operational Mobile Convenience
- **Purpose / Outcome:** Collect deferred operational visibility, field sales and broad Buyer commerce convenience for a later evidence-backed slice.
- **Actors:** Business Operations Manager; Sales Representative; Customer Buyer
- **Apps:** Operations Mobile; Buyer Mobile
- **Capabilities:** CAP-03 Customer accounts and Buyer relationships; CAP-04 Catalog and commercial policy; CAP-05 Buyer shopping and drafts; CAP-06 Purchase Requests and Sales Orders; CAP-07 Availability and inventory reservation; CAP-11 Credit and receivables; CAP-12 Payments and correction; CAP-13 Business documents; CAP-16 Operational visibility
- **Bounded Contexts:** BC-02 Customer & Buyer Relationships; BC-03 Catalog & Commercial Policy; BC-04 Sales Commitment; BC-05 Inventory Availability; BC-07 Credit & Receivables; BC-08 Payments; BC-09 Business Documents; BC-11 Business Traceability
- **Business Goal / Impact:** Keep useful convenience visible without making it part of the focused V1 promise.
- **V1 Stories:** None
- **V2 / Deferred Stories:** MOB-US-004, MOB-US-005, MOB-US-006, MOB-US-007, MOB-US-008, MOB-US-009, MOB-US-010, MOB-US-036, MOB-US-037, MOB-US-038, MOB-US-039, MOB-US-040, MOB-US-041, MOB-US-042, MOB-US-043
- **Future / Runway:** Research, Product Acceptance, API contract and end-to-end evidence are required before activation.
- **Out of Scope:** Platform/Portal parity, local commercial authority and disconnected commitment or finance success.
- **Success Criteria:** Deferred stories have explicit research and authority gates instead of being implied V1 scope.
- **Implementation Evidence:** API compatibility is partial evidence only; no Mobile client claim.
- **Academic Traceability:** Reconciliation matrix and future Product Acceptance evidence.

## MOBILE-EPIC-07 - Advanced Field Mobility & Offline Operations

- **ID / Title:** MOBILE-EPIC-07 / Advanced Field Mobility & Offline Operations
- **Purpose / Outcome:** Collect advanced transfer, location, contact and generic offline recovery questions without making them V1 promises.
- **Actors:** Warehouse Operator; Driver or Delivery Operator; Customer Buyer
- **Apps:** Operations Mobile; Buyer Mobile
- **Capabilities:** CAP-08 Receiving and warehouse operations; CAP-09 Fulfillment, dispatch and delivery; CAP-10 Cold-chain evidence and disposition; CAP-15 Business traceability
- **Bounded Contexts:** BC-02 Customer & Buyer Relationships; BC-05 Inventory Availability; BC-06 Fulfillment & Delivery; BC-10 Notifications; BC-11 Business Traceability
- **Business Goal / Impact:** Protect integrity and privacy while advanced mobility questions are researched.
- **V1 Stories:** None
- **V2 / Deferred Stories:** MOB-US-018, MOB-US-029, MOB-US-030, MOB-US-035, MOB-US-045, MOB-US-046
- **Future / Runway:** Native/cross-platform, privacy, battery, provider, consent and offline evidence remain open.
- **Out of Scope:** Stored/background/continuous location, live map/ETA, chat and generic synchronization as V1 authority.
- **Success Criteria:** The runway records uncertainty and evidence needs without promoting research to Product truth.
- **Implementation Evidence:** No implementation or research result claimed; SPIKE-002, SPIKE-004 and SPIKE-006 remain open.
- **Academic Traceability:** Reconciliation matrix, spike contracts and future acceptance evidence.

## Academic boundary

Epic content is derived from the canonical catalog and reconciliation matrix.
Research status, framework choice, Product Acceptance, implementation evidence and
production readiness remain separate gates.
