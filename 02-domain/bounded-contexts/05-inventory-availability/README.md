---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-05 Inventory Availability

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Owns physical truth, sellability, deterministic backing and Physical Allocation; Core. Strategic importance: connects commitment to real cold-chain stock. |
| Language / actors | Inventory Lot, physical stock, Sellable Availability, Safety Stock, Inventory Reservation, Warehouse Backing, HOLD, QUARANTINE, FEFO, Physical Allocation, ColdChainDisposition. Actors: Warehouse Operator, Business Operations Manager, Sales Representative. |
| Responsibilities / data | Receiving, lots, quantities, movement, holds, safety stock, availability, warehouse-neutral backing, lot allocation and transfers. |
| Invariants | Sellable = usable on-hand - active commitments - safety stock; backing protects full demand without double count; in-transit is not sellable twice; expired/quarantined lots cannot allocate. |
| Commands | ReceiveStock, RegisterLot, ChangeDisposition, AdjustQuantity, TransferStock, ReserveDemand, AllocatePhysicalLots, ReleaseBacking, RecordCount. |
| Domain / published events | Internal: StockReceived, LotCreated, InventoryMoved, CommitmentDemandObserved, AllocationExecuted, ShortageDetected. Published: AvailabilityChanged.v1, PhysicalAllocationCreated.v1. |
| Upstream / downstream | Upstream: Sales Commitment demand and catalog SKU semantics. Downstream: Sales projections and Fulfillment & Delivery. Sync: full protection and allocation decisions; async: availability announcements. |
| Failure / transaction | Allocation rejects expired/quarantined/insufficient stock; row/version guards prevent over-allocation; backing distribution is internal and creates no new published event. |
| Security / tenant | Warehouse scope and capability control mutations; tenant isolation and evidence required for exceptional adjustments. |
| Web / Mobile consumers | Web: Platform warehouse and availability views, Portal sellable availability. Mobile: Warehouse scan-to-inventory, Sales visibility and BOM exceptions. |
| Out of scope | Commercial Order ownership, receivables, notification delivery, scanning/QR BC, IoT BC and permanent tracking. |

## Tactical DDD target

Aggregate Roots: InventoryPosition, InventoryReservation, PhysicalAllocation. Entities: InventoryLot, WarehouseBacking, StockMovement, Count. Value Objects: SkuId, WarehouseId, LotId, Quantity, ExpiryDate, Disposition. Domain Services: SellableAvailabilityPolicy, FEFOAllocationPolicy. Repositories: InventoryLotRepository, ReservationRepository, AllocationRepository. Lifecycle: received → sellable/hold/quarantine/expired; reservation → backed → allocated/released.
