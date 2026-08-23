---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: engineering
last-reviewed: 2026-08-23
---

# Implementation traceability

This matrix connects accepted PRE-V1 product knowledge to independent
repositories and evidence. It is an AS-IS index plus construction traceability;
repository presence does not mean every flow is production-ready. The current
ref cut is [recorded separately](as-is/pre-v1-current-ref-verification.md).

| Capability / surface | Repository evidence | Blueprint authority | Classification |
| --- | --- | --- | --- |
| Identity, Tenant, access | API, Platform, Portal | [Known rules](../02-domain/business-rules/known-rules.md), [C4 L3/L4](../04-architecture/c4/l3-l4-views.md) | AS-IS; BC-01 target accepted |
| Customer and Buyer relationships | API, Platform, Portal | [Business knowledge](../02-domain/business-knowledge.md), [Strategic DDD](../02-domain/strategic-ddd/README.md) | AS-IS distributed; BC-02 target accepted |
| Catalog and commercial policy | API, Platform, Portal | [Capability Map](../02-domain/strategic-ddd/capability-map.md), [Glossary](../02-domain/glossary.md) | AS-IS; SKU terminology protected |
| Purchase Request, commitment, Sales Order | API, Platform, Portal | [Workflows](flows/workflows.md), [Known rules](../02-domain/business-rules/known-rules.md) | Accepted rule; convergence remains evidence work |
| Inventory, warehouse, fulfillment, delivery | API, Platform, Portal | [C4 code views](../04-architecture/c4/code-views.md), [AS-IS/TARGET fit](../04-architecture/as-is-target-fit.md) | AS-IS; commitment/allocation distinction accepted |
| Credit, receivables, payments | API, Platform, Portal | [Business rules](../02-domain/business-rules/known-rules.md), [Payment workflow](flows/workflows.md) | Formula accepted; BC-07/08 target accepted |
| Documents and notifications | API, Platform, Portal | [C4 L3/L4](../04-architecture/c4/l3-l4-views.md) | AS-IS adapters/projections; BC-09/10 target accepted |
| Public discovery and demo intake | Website | [Repository map](../10-repositories/repository-map.md), [Product scope](../01-product/scope/v1-scope.md) | AS-IS public boundary |
| Visual language and UX flows | Design Lab, Platform, Portal, Website | [Design convergence](../04-architecture/design-convergence-interface.md), [Design adoption](../03-design/05-engineering/design-adoption.md) | Visual source/candidate guidance |
| Mobile and driver workflows | Mobile | [Runway](../09-evolution/runway.md) | FUTURE; not V1 implementation |

## Evidence rules

- Repository map records independent Git roots; it is not a monorepo model.
- Dated implementation baselines are snapshots, not automatically current runtime proof; use the current-ref verification for the latest accessible cut.
- C4 L3/L4 views describe responsibility seams, not accepted Bounded Contexts.
- Missing runtime, authenticated browser or provider evidence remains a gap.
