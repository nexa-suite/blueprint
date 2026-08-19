---
status: draft
maturity: DISCOVERY
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Proposed Bounded Context Catalog

These are candidate model boundaries discovered from language, authority, lifecycle, invariants and change coupling. They are **not canonically accepted**.

| Candidate | Purpose | Classification | Primary authority |
|---|---|---|---|
| Tenant & Access Governance | Tenant lifecycle, Workspace relationship, Human Identity access, Workforce Membership, roles/capabilities and session-facing relationship resolution | Supporting | Tenant status, membership status, capability assignment and access context |
| Customer & Buyer Relationships | Customer Account, contacts/addresses, Buyer Relationship, link/claim, approval and account-specific commercial relationship | Supporting / possible core | Tenant-scoped relationship and account association |
| Catalog & Commercial Policy | Product/SKU presentation, categories, media, temperature requirement, Price Lists, Customer Terms and promotion policy | Supporting | Sellable offer definition and deterministic commercial inputs |
| Sales Commitment | Cart intent, Purchase Request, negotiation/revision evidence, Commercial Commitment and immutable Sales Order | Core candidate | Commercial obligation and order history |
| Inventory Availability | Receiving, Batch/Lot, physical stock, sellability, safety stock, transfer, adjustment and temperature qualification | Core candidate | Physical stock truth and sellability state |
| Fulfillment & Delivery | Fulfillment, lot allocation, picking, packing, Dispatch, Delivery, Route, POD and cold-chain execution evidence | Core candidate | Physical fulfillment and delivery outcome |
| Credit & Receivables | Credit limit/reserved exposure, Financial Posting, Receivable, due state and partial payment exposure | Supporting | Tenant-specific credit exposure and formal debt |
| Payments | Online/external payment report, provider interaction, confirmation, reversal, refund and reconciliation state | Supporting | Payment state and provider translation |
| Business Documents | Document family, numbering, rendering, evidence metadata, revision/correction and authorized delivery | Supporting | Issued business evidence and document history |
| Notification & Business Traceability | Significant business notifications, Buyer timeline, operational projections and delivery status to surfaces | Supporting | Projection and channel policy; source contexts retain facts |

## Boundary tests

- A proposed context must own at least one invariant or lifecycle authority, not just a screen.
- Cross-context references use stable identifiers or explicit snapshots; no foreign aggregate object leakage.
- A current Spring module may host several proposed contexts or split one proposed context; technical realization follows review.
- The catalog intentionally keeps Payments and Business Documents separate from Credit / Receivables even though current implementation and transactions touch them.

