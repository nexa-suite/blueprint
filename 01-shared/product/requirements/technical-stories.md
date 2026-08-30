---
status: accepted
maturity: FROZEN
scope: cross-cutting
owner: delivery
last-reviewed: 2026-08-24
---


# Technical Stories

Status: SHARED / DELIVERY.

Technical Stories describe delivery capabilities without direct end-user interaction. They do not create Bounded Contexts, assign final implementation repositories where ownership is cross-product, or add Acceptance Criteria and Story Points in this freeze.

The Mobile-specific reconciliation and current API evidence are summarized in
[Mobile technical reconciliation](../../../03-mobile/requirements/mobile-technical-reconciliation.md).

## TS-001 — Provide tenant-safe REST contracts for Identity and active business context

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | REST contract, tenant scope and active context propagation |
| Related Bounded Contexts | BC-01 — Tenant & Access Governance |
| Likely products / repositories | API; consuming Web and Mobile surfaces |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-002 — Provide REST contracts for Customers, Buyer Relationships and Catalog

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | REST contract across relationship and catalog reads/writes |
| Related Bounded Contexts | BC-02 — Customer & Buyer Relationships; BC-03 — Catalog & Commercial Policy |
| Likely products / repositories | API; Platform; Buyer Portal |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-003 — Provide canonical REST contracts for Purchase Requests and Sales Orders

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Canonical commercial commitment contract |
| Related Bounded Contexts | BC-04 — Sales Commitment |
| Likely products / repositories | API; Platform; Buyer Portal |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-004 — Guarantee atomic consistency across Commercial Commitment, Inventory and Credit

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Cross-context atomic decision and reservation boundary |
| Related Bounded Contexts | BC-04 — Sales Commitment; BC-05 — Inventory Availability; BC-07 — Credit & Receivables |
| Likely products / repositories | API |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-005 — Guarantee concurrency control and idempotency for critical business mutations

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | CAS/locking, stale outcomes and restart-safe duplicate suppression |
| Related Bounded Contexts | Cross-cutting across accepted 11 Bounded Contexts |
| Likely products / repositories | API; no single repository owns whole concern |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-006 — Provide REST contracts for Inventory and Fulfillment

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Inventory and fulfillment operational contracts |
| Related Bounded Contexts | BC-05 — Inventory Availability; BC-06 — Fulfillment & Delivery |
| Likely products / repositories | API; Platform; Operations Mobile |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-007 — Provide REST contracts for Dispatch, Delivery and POD

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Dispatch, delivery, POD and evidence contract |
| Related Bounded Contexts | BC-06 — Fulfillment & Delivery; BC-09 — Business Documents; BC-11 — Business Traceability |
| Likely products / repositories | API; Platform; Operations Mobile; Buyer Portal |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-008 — Implement the authoritative Credit & Receivables model

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Credit exposure, reservation, receivable and adjustment authority |
| Related Bounded Contexts | BC-07 — Credit & Receivables |
| Likely products / repositories | API |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-009 — Integrate provider-neutral Payments and secure provider webhooks

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Payment lifecycle and secure external provider translation |
| Related Bounded Contexts | BC-08 — Payments; BC-07 — Credit & Receivables |
| Likely products / repositories | API |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-010 — Provide secure Object Storage for evidence and Business Documents

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Tenant-authorized binary evidence and document storage boundary |
| Related Bounded Contexts | BC-09 — Business Documents; BC-11 — Business Traceability |
| Likely products / repositories | API; Object Storage integration |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-011 — Provide durable Outbox/Inbox handling for Published Integration Events

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | At-least-once publication, inbox deduplication and restart durability |
| Related Bounded Contexts | Cross-cutting event infrastructure |
| Likely products / repositories | API; no single surface repository owns whole concern |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-012 — Provide durable Business Traceability and Security Audit foundations

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Append-only business facts, actor, reason, correlation and security evidence |
| Related Bounded Contexts | BC-11 — Business Traceability; BC-01 — Tenant & Access Governance |
| Likely products / repositories | API; consuming products |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-013 — Provide Web Service internationalization and canonical error contracts

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Cross-surface locale and observable business error contract |
| Related Bounded Contexts | Cross-cutting product contract |
| Likely products / repositories | API; consuming Web and Mobile surfaces |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-014 — Provide Web i18n and a11y/ARIA support

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Web localization and accessible interaction foundations |
| Related Bounded Contexts | Cross-cutting product and Design foundation |
| Likely products / repositories | Website; Platform; Buyer Portal |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-015 — Provide Mobile local storage capability

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Secure selective local state for proposed Mobile experiences |
| Related Bounded Contexts | Cross-cutting Mobile foundation |
| Likely products / repositories | Mobile |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-016 — Integrate Mobile camera-based Barcode/QR identification

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Camera scanning abstraction and backend-validated identifiers |
| Related Bounded Contexts | BC-03 — Catalog & Commercial Policy; BC-05 — Inventory Availability; BC-06 — Fulfillment & Delivery |
| Likely products / repositories | Mobile; API |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-017 — Integrate maps and geolocation capabilities

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Delivery navigation and active-delivery location capability |
| Related Bounded Contexts | BC-06 — Fulfillment & Delivery |
| Likely products / repositories | Mobile; API; map provider boundary |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-018 — Integrate Mobile Push Notifications

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Push delivery and deep-link projection |
| Related Bounded Contexts | BC-10 — Notifications |
| Likely products / repositories | Mobile; API |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-019 — Provide resilient Mobile synchronization and retry

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Offline queue, retry, conflict and recovery capability |
| Related Bounded Contexts | Cross-cutting Mobile foundation; BC-06 — Fulfillment & Delivery |
| Likely products / repositories | Mobile; API |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.

## TS-020 — Protect Mobile sessions and locally stored sensitive data

| Field | Value |
|---|---|
| Status | SHARED / DELIVERY |
| Product | Shared |
| Surface | Shared / Delivery |
| Actor | Developer |
| Concern | Session, local data and device-security boundary |
| Related Bounded Contexts | BC-01 — Tenant & Access Governance |
| Likely products / repositories | Mobile; API |
| Priority | DELIVERY REFINEMENT PENDING |
| Refinement | CATALOG FROZEN — ACCEPTANCE CRITERIA PENDING |

### Current Scope

Technical capability contract only. Detailed design, dependencies, validation scenarios and implementation sequencing remain delivery refinement.
