---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-09-20
---

# BC-05 Inventory Availability — Tactical Model

**State:** TARGET core-domain model. Inventory owns physical availability,
Inventory Reservation/Warehouse Backing and Physical Allocation. It does not own Commercial
Commitment or Fulfillment execution.

## Purpose and product participation

Own physical stock, sellable availability, warehouse backing, FEFO,
allocation and transfer facts. Platform and OWNER-ACCEPTED Operations Mobile
projections execute authorized work; API remains physical availability
authority.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `InventoryPosition` | SKU + Warehouse quantity authority and sellable calculation inputs | SKU ID |
| `InventoryLot` | lot/expiry/disposition and physical quantity | SKU/Warehouse IDs |
| `InventoryReservation` | protects Commercial Commitment demand across eligible Warehouses; relational root is `inventory_backing` | Commitment ID, SKU ID |
| `PhysicalAllocation` | selects lot quantities for a Fulfillment contract | commitment/fulfillment IDs, lot IDs |
| `WarehouseTransfer` | source/destination movement state `REQUESTED -> IN_TRANSIT -> RECEIVED` | Warehouse/Lot IDs |

`WarehouseBacking` is the Reservation-owned deterministic SKU + Warehouse
distribution, stored as `inventory_backing_line`; it is not a second Aggregate
Root or a Physical Allocation. Movement and adjustment facts are append-only;
position is a guarded projection of physical truth. Safety Stock is a policy,
not a reservation.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `Warehouse` | Aggregate Root | warehouse ID, scope, status, service policy, version | `open()`, `close()`, `setServicePolicy()` | roots Position/Lot references |
| `InventoryLot` | Aggregate Root | lot ID, SKU, warehouse, expiry, quantity, disposition, version | `receive()`, `hold()`, `releaseHold()`, `markExpired()` | physical lot; TARGET |
| `InventoryPosition` | Aggregate Root | SKU/warehouse IDs, onHand, reserved, safetyStock, version | `applyMovement()`, `applyReservationResult()`, `sellableAvailability()` | guarded projection; does not decide reserve/release |
| `SafetyStockPolicy` | Entity | SKU/warehouse, minimum quantity, effectiveAt | `changeMinimum()` | owned by Warehouse policy boundary |
| `InventoryReservation` | Aggregate Root | reservation ID, commitment ID, status, version | `establish()`, `reallocate()`, `release()` | represented by `inventory_backing`; composes WarehouseBacking; no lot ownership |
| `WarehouseBacking` | Entity | warehouse/SKU IDs, protected quantity | `changeQuantity()` | represented by `inventory_backing_line`; owned by Reservation |
| `PhysicalAllocation` | Aggregate Root | allocation ID, commitment/fulfillment IDs, status, version | `allocateFEFO()`, `release()`, `confirm()` | composes AllocationLine; lot references |
| `PhysicalAllocationLine` | Entity | lot ID, quantity, expiry snapshot | `confirmPick()` | owned by Allocation |
| `WarehouseTransfer` | Aggregate Root | source/destination, state, requestedAt, inTransitAt, receivedAt, version | `request()`, `moveInTransit()`, `receive()` | composes TransferLine |
| `InventoryMovement` / `InventoryAdjustment` | Immutable facts | quantity delta, reason, actor, occurredAt | none after append | physical ledger |
| `LotDisposition` | Value/Entity | disposition, reason, decidedAt | `hold()`, `release()`, `reject()` | prevents sellability |
| `StockQuantity` | Value Object | non-negative amount | `add()`, `subtractChecked()` | invariant value |
| `SellableAvailabilityPolicy` | Domain Service | none | `calculate(onHand, commitments, safetyStock)` | avoids double subtraction |
| `FEFOAllocationPolicy` | Domain Service | none | `orderEligibleLots()` | expiry-tracked default |
| `InventoryPositionRepository` / `InventoryReservationRepository` | Repository interfaces | none | `save()`, `bySkuWarehouse()` | roots only |
| `InventoryReservationEstablished` / `PhysicalAllocationConfirmed` | Domain Events | IDs, quantities, occurredAt | immutable facts | no new published events |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `EstablishInventoryReservationHandler` | protect commitment demand | deterministic Warehouse selection; same transaction boundary as sales/credit |
| `ReleaseInventoryReservationHandler` | release on terminal PR/SO result | idempotent release ledger; no double subtract |
| `AllocatePhysicalStockHandler` | lot selection | locks SKU/Warehouse/Lot, applies FEFO and creates allocation |
| `RecordInventoryAdjustmentHandler` | correct physical truth | authorized reason, versioned mutation and shortage outcome |
| `TransferInventoryHandler` | dispatch/receive stock | ordered source/destination locks and explicit transfer state |
| `RecordDispositionHandler` | hold/quarantine/cold-chain outcome | affected quantity becomes non-sellable until disposition |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `InventoryController` | Platform warehouse/availability boundary | AS-IS warehouse controller; KEEP/REFINE |
| `WarehouseController` | warehouse configuration boundary | AS-IS; KEEP |
| `InventoryAvailabilityQueryConsumer` | Portal safe availability projection | TARGET consumer contract |
| `OperationsInventoryConsumer` | Operations Mobile target scan/work consumer | TARGET interface; partial unmerged client evidence remains separate |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `InventoryRepositoryAdapter` | PostgreSQL position/lot/movement persistence | AS-IS warehouse adapters; KEEP/REFINE |
| `InventoryBackingAdapter` | backing/reservation persistence | AS-IS V16/V49/V57/V75; REFINE ownership language |
| `FEFOQueryAdapter` | ordered lot query | TARGET persistence adapter |
| `TenantScopedTransactionPort` | RLS/worker scope | shared technical boundary |
| `InventoryOutboxAdapter` | committed fact publication | AS-IS integration outbox; KEEP |

