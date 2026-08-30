---
status: planned
maturity: BASELINED
scope: runway
owner: academic
last-reviewed: 2026-08-30
---

# UPC 1ACC0238 Mobile requirements projection

Academic projection keyed to the canonical Mobile catalog. It supplies rubric join fields without becoming a second Product or Domain authority.

Canonical behavior, User Story text and Acceptance Criteria remain in [the Mobile V1 catalog](../../../03-mobile/requirements/mobile-v1-catalog.md). The academic source transcription is [Enunciado del Trabajo Final V4.0](../enunciado-trabajo-final.md). The rubric constrains coursework evidence; Blueprint decides Product, Domain and Architecture.

## Projection rules

- 49 canonical Mobile IDs remain preserved: 42 V1 candidates and 7 deferred V2 candidates.
- Deferred IDs remain deferred: MOB-US-004, MOB-US-005, MOB-US-018, MOB-US-030, MOB-US-039, MOB-US-045, MOB-US-046.
- P1/P2/P3, Story Points, Sprint and academic milestone are coursework planning fields; they do not change Product priority or Product Acceptance.
- Backend Support reports compatibility evidence only. Client Status remains NOT STARTED; no Mobile implementation, device run, interview, UX artifact or Product Acceptance is claimed.
- Every V1 entry links Description/User Story and Acceptance Criteria back to its canonical story block. Gherkin validation runs against that source.

## Academic Product Backlog

Order follows business value and risk, not authentication-first sequencing.

| Order | ID | User | Priority | Epic | Title | BC | Story Points | Sprint | Backend Support | Status |
|---:|---|---|---|---|---|---|---:|---|---|---|
| 1 | MOB-US-016 | Warehouse Operator | P1 | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution | Validate FEFO scan and execute an allocated pick | BC-05 | 8 | S1 | SUPPORTED — API FEFO/picking evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 2 | MOB-US-013 | Warehouse Operator | P1 | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution | Record an inbound inventory receipt | BC-05 | 5 | S1 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 3 | MOB-US-034 | Driver / Delivery Operator | P1 | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution | Issue or present an ephemeral Buyer Delivery Handoff QR | BC-06 | 5 | S2 | SUPPORTED — API handoff-token evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 4 | MOB-US-047 | Customer Buyer | P1 | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization | Scan and resolve a Delivery Handoff QR | BC-06 | 5 | S2 | SUPPORTED — API handoff-token validation evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 5 | MOB-US-048 | Customer Buyer | P1 | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization | Review handoff and confirm received quantities | BC-06 | 5 | S2 | SUPPORTED — API Buyer receipt foundation; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 6 | MOB-US-049 | Customer Buyer | P1 | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization | Report Buyer discrepancy and preserve receipt fact | BC-06 | 5 | S2 | SUPPORTED — API receipt/discrepancy foundation; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 7 | MOB-US-017 | Warehouse Operator | P1 | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution | Record a picking discrepancy or authorized inventory disposition | BC-05 | 5 | S1 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 8 | MOB-US-032 | Driver / Delivery Operator | P1 | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution | Record partial or rejected Delivery and continuation | BC-06 | 5 | S2 | SUPPORTED — API partial/rejected outcome evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 9 | MOB-US-033 | Driver / Delivery Operator | P1 | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution | Capture policy-driven POD evidence | BC-06 | 5 | S2 | SUPPORTED — API POD/evidence hardening; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 10 | MOB-US-009 | Sales Representative | P1 | MOBILE-EPIC-02 — Field Sales & Commercial Access | Submit a Purchase Request from field workflow | BC-04 | 5 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 11 | MOB-US-040 | Customer Buyer | P1 | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents | Submit a PR or place a Direct Order under policy | BC-04 | 5 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 12 | MOB-US-022 | Dispatch Coordinator | P1 | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution | Verify outgoing goods against allocation | BC-06 | 5 | S2 | SUPPORTED — API allocation/picking evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 13 | MOB-US-025 | Dispatch Coordinator | P1 | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution | Confirm Delivery dispatch after handoff | BC-06 | 3 | S2 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 14 | MOB-US-031 | Driver / Delivery Operator | P1 | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution | Record a Delivery Attempt outcome | BC-06 | 5 | S2 | SUPPORTED — API Delivery Attempt outcome evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 15 | MOB-US-020 | Dispatch Coordinator | P1 | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution | Review Fulfillment-ready Deliveries | BC-06 | 5 | S2 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 16 | MOB-US-027 | Driver / Delivery Operator | P1 | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution | Start a Delivery Attempt | BC-06 | 5 | S2 | SUPPORTED — API Delivery Attempt evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 17 | MOB-US-035 | Driver / Delivery Operator | P1 | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution | Queue and synchronize critical Driver evidence safely | BC-06 | 5 | S2 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 18 | MOB-US-014 | Warehouse Operator | P1 | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution | Capture received Lot, expiry and quantity | BC-05 | 3 | S1 | SUPPORTED — API lot/expiry evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 19 | MOB-US-015 | Warehouse Operator | P1 | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution | Review physical and sellable stock/Lots | BC-05 | 3 | S1 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 20 | MOB-US-006 | Sales Representative | P2 | MOBILE-EPIC-02 — Field Sales & Commercial Access | Find a Customer Account and Buyer Relationship | BC-02 | 3 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 21 | MOB-US-007 | Sales Representative | P2 | MOBILE-EPIC-02 — Field Sales & Commercial Access | Review catalog, price and Sellable Availability | BC-03 | 3 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 22 | MOB-US-008 | Sales Representative | P2 | MOBILE-EPIC-02 — Field Sales & Commercial Access | Prepare assisted commercial intent in a Request Draft | BC-04 | 5 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 23 | MOB-US-041 | Customer Buyer | P2 | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents | Respond to a material change | BC-04 | 5 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 24 | MOB-US-042 | Customer Buyer | P2 | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents | Review PR/SO status, history and Business Documents | BC-04 | 3 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 25 | MOB-US-037 | Customer Buyer | P2 | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents | Review authoritative SKU price and Sellable Availability | BC-03 | 3 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 26 | MOB-US-036 | Customer Buyer | P2 | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents | Browse the supplier catalog | BC-03 | 3 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 27 | MOB-US-038 | Customer Buyer | P2 | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents | Maintain a Request Draft | BC-04 | 3 | S3 | PARTIAL — draft/read contracts; Mobile persistence and client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 28 | MOB-US-043 | Customer Buyer | P2 | MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents | Review Credit/Receivables and report allowed Payment evidence | BC-07 | 3 | S3 | PARTIAL — API payment/receivable evidence; provider and reconciliation remain open | PROPOSED / RESEARCH VALIDATION PENDING |
| 29 | MOB-US-044 | Mobile User | P2 | MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization | Register/refresh a Push Subscription and receive critical notifications | BC-10 | 5 | S3 | SUPPORTED — API push-subscription foundation; provider/client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 30 | MOB-US-021 | Dispatch Coordinator | P2 | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution | Assign a Driver | BC-06 | 3 | S2 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 31 | MOB-US-023 | Dispatch Coordinator | P2 | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution | Record dispatch handoff evidence | BC-06 | 3 | S2 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 32 | MOB-US-024 | Dispatch Coordinator | P2 | MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution | Record a stable Dispatch Handoff identifier | BC-06 | 3 | S2 | SUPPORTED — API handoff identifier evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 33 | MOB-US-026 | Driver / Delivery Operator | P2 | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution | View assigned Deliveries | BC-06 | 3 | S2 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 34 | MOB-US-028 | Driver / Delivery Operator | P2 | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution | Launch external navigation from Delivery context | BC-06 | 2 | S2 | OPEN — external navigation/provider contract not closed | PROPOSED / RESEARCH VALIDATION PENDING |
| 35 | MOB-US-029 | Driver / Delivery Operator | P2 | MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution | Capture location only within an active Delivery | BC-06 | 5 | S2 | OPEN — Mobile-specific location API, privacy and retention contract not closed | PROPOSED / RESEARCH VALIDATION PENDING |
| 36 | MOB-US-001 | Mobile User | P3 | MOBILE-EPIC-01 — Identity, Context & Device Foundation | Restore an authenticated Mobile session | BC-01 | 3 | S1 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 37 | MOB-US-002 | Mobile User | P3 | MOBILE-EPIC-01 — Identity, Context & Device Foundation | Resolve an active business context | BC-01 | 3 | S1 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 38 | MOB-US-003 | Mobile User | P3 | MOBILE-EPIC-01 — Identity, Context & Device Foundation | Render capability-authorized Mobile work | BC-01 | 3 | S1 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 39 | MOB-US-011 | Warehouse Operator | P3 | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution | Resolve a SKU by physical identifier | BC-03 | 3 | S1 | SUPPORTED — API SKU identifier-resolution evidence; client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 40 | MOB-US-012 | Warehouse Operator | P3 | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution | Resolve a known SKU manually | BC-03 | 1 | S1 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |
| 41 | MOB-US-019 | Warehouse Operator | P3 | MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution | Record receiving or warehouse temperature evidence | BC-05 | 3 | S1 | PARTIAL — evidence boundary exists; Mobile capture/upload contract not closed | PROPOSED / RESEARCH VALIDATION PENDING |
| 42 | MOB-US-010 | Sales Representative | P3 | MOBILE-EPIC-02 — Field Sales & Commercial Access | Review PR/SO and contextual Customer credit | BC-04 | 3 | S3 | PARTIAL — API compatibility evidence; Mobile client absent | PROPOSED / RESEARCH VALIDATION PENDING |

