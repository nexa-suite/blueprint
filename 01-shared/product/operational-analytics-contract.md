---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# V1 operational analytics contract

This contract defines decision-support projections for authorized operational
users. It is not a BI warehouse, OLAP model, forecasting engine or a new
Bounded Context. Values are read from current BC-owned facts and carry source
version/freshness metadata.

| Projection | Authorized audience | Measures | Required dimensions | Source owners | Stale/error behavior |
|---|---|---|---|---|---|
| Company / Executive | Company Owner; Business Operations Manager | open commitments, confirmed orders, receivables due, fulfillment backlog, delivery exceptions | Tenant, Workspace, period, lifecycle state | BC-04, BC-06, BC-07, BC-11 | show freshness and partial-source warning; never invent totals |
| Sales | Sales Representative; Company Owner | drafts, PRs, SOs, conversion outcomes, price/terms conflicts | Tenant, relationship, actor, customer, period, state | BC-02, BC-03, BC-04 | refetch authoritative relationship/order state |
| Inventory | Warehouse Operator; Business Operations Manager | sellable quantity, held/quarantined/expired quantity, allocation coverage, FEFO exceptions | Tenant, warehouse, SKU, lot, disposition, expiry | BC-03, BC-05 | stale availability cannot authorize a commitment or pick |
| Fulfillment | Warehouse Operator; Dispatch Coordinator; Business Operations Manager | planned/picked/packed/staged/ready work, shortages, allocation mismatches | Tenant, fulfillment, delivery, SKU, lot, state | BC-05, BC-06 | expose incomplete evidence and source version |
| Delivery | Dispatch Coordinator; Driver / Delivery Operator; Customer Buyer | assigned deliveries, attempts, outcomes, continuations, handoff/POD status | Tenant, delivery, attempt, assignment, window, outcome | BC-06, BC-09, BC-11 | no continuous location claim; display bounded active-delivery data only |
| Finance | Company Owner; Business Operations Manager; Sales Representative; Customer Buyer | credit limit/available credit, receivables, reported/confirmed payments, adjustments | Tenant, customer/relationship, currency, period, state | BC-07, BC-08 | payment reported != confirmed; no client-side calculation authority |

## Contract rules

- Every value identifies its source context, source version and `asOf` time.
- Server authorization filters Tenant, Workspace, membership and Buyer
  Relationship before aggregation.
- A projection may be eventually consistent; a command must revalidate against
  the owning BC synchronously where an atomic invariant is required.
- Failure of a projection does not change source business state. It is visible
  as stale, partial or unavailable.
- V1 excludes forecasting, predictive replenishment, route optimization,
  continuous IoT telemetry and cross-tenant benchmarking.
