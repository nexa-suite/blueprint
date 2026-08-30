---
status: planned
maturity: BASELINED
scope: runway
owner: academic
last-reviewed: 2026-08-30
---

# UPC Mobile Epic projection

This course-only register makes the rubric Epic fields explicit. The canonical
Mobile catalog remains the source for story behavior, Acceptance Criteria,
reconciliation and Bounded Context ownership.

## MOBILE-EPIC-01 - Identity, Context & Device Foundation

- **ID / Title:** MOBILE-EPIC-01 / Identity, Context & Device Foundation
- **Purpose / Outcome:** Establish an authenticated, tenant-safe and capability-authorized Mobile entry point.
- **Actors:** Mobile User
- **Apps:** Operations Mobile; Buyer Mobile
- **Capabilities:** CAP-02 Workforce access and governance; CAP-03 Customer accounts and Buyer relationships
- **Bounded Contexts:** BC-01 Tenant & Access Governance; BC-02 Customer & Buyer Relationships
- **Business Goal / Impact:** Academic hypothesis: reduce unauthorized or ambiguous Mobile work by requiring an explicit active context before protected data or commands.
- **V1 Stories:** MOB-US-001, MOB-US-002, MOB-US-003
- **V2 / Deferred Stories:** None in this Epic
- **Future / Runway:** Device-attestation and identity-provider choices remain open; no provider is selected.
- **Out of Scope:** Client-owned authorization, cross-tenant access, invented authentication providers and offline authority.
- **Success Criteria:** Proposed: each protected flow shows current scope, server authorization and explicit stale/unavailable state; validate with security and device evidence.
- **Implementation Evidence:** API compatibility is AS-IS candidate evidence; Mobile client/runtime is NOT STARTED.
- **Academic Traceability:** AV1 requirements/DDD; TB1 foundation design and implementation evidence; AV2/TB2 acceptance and device proof.

## MOBILE-EPIC-02 - Field Sales & Commercial Access

- **ID / Title:** MOBILE-EPIC-02 / Field Sales & Commercial Access
- **Purpose / Outcome:** Give authorized Sales a contextual path from Customer/Buyer relationship to draft and PR/SO review or submission.
- **Actors:** Sales Representative; Business Operations Manager for deferred visibility/exception projections
- **Apps:** Operations Mobile
- **Capabilities:** CAP-03 Customer accounts and Buyer relationships; CAP-04 Catalog and commercial policy; CAP-05 Buyer shopping and drafts; CAP-06 Purchase Requests and Sales Orders; CAP-07 Availability and inventory reservation; CAP-11 Credit and receivables; CAP-16 Operational visibility
- **Bounded Contexts:** BC-01, BC-02, BC-03, BC-04, BC-05, BC-07, BC-11
- **Business Goal / Impact:** Academic hypothesis: reduce field order ambiguity while preserving server-authoritative pricing, availability, credit and commitment decisions.
- **V1 Stories:** MOB-US-006, MOB-US-007, MOB-US-008, MOB-US-009, MOB-US-010
- **V2 / Deferred Stories:** MOB-US-004, MOB-US-005
- **Future / Runway:** Operational analytics may expand only after the accepted read contract and research close.
- **Out of Scope:** Tenant-wide finance superuser authority for Sales; generic dashboards; client-side PR/SO truth; BOM deferral closure without evidence.
- **Success Criteria:** Proposed: an authorized Sales workflow preserves Draft versus PR/SO distinction and exposes conflict, credit and availability outcomes truthfully.
- **Implementation Evidence:** API/read and commitment evidence is partial; Mobile client, research and Product Acceptance are NOT STARTED.
- **Academic Traceability:** AV1 Product Backlog/DDD; TB1 field workflow; AV2 validation; TB2 final device and acceptance evidence.

## MOBILE-EPIC-03 - Warehouse Scan, Receiving & Physical Inventory Execution