## V1 story field registry

Every rubric field is explicit per V1 story; canonical behavior remains in one home.

<!-- REGISTRY-CHUNK-1-END -->
### MOB-US-016 - Validate FEFO scan and execute an allocated pick

- **ID:** MOB-US-016
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Validate FEFO scan and execute an allocated pick
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-03 — Catalog & Commercial Policy; BC-06 — Fulfillment & Delivery
- **Shared Capability:** CAP-07 — Availability and inventory reservation; CAP-08 — Receiving and warehouse operations
- **Business Goal / Impact:** Canonical goal: Pick the allocated lot only when identifier, FEFO policy, quantity and version are valid.; academic impact hypothesis: reliable stock, lot and physical execution.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Warehouse work benefits from physical identifier capture, manual fallback and safe connectivity recovery.
- **Backend Support:** SUPPORTED — API FEFO/picking evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** API v0.17.0 FEFO/picking scan validation; BC-05 allocation; BC-06 fulfillment binding.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-016--validate-fefo-scan-and-execute-an-allocated-pick)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-016--validate-fefo-scan-and-execute-an-allocated-pick); canonical block remains the executable behavior source
- **Story Points:** 8
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-013 - Record an inbound inventory receipt

- **ID:** MOB-US-013
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record an inbound inventory receipt
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-03 — Catalog & Commercial Policy
- **Shared Capability:** CAP-08 — Receiving and warehouse operations
- **Business Goal / Impact:** Canonical goal: Create an authoritative inbound receipt for a valid Tenant warehouse and SKU.; academic impact hypothesis: reliable stock, lot and physical execution.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Warehouse work benefits from physical identifier capture, manual fallback and safe connectivity recovery.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 context; BC-03 SKU; BC-05 receiving contract; API v0.17.0 lot/receipt support.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-013--record-an-inbound-inventory-receipt)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-013--record-an-inbound-inventory-receipt); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-034 - Issue or present an ephemeral Buyer Delivery Handoff QR

