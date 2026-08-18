---
status: draft
maturity: DRAFT
scope: cross-cutting
owner: product
last-reviewed: 2026-08-14
---

# Product decisions and discovery backlog

Product V1 has no known major Product decision blocker: it is **FROZEN / CLOSED**. Items below are deliberately reclassified; open technical/domain detail must not be misread as open Product scope.

## A. Product V1 decisions

None currently blocking Product V1.

## B. Domain discovery questions

| Open point | Accepted boundary | Activity that should resolve it |
|---|---|---|
| Product versus Variant | Product to sellable SKU is accepted; Variant is not mandatory. | Capability Mapping; EventStorming; Strategic DDD |
| Tenant provisioning and ICISA reproduction | Fresh, Generic and ICISA outcomes are accepted; exact workflow is not defined. | Domain discovery; Data Architecture; Operations |
| Configurable role templates and policies | Supported configuration is accepted; final policy language/model is not defined. | Capability Mapping; Strategic DDD; Security Architecture |
| Detailed commercial and cold-chain rules | Product principles are accepted; complete sequence, ownership and exceptions remain to discover. | EventStorming; Domain Storytelling; Strategic DDD |

## C. Technical Architecture questions

| Open point | Boundary | Activity that should resolve it |
|---|---|---|
| Production providers and credentials | Stripe direction is a V1 Product choice; provider contracts, credentials, email/maps/storage/scanning/observability and deployment remain open. | Security Architecture; Cloud/Deployment Architecture |
| Data, RLS and security ownership | Product isolation and traceability principles are accepted; TARGET ownership and policy are not defined. | Strategic DDD; Data/Security Architecture |

## D. Future Product questions

Plans/entitlements, multi-workspace, multi-user Buyer organizations, full Procurement, advanced CRM/Finance, Mobile, Driver, IoT and deeper fiscal/QMS workflows remain V2+/future.

Do not promote open detail to Product uncertainty or implement it from this register alone.
