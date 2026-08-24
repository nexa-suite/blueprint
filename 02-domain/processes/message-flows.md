---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: domain
last-reviewed: 2026-08-23
---

# Domain message flows

These are canonical sync/async boundaries, not endpoint specifications. `S` is
synchronous inside the source transaction or decision; `A` is an asynchronous
published fact through outbox/inbox. No flow creates a new Bounded Context.

| Flow | Message path |
|---|---|
| Tenant onboarding | `S` ProvisionTenant → TenantActivated → MembershipGranted; `A` traceability and notification projections |
| Buyer relationship activation | `S` RequestRelationship → ApproveRelationship → LinkBuyerIdentity; `A` authorized relationship projection |
| Catalog → Buyer offer | `S` relationship eligibility → ResolveOffer → price/terms/SKU snapshot; `A` offer/availability UI refresh hint |
| APPROVAL_REQUIRED purchase | `S` Buyer submits PR → commitment + inventory backing + applicable credit reservation; `A` PurchaseRequestSubmitted → sales review/notification |
| DIRECT_ORDER purchase | `S` Buyer submits → resolve offer → commitment + backing + credit decision → SO born CONFIRMED; `A` SalesOrderConfirmed |
| PR → Sales Order | `S` review/material change → BuyerChangeAccepted when required → ConfirmSalesOrder and ownership transfer; `A` SalesOrderConfirmed |
| Commercial Commitment | `S` SKU + quantity demand becomes active/released commitment; `A` CommercialCommitmentEstablished |
| Inventory allocation | `S` demand → backing → FEFO Physical Allocation or explicit shortage; `A` AvailabilityChanged / PhysicalAllocationCreated |
| Fulfillment | `S` SO + allocation → pick → pack → stage → ReadyForDispatch; `A` shortage or readiness projections |
| Dispatch handoff | `S` verify goods/packages → assign Driver → mandatory Dispatch Handoff + photo + stable ID → dispatch; `A` handoff notification and traceability |
| Delivery / POD | `S` attempt → offered/accepted/rejected quantities → recipient acknowledgement + photo + POD; `A` DeliveryCompleted or ContinuationDeliveryCreated |
| Credit / Receivable | `S` credit reservation → SO confirmation → Receivable posted/conversion without double count; `A` CreditReservationEstablished / ReceivablePosted |
| Payment | `S` report/callback verification and idempotency; `A` PaymentConfirmed → credit/application, notifications and traceability |
| Financial correction | `S` explicit FinancialAdjustment preserves prior obligation; `A` document/traceability projections |
| Notifications | `A` source fact → candidate → channel attempt/retry/terminal failure; source state never changes because delivery failed |
| Traceability | `A` source fact → append-only BusinessFactTraced with actor/reason/evidence/correlation; authorized timelines refetch |

## Delivery evidence boundary

Dispatch Handoff contains Delivery reference, Driver, package/goods references,
dispatch actor, timestamp, mandatory photographic evidence and handoff ID. POD
contains Delivery Attempt ID, recipient identity evidence, timestamp,
geolocation, delivered/rejected quantities and reasons, photographic evidence,
actor and evidence references. A Buyer QR token is ephemeral, opaque,
time-limited and replay-protected; it does not carry sensitive business data.