- **ID:** MOB-US-034
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver / Delivery Operator
- **Epic:** MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Issue or present an ephemeral Buyer Delivery Handoff QR
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Present a bounded one-time handoff token that an authorized Buyer can resolve for the Delivery.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Delivery work needs device evidence, bounded location/QR and retry/conflict-safe lifecycle commands. Handoff QR is ephemeral and bounded, not a new context.
- **Backend Support:** SUPPORTED — API handoff-token evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** API v0.17.0 handoff-token/validation paths; BC-02 relationship; BC-11 evidence.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-034--issue-or-present-an-ephemeral-buyer-delivery-handoff-qr)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-034--issue-or-present-an-ephemeral-buyer-delivery-handoff-qr); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-047 - Scan and resolve a Delivery Handoff QR

- **ID:** MOB-US-047
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Scan and resolve a Delivery Handoff QR
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Resolve a Driver-presented ephemeral token to the authorized Delivery and handoff context.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Critical handoff/notification flows use device capability; selective queueing is not full offline authority. Handoff QR is ephemeral and bounded, not a new context.
- **Backend Support:** SUPPORTED — API handoff-token validation evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** API v0.17.0 handoff validation; BC-02 relationship; BC-06 token; BC-11 trace.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-047--scan-and-resolve-a-delivery-handoff-qr)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-047--scan-and-resolve-a-delivery-handoff-qr); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-048 - Review handoff and confirm received quantities

- **ID:** MOB-US-048
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Review handoff and confirm received quantities
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Create a separate Buyer receipt fact for quantities actually received after handoff.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Critical handoff/notification flows use device capability; selective queueing is not full offline authority.
- **Backend Support:** SUPPORTED — API Buyer receipt foundation; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** API v0.17.0 Buyer receipt fact; BC-02/06/11; handoff resolution MOB-US-047.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-048--review-handoff-and-confirm-received-quantities)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-048--review-handoff-and-confirm-received-quantities); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-049 - Report Buyer discrepancy and preserve receipt fact

- **ID:** MOB-US-049
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Report Buyer discrepancy and preserve receipt fact
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Record discrepancy/rejection against the Buyer receipt without rewriting offered or delivered history.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Critical handoff/notification flows use device capability; selective queueing is not full offline authority.
- **Backend Support:** SUPPORTED — API receipt/discrepancy foundation; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** API v0.17.0 Buyer receipt/discrepancy; BC-02/06/11; Object Storage evidence.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-049--report-buyer-discrepancy-and-preserve-receipt-fact)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-049--report-buyer-discrepancy-and-preserve-receipt-fact); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-017 - Record a picking discrepancy or authorized inventory disposition

- **ID:** MOB-US-017
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record a picking discrepancy or authorized inventory disposition
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability
- **Shared Capability:** CAP-08 — Receiving and warehouse operations; CAP-10 — Cold-chain evidence and disposition; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Preserve a physical discrepancy or authorized disposition as an attributable fact.; academic impact hypothesis: reliable stock, lot and physical execution.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Warehouse work benefits from physical identifier capture, manual fallback and safe connectivity recovery.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 adjustment/disposition; BC-06 pick discrepancy; BC-11 traceability.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-017--record-a-picking-discrepancy-or-authorized-inventory-disposition)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-017--record-a-picking-discrepancy-or-authorized-inventory-disposition); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

<!-- REGISTRY-CHUNK-2-END -->
<!-- APPEND-CHUNK-2 -->
### MOB-US-032 - Record partial or rejected Delivery and continuation

- **ID:** MOB-US-032
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver / Delivery Operator
- **Epic:** MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record partial or rejected Delivery and continuation
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Preserve delivered, rejected and remaining quantities and create a controlled continuation when required.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Delivery work needs device evidence, bounded location/QR and retry/conflict-safe lifecycle commands.
- **Backend Support:** SUPPORTED — API partial/rejected outcome evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 partial/continuation; BC-11 trace; API v0.17.0 delivery outcomes.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-032--record-partial-or-rejected-delivery-and-continuation)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-032--record-partial-or-rejected-delivery-and-continuation); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-033 - Capture policy-driven POD evidence

- **ID:** MOB-US-033
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver / Delivery Operator
- **Epic:** MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Capture policy-driven POD evidence
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-09 — Business Documents; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery; CAP-13 — Business documents; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Attach required immutable proof evidence to the Delivery Attempt/POD.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Delivery work needs device evidence, bounded location/QR and retry/conflict-safe lifecycle commands.
- **Backend Support:** SUPPORTED — API POD/evidence hardening; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 POD; BC-09 evidence metadata; BC-11 trace; Object Storage; API v0.17.0 evidence hardening.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-033--capture-policy-driven-pod-evidence)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-033--capture-policy-driven-pod-evidence); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-009 - Submit a Purchase Request from field workflow

