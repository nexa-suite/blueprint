---
status: accepted
maturity: FROZEN
scope: cross-cutting
owner: delivery
last-reviewed: 2026-08-24
---

# Shared Technical Coverage

Technical Stories remain shared delivery concerns. Repository ownership is
recorded only where it is obvious; cross-product concerns remain unassigned to
a single application repository.

| Story | Concern | Likely products / repositories |
|---|---|---|
| TS-001 | Identity and active context REST | API; consuming Web and Mobile surfaces |
| TS-002 | Customers, Buyer Relationships and Catalog REST | API; Platform; Buyer Portal |
| TS-003 | Purchase Requests and Sales Orders REST | API; Platform; Buyer Portal |
| TS-004 | Atomic Commercial Commitment, Inventory and Credit | API |
| TS-005 | Concurrency control and idempotency | API; cross-product concern |
| TS-006 | Inventory and Fulfillment REST | API; Platform; Operations Mobile |
| TS-007 | Dispatch, Delivery and POD REST | API; Platform; Operations Mobile; Buyer Portal |
| TS-008 | Credit and Receivables authority | API |
| TS-009 | Provider-neutral Payments and webhooks | API |
| TS-010 | Object Storage for evidence and documents | API; Object Storage |
| TS-011 | Outbox/Inbox and published events | API; cross-product concern |
| TS-012 | Business Traceability and Security Audit | API; consuming products |
| TS-013 | Web Service i18n and error contracts | API; consuming Web and Mobile surfaces |
| TS-014 | Web i18n and a11y/ARIA | Website; Platform; Buyer Portal |
| TS-015 | Mobile local storage | Mobile |
| TS-016 | Mobile Barcode/QR identification | Mobile; API |
| TS-017 | Maps and geolocation | Mobile; API; map provider boundary |
| TS-018 | Mobile Push Notifications | Mobile; API |
| TS-019 | Mobile synchronization and retry | Mobile; API |
| TS-020 | Mobile sessions and local data security | Mobile; API |

Spike coverage is recorded in the [Spike Stories catalog](spike-stories.md).
Technical entries do not create new Bounded Contexts.
