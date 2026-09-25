---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-25
---

# Mobile API client contract

Mobile is an anti-corruption client boundary:

`OpenAPI contract → Remote DTO → remote source/service → repository → client
model/view state → UI`.

Remote DTOs do not become aggregate entities. Repositories translate transport
errors, freshness and retry state into client-safe outcomes while the Nexa API
reconstructs Tenant/Workspace scope and remains business authority.

## Accepted Wave 2 identity-first access contract (TARGET)

Operations Mobile uses business/API surface `PLATFORM` and transport marker
`NATIVE`. Its canonical sign-in operation is
`POST /api/v1/authentication/identity-sign-in`, with
`X-Nexa-Client: NATIVE` and a body containing `identifier`, `password` and
`surface: "PLATFORM"`; it has no `workspaceSlug`. The existing
`POST /api/v1/authentication/sign-in` remains backward compatible for Web.

Identity-first sign-in has exactly three outcomes:

- `SESSION_ESTABLISHED`: one eligible context is scoped automatically; do not
  request redundant selection.
- `CONTEXT_SELECTION_REQUIRED`: two or more eligible contexts require an
  opaque `X-Nexa-Context-Ticket`.
- `NO_WORK_CONTEXT`: zero eligible contexts returns `200` and creates no
  scoped session, refresh family or context ticket.

The context ticket expires after five minutes, is single-use and
non-refreshable, is stored server-side only as a hash, and is conveyed only in
the header. Its raw value is never persisted; the native client keeps it in
memory only. Context listing is `GET /api/v1/me/access-contexts`:
exactly one of the context-ticket header or a Bearer access session is
required; both yield `400 INVALID_REQUEST`, neither yields `401`. Each
projection contains `membershipId`, `tenantId`, `tenantName`, `tenantSlug`,
`workspaceId`, `workspaceName` and `workspaceSlug`, ordered by `tenantName`,
`workspaceName`, then `membershipId`, ascending.

Selection is `POST /api/v1/me/access-context-selections` with
`{"membershipId":"..."}`. The server revalidates identity, membership and
its status, Tenant and Workspace status, surface eligibility, roles,
permissions and `authorizationVersion`. Success creates a new scoped session
and refresh family. Replacing context from an existing session revokes only
the invoking refresh family and preserves unrelated sessions. Ticket use is
consumed atomically with selection; concurrent use permits at most one
success. Invalid, expired or consumed tickets return
`401 CONTEXT_TICKET_INVALID`; an unavailable selected context returns
`409 ACCESS_CONTEXT_SELECTION_REJECTED`. The API does not disclose whether a
foreign membership exists and context selection does not use a generic
`Idempotency-Key`.

For an ambiguous native selection result, never replay the request: discard
uncertain local authority and reauthenticate. `GET /api/v1/session` remains
authoritative and includes `tenantName` and `workspaceName` alongside existing
IDs, slugs, membership, roles and permissions. This accepted contract is
TARGET until verified implementation evidence exists.

## Required command behavior

- Retry-sensitive commands carry `Idempotency-Key` where the API contract
  requires it; a locally retained key supports safe retry, not local truth.
- Mutable concurrency-sensitive commands send the accepted `If-Match` or
  revision contract where exposed.
- Problem Details, correlation identifiers, `401`, `403`, safe `404`, `409`
  and `412` must map to explicit user-safe states.
- Network timeout and unknown-result states require status confirmation or safe
  idempotent retry; they must never imply a command succeeded.
- Retryable transport failure and terminal authorization/validation/conflict
  outcomes remain distinct.

The contract does not freeze client HTTP, serialization, local database,
secure-storage or analytics packages.
