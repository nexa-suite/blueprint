---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-01 — Tenant & Access Governance functional contract

**Purpose:** establish identity, Tenant isolation, Workspace scope, Workforce
Membership, capability grants and safe context propagation.

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