- **ID:** MOB-US-009
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Sales Representative
- **Epic:** MOBILE-EPIC-02 — Field Sales & Commercial Access
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Submit a Purchase Request from field workflow
- **Owning Bounded Context:** BC-04 — Sales Commitment
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-07 — Credit & Receivables
- **Shared Capability:** CAP-06 — Purchase Requests and Sales Orders
- **Business Goal / Impact:** Canonical goal: Submit field demand through the same PR rules and authoritative validation as Web.; academic impact hypothesis: reliable commercial commitment without false success.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Field commercial work benefits from contextual access, but server/API remains authoritative.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01/02/03/05/07 synchronous contracts; API v0.17.0 OpenAPI/commitment baseline.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-009--submit-a-purchase-request-from-field-workflow)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-009--submit-a-purchase-request-from-field-workflow); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-040 - Submit a PR or place a Direct Order under policy

- **ID:** MOB-US-040
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Submit a PR or place a Direct Order under policy
- **Owning Bounded Context:** BC-04 — Sales Commitment
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-07 — Credit & Receivables
- **Shared Capability:** CAP-06 — Purchase Requests and Sales Orders
- **Business Goal / Impact:** Canonical goal: Choose the explicit PR or policy-authorized Direct Order path with atomic server validation.; academic impact hypothesis: reliable commercial commitment without false success.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Buyer work benefits from convenient mobile review while commitment and finance authority stays server-side.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-02/03/04/05/07; API v0.17.0 PR/direct-order/OpenAPI contract.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-040--submit-a-pr-or-place-a-direct-order-under-policy)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-040--submit-a-pr-or-place-a-direct-order-under-policy); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-022 - Verify outgoing goods against allocation

- **ID:** MOB-US-022
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Verify outgoing goods against allocation
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-05 — Inventory Availability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** Canonical goal: Confirm outgoing quantities and lots match the authoritative physical allocation before handoff.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Dispatch work needs fast operational context and reliable physical handoff preparation.
- **Backend Support:** SUPPORTED — API allocation/picking evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 physical allocation; BC-06 fulfillment; API v0.17.0 picking/allocation contract.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-022--verify-outgoing-goods-against-allocation)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-022--verify-outgoing-goods-against-allocation); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-025 - Confirm Delivery dispatch after handoff

- **ID:** MOB-US-025
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Confirm Delivery dispatch after handoff
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** Canonical goal: Move a Delivery to dispatched only after allocation, outgoing verification and handoff evidence pass.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Dispatch work needs fast operational context and reliable physical handoff preparation.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 allocation; BC-06 handoff/Delivery; API v0.17.0 dispatch paths.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-025--confirm-delivery-dispatch-after-handoff)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-025--confirm-delivery-dispatch-after-handoff); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-031 - Record a Delivery Attempt outcome

- **ID:** MOB-US-031
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver / Delivery Operator
- **Epic:** MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record a Delivery Attempt outcome
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** Canonical goal: Record an attributable success, failure or other allowed outcome for the active Attempt.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Delivery work needs device evidence, bounded location/QR and retry/conflict-safe lifecycle commands.
- **Backend Support:** SUPPORTED — API Delivery Attempt outcome evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 Attempt/outcome contract; BC-09/11 evidence; API v0.17.0 attempts/outcomes.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-031--record-a-delivery-attempt-outcome)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-031--record-a-delivery-attempt-outcome); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

<!-- REGISTRY-CHUNK-3-END -->
<!-- APPEND-CHUNK-3 -->
### MOB-US-020 - Review Fulfillment-ready Deliveries

- **ID:** MOB-US-020
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Review Fulfillment-ready Deliveries
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** Canonical goal: See only deliveries whose fulfillment and allocation evidence permits dispatch preparation.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Dispatch work needs fast operational context and reliable physical handoff preparation.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 allocation; BC-06 fulfillment/delivery query; API v0.17.0 fulfillment paths.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-020--review-fulfillment-ready-deliveries)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-020--review-fulfillment-ready-deliveries); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-027 - Start a Delivery Attempt

- **ID:** MOB-US-027
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver / Delivery Operator
- **Epic:** MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Start a Delivery Attempt
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** Canonical goal: Begin an assigned Delivery Attempt with an explicit server lifecycle fact.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Delivery work needs device evidence, bounded location/QR and retry/conflict-safe lifecycle commands.
- **Backend Support:** SUPPORTED — API Delivery Attempt evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 Delivery/Attempt lifecycle; API v0.17.0 delivery-attempt contract.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-027--start-a-delivery-attempt)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-027--start-a-delivery-attempt); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-035 - Queue and synchronize critical Driver evidence safely

- **ID:** MOB-US-035
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver / Delivery Operator
- **Epic:** MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Queue and synchronize critical Driver evidence safely
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Recover selected evidence after connectivity loss without fabricating authoritative success.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Delivery work needs device evidence, bounded location/QR and retry/conflict-safe lifecycle commands.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06/11 contracts; outbox/inbox semantics; Object Storage; API v0.17.0 reliability foundation.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-035--queue-and-synchronize-critical-driver-evidence-safely)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-035--queue-and-synchronize-critical-driver-evidence-safely); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-014 - Capture received Lot, expiry and quantity

- **ID:** MOB-US-014
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Capture received Lot, expiry and quantity
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-03 — Catalog & Commercial Policy; BC-11 — Business Traceability
- **Shared Capability:** CAP-08 — Receiving and warehouse operations; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Capture the immutable lot identity, UTC expiry and received quantity needed for safe availability.; academic impact hypothesis: reliable stock, lot and physical execution.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Warehouse work benefits from physical identifier capture, manual fallback and safe connectivity recovery.
- **Backend Support:** SUPPORTED — API lot/expiry evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-03 SKU; BC-05 lot/disposition; BC-11 traceability; API v0.17.0 lot resolution.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-014--capture-received-lot-expiry-and-quantity)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-014--capture-received-lot-expiry-and-quantity); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-015 - Review physical and sellable stock/Lots

