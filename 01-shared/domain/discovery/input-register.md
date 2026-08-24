---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Discovery input register

This is the evidence register for Strategic DDD. Classification controls authority; a source listed here does not automatically become a domain decision.

| Class | Input | What it contributes | Limit |
|---|---|---|---|
| AUTHORITY | Final Product / Business V1 closure in the execution handoff | Frozen product intent, invariants, scope, deferrals and business sequence | Does not provide final Bounded Context acceptance or technical schemas |
| AUTHORITY | [`Shared Product/product-baseline.md`](../../product/product-baseline.md) | Canonical Product positioning and V1 boundary | Must be reconciled when older detail conflicts with final closure |
| AUTHORITY | [`00-start-here/current-decisions.md`](../../product/current-decisions.md) | Accepted governance, identity, tenancy and C4 decisions | Technical/domain detail remains separate |
| AS-IS | [`Delivery/as-is/architecture-implementation-audit.md`](../../../04-delivery/as-is/architecture-implementation-audit.md) | Current API, Platform, Portal, Website, runtime and test evidence | Describes implementation, not business ownership |
| AS-IS | [`Delivery/as-is/business-behavior-evidence.md`](../../../04-delivery/as-is/business-behavior-evidence.md) | Observed flows, events and actors | Historical observations require current-code verification |
| AS-IS | [`Delivery/as-is/current-terminology-evidence.md`](../../../04-delivery/as-is/current-terminology-evidence.md) | Terms and semantic collisions | Not final Ubiquitous Language |
| HISTORICAL | Legacy ecosystem and Vue/ASP evidence | Domain examples, user language, acceptance clues | Cannot override frozen Product authority |
| HISTORICAL | Prior Miro / proposed context names | Workshop prompts and hypotheses | No boundary is preserved solely because it already has a name |
| ACCEPTED | Capability, process, subdomain and context records in this package | PRE-V1 Strategic DDD model | May evolve only through explicit decision replacement |
| HOTSPOT | Commitment ownership/integration, partial delivery implementation, credit transformation and payment failure | Places where inconsistent models create business loss | Requires Process EventStorming and transaction design; Product semantics are already closed |
| HOTSPOT | Tenant / Workspace / Identity / Buyer relationships | Isolation, privacy and authorization consequences | Requires Business Architect and Security review |
| DEFERRED | Mobile, IoT, advanced Procurement, advanced Finance, plans and subscriptions | Future runway | Not a V1 context or construction dependency |
| DEFERRED | Final visual Design System | Parallel active workstream | Technical frontend contracts must stay design-neutral |

## Reconciliation rule

The accepted PRE-V1 decisions outrank older local wording. Numeric Purchase Request expiry is closed at 72 hours by default with Tenant configuration from 1–7 integer days and absolute `expiresAt: Instant`. Future policy may refine operational handling without silently changing the business invariant.
