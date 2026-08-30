---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-05 — Inventory Availability functional contract

**Purpose:** own physical stock, Sellable Availability, demand backing, lot
allocation, FEFO and authorized inventory disposition.

| Contract element | Definition |
|---|---|
| Concepts / roots | Warehouse, Inventory Lot, Inventory Position, Inventory Backing, Physical Allocation, Disposition |
| Value objects | SkuId, LotId, WarehouseId, Quantity, ExpiryDateUtc, AllocationId, ScanEvidence |
| Boundary | Owns physical and sellability truth; does not own order lifecycle, delivery outcome or notification delivery. |
| Commands | ReceiveStock, RegisterLot, ChangeDisposition, AdjustQuantity, TransferStock, ReserveDemand, AllocatePhysicalLots, ValidatePickScan, RecordCount |
| Queries | ResolveLot, ReadSellableAvailability, ReadLotStock, ReadFEFOCandidate, ReadAllocation |
| Invariants | Sellable = usable on-hand - active commitments - safety stock; expired/quarantined lots cannot allocate; no over-pick; FEFO is deterministic unless explicit override. |
| Actors / surfaces | Company Owner, Business Operations Manager, Warehouse Operator, Sales Representative; Platform, Operations Mobile, Buyer Portal/Mobile projections. |
| Synchronous dependencies | BC-03 SKU meaning and BC-04 commitment demand; BC-06 may execute only a valid allocation binding. |
| Events / consumers | `AvailabilityChanged.v1`, `PhysicalAllocationCreated.v1`; scan/FEFO/override facts remain internal/traceable. |
| Trace / idempotency / concurrency | lot/scan/override actor and reason; idempotent receive/pick; row locks/CAS prevent last-unit races; UTC expiry. |
| Scope | V1: receiving, lots, FEFO, physical allocation, scan validation and controlled override. V2/Future: advanced transfer/count/GS1/industrial scanning. |
| AS-IS evidence | API v0.17.0 lot resolution, FEFO/picking validation and allocation binding; runtime/provider evidence remains separate. |
