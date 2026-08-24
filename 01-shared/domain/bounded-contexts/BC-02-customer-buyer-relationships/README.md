---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-02 Customer & Buyer Relationships

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Supplier-Tenant customer and Buyer relationship lifecycle; Supporting. Strategic importance: establishes who may buy from whom. |
| Language / actors | Customer Account, Buyer Relationship, Buyer Identity, contact, address, invitation, claim, approval. Actors: Nexa Commercial & Onboarding Staff, Sales Representative, B2B Buyer, Company Owner. |
| Responsibilities / data | Customer Account, contacts, addresses, relationship status and principal Buyer identity association. Owns relationship authority, not global Human Identity or catalog price. |
| Invariants | Customer Account may exist without Portal identity; one active principal Buyer Identity per account V1; relationship approval is explicit; supplier Tenant context is mandatory. |
| Commands | CreateCustomerAccount, RequestBuyerRelationship, ApproveBuyerRelationship, LinkBuyerIdentity, SuspendBuyerRelationship, RevokeBuyerAccess. |
| Domain / published events | Internal: BuyerRelationshipRequested, BuyerRelationshipApproved, BuyerIdentityLinked, BuyerRelationshipSuspended. Published: no new event; authorized relationship facts feed existing consumers and traceability. |
| Upstream / downstream | Upstream: BC-01 access context. Downstream: Catalog & Commercial Policy, Sales Commitment, Portal and both Mobile projections. Sync: eligibility and relationship resolution. |
| Failure / transaction | Duplicate approval/link is idempotent; invalid supplier relationship rejects atomically; stale relationship cannot authorize a purchase. |
| Security / tenant | Relationship is always scoped to supplier Tenant; Buyer identity is not workforce membership; minimize contacts and protect personal data. |
| Web / Mobile consumers | Web: Platform customer management and Buyer Portal. Mobile: Sales lookup and Buyer Mobile active relationship; no separate mobile relationship model. |
| Out of scope | Global identity authority, price, credit ledger, notifications, a CRM BC or a Mobile BC. |

## Tactical DDD target

Aggregate Roots: CustomerAccount, BuyerRelationship. Entities: Contact, Address, BuyerIdentityLink. Value Objects: CustomerAccountId, RelationshipId, SupplierTenantId, RelationshipStatus. Domain Services: BuyerEligibilityPolicy. Repositories: CustomerAccountRepository, BuyerRelationshipRepository. Lifecycle: requested → approved → active → suspended/revoked.
