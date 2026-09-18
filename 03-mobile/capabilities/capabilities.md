---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-09-18
---

# Mobile capability projection

Mobile projects [the shared CAP-01..CAP-16 model](../../01-shared/product/capability-map.md)
into two applications. Product direction is `ACCEPTED` for the Mobile V1
Product Generation envelope of all 73 functional stories. The former 28/35/9/1
grouping remains historical planning provenance. Needfinding evidence is
available; solution validation and Product Acceptance remain open.

| App | V1 capability projection | Explicit boundary |
|---|---|---|
| Operations Mobile | CAP-02/07/08/09/10/15; warehouse, dispatch and Driver execution | API owns business truth; safe cache/draft/evidence staging only; no Mobile/Scanner/QR/Device BC |
| Buyer Mobile | CAP-02/09/14/15; critical Delivery update, handoff, receipt and discrepancy | Buyer Relationship/API owns authority; no offline receipt or commitment confirmation |

API v0.17.0 supports selected identifier, FEFO, handoff, receipt/discrepancy
and critical-update foundations. Advanced analytics, continuous tracking,
IoT, rich chat, advanced GS1 and transfers/counts are deferred or Future; see
the [feature-family audit](../requirements/roadmap-coverage.md).
