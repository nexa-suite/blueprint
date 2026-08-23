---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# Selective C4 Level 4 code views

These views are deliberately narrow. They show implementation seams that matter for PRE-V1 construction; they do not claim that current packages are Bounded Contexts. Current classes are marked `AS-IS`; accepted logical responsibilities are marked `TARGET`. The C4 guidance recommends using only levels that add value; these views exist because selected concurrency, security and provider seams need code-level traceability. See the [official C4 diagram guidance](https://c4model.com/diagrams).

## Customer access and Buyer relationship path

```mermaid
flowchart LR
  B[Buyer browser] --> P[Portal route and guard\nAS-IS]
  P --> C[Buyer API client / facade\nAS-IS]
  C --> H[API presentation\nAS-IS]
  H --> A[CurrentAccessContext\nAS-IS]
  A --> R[Relationship / membership policy\nTARGET ownership boundary]
  R --> Q[Scoped query projection\nTARGET]
  Q --> DB[(PostgreSQL + RLS\nAS-IS / TARGET coverage)]
```

The browser supplies intent, not authority. `CurrentAccessContext` and the API authorization boundary must resolve Tenant, Workspace, membership/relationship and capability before the query reaches persistence.

## Purchase Request to Sales Order path

```mermaid
flowchart LR
  PRC[PurchaseRequestCommandController\nAS-IS] --> PRS[PurchaseRequestService\nAS-IS]
  PRS --> PR[PurchaseRequest\nAS-IS domain model]
  PRS --> PA[PurchaseRequestPersistenceAdapter\nAS-IS]
  PRS --> SO[Sales Commitment boundary\nTARGET]
  SO --> SOD[SalesOrderService\nAS-IS]
  SOD --> ORDER[SalesOrder\nAS-IS domain model]
  ORDER --> OUT[CanonicalOutbox\nAS-IS / TARGET event seam]
```

`Sales Commitment boundary` is a TARGET logical responsibility, not a current class. Purchase Request and Sales Order snapshots must preserve the decision made at submission/acceptance. `If-Match` and idempotency protect different retry/concurrency concerns.

## Commitment, reservation and allocation path

```mermaid
flowchart LR
  CMD[Sales / warehouse command\nAS-IS] --> W[WarehouseOperationsService\nAS-IS]
  W --> RES[Reservation persistence and row/version guard\nAS-IS]
  RES --> AV[Inventory Availability\nTARGET semantic boundary]
  AV --> FEFO[FEFO / lot policy\nAS-IS evidence]
  AV --> ALLOC[Allocation state\nTARGET distinction]
  ALLOC --> OUT[CanonicalOutbox\nAS-IS]
  OUT --> F[ Fulfillment and Delivery\nTARGET]
```

The target distinction is `Commercial Commitment != Inventory Reservation/Warehouse Backing != Physical Allocation != physical stock`. `RES` represents Inventory-owned reservation backing: it may span eligible Warehouses, selects no Lot, and protects full demand before later Physical Allocation. Existing reservation and FEFO behavior is preserved as evidence while accepted ownership and lifecycle language guide construction.

## Payment provider and reconciliation path

```mermaid
flowchart LR
  UI[Payment command\nPlatform/Portal] --> API[Payment API boundary\nAS-IS]
  API --> PS[PaymentService\nAS-IS]
  PS --> ACL[Provider ACL / Stripe adapter\nAS-IS provider direction]
  ACL --> EXT[Payment Provider\nexternal]
  EXT --> WH[Verified webhook\nAS-IS]
  WH --> IN[Inbox identity + lease/fencing\nAS-IS]
  IN --> PAY[Payment business state\nTARGET ownership boundary]
  PAY --> REC[Receivable/reconciliation\nTARGET]
  PAY --> OUT[CanonicalOutbox\nAS-IS]
```

Payment is not synonymous with Stripe. Provider callbacks are authenticated, deduplicated and reconciled; capture success plus failed order creation remains an explicit operational state.

## Authenticated frontend to API path

```mermaid
flowchart LR
  PR[Platform route] --> PG[PlatformShellComponent\nAS-IS]
  PG --> PF[Feature facade / signal state\nAS-IS]
  PF --> PA[AuthApiService or feature API service\nAS-IS]
  BR[Portal route] --> BS[PortalShellComponent\nAS-IS]
  BS --> BF[Buyer facade / signal state\nAS-IS]
  BF --> BA[Buyer API client\nAS-IS]
  PA --> HTTP[HTTPS + If-Match + Idempotency-Key\nTARGET contract]
  BA --> HTTP
  HTTP --> API[API presentation + access context\nAS-IS]
```

Route guards improve navigation. Only the API and persistence scope enforce authorization. Loading, empty, forbidden, stale and conflict states are part of the frontend contract.
