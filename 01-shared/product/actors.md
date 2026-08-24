---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-08-24
---

# Shared actor catalog

One actor catalog for Shared, Web and Mobile. Surface documents project these
actors; they do not create alternate personas or Bounded Contexts.

## Actors

| Actor | Responsibility boundary | Web | Mobile |
|---|---|---|---|
| Public Interested Company / Prospect | request information or assisted evaluation | Website | — |
| Nexa Commercial & Onboarding Staff | qualify, approve and provision assisted onboarding | Website/Platform support boundary | — |
| Supplier Tenant: Company Owner | company identity, sensitive organization decisions and exceptional business authority | Platform | not V1; future possible |
| Supplier Tenant: Business Operations Manager | cross-functional operational decisions and exceptions | Platform | proposed |
| Supplier Tenant: Tenant Administrator | technical access, membership and capability governance | Platform | not V1 |
| Supplier Tenant: Sales Representative | customer, catalog, commercial and assisted-order work | Platform | proposed |
| Supplier Tenant: Warehouse Operator | receiving, lots, inventory and fulfillment execution | Platform | proposed |
| Supplier Tenant: Dispatch Coordinator | dispatch readiness, assignment, handoff and delivery evidence | Platform | proposed |
| Supplier Tenant: Driver / Delivery Operator | assigned delivery, attempt, location and POD execution | — | Operations Mobile proposed |
| Customer Buyer | authorized supplier relationship, catalog, request/order, delivery and financial visibility | Buyer Portal | Buyer Mobile proposed; mobile-primary candidate |

Finance is a capability responsibility, not a mandatory new actor. Credit,
receivables and payment work is assigned to authorized Company Owner, Sales or
operations staff according to Tenant policy.

## Surface projection status

Web is the accepted current product projection. Mobile has two proposed apps:
Operations Mobile for supplier operations and Buyer Mobile for Customer Buyer.
Mobile actor use is `PROPOSED / RESEARCH VALIDATION PENDING`; no interview,
persona or outcome is claimed here.

See [shared capability model](capability-map.md), [Web actors](../../02-web/actors/README.md)
and [Mobile actors](../../03-mobile/actors/README.md).
