# Nexa Blueprint

Nexa is a multi-tenant B2B SaaS platform for importers, distributors and
wholesalers,
especially cold-chain operations. Blueprint documents product intent, shared
domain, surface projections and delivery evidence.

## In three minutes

- **Shared**: product, one domain, Design System, architecture, data, security and engineering.
- **Web**: Website, Internal Platform and Buyer Portal.
- **Mobile**: two-app direction accepted; 73-story V1 Product Generation envelope, 9/9 Needfinding evidence, partial unmerged Operations implementation evidence, and Buyer implementation absent.
- **Problem**: [current Problem Foundation](../01-shared/product/vision/problem.md), with historical Web provenance.
- **DDD**: [01-shared/domain](../01-shared/domain/README.md).
- **C4**: [01-shared/architecture/c4](../01-shared/architecture/c4/README.md).
- **Design**: [01-shared/design](../01-shared/design/README.md), sourced from [Design Lab](https://github.com/nexa-suite/design-lab).
- **Requirements**: [Web](../02-web/requirements/README.md) with 15 Epics / 133 confirmed stories; [Mobile](../03-mobile/requirements/README.md) with 12 outcome-based Epics / 73-story V1 Product Generation envelope; [shared delivery](../01-shared/product/requirements/README.md) with 20 Technical Stories / 6 Spikes.
- **Actors and capabilities**: [Shared actors](../01-shared/product/actors.md), [Shared capability model](../01-shared/product/capability-map.md), [role matrix](../01-shared/product/role-capability-matrix.md) and [surface matrix](../01-shared/product/surface-role-matrix.md).
- **Academic evidence**: [AV1 Mobile projection](../90-academic/mobile/course-1acc0238/README.md) aligned to `mobile-report` v1.0.1; historical Web source in [91-reference](../91-reference/README.md).

## If you are...

| Role | Start |
|---|---|
| Product student | [Shared product](../01-shared/product/README.md) and [Web UX discovery](../02-web/ux/discovery/README.md) |
| Domain architect | [Strategic DDD](../01-shared/domain/strategic-ddd/README.md) and [11 BCs](../01-shared/domain/bounded-contexts/README.md) |
| Frontend engineer | [Web](../02-web/README.md) and [shared Design](../01-shared/design/README.md) |
| Backend engineer | [Shared domain](../01-shared/domain/README.md), [C4](../01-shared/architecture/c4/README.md) and [AS-IS](../04-delivery/as-is/README.md) |
| Mobile engineer | [Mobile](../03-mobile/README.md), [live implementation baseline](../04-delivery/as-is/live-repository-baseline-2026-09-18.md) and open acceptance gates |
| Professor/reviewer | [Academic](../90-academic/README.md), [status](status.md) and [repository map](repository-map.md) |

## Repository tree

```text
00-start-here/  navigation and status
01-shared/     cross-surface product, domain, design and architecture
02-web/        Website, Platform and Buyer Portal
03-mobile/     accepted two-app Mobile Product Generation projection
04-delivery/   AS-IS, runtime, CI/CD and Production Gate
90-academic/   isolated course projections
91-reference/  historical, research and source material
tooling/       validators and local tools
```

Status dimensions are separate: decision `ACCEPTED / PROPOSED / DEFERRED`;
research `RESEARCHING / RESEARCH EVIDENCE AVAILABLE / OPEN`; implementation
`IMPLEMENTED / PARTIAL / PLANNED / FUTURE`; Product Acceptance, System
Acceptance and production readiness remain independent gates.

Read [navigation](navigation.md), [status](status.md), [repository map](repository-map.md),
[source of truth](../01-shared/engineering/governance/source-of-truth.md),
[status taxonomy](status-taxonomy.md) and [current decisions](../01-shared/product/current-decisions.md) next.
