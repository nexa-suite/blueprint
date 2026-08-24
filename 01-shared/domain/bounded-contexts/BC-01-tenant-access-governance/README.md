---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-01 Tenant & Access Governance

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Tenant isolation, identity scope and workforce authority; Supporting. Strategic importance: enables every tenant-scoped decision. |
| Language / actors | Tenant, Workspace, Human Identity, Workforce Membership, Company Owner, capability, access context. Actors: Nexa Commercial & Onboarding Staff, Company Owner, Tenant Administrator, all tenant workforce. |
| Responsibilities / data | Tenant lifecycle, Tenant 1:1 Workspace V1, membership, roles, capabilities, access eligibility and fail-closed context. Owns these concepts, not commercial customer facts. |
| Invariants | Tenant is the isolation boundary; one Workspace per Tenant V1; one Company Owner; missing or ambiguous scope fails closed; client-supplied Tenant IDs are never authority. |
| Commands | ProvisionTenant, ActivateTenant, GrantMembership, ChangeCapability, SuspendMembership, RevokeAccess. TARGET command candidates. |
| Domain / published events | Internal: TenantProvisioningRequested, TenantActivated, MembershipGranted, CapabilityChanged, AccessRevoked. Published: no additional event added to the frozen 14-event catalog; consumers receive authorized context or existing trace facts. |
| Upstream / downstream | Upstream: onboarding identity input. Downstream: every tenant-scoped BC and all surfaces. Sync: access-context and capability decisions. Event consumers: authorized projections and traceability. |
| Failure / transaction | Fail closed on missing scope; membership and capability changes commit atomically with access state; downstream stale projections cannot grant access. |
| Security / tenant | Primary security boundary; reconstruct scope server-side, apply authorization and RLS context, separate security audit from Business Traceability. |
| Web / Mobile consumers | Web: Website intake, Platform governance, Portal session. Mobile: both apps authenticate and resolve active context; no Mobile-owned identity. |
| Out of scope | Customer commercial lifecycle, payment policy, inventory, device identity and a new Mobile/Identity BC. |

## Tactical DDD target

Aggregate Roots: Tenant, WorkforceMembership. Entities: Workspace, CapabilityGrant. Value Objects: TenantId, WorkspaceId, MembershipId, AccessContext, Capability. Domain Services: AccessEligibilityPolicy. Repositories: TenantRepository, MembershipRepository. Lifecycles: provisioning → active → suspended; membership granted → changed → revoked. Invariants stay in this context; technical modules remain undecided.