- **ID:** MOB-US-015
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution
- **Priority:** academic P1; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Review physical and sellable stock/Lots
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-07 — Availability and inventory reservation
- **Business Goal / Impact:** Canonical goal: Inspect current lot, disposition and sellable availability before physical work.; academic impact hypothesis: reliable stock, lot and physical execution.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Warehouse work benefits from physical identifier capture, manual fallback and safe connectivity recovery.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 availability/lot query; BC-03 SKU identity; API version/freshness contract.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-015--review-physical-and-sellable-stock-lots)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-015--review-physical-and-sellable-stock-lots); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-006 - Find a Customer Account and Buyer Relationship

- **ID:** MOB-US-006
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Sales Representative
- **Epic:** MOBILE-EPIC-02 — Field Sales & Commercial Access
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Find a Customer Account and Buyer Relationship
- **Owning Bounded Context:** BC-02 — Customer & Buyer Relationships
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-03 — Customer accounts and buyer relationships
- **Business Goal / Impact:** Canonical goal: Open the correct authorized customer and buyer relationship for assisted commercial work.; academic impact hypothesis: trusted customer and Buyer relationship work.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Field commercial work benefits from contextual access, but server/API remains authoritative.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 active context; BC-02 relationship query; API pagination/filter contract.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-006--find-a-customer-account-and-buyer-relationship)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-006--find-a-customer-account-and-buyer-relationship); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-007 - Review catalog, price and Sellable Availability

- **ID:** MOB-US-007
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Sales Representative
- **Epic:** MOBILE-EPIC-02 — Field Sales & Commercial Access
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Review catalog, price and Sellable Availability
- **Owning Bounded Context:** BC-03 — Catalog & Commercial Policy
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-05 — Inventory Availability
- **Shared Capability:** CAP-04 — Catalog and commercial policy; CAP-07 — Availability and inventory reservation
- **Business Goal / Impact:** Canonical goal: Quote from authoritative SKU, relationship price/terms and current sellable availability inputs.; academic impact hypothesis: less catalog, identity and commercial ambiguity.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Field commercial work benefits from contextual access, but server/API remains authoritative.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01/02 context; BC-03 offer resolution; BC-05 availability query; API v0.17.0.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-007--review-catalog-price-and-sellable-availability)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-007--review-catalog-price-and-sellable-availability); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** TB2

<!-- REGISTRY-CHUNK-4-END -->
<!-- APPEND-CHUNK-4 -->
### MOB-US-008 - Prepare assisted commercial intent in a Request Draft

- **ID:** MOB-US-008
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Sales Representative
- **Epic:** MOBILE-EPIC-02 — Field Sales & Commercial Access
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Prepare assisted commercial intent in a Request Draft
- **Owning Bounded Context:** BC-04 — Sales Commitment
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy
- **Shared Capability:** CAP-05 — Buyer shopping and drafts
- **Business Goal / Impact:** Canonical goal: Assemble a Customer-specific draft before choosing the authoritative PR or Direct Order path.; academic impact hypothesis: reliable commercial commitment without false success.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Field commercial work benefits from contextual access, but server/API remains authoritative.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-02 relationship; BC-03 offer; BC-04 draft contract; API conflict/version semantics.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-008--prepare-assisted-commercial-intent-in-a-request-draft)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-008--prepare-assisted-commercial-intent-in-a-request-draft); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-041 - Respond to a material change

- **ID:** MOB-US-041
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Respond to a material change
- **Owning Bounded Context:** BC-04 — Sales Commitment
- **Secondary Bounded Contexts:** BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-07 — Credit & Receivables
- **Shared Capability:** CAP-06 — Purchase Requests and Sales Orders
- **Business Goal / Impact:** Canonical goal: Accept or reject a material change through an explicit versioned commitment decision.; academic impact hypothesis: reliable commercial commitment without false success.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Buyer work benefits from convenient mobile review while commitment and finance authority stays server-side.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-03/04/05/07; API material-change contract; notification deep link may be stale.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-041--respond-to-a-material-change)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-041--respond-to-a-material-change); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-042 - Review PR/SO status, history and Business Documents

- **ID:** MOB-US-042
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Review PR/SO status, history and Business Documents
- **Owning Bounded Context:** BC-04 — Sales Commitment
- **Secondary Bounded Contexts:** BC-09 — Business Documents; BC-11 — Business Traceability
- **Shared Capability:** CAP-06 — Purchase Requests and Sales Orders; CAP-13 — Business documents; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Review authoritative commitment lifecycle and authorized issued documents.; academic impact hypothesis: reliable commercial commitment without false success.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Buyer work benefits from convenient mobile review while commitment and finance authority stays server-side.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-02/04/09/11; API document/history contracts; Portal parity.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-042--review-pr-so-status-history-and-business-documents)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-042--review-pr-so-status-history-and-business-documents); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-037 - Review authoritative SKU price and Sellable Availability

- **ID:** MOB-US-037
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Review authoritative SKU price and Sellable Availability
- **Owning Bounded Context:** BC-03 — Catalog & Commercial Policy
- **Secondary Bounded Contexts:** BC-05 — Inventory Availability
- **Shared Capability:** CAP-04 — Catalog and commercial policy; CAP-07 — Availability and inventory reservation
- **Business Goal / Impact:** Canonical goal: Understand current price/terms and sellable availability before building a request.; academic impact hypothesis: less catalog, identity and commercial ambiguity.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Buyer work benefits from convenient mobile review while commitment and finance authority stays server-side.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-02/03/05 queries; API v0.17.0 SKU/lot/availability foundation.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-037--review-authoritative-sku-price-and-sellable-availability)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-037--review-authoritative-sku-price-and-sellable-availability); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-036 - Browse the supplier catalog