## Invariants and transaction boundaries

- Sellable Availability = `max(0, onHand − held − reserved − safetyStock)`.
  `reserved` is the guarded InventoryPosition projection of active Inventory
  Reservation protection, represented by `inventory_backing`; its
  WarehouseBacking distribution is not subtracted twice.
- HOLD, QUARANTINE, DAMAGED/WASTE, EXPIRED and IN_TRANSIT are not sellable.
- Prefer one Warehouse when it can satisfy demand; V1 may split across eligible
  Warehouses deterministically.
- Physical Allocation cannot exceed committed/backed quantity or usable lot
  quantity. FEFO never selects expired/quarantined stock.
- Transfer is explicit `REQUESTED`, `IN_TRANSIT`, `RECEIVED`; in-transit stock
  is not sellable at either location.
- Scarce inventory uses conditional updates/locks and version/CAS; no silent
  last-write-wins.

## Events, persistence and evidence

Internal events include `InventoryReservationEstablished`, `InventoryHeld` and
`PhysicalAllocationConfirmed`; published count remains 14. See [BC-05 data model](data/data-model.md),
[target SQL](data/target-relational-model.sql) and [domain UML](diagrams/domain-model.puml).

AS-IS evidence at API main: `warehouse` domain/application/infrastructure and
V15–V17, V38, V49, V57, V74, V77, V80–V81. Classification: lot/movement/
reservation persistence **KEEP/REFINE**, explicit Inventory Reservation /
Warehouse Backing versus Physical Allocation semantics **REFINE**, full multi-Warehouse atomic
orchestration **PARTIAL / NOT IMPLEMENTED**.

## Mobile v0.17 reconciliation

Identifier resolution is an application query owned by BC-03. BC-05 consumes
the resolved SKU/lot identity for `ValidatePickScan` and binds a successful
physical pick to an existing `PhysicalAllocationLine`; it does not create a
scan aggregate. FEFO ordering, stale allocation detection, over-pick rejection
and controlled override with actor/reason are domain/application behavior.
Override and discrepancy are append-only traceable facts. API v0.17.0 provides
the contract and V93/V97/V98 evidence; the Published Integration Event catalog
remains unchanged.
