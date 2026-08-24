---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-08-23
---

# API architecture TARGET

## HTTP boundary

The API is the authoritative application boundary for identity, Tenant/Workspace scope, business commands, queries, provider adapters and persistence. Controllers translate HTTP to application commands/queries; they do not own business invariants or transaction choreography.

| Boundary | Rule |
|---|---|
| Authentication | Resolve global identity and session; reject invalid/revoked credentials |
| Authorization | Resolve requested surface, Tenant, Workspace, relationship and capability; fail closed |
| Commands | Validate syntax, idempotency and expected revision before invoking use case |
| Queries | Return purpose-specific projections; never expose arbitrary entity graphs |
| Errors | Use stable Problem Details type, status, code, correlation ID and field errors |
| Concurrency | `If-Match` for revision-controlled resources; idempotency for retryable commands |
| Files | Return authorized metadata or short-lived controlled transfer; never trust object key alone |
| Webhooks | Verify provider signature, persist event identity, claim lease, process idempotently |

## Layer contract

```text
HTTP / webhook / worker adapter
        -> application command/query handler
        -> domain policy / aggregate / port
        -> repository or provider adapter
        -> database / external system
```

Presentation may depend on application contracts and shared HTTP concerns. Application may depend on domain and ports. Domain must not depend on Spring, JPA, Stripe, Angular, HTTP or database classes. Infrastructure implements ports and owns mapping, not business policy.

## Contract rules

- OpenAPI is generated/maintained from the API contract and must be checked against runtime routes.
- Request/response DTOs are surface/use-case contracts, not persistence entities.
- Tenant and Workspace identifiers are never inferred from an arbitrary body field when the access context already resolved them.
- Buyer requests may expose only the current authorized supplier relationship and allowed projections.
- Mutation endpoints document expected revision, idempotency, authorization capability, state transitions and error conditions.
- External provider IDs are opaque and scoped to provider plus Tenant/business object; they are not public Nexa identifiers.
- Pagination, filtering, sorting and export limits are explicit; no unbounded cross-tenant query.

## Contract testing

Required gates: OpenAPI structural diff, controller/application contract tests, authorization matrix tests, tenant isolation tests, idempotency/retry tests, webhook signature/duplicate tests, and browser-client contract smoke for Platform and Portal. A green static OpenAPI file alone is not runtime proof.
