---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-08-29
---

# Shared actor catalog

One actor catalog for Website, Platform, Buyer Portal, Operations Mobile and
Buyer Mobile. Surface roles are projections; they do not create Bounded
Contexts, duplicate identities or replace authorization.

## Actors

| Actor | Responsibility boundary | Website | Platform | Buyer Portal | Operations Mobile | Buyer Mobile |
|---|---|---|---|---|---|---|
| Public Interested Company / Prospect | request information or assisted evaluation | primary | — | — | — | — |
| Nexa Commercial & Onboarding Staff | qualify, approve and provision assisted onboarding | primary/support | support boundary | — | — | — |
| Company Owner | Tenant identity, sensitive organization decisions and exceptional business authority | — | primary | — | secondary/planned | — |
| Tenant Administrator | technical access, membership and capability governance | — | primary | — | — | — |
| Business Operations Manager | cross-functional operational decisions, visibility and exceptions | — | primary | — | planned | — |
| Sales Representative | Customer, catalog, commercial and assisted-order work | — | primary | — | planned | — |
| Warehouse Operator | receiving, lots, inventory and fulfillment execution | — | primary | — | planned | — |
| Dispatch Coordinator | readiness, assignment, handoff and delivery evidence | — | primary | — | planned | — |
| Driver / Delivery Operator | assigned Delivery, Attempt, location and POD execution | — | — | — | planned | — |
| Customer Buyer | authorized supplier relationship, catalog, commitment, delivery and financial visibility | — | — | primary | — | planned/primary candidate |

`Mobile User` is a surface descriptor used by access stories; it is not a new
organizational actor. Finance is a capability responsibility assigned by Tenant
policy, not a mandatory Finance actor or context.

## Authority boundaries

- Company Owner and Tenant Administrator govern access according to distinct
  authority; a UI role label never grants either authority.
- Sales, Warehouse, Dispatch and Driver actions remain bounded by active
  Tenant/Workspace, membership/capability and object assignment.
- Customer Buyer actions require an active Buyer Relationship with the supplier
  Tenant. A Customer Account can exist without a Portal/Mobile identity.
- Driver outcome, Buyer receipt and POD are separate facts. No actor can edit
  another actor's immutable history through a projection.

## Surface status

Website, Platform and Buyer Portal are current Web projections. Operations
Mobile and Buyer Mobile are `OWNER-ACCEPTED` product directions with
`PROPOSED / RESEARCH VALIDATION PENDING`, partial API support and no client
implementation claim. See the [surface-role matrix](surface-role-matrix.md),
[role-capability matrix](role-capability-matrix.md) and [Mobile catalog](../../03-mobile/requirements/mobile-v1-catalog.md).
