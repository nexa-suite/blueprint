---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-06 Fulfillment & Delivery

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Executes picking, packing, staging, dispatch, delivery and evidence; Core. Strategic importance: converts allocation into traceable physical outcome. |
| Language / actors | Fulfillment, pick, pack, stage, Dispatch Handoff, Delivery, Attempt, Continuation Delivery, POD, excursion. Actors: Warehouse Operator, Dispatch Coordinator, Driver / Delivery Operator, B2B Buyer. |
| Responsibilities / data | Fulfillment execution, dispatch coordination, mandatory handoff, delivery attempts, partial/rejected quantities, continuation, POD and operational cold-chain evidence. Inventory remains physical authority. |
| Invariants | Attempts stay on one Delivery; partial delivery creates continuation; POD is immutable; no silent substitution; Dispatch Handoff is distinct from POD and contains mandatory photographic evidence. |
| Commands | PlanFulfillment, StartPicking, CompletePicking, PackGoods, StageFulfillment, RecordDispatchHandoff, DispatchDelivery, StartAttempt, RecordDeliveryOutcome, CreateContinuation, CapturePOD, RecordTemperatureEvidence. |
| Domain / published events | Internal: FulfillmentPlanned, PickingCompleted, ReadyForDispatch, DispatchHandoffRecorded, DeliveryAttempted, PartialDeliveryRecorded, PODRecorded. Published: FulfillmentShortage.v1, DeliveryCompleted.v1, ContinuationDeliveryCreated.v1. |
| Upstream / downstream | Upstream: confirmed SO and BC-05 allocation. Downstream: Inventory mutation contract, Documents, Notifications, Traceability, Portal and Mobile. Sync: handoff/POD source facts; async: published completion. |
| Failure / transaction | Failed attempt remains on same Delivery; missing evidence blocks required completion; partial outcome preserves offered/accepted/rejected facts and creates continuation explicitly. |
| Security / tenant | Driver sees assigned deliveries only; live location only during active relevant lifecycle; recipient evidence is minimized and tenant-scoped. |
| Web / Mobile consumers | Web: Platform fulfillment/dispatch and Portal tracking. Mobile: Operations Mobile for warehouse/dispatch and Driver execution; Buyer Mobile for QR confirmation/discrepancy. |
| Out of scope | Physical stock authority, credit approval, payment provider, permanent employee tracking, personal-phone contact and a Tracking/QR/POD BC. |

## Tactical DDD target

Aggregate Roots: Fulfillment, Delivery. Entities: Package, DispatchHandoff, DeliveryAttempt, POD, DeliveryDiscrepancy. Value Objects: DeliveryId, HandoffId, AttemptId, EvidenceRef, GeoPoint, DeliveryQuantity. Domain Services: PartialDeliveryPolicy, DeliveryLocationPrivacyPolicy. Repositories: FulfillmentRepository, DeliveryRepository. Lifecycle: planned → picked → packed → staged → ready → handed over → dispatched → attempted → completed/failed with continuation.

## Tactical wave artifacts

- [Tactical model](tactical-model.md)
- [Domain UML source](diagrams/domain-model.puml)
- [Rendered UML SVG](diagrams/BC06_FulfillmentDelivery.svg)
- [Rendered UML PNG](diagrams/BC06_FulfillmentDelivery.png)
- [Target data model](data/data-model.md)
- [Target SQL](data/target-relational-model.sql)
- [Database ERD SVG](data/database-diagram.svg) · [PNG](data/database-diagram.png)
