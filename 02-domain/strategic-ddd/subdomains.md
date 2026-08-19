---
status: draft
maturity: DISCOVERY
scope: v1
owner: domain
last-reviewed: 2026-08-19
---

# Subdomain Map

Classification is a proposal based on differentiation, business value, complexity and change pressure. It is not based on Java module count or table count.

| Proposed subdomain | Classification | Rationale | Evidence / review need |
|---|---|---|---|
| Sales Commitment | CORE candidate | Converts B2B intent into controlled commercial obligation; protects price, availability, credit, immutable order truth and no silent substitution | Frozen Product invariants, P1; validate with sales process discovery |
| Inventory Availability and Cold-Chain Operations | CORE candidate | Physical truth, sellability and temperature disposition are Nexa's cold-chain specialization and create operational differentiation | Frozen inventory/cold-chain rules, P2; validate Warehouse actors and exception ownership |
| Fulfillment and Delivery Coordination | CORE candidate | Connects committed commercial demand to traceable delivery, partial continuation and POD | P3, delivery/cold-chain evidence; validate operational value and boundaries |
| Customer / Buyer Relationships | SUPPORTING-to-CORE candidate | Establishes Tenant-specific commercial relationship without becoming public marketplace; affects retention and privacy | P4; review relationship language and lifecycle |
| Catalog and Commercial Policy | SUPPORTING candidate | Provides configurable sellable offer, deterministic price and Tenant policy inputs | Frozen Product/Pricing rules, P1; review whether pricing deserves separate context |
| Tenant and Access Governance | SUPPORTING candidate | Enables safe Tenant lifecycle, workforce capability and global identity relationships | Frozen tenancy/identity rules, P4; Security review required |
| Credit and Receivables | SUPPORTING candidate | Protects credit risk and financial recognition without becoming full accounting | P5; Financial Posting triggers remain open |
| Payments and Business Documents | SUPPORTING candidate | Integrates external money movement and preserves commercial evidence | P5; provider/fiscal boundaries require further review |
| Notification and Business Traceability | SUPPORTING candidate | Turns source facts into useful visibility while separating audit from customer timeline | P6; projection ownership and retention open |
| Identity token/session, email, object storage, malware scanning, maps | GENERIC / enabling candidates | Replaceable technical capabilities; provider details must not leak into core language | Technical evidence and official provider constraints |

## Candidate core-domain test

The current proposal treats Sales Commitment, Inventory Availability / Cold-Chain and Fulfillment / Delivery as core candidates. Business Architect review must test whether each contains differentiated policy and knowledge, whether one can be genericized, and whether the proposed split creates harmful handoff cost.

## Explicitly excluded from V1 subdomains

Mobile, Driver application, IoT telemetry, full Procurement, advanced Finance/accounting, SUNAT, advanced BI, plans/subscriptions/entitlements, Control Center, Support impersonation and arbitrary payment providers remain future or deferred.
