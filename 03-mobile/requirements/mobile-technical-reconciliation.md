---
status: accepted
maturity: BASELINED
scope: runway
owner: architecture
last-reviewed: 2026-08-29
---

# Mobile technical-story reconciliation

The shared technical catalog remains the authority for cross-cutting technical
work. Its 20 IDs are retained; the table below maps Mobile-relevant work to
the product catalog without creating `MOB-TS` duplicates or choosing a client
framework.

| ID | Existing technical story | Reconciled target | Status / evidence |
|---|---|---|---|
| TS-001 | Tenant-safe REST contracts for Identity and active business context | MOB-US-001..003 | KEEP; API baseline and BC-01 authority. |
| TS-002 | REST contracts for Customers, Buyer Relationships and Catalog | MOB-US-006..007, 036..037 | KEEP; API/Portal contracts. |
| TS-003 | Canonical REST contracts for Purchase Requests and Sales Orders | MOB-US-008..010, 038, 040..042 | KEEP; API v0.17.0 compatibility. |
| TS-004 | Atomic consistency across Commercial Commitment, Inventory and Credit | MOB-US-009, 040..041 | KEEP; critical invariant, backend evidence partial. |
| TS-005 | Concurrency control and idempotency for critical mutations | all command stories | KEEP; API release evidence, client proof absent. |
| TS-006 | REST contracts for Inventory and Fulfillment | MOB-US-013..025 | KEEP; v0.17.0 extends lot/FEFO/picking. |
| TS-007 | REST contracts for Dispatch, Delivery and POD | MOB-US-020..035, 047..049 | KEEP; handoff/receipt contract added by v0.17.0. |
| TS-008 | Authoritative Credit & Receivables model | MOB-US-010, 043 | KEEP; no client financial authority. |
| TS-009 | Provider-neutral Payments and secure provider webhooks | MOB-US-043 | KEEP; provider operations remain production-gate open. |
| TS-010 | Secure Object Storage for evidence and Business Documents | MOB-US-023, 033, 035, 049 | KEEP; metadata/reference only in Mobile. |
| TS-011 | Durable Outbox/Inbox handling for Published Integration Events | MOB-US-009, 025, 035, 044 | KEEP; no new published Mobile events. |
| TS-012 | Durable Business Traceability and Security Audit foundations | MOB-US-014, 017, 019, 023, 029, 033..035, 047..049 | KEEP; BC-11 remains distinct from security audit. |
| TS-013 | Web service i18n and canonical error contracts | all Mobile API consumers | KEEP; shared API error/Problem Details authority. |
| TS-014 | Web i18n and a11y/ARIA support | Mobile UX equivalent remains open | KEEP for Web; Mobile accessibility is client acceptance work. |
| TS-015 | Mobile local storage capability | MOB-US-001..003, 008, 035, 038 | REFINE; secure local non-authoritative model, framework open. |
| TS-016 | Mobile camera-based Barcode/QR identification | MOB-US-011, 034, 047 | REFINE; camera is optional adapter, QR is ephemeral, no Scanner BC. |
| TS-017 | Maps and geolocation capabilities | MOB-US-028..029, 045 | REFINE; bounded location V1 candidate, map/live tracking V2/deferred. |
| TS-018 | Mobile Push Notifications | MOB-US-044 | REFINE; provider-neutral subscription/retry foundation, provider open. |
| TS-019 | Resilient Mobile synchronization and retry | MOB-US-009, 013..014, 016..017, 019, 023, 027, 031..035, 040..043, 049 | REFINE; selective queue only, no fake offline success. |
| TS-020 | Protect Mobile sessions and locally stored sensitive data | MOB-US-001..003, 035, 043..044 | KEEP; device implementation and threat evidence open. |

All 20 technical IDs remain counted in the global catalog. Implementation
status is separate from Product Acceptance and Mobile client status.
