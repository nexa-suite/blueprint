---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-08-29
---

# Shared role-capability matrix

This is the authorization-oriented projection of the shared actor catalog. It
does not create roles, endpoints or Bounded Contexts. `COMMAND` means the actor
may initiate an operation subject to server policy; `QUERY` means read access;
`OVERSIGHT` means operational review; `EXCEPTION AUTHORITY` means an explicit
exception or correction authority; `NONE` means no capability grant.

The acquisition prospect and Nexa onboarding staff are intentionally handled
by the Website/onboarding boundary and are not workforce role columns here.

| Shared capability | Company Owner | Tenant Administrator | Business Operations Manager | Sales Representative | Warehouse Operator | Dispatch Coordinator | Driver / Delivery Operator | Customer Buyer |
|---|---|---|---|---|---|---|---|---|
| CAP-01 Acquisition and assisted onboarding | EXCEPTION AUTHORITY | NONE | NONE | NONE | NONE | NONE | NONE | NONE |
| CAP-02 Workforce access and governance | EXCEPTION AUTHORITY | COMMAND; OVERSIGHT | QUERY | QUERY | QUERY | QUERY | NONE | NONE |
| CAP-03 Customer accounts and buyer relationships | OVERSIGHT; EXCEPTION AUTHORITY | QUERY | OVERSIGHT | COMMAND; QUERY | QUERY | QUERY | QUERY | COMMAND; QUERY |
| CAP-04 Catalog and commercial policy | EXCEPTION AUTHORITY | QUERY | OVERSIGHT | COMMAND; QUERY | QUERY | NONE | NONE | QUERY |
| CAP-05 Buyer shopping and drafts | OVERSIGHT | NONE | QUERY | COMMAND; QUERY | NONE | NONE | NONE | COMMAND; QUERY |
| CAP-06 Purchase Requests and Sales Orders | EXCEPTION AUTHORITY; OVERSIGHT | NONE | OVERSIGHT | COMMAND; QUERY | QUERY | NONE | NONE | COMMAND; QUERY |
| CAP-07 Availability and inventory reservation | OVERSIGHT | NONE | OVERSIGHT | QUERY | COMMAND; QUERY | QUERY | NONE | QUERY |
| CAP-08 Receiving and warehouse operations | EXCEPTION AUTHORITY | NONE | OVERSIGHT | NONE | COMMAND; EXCEPTION AUTHORITY | QUERY | NONE | NONE |
| CAP-09 Fulfillment, dispatch and delivery | OVERSIGHT | NONE | OVERSIGHT | QUERY | COMMAND; QUERY | COMMAND; EXCEPTION AUTHORITY | COMMAND; QUERY | QUERY |
| CAP-10 Cold-chain evidence and disposition | EXCEPTION AUTHORITY | NONE | OVERSIGHT | NONE | COMMAND; EXCEPTION AUTHORITY | COMMAND; QUERY | COMMAND; QUERY | QUERY |
| CAP-11 Credit and receivables | EXCEPTION AUTHORITY; OVERSIGHT | NONE | OVERSIGHT | QUERY | NONE | NONE | NONE | QUERY |
| CAP-12 Payments and correction | EXCEPTION AUTHORITY; OVERSIGHT | NONE | OVERSIGHT | QUERY | NONE | NONE | NONE | COMMAND; QUERY |
| CAP-13 Business documents | OVERSIGHT | NONE | OVERSIGHT | QUERY | QUERY | QUERY | QUERY | QUERY |
| CAP-14 Notifications | OVERSIGHT | COMMAND; OVERSIGHT | QUERY | QUERY | QUERY | QUERY | QUERY | QUERY |
| CAP-15 Business traceability | OVERSIGHT; EXCEPTION AUTHORITY | QUERY | OVERSIGHT | QUERY | QUERY | QUERY | QUERY | QUERY |
| CAP-16 Operational visibility | OVERSIGHT | QUERY | OVERSIGHT | QUERY | QUERY | QUERY | QUERY | QUERY |

## Guardrails

- Server-side Tenant, Workspace, Workforce Membership and Buyer Relationship
  authorization is authoritative; UI visibility is not authorization.
- `EXCEPTION AUTHORITY` never permits rewriting immutable payments, receivables,
  issued documents, POD or traceability facts. It permits an explicit
  correction/reversal workflow.
- Driver authority is limited to assigned Delivery work. Buyer authority is
  limited to the authorized supplier relationship.
- Finance is a capability responsibility, not a new actor or Bounded Context.
- The matrix is a target authorization projection. Current implementation
  support is recorded in [the compatibility baseline](../../04-delivery/compatibility-baseline-2026-08-29.md).
