---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-09-25
---

# BC-01 — Tenant & Access Governance functional contract

**Purpose:** establish identity, Tenant isolation, Workspace scope, Workforce
Membership, capability grants and safe context propagation.

## Accepted Wave 2 identity-first access contract (TARGET)

Operations Mobile uses the `PLATFORM` business surface with the `NATIVE`
transport marker. `POST /api/v1/authentication/identity-sign-in` accepts an
identity identifier, password and surface without a `workspaceSlug`. It
returns exactly `SESSION_ESTABLISHED`, `CONTEXT_SELECTION_REQUIRED` or
`NO_WORK_CONTEXT`: zero eligible contexts creates no scoped session, refresh
family or context ticket; one context establishes its scoped session; multiple
contexts require explicit selection. Context listing and selection, ticket
authority, expiry, session rotation and failure outcomes are specified in the
[Mobile API client contract](../../../03-mobile/architecture/technical/api-client-contract.md).
The existing workspace-scoped Web sign-in remains backward compatible. This is
the accepted TARGET contract; it does not assert current API implementation.

| Contract element | Definition |
|---|---|
| Concepts / roots | Human Identity, Tenant, Workspace, Workforce Membership, Role, Capability, Access Context |
| Value objects | IdentityId, TenantId, WorkspaceId, MembershipId, CapabilityKey, ContextVersion |
| Boundary | Owns workforce access and operational scope; does not own Customer Buyer relationship or business transactions. |
| Commands | RegisterIdentity, ProvisionTenant, ActivateTenant, ManageMembership, GrantCapability, RevokeCapability, SelectAccessContext |
| Queries | ResolveIdentity, ListMemberships, ResolveCapabilities, ReadActiveContext |
| Invariants | Tenant is maximum isolation boundary; missing scope fails closed; Tenant 1:1 Workspace in V1; revoked membership cannot act. |
| Actors / surfaces | Company Owner, Tenant Administrator, Nexa onboarding staff; Website, Platform, Operations Mobile, Buyer Mobile entry boundary. |
| Synchronous dependencies | Authentication/session, capability and context checks before protected commands. |
| Events / consumers | Internal access facts; published `TenantActivated.v1` where already catalogued; consumers must reauthorize. |
| Trace / idempotency / concurrency | Trace membership changes; idempotent provisioning and context selection; version membership/capability mutations. |
| Scope | V1: Tenant, Workspace, workforce roles and buyer access boundary. V2/Future: richer delegated administration and external identity providers. |
| AS-IS evidence | API identity/tenant/workspace/membership/security modules and RLS; Platform/Portal consume API-only authority. |
