---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# BC-05 Inventory Availability — Tactical Model

**State:** TARGET core-domain model. Inventory owns physical availability,
Warehouse backing and Physical Allocation. It does not own Commercial
Commitment or Fulfillment execution.

## Purpose and product participation

Own physical stock, sellable availability, warehouse backing, FEFO,
allocation and transfer facts. Platform and proposed Operations Mobile execute
authorized work; API remains physical availability authority.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `InventoryPosition` | SKU + Warehouse quantity authority and sellable calculation inputs | SKU ID |
| `InventoryLot` | lot/expiry/disposition and physical quantity | SKU/Warehouse IDs |
| `InventoryBacking` | protects Commercial Commitment demand across eligible Warehouses | Commitment ID, SKU ID |
| `PhysicalAllocation` | selects lot quantities for a Fulfillment contract | commitment/fulfillment IDs, lot IDs |
| `WarehouseTransfer` | source/destination movement state `REQUESTED -> IN_TRANSIT -> RECEIVED` | Warehouse/Lot IDs |

Movement and adjustment facts are append-only; position is a guarded projection
of physical truth. Safety Stock is a policy, not a reservation.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `Warehouse` | Aggregate Root | warehouse ID, scope, status, service policy, version | `open()`, `close()`, `setServicePolicy()` | roots Position/Lot references |
| `InventoryLot` | Aggregate Root | lot ID, SKU, warehouse, expiry, quantity, disposition, version | `receive()`, `hold()`, `releaseHold()`, `markExpired()` | physical lot; TARGET |
| `InventoryPosition` | Aggregate Root | SKU/warehouse IDs, onHand, reserved, safetyStock, version | `applyMovement()`, `sellableAvailability()` | one per SKU + Warehouse |
| `SafetyStockPolicy` | Entity | SKU/warehouse, minimum quantity, effectiveAt | `changeMinimum()` | owned by Warehouse policy boundary |
| `InventoryBacking` | Aggregate Root | backing ID, commitment ID, status, version | `establish()`, `reallocate()`, `release()` | composes BackingLine; no lot ownership |
| `InventoryBackingLine` | Entity | warehouse/SKU IDs, protected quantity | `changeQuantity()` | owned by Backing |
| `PhysicalAllocation` | Aggregate Root | allocation ID, commitment/fulfillment IDs, status, version | `allocateFEFO()`, `release()`, `confirm()` | composes AllocationLine; lot references |
| `PhysicalAllocationLine` | Entity | lot ID, quantity, expiry snapshot | `confirmPick()` | owned by Allocation |
| `WarehouseTransfer` | Aggregate Root | source/destination, state, requestedAt, inTransitAt, receivedAt, version | `request()`, `moveInTransit()`, `receive()` | composes TransferLine |
| `InventoryMovement` / `InventoryAdjustment` | Immutable facts | quantity delta, reason, actor, occurredAt | none after append | physical ledger |
| `LotDisposition` | Value/Entity | disposition, reason, decidedAt | `hold()`, `release()`, `reject()` | prevents sellability |
| `StockQuantity` | Value Object | non-negative amount | `add()`, `subtractChecked()` | invariant value |
| `SellableAvailabilityPolicy` | Domain Service | none | `calculate(onHand, commitments, safetyStock)` | avoids double subtraction |
| `FEFOAllocationPolicy` | Domain Service | none | `orderEligibleLots()` | expiry-tracked default |
| `InventoryPositionRepository` / `InventoryBackingRepository` | Repository interfaces | none | `save()`, `bySkuWarehouse()` | roots only |
| `InventoryBackingEstablished` / `PhysicalAllocationConfirmed` | Domain Events | IDs, quantities, occurredAt | immutable facts | no new published events |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `EstablishInventoryBackingHandler` | protect commitment demand | deterministic Warehouse selection; same transaction boundary as sales/credit |
| `ReleaseInventoryBackingHandler` | release on terminal PR/SO result | idempotent release ledger; no double subtract |
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
| `OperationsInventoryConsumer` | proposed Mobile scan/work consumer | TARGET proposed interface |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `InventoryRepositoryAdapter` | PostgreSQL position/lot/movement persistence | AS-IS warehouse adapters; KEEP/REFINE |
| `InventoryBackingAdapter` | backing/reservation persistence | AS-IS V16/V49/V57/V75; REFINE ownership language |
| `FEFOQueryAdapter` | ordered lot query | TARGET persistence adapter |
| `TenantScopedTransactionPort` | RLS/worker scope | shared technical boundary |
| `InventoryOutboxAdapter` | committed fact publication | AS-IS integration outbox; KEEP |

## Invariants and transaction boundaries

- Sellable Availability = usable on-hand − active Commercial Commitments −
  Safety Stock. Backing protects commitment once; it is not subtracted twice.
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

Internal events include `InventoryBackingEstablished`, `InventoryHeld` and
`PhysicalAllocationConfirmed`; published count remains 14. See [BC-05 data model](data/data-model.md),
[target SQL](data/target-relational-model.sql) and [domain UML](diagrams/domain-model.puml).

AS-IS evidence at API main: `warehouse` domain/application/infrastructure and
V15–V17, V38, V49, V57, V74, V77, V80–V81. Classification: lot/movement/
reservation persistence **KEEP/REFINE**, explicit Sellable Availability and
backing-vs-allocation semantics **REFINE**, full multi-Warehouse atomic
orchestration **PARTIAL / NOT IMPLEMENTED**.
