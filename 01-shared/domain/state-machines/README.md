---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-09-20
---

# Canonical domain state machines

These PlantUML sources are the canonical lifecycle vocabulary. SVG and PNG
files are generated artifacts. They align with the owning BC tactical model
and relational SQL; they do not introduce new business states.

| Lifecycle | Canonical source | Generated artifacts |
|---|---|---|
| Purchase Request | [PlantUML](purchase-request-state.puml) | [SVG](purchase-request-state.svg) · [PNG](purchase-request-state.png) |
| Fulfillment | [PlantUML](fulfillment-state.puml) | [SVG](fulfillment-state.svg) · [PNG](fulfillment-state.png) |
| Delivery | [PlantUML](delivery-state.puml) | [SVG](delivery-state.svg) · [PNG](delivery-state.png) |
| Warehouse Transfer | [PlantUML](warehouse-transfer-state.puml) | [SVG](warehouse-transfer-state.svg) · [PNG](warehouse-transfer-state.png) |
| Credit Reservation | [PlantUML](credit-reservation-state.puml) | [SVG](credit-reservation-state.svg) · [PNG](credit-reservation-state.png) |
| Payment | [PlantUML](payment-state.puml) | [SVG](payment-state.svg) · [PNG](payment-state.png) |

The associated aggregate boundaries are [BC-04](../bounded-contexts/BC-04-sales-commitment/README.md),
[BC-05](../bounded-contexts/BC-05-inventory-availability/README.md),
[BC-06](../bounded-contexts/BC-06-fulfillment-delivery/README.md),
[BC-07](../bounded-contexts/BC-07-credit-receivables/README.md) and
[BC-08](../bounded-contexts/BC-08-payments/README.md).
