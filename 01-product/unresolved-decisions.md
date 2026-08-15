---
status: draft
scope: cross-cutting
owner: product
last-reviewed: 2026-08-14
---

# Unresolved product decisions

Maturity: **DRAFT**. These are known open points, not proposed solutions.

| Open point | Current wording | Activity that should resolve it |
|---|---|---|
| Production providers and credentials | Payment, email, maps/geolocation, object storage, malware scanning and observability production choices remain unresolved where local adapters/mocks exist. | Security Architecture; Cloud/Deployment Architecture; provider decisions |
| Product versus Variant | Product -> sellable SKU is favored; a separate Variant is not accepted as required. | Capability Mapping; EventStorming; Strategic DDD |
| Tenant provisioning and ICISA reproduction | The desired outcome is accepted; exact provisioning and seed/import workflow is not yet defined. | Domain discovery; Data Architecture; Operations |
| Configurable role templates and policies | Configuration/policy direction is accepted; the final policy model is not defined here. | Capability Mapping; Strategic DDD; Security Architecture |
| Detailed commercial and cold-chain rules | Accepted principles exist; complete invariants and ownership are not yet discovered. | EventStorming; Domain Storytelling; Strategic DDD |

Do not promote these items to FROZEN or implement them from this register alone.
