---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# BC-05 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Aggregate/group | Tables | Integrity |
|---|---|---|
| Warehouse | `warehouse`, `safety_stock_policy` | scoped code; policy validity; warehouse FK |
| Lot and position | `inventory_lot`, `inventory_position`, `inventory_movement`, `lot_disposition` | lot/warehouse FKs; non-negative stock; movement append-only |
| Backing | `inventory_backing`, `inventory_backing_line` | commitment is external stable ID; line FK and quantity bounds |
| Physical allocation | `physical_allocation`, `physical_allocation_line` | backing/lot FKs; allocation quantity bounds |
| Transfer | `warehouse_transfer`, `warehouse_transfer_line` | source/destination warehouse FKs; no self-transfer |
| Adjustment | `inventory_adjustment` | warehouse/lot FKs; approval/application lifecycle |

SQL has PK, same-owner FK, NOT NULL, quantity/status checks, unique stock
positions and FEFO/backing/transfer indexes. RLS applies tenant/workspace;
no cross-BC FK is declared. `on_hand`, `reserved`, `held` and safety policy
support Sellable Availability; lot expiry supports FEFO. AS-IS anchors are all
`warehouse` tables, including reservation/allocation, movement, temperature
evaluation and transfer tables. Warehouse Transfer states are exactly
`REQUESTED`, `IN_TRANSIT` and `RECEIVED`; lot status distinguishes
`QUARANTINE`, `DAMAGED`, `WASTE` and `IN_TRANSIT` from sellable stock.
