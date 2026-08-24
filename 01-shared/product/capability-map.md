---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-08-23
---

# Shared capability model

This is the one cross-surface capability model. It describes business ability,
not screens, routes, endpoints, tables, epics or Bounded Contexts. The Domain
ownership map remains the authority for ownership detail; this matrix adds the
Product/Surface projection needed to derive future requirements.

## Capability matrix

| ID | Business capability | Primary actors | Primary BC | Web | Mobile V1 | Process/state/event anchors |
|---|---|---|---|---|---|---|
| CAP-01 | Acquisition and assisted onboarding | Public Interested Company/Prospect; Nexa Commercial & Onboarding Staff | BC-01 | Website | — | onboarding / Tenant lifecycle / `TenantActivated` |
| CAP-02 | Workforce access and governance | Company Owner; Tenant Administrator; Nexa Staff | BC-01 | Platform | Operations proposed | access / membership / access facts |
| CAP-03 | Customer accounts and buyer relationships | Sales Representative; Company Owner; Business Operations Manager; Customer Buyer | BC-02 | Platform + Portal | Operations/Buyer proposed | relationship lifecycle / authorization |
| CAP-04 | Catalog and commercial policy | Company Owner; Sales Representative; Customer Buyer | BC-03 | Platform + Portal | Operations/Buyer proposed | offer / price resolution / `PriceResolved` |
| CAP-05 | Buyer shopping and drafts | Customer Buyer; Sales Representative | BC-03 + BC-04 | Portal + Platform | Buyer proposed; Sales proposed | cart/draft / no reservation / `CartDraftCreated` |
| CAP-06 | Purchase Requests and Sales Orders | Customer Buyer; Sales Representative; Company Owner | BC-04 | Portal + Platform | Buyer proposed; Operations proposed | PR/SO state / commitment / `SalesOrderConfirmed` |
| CAP-07 | Availability and inventory reservation | Customer Buyer; Sales Representative; Warehouse Operator | BC-05 | Portal + Platform | Operations proposed | sellable availability / reservation / `AvailabilityChanged` |
| CAP-08 | Receiving and warehouse operations | Warehouse Operator | BC-05 | Platform | Operations proposed | receiving/lots/FEFO / stock facts |
| CAP-09 | Fulfillment, dispatch and delivery | Warehouse Operator; Dispatch Coordinator; Driver/Delivery Operator | BC-06 | Platform + Portal | Operations proposed | fulfillment/delivery/POD / `DeliveryCompleted` |
| CAP-10 | Cold-chain evidence and disposition | Warehouse Operator; Dispatch Coordinator; Driver/Delivery Operator | BC-06 | Platform + Portal | Operations proposed | temperature / HOLD / disposition |
| CAP-11 | Credit and receivables | Company Owner; Sales Representative; Customer Buyer | BC-07 | Platform + Portal | Buyer proposed | credit / reservation / receivable |
| CAP-12 | Payments and correction | Customer Buyer; Company Owner; Sales Representative | BC-08 + BC-07 | Portal + Platform | Buyer proposed; Operations proposed | payment lifecycle / `PaymentConfirmed` |
| CAP-13 | Business documents | Customer Buyer; Sales Representative; Dispatch Coordinator | BC-09 | Portal + Platform | Buyer proposed; Operations proposed | issued history / `BusinessDocumentIssued` |
| CAP-14 | Notifications | all authorized recipients | BC-10 | Platform + Portal + Website intake | Push proposed | delivery attempt / `NotificationDeliveryFailed` |
| CAP-15 | Business traceability | authorized workforce; Customer Buyer | BC-11 | Platform + Portal | Operations/Buyer proposed | durable timeline / `BusinessFactTraced` |
| CAP-16 | Operational visibility | Business Operations Manager; authorized workforce | consuming projections | Platform | Operations proposed | read projections / source version |

## Boundary rules

- The exact 11 accepted BCs are listed in [Shared Domain](../domain/README.md).
- Web and Mobile project capabilities; neither surface creates a BC.
- `Web` means Website, Internal Platform and Buyer Portal projections. `Mobile
  V1` is not accepted implementation scope; `proposed` means derivation input
  pending research.
- State machines and published event contracts are linked from [processes](../domain/processes/README.md),
  [state machines](../domain/state-machines/README.md) and [events](../domain/events/README.md).
- Capability-to-story derivation is governed by the [requirements standard](requirements-standard.md)
  and the [Web source map](../../02-web/requirements/derivation-sources.md).
