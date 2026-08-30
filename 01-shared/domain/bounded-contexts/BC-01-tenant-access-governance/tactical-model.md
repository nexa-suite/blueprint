---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# BC-01 Tenant & Access Governance — Tactical Model

**State:** TARGET construction model. Strategic ownership remains the accepted
BC-01 canvas. This document adds tactical classes; it does not create an
Identity BC, Mobile BC or a new tenant boundary.

## Purpose and product participation

Own Tenant lifecycle, the V1 Tenant 1:1 Workspace relationship, global Human
Identity linkage, Workforce Membership, roles/capabilities and fail-closed
access eligibility. Website initiates onboarding; Platform governs workforce;
Portal and OWNER-ACCEPTED Mobile projections resolve authorized context. API is
Domain authority; Mobile client implementation remains NOT STARTED.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `Tenant` | Owns lifecycle and isolation policy; one active Workspace in V1; one active Company Owner | `TenantId`, no deep membership graph |
| `HumanIdentity` | Global person identity; never duplicated per Tenant | referenced by identity |
| `WorkforceMembership` | Tenant/workspace participation, status and capability context | `HumanIdentityId`, `TenantId`, `WorkspaceId` |
| `RoleDefinition` | Role lifecycle and capability assignment; global templates or tenant custom role | `CapabilityCode` |
| `CompanyOnboardingRequest` | Complex intake and activation handoff; no access until Tenant lifecycle gate passes | requester identity reference |

`Workspace` is a Tenant-owned entity with an explicit identity because accepted
V1 is `Tenant 1:1 Workspace`; it is not a C4 Container. Memberships reference
the Workspace by identity and are not composed into the Tenant object graph.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `Tenant` | Aggregate Root | `TenantId`, `name`, `status`, `expiryPolicy`, `version` | `requestActivation()`, `activate()`, `suspend()`, `changeExpiryPolicy()` | composes one `Workspace`; KEEP target, AS-IS close |
| `Workspace` | Entity | `WorkspaceId`, `tenantId`, `slug`, `status` | `rename()`, `activate()`, `suspend()` | owned by Tenant; KEEP target |
| `HumanIdentity` | Aggregate Root | `HumanIdentityId`, `email`, `displayName`, `status` | `changeDisplayName()`, `deactivate()` | global identity, referenced by memberships; KEEP AS-IS |
| `WorkforceMembership` | Aggregate Root | `MembershipId`, `tenantId`, `workspaceId`, `identityId`, `status`, `version` | `grant()`, `assignRole()`, `changeCapability()`, `suspend()`, `revoke()` | references Tenant/Workspace/Identity by ID; REFINE AS-IS |
| `RoleDefinition` | Aggregate Root | `RoleId`, optional `tenantId`, `code`, `roleType`, `status` | `assignCapability()`, `removeCapability()`, `retire()` | owns capability assignments; REFINE AS-IS |
| `CompanyInformation` | Value Object | legal/trade name, tax identity, contact | `changeRegisteredData()` | used by onboarding/Tenant; TARGET |
| `AccessContext` | Value Object | `tenantId`, `workspaceId`, `membershipId`, capability version | `requireCapability()` | generated per request; TARGET |
| `CapabilityCode` | Value Object | normalized code | `isWithin()` | referenced by RoleDefinition; TARGET |
| `TenantStatus` / `MembershipStatus` | Enum | lifecycle values | none | constrain transitions; TARGET |
| `AccessEligibilityPolicy` | Domain Service | none | `evaluate(context, capability)` | combines lifecycle, membership and capability without owning state; TARGET |
| `TenantRepository` | Repository interface | none | `save()`, `byId()`, `activate()` | persists Tenant root; TARGET |
| `WorkforceMembershipRepository` | Repository interface | none | `save()`, `byId()`, `activeOwner()` | persists Membership root; TARGET |
| `TenantActivated` | Domain Event | tenant/workspace IDs, occurredAt | immutable fact | published events remain frozen; TARGET |

Private state is shown in the UML; public methods are business behavior, not
framework getters/setters.

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `SubmitCompanyOnboardingHandler` | accept public onboarding intake | validates intake, creates request and emits internal handoff; no access grant |
| `ActivateTenantHandler` | activate Tenant and Workspace | checks Company Owner, creates/links membership, commits access state and outbox |
| `EvaluateAccessHandler` | resolve request access | reconstructs server-side context, invokes `AccessEligibilityPolicy`, returns decision |
| `ChangeMembershipCapabilityHandler` | change workforce access | version/CAS, capability policy and security/trace facts in one local transaction |
| `TransferCompanyOwnershipHandler` | transfer single owner | locks owner candidates, applies one-owner invariant, records reason and audit |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `OrganizationRegistrationController` | public onboarding request boundary | AS-IS `iam` controller; KEEP as interface evidence |
| `AuthenticationController` | sign-in/session boundary | AS-IS; KEEP, not Domain authority |
| `IamSecurityController` | active context and access projection | AS-IS; REFINE to explicit access contract |
| `TenantAccessController` | TARGET coherent tenant/membership capability boundary | TARGET logical interface, URI intentionally not invented |
| `AccessContextConsumer` | Platform/Portal/Mobile projection consumer of access contract | TARGET interface role, not a new context |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `TenantRepositoryAdapter` | PostgreSQL implementation for Tenant/Workspace | TARGET; maps to `tenant` and `workspace` |
| `WorkforceMembershipRepositoryAdapter` | PostgreSQL membership/role persistence | TARGET; maps to membership and assignment tables |
| `IdentityRepositoryAdapter` | identity persistence and profile lookup | AS-IS `UserAccountJpaAdapter`; KEEP/REFINE |
| `TransactionTenantScopePort` | sets transaction-local tenant/workspace scope | AS-IS evidence plus TARGET contract; fail closed |
| `SecurityAuditWriter` | separate security audit sink | AS-IS `JdbcSecurityAuditAdapter`; KEEP, not BC-11 |
| `AccessOutboxAdapter` | durable post-commit event publication | AS-IS integration outbox; KEEP/REFINE |

## Invariants and transaction boundaries

- Tenant is maximum business/data isolation boundary; missing or ambiguous
  scope rejects access.
- V1 has exactly one Workspace per Tenant and one active Company Owner.
- Human Identity is global; Workforce Membership is tenant-scoped.
- Client-supplied tenant IDs are input only. API reconstructs scope and applies
  authorization plus RLS context.
- Activation, membership capability changes and ownership transfer are local
  consistency boundaries with version/CAS and durable trace/security facts.
- Cross-BC reads use IDs/projections. No membership graph is loaded into sales,
  catalog or delivery aggregates.

## Events, persistence and evidence

Internal events include `TenantActivated`, `MembershipGranted` and
`AccessRevoked`. No new Published Integration Event is added to the frozen 14.
Target persistence is in
[BC-01 data model](data/data-model.md) and
[target SQL](data/target-relational-model.sql). Domain UML:
[domain-model.puml](diagrams/domain-model.puml).

AS-IS evidence at API main: `iam` identity/session/security classes,
`tenant_management` tenant/workspace/membership/role classes and Flyway V1–V29,
V39, V44, V84–V86. Classification: identity/session **KEEP**, target
membership/role semantics **REFINE**, onboarding-to-active-domain orchestration
**NOT IMPLEMENTED / gap**. Current Java packages remain implementation evidence,
not BC definitions.