- **ID / Title:** MOBILE-EPIC-03 / Warehouse Scan, Receiving & Physical Inventory Execution
- **Purpose / Outcome:** Support physical Warehouse work from SKU/identifier resolution through receiving, lot evidence, availability, FEFO pick and attributable discrepancy.
- **Actors:** Warehouse Operator
- **Apps:** Operations Mobile
- **Capabilities:** CAP-04 Catalog and commercial policy; CAP-07 Availability and inventory reservation; CAP-08 Receiving and warehouse operations; CAP-10 Cold-chain evidence and disposition; CAP-15 Business traceability
- **Bounded Contexts:** BC-03 Catalog & Commercial Policy; BC-05 Inventory Availability; BC-06 Fulfillment & Delivery; BC-11 Business Traceability
- **Business Goal / Impact:** Academic hypothesis: reduce stock, lot and physical-execution ambiguity using camera/manual fallback and server-authoritative inventory facts.
- **V1 Stories:** MOB-US-011, MOB-US-012, MOB-US-013, MOB-US-014, MOB-US-015, MOB-US-016, MOB-US-017, MOB-US-019
- **V2 / Deferred Stories:** MOB-US-018
- **Future / Runway:** Advanced transfer/count scope and IoT automation require separate accepted evidence.
- **Out of Scope:** Barcode/QR Bounded Context; scanner as authority; expired/quarantined allocation; queued local capture presented as inventory success.
- **Success Criteria:** Proposed: a physical-device flow resolves or manually recovers an identifier, validates FEFO/version and records an attributable result or conflict.
- **Implementation Evidence:** API identifier/lot/FEFO/picking foundations are evidenced; Mobile capture, device and Product Acceptance are NOT STARTED.
- **Academic Traceability:** AV1 DDD/C4; TB1 camera and warehouse flow; AV2 usability/device validation; TB2 final physical run.

## MOBILE-EPIC-04 - Dispatch & Driver Delivery Execution

- **ID / Title:** MOBILE-EPIC-04 / Dispatch & Driver Delivery Execution
- **Purpose / Outcome:** Prepare a Delivery for dispatch with allocation verification, Driver assignment and durable handoff evidence.
- **Actors:** Dispatch Coordinator
- **Apps:** Operations Mobile
- **Capabilities:** CAP-09 Fulfillment, dispatch and delivery; CAP-15 Business traceability
- **Bounded Contexts:** BC-01 Tenant & Access Governance; BC-05 Inventory Availability; BC-06 Fulfillment & Delivery; BC-09 Business Documents; BC-11 Business Traceability
- **Business Goal / Impact:** Academic hypothesis: reduce dispatch and handoff ambiguity before a Delivery leaves controlled fulfillment.
- **V1 Stories:** MOB-US-020, MOB-US-021, MOB-US-022, MOB-US-023, MOB-US-024, MOB-US-025
- **V2 / Deferred Stories:** None in this Epic
- **Future / Runway:** Route optimization and richer tracking remain separate future projections.
- **Out of Scope:** Dispatch success without allocation/evidence, direct persistence manipulation across BCs and Driver acceptance inferred from a QR.
- **Success Criteria:** Proposed: dispatch is accepted only after current allocation, handoff evidence, authorization and version checks pass.
- **Implementation Evidence:** API fulfillment/handoff foundations are partial-to-supported; Mobile client and device evidence are NOT STARTED.
- **Academic Traceability:** AV1 strategic DDD; TB1 dispatch wireflow; AV2 handoff validation; TB2 physical delivery evidence.

## MOBILE-EPIC-05 - Buyer Delivery Handoff & Discrepancy Resolution

- **ID / Title:** MOBILE-EPIC-05 / Buyer Delivery Handoff & Discrepancy Resolution
- **Purpose / Outcome:** Let a Driver execute a bounded Delivery Attempt and preserve separate outcome, POD, Buyer receipt and discrepancy facts.
- **Actors:** Driver / Delivery Operator
- **Apps:** Operations Mobile
- **Capabilities:** CAP-09 Fulfillment, dispatch and delivery; CAP-13 Business documents; CAP-15 Business traceability
- **Bounded Contexts:** BC-02 Customer & Buyer Relationships; BC-06 Fulfillment & Delivery; BC-09 Business Documents; BC-11 Business Traceability
- **Business Goal / Impact:** Academic hypothesis: make delivery outcomes and evidence attributable without conflating handoff, QR, POD, receipt or discrepancy.
- **V1 Stories:** MOB-US-026, MOB-US-027, MOB-US-028, MOB-US-029, MOB-US-031, MOB-US-032, MOB-US-033, MOB-US-034, MOB-US-035
- **V2 / Deferred Stories:** MOB-US-030
- **Future / Runway:** Continuous Driver tracking and rich Driver/Buyer contact remain deferred.
- **Out of Scope:** Permanent Driver surveillance, QR-as-acceptance, full offline authority, unbounded location capture and hidden RMA/returns.
- **Success Criteria:** Proposed: an active Delivery Attempt records truthful success/failure/partial outcome and recoverable evidence with retry, TTL and stale-state handling.
- **Implementation Evidence:** API Attempt, handoff, evidence and reliability foundations are partial-to-supported; Mobile client/device proof is NOT STARTED.
- **Academic Traceability:** AV1 lifecycle/DDD; TB1 core Attempt screens; AV2 handoff/validation; TB2 physical device and video evidence.

