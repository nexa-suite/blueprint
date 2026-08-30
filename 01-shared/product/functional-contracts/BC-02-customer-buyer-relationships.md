---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-02 — Customer & Buyer Relationships functional contract

**Purpose:** own Customer Accounts and the authorized relationship between a
Customer Buyer and a supplier Tenant.

| Contract element | Definition |
|---|---|
| Concepts / roots | Customer Account, Customer Contact, Buyer Relationship, relationship status and history |
| Value objects | CustomerAccountId, BuyerRelationshipId, ContactReference, RelationshipStatus |
| Boundary | Owns relationship eligibility and buyer identity reference; does not own catalog, orders, delivery or payment state. |
| Commands | CreateCustomerAccount, UpdateCustomerAccount, InviteBuyer, ActivateBuyerRelationship, SuspendBuyerRelationship, RecordBuyerReceiptContext |
| Queries | SearchCustomers, ResolveBuyerRelationship, ReadCustomerProfile, ReadRelationshipHistory |
| Invariants | A Buyer sees only an authorized supplier relationship; suspension denies protected actions; relationship history is append-preserving. |
| Actors / surfaces | Company Owner, Business Operations Manager, Sales Representative, Customer Buyer; Platform, Buyer Portal, Operations Mobile, Buyer Mobile. |
| Synchronous dependencies | BC-01 access context; relationship check before catalog, commitment, delivery handoff or finance commands. |
| Events / consumers | Consumes delivery handoff/receipt facts as authorized references; publishes relationship facts only where the existing event catalog permits. |
| Trace / idempotency / concurrency | Idempotent invitations and relationship activation; optimistic version for status races; trace actor/reason. |
| Scope | V1: customer/account/relationship lifecycle and buyer authorization. V2/Future: richer contact channels and self-service administration. |
| AS-IS evidence | API customer/account/buyer relationship services and Portal buyer projection; v0.17 handoff authorization references this boundary. |
