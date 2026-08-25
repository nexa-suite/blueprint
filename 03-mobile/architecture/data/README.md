---
status: planned
maturity: DRAFT
scope: runway
owner: mobile
last-reviewed: 2026-08-25
---

# Mobile local persistence boundary

These are two logical, technology-neutral designs required by the mobile
course rubric. They are **PROPOSED / RESEARCH VALIDATION PENDING** and
**LOCAL / NON-AUTHORITATIVE**. No Room, SQLite, Drift, Realm, CoreData,
SQLDelight, KMP storage or Flutter storage framework is selected.

| Model | Scope | Authority |
|---|---|---|
| [Operations Mobile](operations-mobile-local-persistence.md) / [UML](operations-mobile-local-persistence.puml) / [SVG](OperationsMobileLocalPersistence.svg) / [PNG](OperationsMobileLocalPersistence.png) | Driver, Warehouse and operational selective-offline work | Nexa API remains authority; local records are cache, draft, outbox, upload queue and sync metadata |
| [Buyer Mobile](buyer-mobile-local-persistence.md) / [UML](buyer-mobile-local-persistence.puml) / [SVG](BuyerMobileLocalPersistence.svg) / [PNG](BuyerMobileLocalPersistence.png) | Buyer relationship, safe catalog, drafts and recent delivery visibility | Nexa API remains authority; offline success is never payment, authorization or order confirmation |

Mobile local records are deliberately absent from [Target PostgreSQL](../../../01-shared/data/master-data-model.md).
