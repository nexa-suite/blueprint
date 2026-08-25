---
status: planned
maturity: DISCOVERY
scope: runway
owner: product
last-reviewed: 2026-08-24
---

# Mobile Requirements Derivation Sources

This map indexes inputs for the proposed Mobile catalog. It does not claim
Mobile research validation and does not derive a new Bounded Context.

| Mobile area | Actor / segment | Shared capability and BC input | Research input | Status |
|---|---|---|---|---|
| Access and context | Mobile User | active context and capability navigation; BC-01 | Mobile research | PENDING |
| Operations: sales | Sales Representative / field operations | Customer Account, Buyer Relationship, catalog, pricing, availability, drafts and PR/order; BC-02/03/04/05/07 | class interviews and task observation | PENDING |
| Operations: warehouse | Warehouse Operator | scan abstraction, receiving, lot/expiry, inventory, picking and evidence; BC-05/06/11 | field workflow research | PENDING |
| Operations: dispatch | Dispatch Coordinator | ready delivery, assignment, handoff and evidence; BC-06/11 | dispatch workflow research | PENDING |
| Operations: driver | Driver | assigned delivery, attempt, active location, POD and evidence; BC-06/09/11 | driver interviews and delivery observation | PENDING |
| Buyer Mobile | Customer Buyer | catalog, order, PR/SO, credit, payment, documents, push, progress and discrepancy; BC-02/03/04/06/07/08/09/10/11 | buyer research during class | PENDING |

Cross-cutting research questions: selective offline, push priority, EAN/UPC/QR
and future GS1 abstraction, camera permissions, location consent, mobile IA,
temperature/evidence capture and recovery from failed sync. No result is
asserted until evidence is recorded in [Mobile discovery](../ux/discovery/README.md).