- **ID:** MOB-US-036
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Browse the supplier catalog
- **Owning Bounded Context:** BC-03 — Catalog & Commercial Policy
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships
- **Shared Capability:** CAP-04 — Catalog and commercial policy
- **Business Goal / Impact:** Canonical goal: Browse only the supplier catalog visible to the authorized Buyer Relationship.; academic impact hypothesis: less catalog, identity and commercial ambiguity.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Buyer work benefits from convenient mobile review while commitment and finance authority stays server-side.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 context; BC-02 relationship; BC-03 catalog query; Buyer Portal/API parity.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-036--browse-the-supplier-catalog)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-036--browse-the-supplier-catalog); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-038 - Maintain a Request Draft

- **ID:** MOB-US-038
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Maintain a Request Draft
- **Owning Bounded Context:** BC-04 — Sales Commitment
- **Secondary Bounded Contexts:** BC-03 — Catalog & Commercial Policy
- **Shared Capability:** CAP-05 — Buyer shopping and drafts
- **Business Goal / Impact:** Canonical goal: Build and edit a Request Draft without reserving stock or creating a PR/SO.; academic impact hypothesis: reliable commercial commitment without false success.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Buyer work benefits from convenient mobile review while commitment and finance authority stays server-side.
- **Backend Support:** PARTIAL — draft/read contracts; Mobile persistence and client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-02/03/04; buyer local persistence model; API version/conflict contract.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-038--maintain-a-request-draft)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-038--maintain-a-request-draft); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-043 - Review Credit/Receivables and report allowed Payment evidence

- **ID:** MOB-US-043
- **Product:** Mobile
- **App:** Buyer Mobile
- **Surface:** Buyer Mobile
- **User / Actor:** Customer Buyer
- **Epic:** MOBILE-EPIC-06 — Buyer Commerce, Credit, Payments & Documents
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Review Credit/Receivables and report allowed Payment evidence
- **Owning Bounded Context:** BC-07 — Credit & Receivables
- **Secondary Bounded Contexts:** BC-08 — Payments
- **Shared Capability:** CAP-11 — Credit and receivables; CAP-12 — Payments and correction
- **Business Goal / Impact:** Canonical goal: Review financial state and report permitted payment evidence without confusing it with confirmation.; academic impact hypothesis: controlled credit and receivable decisions.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Buyer work benefits from convenient mobile review while commitment and finance authority stays server-side.
- **Backend Support:** PARTIAL — API payment/receivable evidence; provider and reconciliation remain open
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-07/08; API payment/receivable contract; provider/reconciliation production gate.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-043--review-credit-receivables-and-report-allowed-payment-evidence)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-043--review-credit-receivables-and-report-allowed-payment-evidence); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** TB2

<!-- REGISTRY-CHUNK-5-END -->
<!-- APPEND-CHUNK-5 -->
### MOB-US-044 - Register/refresh a Push Subscription and receive critical notifications

- **ID:** MOB-US-044
- **Product:** Mobile
- **App:** Buyer Mobile; Operations Mobile
- **Surface:** Buyer Mobile; Operations Mobile
- **User / Actor:** Mobile User
- **Epic:** MOBILE-EPIC-07 — Notifications, Offline Safety & Synchronization
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Register/refresh a Push Subscription and receive critical notifications
- **Owning Bounded Context:** BC-10 — Notifications
- **Secondary Bounded Contexts:** BC-01 — Tenant & Access Governance
- **Shared Capability:** CAP-14 — Notifications
- **Business Goal / Impact:** Canonical goal: Manage a provider-neutral device subscription and receive authorized critical notifications.; academic impact hypothesis: timely critical notification awareness.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Critical handoff/notification flows use device capability; selective queueing is not full offline authority. Push is provider-neutral; notification delivery never mutates source state.
- **Backend Support:** SUPPORTED — API push-subscription foundation; provider/client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01/10; provider-neutral API v0.17.0; secure device storage; notification preferences.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-044--register-refresh-a-push-subscription-and-receive-critical-notifications)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-044--register-refresh-a-push-subscription-and-receive-critical-notifications); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S3
- **Academic Milestone:** TB2

### MOB-US-021 - Assign a Driver

- **ID:** MOB-US-021
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Assign a Driver
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** Canonical goal: Assign an authorized Driver to a ready Delivery with explicit version control.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Dispatch work needs fast operational context and reliable physical handoff preparation.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 membership/capability; BC-06 Delivery; assignment/version contract.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-021--assign-a-driver)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-021--assign-a-driver); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-023 - Record dispatch handoff evidence

- **ID:** MOB-US-023
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record dispatch handoff evidence
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-09 — Business Documents; BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Preserve the required dispatch handoff evidence before goods leave the controlled workflow.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Dispatch work needs fast operational context and reliable physical handoff preparation.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 handoff; BC-09 evidence reference; BC-11 trace; API v0.17.0 handoff foundation.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-023--record-dispatch-handoff-evidence)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-023--record-dispatch-handoff-evidence); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-024 - Record a stable Dispatch Handoff identifier

- **ID:** MOB-US-024
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Dispatch Coordinator
- **Epic:** MOBILE-EPIC-04 — Dispatch & Driver Delivery Execution
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record a stable Dispatch Handoff identifier
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** Canonical goal: Associate a stable handoff reference with the Delivery without confusing it with Buyer acceptance QR.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Dispatch work needs fast operational context and reliable physical handoff preparation.
- **Backend Support:** SUPPORTED — API handoff identifier evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 handoff; API v0.17.0 handoff-token contract; BC-02 relationship for Buyer presentation.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-024--record-a-stable-dispatch-handoff-identifier)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-024--record-a-stable-dispatch-handoff-identifier); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-026 - View assigned Deliveries

