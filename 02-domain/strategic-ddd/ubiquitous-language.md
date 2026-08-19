---
status: draft
maturity: DISCOVERY
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Ubiquitous Language proposal

This is a contextual vocabulary proposal. Terms are protected from accidental synonym collapse; final meanings require Business Architect review.

| Term | Proposed meaning | Must not be treated as |
|---|---|---|
| Tenant | Nexa customer and maximum business/data isolation boundary | Workspace, Customer Account, user organization |
| Workspace | V1 operational environment associated 1:1 with Tenant | C4 Container, separate Tenant, security shortcut |
| Human Identity | Global person authentication identity | Workforce Membership, Buyer Relationship |
| Workforce Membership | Tenant-scoped business/work access relationship for a person | Global identity, Buyer Relationship |
| Buyer Relationship | Tenant-approved commercial relationship between Buyer and supplier Tenant | Customer Account, Portal Access |
| Portal Access | Permission to use Buyer Portal for an authorized relationship | Buyer identity, Customer Account |
| Customer Account | Tenant-scoped business customer record with contacts/addresses | Buyer, global identity |
| Product | Commercial product concept | Sellable SKU, Inventory Lot |
| SKU | Concrete sellable presentation/UOM V1 | Product Variant engine, physical lot |
| Price List | Tenant pricing configuration with validity periods | Arbitrary Sales override |
| Commercial Terms | Customer-specific commercial conditions used in price/credit/order resolution | Price List, Payment |
| Cart | Persisted buyer selection before checkout | Inventory commitment or reservation |
| Purchase Request | Buyer-originated commercial request subject to review | Sales Order, Purchase Order |
| Sales Order | Confirmed immutable commercial obligation | Purchase Request, backorder |
| Commercial Commitment | Demand quantity committed before physical lot selection | Inventory Lot, physical reservation |
| Physical Stock | Actual quantity in Warehouse, including non-sellable states | Sellable Availability |
| Sellable Availability | Quantity eligible for a new commercial commitment | Physical Stock, Safety Stock |
| Safety Stock | Quantity protected by warehouse policy | Commitment, reservation |
| Inventory Lot | Physical traceable stock unit in one Warehouse | Manufacturer Batch, SKU |
| Manufacturer Batch | Source traceability grouping that may produce multiple lots | Inventory Lot |
| Allocation | Selection of valid physical lots for Fulfillment | Commercial Commitment |
| Fulfillment | Work to prepare committed goods for dispatch | Delivery, Dispatch |
| Dispatch | Coordination grouping for deliveries | Delivery, Route |
| Delivery | Scheduled/attempted obligation to deliver goods | Dispatch, Route |
| Continuation Delivery | Remaining portion after partial delivery | New backorder |
| Temperature Excursion | Out-of-range observation requiring evaluation | Automatic Waste |
| Hold | Non-sellable pending evaluation state | Quarantine, confirmed Waste |
| Credit Reserved | Exposure reserved for relevant commitments before receivable | Outstanding Receivable |
| Receivable | Formal commercial debt/claim created by Financial Posting | Sales Order by default |
| Financial Posting | Business recognition event that makes obligation financially due/recognized | Payment, invoice rendering only |
| Payment | Business money movement/report/confirmation concept | Stripe provider |
| Payment Report | External/manual claim of a payment operation | Payment Confirmation |
| Payment Confirmation | Authorized acceptance/reversal of payment evidence | Provider callback alone |
| Business Document | Issued commercial/evidence artifact preserving history | Security Audit, Receivable |
| Business Traceability | Buyer/operations timeline of meaningful business facts | Security Audit Logging |
| Security Audit | Security/authorization evidence retained for protection and review | Buyer timeline |

## Rejected ambiguous synonyms

| Ambiguous usage | Required correction |
|---|---|
| Workspace as Tenant | Use Tenant for customer/isolation; Workspace only for V1 operational environment |
| Customer as Buyer | Use Customer Account for business account; Buyer for person/relationship actor |
| Order for every request | Use Purchase Request before confirmation; Sales Order after confirmed commitment |
| Reservation for every commitment | Use Commercial Commitment for demand; Allocation for lot selection |
| Dispatch as Delivery | Keep coordination grouping separate from scheduled delivery obligation |
| Invoice as every document | Use Business Document family; Receivable and fiscal invoice semantics remain explicit |
| Stripe as Payment | Payment is domain concept; Stripe is provider adapter |

## Contextual language rule

A term may have a local meaning inside a proposed context only when its owner, invariants and translation are explicit. Shared database column names do not establish shared language.
