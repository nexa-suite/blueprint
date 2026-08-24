---
status: planned
maturity: DISCOVERY
scope: runway
owner: product
last-reviewed: 2026-08-24
---

# Mobile requirements derivation sources

This is a research map, not a story backlog. Future Mobile requirements must
derive from shared business capabilities and real class evidence.

| Mobile area | Actor / segment | Shared capability and BC input | Research input | Status |
|---|---|---|---|---|
| Operations: sales | Sales Representative / `MOB-SEG-01` Field & Warehouse Operations | customer lookup, Buyer Relationship, catalog, pricing, availability, drafts and PR/order; BC-02/03/04/05/07 | class interviews and task observation | PENDING |
| Operations: warehouse | Warehouse Operator / `MOB-SEG-01` | scan abstraction, receiving, lot/expiry, inventory, picking, evidence; BC-05/11 | field workflow research | PENDING |
| Operations: dispatch | Dispatch Coordinator / `MOB-SEG-01` | ready delivery, assignment, handoff and evidence; BC-06/11 | dispatch workflow research | PENDING |
| Operations: driver | Driver / Delivery Operator / `MOB-SEG-02` Delivery Workforce | assigned delivery, attempt, active location, POD, temperature evidence; BC-06/09/10/11 | driver interviews and delivery observation | PENDING |
| Buyer Mobile | Customer Buyer / `MOB-SEG-03` B2B Buyers | catalog, order, PR/SO, credit, payment, documents, push, progress and discrepancy; BC-02/03/04/06/07/08/09/10/11 | buyer research during class | PENDING |

Cross-cutting research questions: selective offline, push priority, EAN/UPC/QR
and future GS1 abstraction, camera permissions, location consent, mobile IA,
temperature/evidence capture and recovery from failed sync. No result is
asserted until evidence is recorded in [Mobile discovery](../ux/discovery/README.md).

Academic Web evidence is not silently reused as Mobile validation. Shared
Design policy is linked from [Design adoption](../../01-shared/design/adoption/README.md).
