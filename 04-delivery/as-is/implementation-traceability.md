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
ref cut is [recorded separately](pre-v1-current-ref-verification.md).

| Capability / surface | Repository evidence | Blueprint authority | Classification |
| --- | --- | --- | --- |
| Identity, Tenant, access | API, Platform, Portal | [Known rules](../../01-shared/domain/business-rules/README.md), [C4 L3/L4](../../01-shared/architecture/c4/l4/technical-lenses.md) | AS-IS; BC-01 target accepted |
| Customer and Buyer relationships | API, Platform, Portal | [Business knowledge](../../01-shared/domain/strategic-ddd/core-domain.md), [Strategic DDD](../../01-shared/domain/README.md) | AS-IS distributed; BC-02 target accepted |
| Catalog and commercial policy | API, Platform, Portal | [Capability Map](../../01-shared/domain/ownership/capability-map.md), [Glossary](../../01-shared/domain/ubiquitous-language/quick-reference.md) | AS-IS; SKU terminology protected |
| Purchase Request, commitment, Sales Order | API, Platform, Portal | [Workflows](../../01-shared/domain/processes/workflows.md), [Known rules](../../01-shared/domain/business-rules/README.md) | Accepted rule; convergence remains evidence work |
| Inventory, warehouse, fulfillment, delivery | API, Platform, Portal | [C4 code views](../../01-shared/architecture/c4/l4/code-views.md), [AS-IS/TARGET fit](architecture-target-fit.md) | AS-IS; commitment/allocation distinction accepted |
| Credit, receivables, payments | API, Platform, Portal | [Business rules](../../01-shared/domain/business-rules/README.md), [Payment workflow](../../01-shared/domain/processes/workflows.md) | Formula accepted; BC-07/08 target accepted |
| Documents and notifications | API, Platform, Portal | [C4 L3/L4](../../01-shared/architecture/c4/l4/technical-lenses.md) | AS-IS adapters/projections; BC-09/10 target accepted |
| Business traceability | API, Platform, Portal | [Business ownership](../../01-shared/domain/ownership/business-ownership-matrix.md), [Traceability ADR](../../01-shared/architecture/decisions/adr/adr-0011-durable-business-traceability.md) | AS-IS evidence; BC-11 target accepted |
| Public discovery and demo intake | Website | [Repository map](../../00-start-here/repository-map.md), [Product scope](../../01-shared/product/vision/v1-scope.md) | AS-IS public boundary |
| Visual language and UX flows | Design Lab, Platform, Portal, Website | [Design convergence](../../01-shared/design/design-system/web-evidence/design-lab-contract.md), [Design adoption](../../01-shared/design/design-system/web-evidence/05-engineering/design-adoption.md) | Visual source/candidate guidance |
| Mobile and driver workflows | Mobile | [Runway](../../01-shared/engineering/construction/current-wave.md) | FUTURE; not V1 implementation |

## Evidence rules

- Repository map records independent Git roots; it is not a monorepo model.
- Dated implementation baselines are snapshots, not automatically current runtime proof; use the current-ref verification for the latest accessible cut.
- C4 L3/L4 views describe responsibility seams, not accepted Bounded Contexts.
- Missing runtime, authenticated browser or provider evidence remains a gap.
