---
status: draft
maturity: DRAFT
scope: v1
owner: architecture
last-reviewed: 2026-08-19
---

# Frontend application architecture TARGET

## Surface contract

| Surface | Actor | Owns | Must not do |
|---|---|---|---|
| Website | anonymous/prospective customer | public content, contact and demo intake | expose tenant catalog, prices or authenticated business data |
| Platform | internal Tenant workforce | administration, customer, commercial, warehouse, fulfillment and operational work | bypass API authorization or treat route guards as security |
| Buyer Portal | authorized Buyer relationship | private catalog, request/order, delivery, documents, receivables and payment experience | see another Tenant relationship or internal operational data |

## Feature slice

Each authenticated feature follows:

```text
route -> guard/resolver -> page/container -> facade/signal state
      -> use-case API client -> HTTP/interceptors -> API contract
      -> loading / empty / error / forbidden / stale / conflict state
```

Feature state owns server data and command status. Shared UI owns presentation states and accessibility primitives. API clients own transport mapping. No feature imports another feature's private state, repository or component internals.

## Cross-cutting rules

- Route guards improve navigation; backend authorization remains authoritative.
- Carry correlation ID, `If-Match`, `Idempotency-Key` and Problem Details consistently where the API contract requires them.
- Signals are appropriate for local/server projection state; avoid a global mutable store without an ownership reason.
- Mutation UX must distinguish validation, permission denied, stale revision, duplicate idempotency result, network retry and server failure.
- A change-feed event triggers a refetch or stale marker; it is not trusted as complete business data.
- Use typed DTOs generated or contract-aligned with OpenAPI; do not duplicate business policy in TypeScript.
- i18n keys, accessible names, focus order, keyboard operation, responsive behavior and loading/empty/error states are part of feature acceptance.
- Buyer-facing data is minimized by endpoint and projection, not hidden only with CSS.

## Testing layers

Unit-test pure state and mapping. Contract-test API clients. Component-test state transitions and accessibility. E2E-test one approved critical path per surface with real authorization fixtures. Visual comparison requires the Design Convergence Interface and matched authenticated captures; it is not claimed by source similarity.
