---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-08-29
---

# Shared capability model

The one cross-surface capability model describes business ability, not screens,
routes, endpoints, tables, epics or Bounded Contexts. Domain ownership remains
the authority for context detail.

## Capability matrix

| ID | Business capability | Primary actors | Primary BC | Website | Platform | Buyer Portal | Mobile projection |
|---|---|---|---|---|---|---|---|
| CAP-01 | Acquisition and assisted onboarding | Prospect; Nexa Commercial & Onboarding Staff | BC-01 | primary | support | — | — |
| CAP-02 | Workforce access and governance | Company Owner; Tenant Administrator; Nexa Staff | BC-01 | — | primary | — | both apps; owner-accepted direction |
| CAP-03 | Customer accounts and buyer relationships | Sales; Company Owner; BOM; Customer Buyer | BC-02 | — | primary | primary projection | Operations/Buyer; owner-accepted direction |
| CAP-04 | Catalog and commercial policy | Company Owner; Sales; Customer Buyer | BC-03 | — | primary | primary projection | Operations/Buyer; owner-accepted direction |
| CAP-05 | Buyer shopping and drafts | Customer Buyer; Sales | BC-03 + BC-04 | — | supporting | primary | Buyer/Operations; owner-accepted direction |
| CAP-06 | Purchase Requests and Sales Orders | Customer Buyer; Sales; Company Owner | BC-04 | — | primary | primary | Buyer/Operations; owner-accepted direction |
| CAP-07 | Availability and inventory reservation | Buyer; Sales; Warehouse | BC-05 | — | primary | projection | Operations/Buyer read projection |
| CAP-08 | Receiving and warehouse operations | Warehouse Operator | BC-05 | — | primary | — | Operations; owner-accepted direction |
| CAP-09 | Fulfillment, dispatch and delivery | Warehouse; Dispatch; Driver | BC-06 | — | primary | projection | Operations/Buyer; owner-accepted direction |
| CAP-10 | Cold-chain evidence and disposition | Warehouse; Dispatch; Driver | BC-06 | — | primary | projection | Operations; manual evidence candidate |
| CAP-11 | Credit and receivables | Company Owner; Sales; Customer Buyer | BC-07 | — | primary | primary projection | Buyer read/report candidate |
| CAP-12 | Payments and correction | Customer Buyer; Company Owner; Sales | BC-08 + BC-07 | — | primary | primary projection | Buyer/Operations; online authority |
| CAP-13 | Business documents | Buyer; Sales; Dispatch | BC-09 | — | primary | primary projection | Buyer/Operations; owner-accepted direction |
| CAP-14 | Notifications | authorized recipients | BC-10 | intake status | primary | primary | both apps; subscription/provider split |
| CAP-15 | Business traceability | authorized workforce; Customer Buyer | BC-11 | — | primary | projection | Operations/Buyer; owner-accepted direction |
| CAP-16 | Operational visibility | BOM; authorized workforce | consuming projections | — | primary | — | V2/deferred BOM projection |

## Boundary rules

- The exact eleven accepted BCs are listed in [Shared Domain](../domain/README.md).
- Web and Mobile project capabilities; neither surface creates a BC.
- The Mobile projection is owner-accepted for planning, but research, client
  implementation and Product Acceptance remain pending.
- CAP-03/04/05/06/07/09/11/12/13/15 use server contracts and may expose stale
  projections; critical commands revalidate with the owning BC.
- CAP-16 is not a generic dashboard promise. Its Mobile stories remain V2 until
  an accepted operational read contract exists.

See the [role-capability matrix](role-capability-matrix.md), [surface-role
matrix](surface-role-matrix.md) and [functional contracts](functional-contracts/README.md).
