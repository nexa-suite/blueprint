---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-09-20
---

# BC-05 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Aggregate/group | Tables | Integrity |
|---|---|---|
| Warehouse | `warehouse`, `safety_stock_policy` | scoped candidate key; policy is Warehouse-derived |
| Lot and position | `inventory_lot`, `inventory_position`, `inventory_movement`, `lot_disposition` | Lot carries root scope; position/movement/disposition are Warehouse/Lot-derived; non-negative stock; movement append-only |
| Inventory Reservation / Warehouse Backing | `inventory_backing`, `inventory_backing_line` | scope-bearing backing line has composite FKs to Reservation and Warehouse; deterministic SKU + Warehouse distribution and quantity bounds |
| Physical allocation | `physical_allocation`, `physical_allocation_line` | allocation and line use scoped Backing/Lot composite FKs; allocation quantity bounds; scan-to-allocation validation |
| Transfer | `warehouse_transfer`, `warehouse_transfer_line` | source/destination Warehouse composite scope FKs; no self-transfer |
| Adjustment | `inventory_adjustment` | warehouse/lot FKs; approval/application lifecycle |

SQL has PK, same-owner FK, NOT NULL, quantity/status checks, unique stock
positions and FEFO/reservation/transfer indexes. RLS applies tenant/workspace;
no cross-BC FK is declared. `on_hand`, `reserved`, `held` and safety policy
support Sellable Availability; lot expiry supports FEFO. `reserved_quantity`
is the guarded position projection of active `InventoryReservation` protection
represented by `inventory_backing`; a backing or backing line is never a
second subtraction. `held_quantity` is physically non-sellable. Thus the
calculation is `max(0, on_hand - held - reserved - safety_stock)` and the SQL
prevents reserved plus held from exceeding on-hand. AS-IS anchors are all
`warehouse` tables, including reservation/allocation, movement, temperature
evaluation and transfer tables. Warehouse Transfer states are exactly
`REQUESTED`, `IN_TRANSIT` and `RECEIVED`; lot status distinguishes
`QUARANTINE`, `DAMAGED`, `WASTE` and `IN_TRANSIT` from sellable stock.
`inventory_backing_line` and `physical_allocation_line` carry direct scope only
because they bridge independently scoped roots. `inventory_position`, movement,
adjustment, safety-stock, transfer-line and disposition tables are
parent-derived simple children/facts; they do not duplicate tenant/workspace
scope. The v0.17 scan contract validates the resolved SKU/lot against an existing
Physical Allocation Line, applies FEFO ordering, rejects stale or over-pick
attempts and permits only policy-controlled overrides with actor and reason.
`inventory_backing` is the physical relational representation of the
Inventory Reservation root; `inventory_backing_line.warehouse_id` makes its
Warehouse Backing distribution explicit. It protects commitment demand once;
`physical_allocation` is a later, separate lot-selection fact. Scanning is an application
interaction, not a new domain aggregate.