- **ID:** MOB-US-026
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver / Delivery Operator
- **Epic:** MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** View assigned Deliveries
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** Canonical goal: See current deliveries assigned to the authenticated Driver.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Delivery work needs device evidence, bounded location/QR and retry/conflict-safe lifecycle commands.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 identity/context; BC-06 assignment/delivery query; API v0.17.0 delivery paths.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-026--view-assigned-deliveries)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-026--view-assigned-deliveries); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-028 - Launch external navigation from Delivery context

- **ID:** MOB-US-028
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver / Delivery Operator
- **Epic:** MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Launch external navigation from Delivery context
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery
- **Business Goal / Impact:** Canonical goal: Open the Delivery destination in an available external navigation provider without making routing domain authority.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Delivery work needs device evidence, bounded location/QR and retry/conflict-safe lifecycle commands.
- **Backend Support:** OPEN — external navigation/provider contract not closed
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 authorized destination; device OS/navigation integration; privacy policy.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-028--launch-external-navigation-from-delivery-context)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-028--launch-external-navigation-from-delivery-context); canonical block remains the executable behavior source
- **Story Points:** 2
- **Sprint:** S2
- **Academic Milestone:** AV2

### MOB-US-029 - Capture location only within an active Delivery

- **ID:** MOB-US-029
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Driver / Delivery Operator
- **Epic:** MOBILE-EPIC-05 — Buyer Delivery Handoff & Discrepancy Resolution
- **Priority:** academic P2; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Capture location only within an active Delivery
- **Owning Bounded Context:** BC-06 — Fulfillment & Delivery
- **Secondary Bounded Contexts:** BC-11 — Business Traceability
- **Shared Capability:** CAP-09 — Fulfillment, dispatch and delivery; CAP-15 — Business traceability
- **Business Goal / Impact:** Canonical goal: Capture bounded location evidence only for an active authorized Delivery lifecycle.; academic impact hypothesis: traceable fulfillment and delivery handoff.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Delivery work needs device evidence, bounded location/QR and retry/conflict-safe lifecycle commands. Location is active-Delivery-only; privacy and Product acceptance remain open.
- **Backend Support:** OPEN — Mobile-specific location API, privacy and retention contract not closed
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-06 active lifecycle; BC-11 evidence; device location permission; future API contract.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-029--capture-location-only-within-an-active-delivery)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-029--capture-location-only-within-an-active-delivery); canonical block remains the executable behavior source
- **Story Points:** 5
- **Sprint:** S2
- **Academic Milestone:** AV2

<!-- REGISTRY-CHUNK-6-END -->
<!-- APPEND-CHUNK-6 -->
### MOB-US-001 - Restore an authenticated Mobile session

- **ID:** MOB-US-001
- **Product:** Mobile
- **App:** Operations Mobile; Buyer Mobile
- **Surface:** Operations Mobile; Buyer Mobile
- **User / Actor:** Mobile User
- **Epic:** MOBILE-EPIC-01 — Identity, Context & Device Foundation
- **Priority:** academic P3; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Restore an authenticated Mobile session
- **Owning Bounded Context:** BC-01 — Tenant & Access Governance
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-02 — Workforce access and governance
- **Business Goal / Impact:** Canonical goal: Re-enter a valid session without exposing protected data before server authorization.; academic impact hypothesis: safe authorized access and context selection.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile foundation must preserve secure context, capability and explicit freshness before protected work.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** API authentication/session contract; secure device storage; tenant isolation.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-001--restore-an-authenticated-mobile-session)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-001--restore-an-authenticated-mobile-session); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-002 - Resolve an active business context

- **ID:** MOB-US-002
- **Product:** Mobile
- **App:** Operations Mobile; Buyer Mobile
- **Surface:** Operations Mobile; Buyer Mobile
- **User / Actor:** Mobile User
- **Epic:** MOBILE-EPIC-01 — Identity, Context & Device Foundation
- **Priority:** academic P3; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Resolve an active business context
- **Owning Bounded Context:** BC-01 — Tenant & Access Governance
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships
- **Shared Capability:** CAP-02 — Workforce access and governance; CAP-03 — Customer accounts and buyer relationships
- **Business Goal / Impact:** Canonical goal: Select the intended Tenant/Workspace or authorized Buyer Relationship before work begins.; academic impact hypothesis: safe authorized access and context selection.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile foundation must preserve secure context, capability and explicit freshness before protected work.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 access context; BC-02 relationship resolution; secure local session reference.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-002--resolve-an-active-business-context)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-002--resolve-an-active-business-context); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-003 - Render capability-authorized Mobile work

- **ID:** MOB-US-003
- **Product:** Mobile
- **App:** Operations Mobile; Buyer Mobile
- **Surface:** Operations Mobile; Buyer Mobile
- **User / Actor:** Mobile User
- **Epic:** MOBILE-EPIC-01 — Identity, Context & Device Foundation
- **Priority:** academic P3; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Render capability-authorized Mobile work
- **Owning Bounded Context:** BC-01 — Tenant & Access Governance
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-02 — Workforce access and governance
- **Business Goal / Impact:** Canonical goal: See only work and navigation permitted by the active role, capability and relationship.; academic impact hypothesis: safe authorized access and context selection.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Mobile foundation must preserve secure context, capability and explicit freshness before protected work.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-01 capabilities; shared surface-role matrix; API authorization.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-003--render-capability-authorized-mobile-work)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-003--render-capability-authorized-mobile-work); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-011 - Resolve a SKU by physical identifier

