---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-24
---

# Web requirements derivation source map

This map is a future refinement contract. It names inputs; it does not derive
or publish new story IDs in this wave.

| Requirement area | Capability / actor goal | Domain source | UX/research source | Future review |
|---|---|---|---|---|
| Tenant onboarding | acquisition; Prospect; Nexa Staff | [BC-01](../../01-shared/domain/bounded-contexts/BC-01-tenant-access-governance/README.md) | [Lean UX canvas](../ux/discovery/lean-ux-canvas.md) | assisted approval, activation and access |
| Customer and Buyer relationship | Sales; Customer Buyer | [BC-02](../../01-shared/domain/bounded-contexts/BC-02-customer-buyer-relationships/README.md) | [personas and journeys](../ux/discovery/personas-and-journeys.md) | relationship lifecycle and tenant context |
| Catalog, price and policy | catalog responsibility; Customer Buyer | [BC-03](../../01-shared/domain/bounded-contexts/BC-03-catalog-commercial-policy/README.md) | [research evidence](../ux/discovery/research-evidence.md) | authoritative resolution and visibility |
| Cart and purchase path | Customer Buyer | [capability model](../../01-shared/product/capability-map.md); BC-03/04 | [impact map](../ux/discovery/impact-map-and-stories.md) | direct order vs approval path |
| Purchase Request | Customer Buyer; Sales | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md); [state machines](../../01-shared/domain/state-machines/README.md) | [historical stories](../../91-reference/legacy/legacy-ecosystem-report/historical-user-story-catalog.md) | consent, expiry and material change |
| Sales Order | Sales; Company Owner | BC-04 and [business rules](../../01-shared/domain/business-rules/README.md) | current catalog and historical evidence | immutable snapshot and correction |
| Availability and inventory | Customer Buyer; Sales; Warehouse | [BC-05](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/README.md) | historical FEFO and stock evidence | safe availability, reservation and FEFO |
| Receiving and warehouse | Warehouse Operator | BC-05 processes and rules | historical operations evidence | lot, expiry, hold and adjustment |
| Fulfillment and shortage | Warehouse; Sales | [BC-06](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) | historical dispatch/warehouse evidence | allocation, shortage and readiness |
| Dispatch, delivery and POD | Dispatch; Driver/Delivery Operator | BC-06; POD and continuation rules | historical delivery findings | attempt, partial delivery and evidence |
| Cold-chain | Warehouse; Dispatch | BC-06; temperature rules | historical temperature evidence | manual evidence and disposition only |
| Credit and receivable | Company Owner; Sales; Customer Buyer | [BC-07](../../01-shared/domain/bounded-contexts/BC-07-credit-receivables/README.md) | historical credit observations | tenant-specific credit and correction |
| Payment | Customer Buyer; payment responsibility | [BC-08](../../01-shared/domain/bounded-contexts/BC-08-payments/README.md) | historical payment evidence | report vs confirmation and recovery |
| Documents | Sales; Customer Buyer | [BC-09](../../01-shared/domain/bounded-contexts/BC-09-business-documents/README.md) | historical document findings | immutable issued history |
| Notifications | authorized recipient | [BC-10](../../01-shared/domain/bounded-contexts/BC-10-notifications/README.md) | current Design/UX state policy | relevant event, channel and retry |
| Traceability and visibility | authorized user | [BC-11](../../01-shared/domain/bounded-contexts/BC-11-business-traceability/README.md) | [historical research](../ux/discovery/research-evidence.md) | source fact, version and permission |

Each later story must record the specific source rows and provenance, not only
the capability label. Academic material is evidence, not Product authority.
