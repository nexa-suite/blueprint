---
status: planned
maturity: DRAFT
scope: runway
owner: mobile
last-reviewed: 2026-08-29
---

# Mobile local persistence boundary

These are two logical, technology-neutral designs required by the mobile
course rubric. They are **PROPOSED / RESEARCH VALIDATION PENDING** and
**LOCAL / NON-AUTHORITATIVE**. No Room, SQLite, Drift, Realm, CoreData,
SQLDelight, KMP storage or Flutter storage framework is selected.

| Model | Scope | Authority |
|---|---|---|
| [Operations Mobile](operations-mobile-local-persistence.md) / [UML](operations-mobile-local-persistence.puml) / [SVG](OperationsMobileLocalPersistence.svg) / [PNG](OperationsMobileLocalPersistence.png) | V1 session/context, safe assigned/read cache, harmless drafts, temporary evidence and retry metadata | Nexa API remains authority; no generic offline mutation or sync engine |
| [Buyer Mobile](buyer-mobile-local-persistence.md) / [UML](buyer-mobile-local-persistence.puml) / [SVG](BuyerMobileLocalPersistence.svg) / [PNG](BuyerMobileLocalPersistence.png) | V1 recent Delivery/handoff reads, harmless receipt/discrepancy drafts, freshness and notification state | Nexa API remains authority; offline success is never receipt, payment, authorization or order confirmation |

Mobile local records are deliberately absent from [Target PostgreSQL](../../../01-shared/data/master-data-model.md).

The v0.17.0 backend concepts are consumed as remote contracts: product/lot
resolution, Physical Allocation validation, Delivery Handoff, Buyer Receipt/
Discrepancy and critical Delivery updates. Local staging may hold safe
references/evidence only; it never becomes a Mobile database authority.
