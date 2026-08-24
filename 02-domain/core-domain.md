---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Business Knowledge Layer

Compact navigation into accepted domain meaning. Detailed rules live in [Known Business Rules](business-rules.md); strategic ownership lives in [Strategic DDD](README.md).

## Product proposition

Nexa coordinates B2B commercial commitments against real inventory availability, then traceable physical fulfillment and delivery under lot, expiry and optional cold-chain constraints.

## Canonical distinctions

| Distinction | Meaning |
|---|---|
| Tenant != Workspace | Tenant is isolation boundary; Workspace is V1 operational environment. |
| Human Identity != Workforce Membership != Buyer Relationship != Customer Account | Identity and business relationships have separate authority and lifecycle. |
| Cart/Draft != Purchase Request != Sales Order | Intent precedes submitted request; confirmed order is immutable commercial history. |
| Commercial Commitment != Inventory Reservation/Warehouse Backing != Physical Allocation != Physical Stock | Warehouse-neutral demand, deterministic warehouse protection, lot selection and actual quantity are different facts. |
| Physical Stock != Sellable Availability | HOLD, quarantine, expiry, safety stock, commitments and transit constrain sellability. |
| Payment != Receivable != Credit != Stripe | Payment lifecycle, formal debt, credit risk and provider adapter are separate. |
| Business Document != SUNAT fiscal document | Commercial Invoice is a Nexa V1 document; fiscal integration is deferred. |
| Notification != Business Traceability != Security Audit | Delivery, business history and security evidence have different ownership/failure semantics. |

## Strategic map

The accepted model has 11 Bounded Contexts: Tenant & Access Governance; Customer & Buyer Relationships; Catalog & Commercial Policy; Sales Commitment; Inventory Availability; Fulfillment & Delivery; Credit & Receivables; Payments; Business Documents; Notifications; Business Traceability.

Core Domain: reliable coordination of B2B commercial commitments against real inventory availability, followed by traceable physical fulfillment and delivery under lot, expiry and optional cold-chain constraints.

## AS-IS / TARGET boundary

Existing packages, schemas, APIs and screens are implementation evidence. They may conform, drift or be missing relative to this TARGET. They never define Bounded Contexts and never authorize silent reinterpretation of historical facts.
