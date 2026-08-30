---
status: draft
maturity: DRAFT
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# BC-02 Customer & Buyer Relationships — Tactical Model

**State:** TARGET construction model. Supplier-Tenant relationship authority
stays separate from global Human Identity and from Sales Commitment.

## Purpose and product participation

Own Customer Account, contacts, addresses, Buyer Relationship lifecycle and
the one principal active Buyer Identity assignment permitted in V1. Platform
manages relationships; Buyer Portal and proposed Mobile consume authorized
projections. API owns state.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `CustomerAccount` | supplier-Tenant customer record, contacts and addresses; account may exist without Portal identity | Tenant/Workspace IDs |
| `BuyerRelationship` | invitation, approval, suspension and revocation for one supplier Tenant | CustomerAccount ID, HumanIdentity ID |
| `BuyerRelationshipHistory` | immutable lifecycle facts; not a mutable child graph | relationship ID, actor reference |

Contacts and addresses compose into CustomerAccount because their lifecycle is
account-owned. BuyerRelationship references CustomerAccount by ID; it is not
composed into a global identity.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `CustomerAccount` | Aggregate Root | account ID, tenant/workspace IDs, code, business name, status, version | `create()`, `changeCommercialName()`, `addContact()`, `addAddress()`, `suspend()` | composes Contact/Address; KEEP target |
| `CustomerContact` | Entity | contact ID, name, email, phone, role, active | `changeContactInformation()`, `deactivate()` | composed by CustomerAccount; TARGET |
| `CustomerAddress` | Entity | address ID, label, location, receiving instructions, default flag | `changeLocation()`, `markDefault()`, `deactivate()` | composed by CustomerAccount; KEEP semantics |
| `BuyerRelationship` | Aggregate Root | relationship ID, customer account ID, principal identity ID, status, invited/approved timestamps, version | `invite()`, `approve()`, `linkPrincipalIdentity()`, `suspend()`, `revoke()` | references CustomerAccount/HumanIdentity; REFINE AS-IS |
| `BuyerRelationshipHistory` | Entity / immutable fact | from/to status, actor, reason, occurredAt | none after creation | belongs to relationship history; TARGET |
| `ContactInformation` | Value Object | email, phone | `normalize()` | used by contact; TARGET |
| `Address` | Value Object | road, locality, coordinates, instructions | `validateCoordinates()` | used by address; TARGET |
| `RelationshipStatus` | Enum | `PENDING`, `INVITED`, `ACTIVE`, `SUSPENDED`, `REVOKED` | none | accepted lifecycle |
| `CustomerAccountRepository` | Repository interface | none | `save()`, `byId()`, `search()` | CustomerAccount root; TARGET |
| `BuyerRelationshipRepository` | Repository interface | none | `save()`, `byId()`, `activeForAccount()` | BuyerRelationship root; TARGET |
| `BuyerEligibilityPolicy` | Domain Service | none | `canPurchase(relationship, context)` | evaluates status/tenant, owns no state; TARGET |
| `BuyerRelationshipApproved` | Domain Event | relationship/account IDs, occurredAt | immutable fact | no new published event; TARGET |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `CreateCustomerAccountHandler` | create account | validates tenant scope and account identity; persists root |
| `ManageCustomerAddressHandler` | maintain delivery addresses | invokes account behavior and protects default-address invariant |
| `ApproveBuyerRelationshipHandler` | approve relationship | checks tenant authority, one principal rule and emits trace/outbox fact |
| `LinkBuyerIdentityHandler` | link active principal identity | references BC-01 identity by ID; no identity ownership transfer |
| `SuspendBuyerRelationshipHandler` | suspend/revoke access | versioned lifecycle transition; downstream access re-check required |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `ClientAccountController` | Platform account lifecycle boundary | AS-IS controller; KEEP/REFINE |
| `ClientAccountAddressController` | Platform address boundary | AS-IS controller; KEEP |
| `BuyerRelationshipController` | TARGET relationship approval/link boundary | TARGET logical seam; URI not invented |
| `CustomerAccountQueryConsumer` | Portal/Mobile authorized projection consumer | TARGET interface role |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `CustomerAccountRepositoryAdapter` | PostgreSQL account/contact/address persistence | AS-IS `ClientAccountPersistenceAdapter`; KEEP/REFINE |
| `BuyerRelationshipRepositoryAdapter` | relationship and history persistence | TARGET; AS-IS membership table is partial evidence |
| `TenantAccessPort` | verifies BC-01 context/capability | cross-BC port, no ownership |
| `CustomerRelationshipProjectionMapper` | maps relationship facts to Portal/Mobile view | AS-IS frontend/API projection pattern; REFINE |
| `TraceabilityPublisher` | sends durable relationship fact after local commit | TARGET port to BC-11/outbox |

## Invariants and transactions

- Customer Account may exist without Portal identity.
- Buyer Relationship is supplier-Tenant-specific and never equals Human
  Identity or Workforce Membership.
- V1 permits one active principal Buyer Identity per Customer Account. Approval,
  suspension and revocation preserve history.
- Account/contact/address mutation is local to CustomerAccount. Relationship
  lifecycle is local to BuyerRelationship; cross-aggregate reads use IDs.
- Sales submission revalidates relationship eligibility inside its application
  boundary; stale Portal projections cannot authorize a purchase.

## Events, persistence and evidence

Internal events include `BuyerRelationshipRequested`, `BuyerRelationshipApproved`
and `BuyerRelationshipSuspended`; no new published event is added. See
[BC-02 data model](data/data-model.md), [target SQL](data/target-relational-model.sql)
and [domain UML](diagrams/domain-model.puml).

AS-IS evidence at API main: `customerrelationships` domain/application/
presentation adapters plus `sales.client_account*` and V71 single-buyer
constraint. Classification: Customer Account/address **KEEP**, explicit
BuyerRelationship lifecycle **REFINE / partial**, identity-link approval history
**NOT IMPLEMENTED**. `customerrelationships` is not a strategic BC definition.
