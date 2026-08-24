---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-04 Sales Commitment

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Converts commercial intent into Purchase Request, Commercial Commitment and Sales Order; Core. Strategic importance: core domain coordination point. |
| Language / actors | Purchase Request, Commercial Commitment, Sales Order, revision, material change, replacement, snapshot. Actors: B2B Buyer, Sales Representative, Business Operations Manager. |
| Responsibilities / data | Commercial lifecycle, SKU + quantity demand, price/terms snapshots, material changes, cancellation/replacement and ownership transfer. |
| Invariants | Submitted PR is all-or-nothing; PR-to-SO transfers ownership without release gap; SO is born CONFIRMED; no Draft SO V1; buyer change acceptance is explicit when required. |
| Commands | CreateDraft, SubmitPurchaseRequest, ProposeMaterialChange, AcceptBuyerChange, RejectPurchaseRequest, ConfirmSalesOrder, CancelCommitment, ReplaceSalesOrder. |
| Domain / published events | Internal: AuthoritativePriceResolved, PurchaseRequestVisibleToSales, MaterialChangeProposed, BuyerChangeAccepted, CommitmentOwnershipTransferred. Published: PurchaseRequestSubmitted.v1, CommercialCommitmentEstablished.v1, SalesOrderConfirmed.v1. |
| Upstream / downstream | Upstream: BC-02 relationship, BC-03 offer, BC-05 availability and BC-07 credit decisions. Downstream: Fulfillment, Documents, Notifications, Traceability. Sync: atomic submit/commit decisions; async: announcements. |
| Failure / transaction | PR submission, commitment, complete inventory backing and applicable credit reservation are one logical PostgreSQL transaction; idempotency and revision protect retries/conflicts. |
| Security / tenant | Buyer relationship and workforce capability required; snapshots preserve authorized decision context; never trust client price or Tenant. |
| Web / Mobile consumers | Web: Platform sales and Buyer Portal. Mobile: Sales Mobile and Buyer Mobile capture/submit; API remains authority. |
| Out of scope | Warehouse/Lot selection, physical stock, provider calls, receivable authority and a Mobile order BC. |

## Tactical DDD target

Aggregate Roots: PurchaseRequest, CommercialCommitment, SalesOrder. Entities: CommitmentLine, MaterialChange, CommercialSnapshot. Value Objects: CommitmentId, SkuQuantity, TermsSnapshot, OrderRevision. Domain Services: CommitmentAcceptancePolicy, MaterialChangePolicy. Repositories: PurchaseRequestRepository, SalesOrderRepository. Lifecycle: draft → submitted → commitment → confirmed/cancelled/replaced.
