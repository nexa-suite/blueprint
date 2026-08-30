---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-29
---

# Mobile capability projection

Mobile projects [the shared CAP-01..CAP-16 model](../../01-shared/product/capability-map.md)
into two applications. Product direction is `OWNER-ACCEPTED`; research and
client implementation remain pending.

| App | V1 capability projection | Explicit boundary |
|---|---|---|
| Operations Mobile | CAP-02/03/04/05/06/07/08/09/10/13/14/15; field sales, warehouse, dispatch and Driver execution | API owns business truth; selective evidence queue only; no Mobile/Scanner/QR/Device BC |
| Buyer Mobile | CAP-02/03/04/05/06/09/11/12/13/14/15; catalog, commitment, handoff/receipt/discrepancy and finance | Buyer Relationship/API owns authority; no offline payment/commitment confirmation |

API v0.17.0 supports selected identifier, FEFO, handoff, receipt/discrepancy
and push-subscription foundations. Advanced analytics, continuous tracking,
IoT, rich chat, advanced GS1 and transfers/counts are deferred or Future.