- **ID:** MOB-US-011
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution
- **Priority:** academic P3; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Resolve a SKU by physical identifier
- **Owning Bounded Context:** BC-03 — Catalog & Commercial Policy
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-04 — Catalog and commercial policy
- **Business Goal / Impact:** Canonical goal: Resolve a scanned EAN/UPC/GTIN or other accepted physical identifier to one SKU.; academic impact hypothesis: less catalog, identity and commercial ambiguity.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Warehouse work benefits from physical identifier capture, manual fallback and safe connectivity recovery.
- **Backend Support:** SUPPORTED — API SKU identifier-resolution evidence; client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** API v0.17.0 `/api/v1/skus/resolve`; BC-03 identifier mapping; device permission contract.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-011--resolve-a-sku-by-physical-identifier)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-011--resolve-a-sku-by-physical-identifier); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-012 - Resolve a known SKU manually

- **ID:** MOB-US-012
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution
- **Priority:** academic P3; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Resolve a known SKU manually
- **Owning Bounded Context:** BC-03 — Catalog & Commercial Policy
- **Secondary Bounded Contexts:** None recorded in canonical story
- **Shared Capability:** CAP-04 — Catalog and commercial policy
- **Business Goal / Impact:** Canonical goal: Continue authorized warehouse work when no physical scan is available.; academic impact hypothesis: less catalog, identity and commercial ambiguity.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Warehouse work benefits from physical identifier capture, manual fallback and safe connectivity recovery.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-03 SKU query; MOB-US-011 scan abstraction; active BC-01 context.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-012--resolve-a-known-sku-manually)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-012--resolve-a-known-sku-manually); canonical block remains the executable behavior source
- **Story Points:** 1
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-019 - Record receiving or warehouse temperature evidence

- **ID:** MOB-US-019
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Warehouse Operator
- **Epic:** MOBILE-EPIC-03 — Warehouse Scan, Receiving & Physical Inventory Execution
- **Priority:** academic P3; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Record receiving or warehouse temperature evidence
- **Owning Bounded Context:** BC-05 — Inventory Availability
- **Secondary Bounded Contexts:** BC-06 — Fulfillment & Delivery; BC-11 — Business Traceability
- **Shared Capability:** CAP-10 — Cold-chain evidence and disposition
- **Business Goal / Impact:** Canonical goal: Record manual temperature evidence against the relevant lot or fulfillment context.; academic impact hypothesis: reliable stock, lot and physical execution.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Warehouse work benefits from physical identifier capture, manual fallback and safe connectivity recovery.
- **Backend Support:** PARTIAL — evidence boundary exists; Mobile capture/upload contract not closed
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-05 disposition; BC-06 delivery evidence; BC-11 traceability; Object Storage reference.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-019--record-receiving-or-warehouse-temperature-evidence)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-019--record-receiving-or-warehouse-temperature-evidence); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S1
- **Academic Milestone:** AV1 / TB1

### MOB-US-010 - Review PR/SO and contextual Customer credit

- **ID:** MOB-US-010
- **Product:** Mobile
- **App:** Operations Mobile
- **Surface:** Operations Mobile
- **User / Actor:** Sales Representative
- **Epic:** MOBILE-EPIC-02 — Field Sales & Commercial Access
- **Priority:** academic P3; canonical Product priority remains V1 candidate / Product Acceptance pending
- **Title:** Review PR/SO and contextual Customer credit
- **Owning Bounded Context:** BC-04 — Sales Commitment
- **Secondary Bounded Contexts:** BC-02 — Customer & Buyer Relationships; BC-07 — Credit & Receivables; BC-11 — Business Traceability
- **Shared Capability:** CAP-06 — Purchase Requests and Sales Orders; CAP-11 — Credit and receivables
- **Business Goal / Impact:** Canonical goal: Explain the Customer-specific commitment state and credit context without changing either source.; academic impact hypothesis: reliable commercial commitment without false success.
- **Research status:** PROPOSED / RESEARCH VALIDATION PENDING
- **Scope:** V1 candidate; Product Acceptance pending
- **Mobile justification:** Field commercial work benefits from contextual access, but server/API remains authoritative.
- **Backend Support:** PARTIAL — API compatibility evidence; Mobile client absent
- **Implementation Evidence:** AS-IS API v0.17.0 compatibility evidence only; no verified Mobile client/runtime artifact.
- **Client Status:** NOT STARTED - no verified Mobile client/runtime artifact in the current baseline
- **Dependencies:** BC-02 relationship; BC-04 PR/SO query; BC-07 credit/receivable query; BC-11 history.
- **Description / User Story:** [canonical User Story](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-010--review-pr-so-and-contextual-customer-credit)
- **Acceptance Criteria:** [canonical Acceptance Criteria](../../../03-mobile/requirements/mobile-v1-catalog.md#mob-us-010--review-pr-so-and-contextual-customer-credit); canonical block remains the executable behavior source
- **Story Points:** 3
- **Sprint:** S3
- **Academic Milestone:** TB2

<!-- REGISTRY-CHUNK-7-END -->

## Academic evidence gate

The projection is structurally ready. It is not evidence that coursework deliverables exist. Interviews, personas, UXPressia/Figma/LucidChart artifacts, four recent Q1/Q2 papers, Android/Flutter/KMP implementation, third-party service, physical-device run, Firebase App Distribution, videos, i18n/a11y execution and Product/System Acceptance remain pending in the companion plans.

Canonical reconciliation and historical dispositions remain in [Mobile reconciliation](../../../03-mobile/requirements/reconciliation.md). Technical enablers remain in [Technical Stories](../../../01-shared/product/requirements/technical-stories.md), and uncertainty remains in [Spike Stories](../../../01-shared/product/requirements/spike-stories.md).
