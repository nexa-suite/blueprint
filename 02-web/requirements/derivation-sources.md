---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-24
---

# Web Requirements Derivation Source Map

This map indexes inputs for the frozen catalog and later refinement. It does
not replace accepted Product, DDD or C4 canon.

| Requirement area | Capability / actor goal | Domain source | UX/research source |
|---|---|---|---|
| Tenant onboarding | acquisition; Prospect; Nexa Staff | [BC-01](../../01-shared/domain/bounded-contexts/BC-01-tenant-access-governance/README.md) | [Problem Foundation](../../01-shared/product/vision/problem.md); [Lean UX canvas](../ux/discovery/lean-ux-canvas.md) |
| Customer and Buyer relationship | Sales; Customer Buyer | [BC-02](../../01-shared/domain/bounded-contexts/BC-02-customer-buyer-relationships/README.md) | [personas and journeys](../ux/discovery/personas-and-journeys.md) |
| Catalog, price and policy | catalog responsibility; Customer Buyer | [BC-03](../../01-shared/domain/bounded-contexts/BC-03-catalog-commercial-policy/README.md) | [research evidence](../ux/discovery/research-evidence.md) |
| Cart and purchase path | Customer Buyer | [capability map](../../01-shared/product/capability-map.md); BC-03/04 | [impact map](../ux/discovery/impact-map-and-stories.md) |
| Purchase Request | Customer Buyer; Sales | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md); [state machines](../../01-shared/domain/state-machines/README.md) | historical evidence with provenance |
| Sales Order | Sales; Company Owner | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md); [business rules](../../01-shared/domain/business-rules/README.md) | current catalog and historical evidence |
| Availability and inventory | Customer Buyer; Sales; Warehouse | [BC-05](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/README.md) | historical FEFO and stock evidence |
| Receiving and warehouse | Warehouse Operator | BC-05 processes and rules | historical operations evidence |
| Fulfillment and shortage | Warehouse; Sales | [BC-06](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) | historical dispatch/warehouse evidence |
| Dispatch, delivery and POD | Dispatch; Driver/Delivery Operator | BC-06; POD and continuation rules | historical delivery findings |
| Cold-chain | Warehouse; Dispatch | BC-06; temperature rules | historical temperature evidence |
| Credit and receivable | Company Owner; Sales; Customer Buyer | [BC-07](../../01-shared/domain/bounded-contexts/BC-07-credit-receivables/README.md) | historical credit observations |
| Payment | Customer Buyer; payment responsibility | [BC-08](../../01-shared/domain/bounded-contexts/BC-08-payments/README.md) | historical payment evidence |
| Documents | Sales; Customer Buyer | [BC-09](../../01-shared/domain/bounded-contexts/BC-09-business-documents/README.md) | historical document findings |
| Notifications | authorized recipient | [BC-10](../../01-shared/domain/bounded-contexts/BC-10-notifications/README.md) | current Design and UX state policy |
| Traceability and visibility | authorized user | [BC-11](../../01-shared/domain/bounded-contexts/BC-11-business-traceability/README.md) | [historical research](../ux/discovery/research-evidence.md) |

Each later refinement record must cite exact source rows and provenance.
Academic material is evidence, not Product authority.