## MOBILE-EPIC-06 - Buyer Commerce, Credit, Payments & Documents

- **ID / Title:** MOBILE-EPIC-06 / Buyer Commerce, Credit, Payments & Documents
- **Purpose / Outcome:** Provide Buyer Mobile catalog, draft, commitment, order, finance and document visibility with explicit server authority.
- **Actors:** Customer Buyer
- **Apps:** Buyer Mobile
- **Capabilities:** CAP-04 Catalog and commercial policy; CAP-05 Buyer shopping and drafts; CAP-06 Purchase Requests and Sales Orders; CAP-07 Availability and inventory reservation; CAP-11 Credit and receivables; CAP-12 Payments and correction; CAP-13 Business documents; CAP-15 Business traceability
- **Bounded Contexts:** BC-02, BC-03, BC-04, BC-05, BC-07, BC-08, BC-09, BC-11
- **Business Goal / Impact:** Academic hypothesis: reduce Buyer effort and stale commercial decisions while keeping commitment, inventory, credit, payment and documents authoritative on the server.
- **V1 Stories:** MOB-US-036, MOB-US-037, MOB-US-038, MOB-US-040, MOB-US-041, MOB-US-042, MOB-US-043
- **V2 / Deferred Stories:** MOB-US-039
- **Future / Runway:** Multi-user Buyer organizations, multi-currency and richer payment/provider scope remain deferred or open.
- **Out of Scope:** Client-owned price/availability, Draft-as-commitment, payment report-as-confirmation, invented provider credentials and silent history rewrite.
- **Success Criteria:** Proposed: Buyer can review current state and submit an explicit PR/Direct Order path with idempotency, conflict and truthful result handling.
- **Implementation Evidence:** API commercial/finance/document evidence is partial; Buyer Mobile client and Product Acceptance are NOT STARTED.
- **Academic Traceability:** AV1 backlog/DDD; TB1 Buyer flow and local draft boundary; AV2 UX validation; TB2 final distribution/device evidence.

## MOBILE-EPIC-07 - Notifications, Offline Safety & Synchronization

- **ID / Title:** MOBILE-EPIC-07 / Notifications, Offline Safety & Synchronization
- **Purpose / Outcome:** Deliver critical provider-neutral notification and bounded Buyer handoff flows with selective safe synchronization.
- **Actors:** Mobile User; Customer Buyer
- **Apps:** Operations Mobile; Buyer Mobile
- **Capabilities:** CAP-09 Fulfillment, dispatch and delivery; CAP-14 Notifications; CAP-15 Business traceability
- **Bounded Contexts:** BC-01 Tenant & Access Governance; BC-02 Customer & Buyer Relationships; BC-06 Fulfillment & Delivery; BC-10 Notifications; BC-11 Business Traceability
- **Business Goal / Impact:** Academic hypothesis: reduce missed critical decisions and handoff friction without turning push, cache or queue state into business authority.
- **V1 Stories:** MOB-US-044, MOB-US-047, MOB-US-048, MOB-US-049
- **V2 / Deferred Stories:** MOB-US-045, MOB-US-046
- **Future / Runway:** Provider selection, live tracking and richer communication require separate privacy, Product and Architecture decisions.
- **Out of Scope:** Full offline mode, permanent tracking, notification-driven mutation and QR-as-receipt.
- **Success Criteria:** Proposed: subscription/deep-link recovery is tenant-safe and stale-aware; handoff/receipt/discrepancy facts remain distinct and server-confirmed.
- **Implementation Evidence:** API push and Buyer receipt/discrepancy foundations are evidenced; Mobile provider/client/device proof is NOT STARTED.
- **Academic Traceability:** AV1 safety model; TB1 sync and handoff design; AV2 validation; TB2 distribution and physical evidence.

## Cross-surface Landing Page dependency

The course Landing Page is a Web deliverable, not a new Mobile Epic. Sprint 1
must include the existing Website stories `WEB-US-001`, `WEB-US-002`,
`WEB-US-003`, `WEB-US-004` and `WEB-US-005` as a
cross-surface dependency. Story Points and implementation status remain OPEN in
the Web catalog because its current refinement explicitly has not assigned
academic points or Sprints. No points are invented here.
