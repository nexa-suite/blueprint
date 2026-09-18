# Nexa Blueprint

Canonical documentation for Nexa Product, Domain, System, Web, accepted Mobile projections, delivery evidence, academic projections and historical reference.

## Start here

- [00-start-here](00-start-here/README.md) — orientation, authority and current status.
- [Shared product](01-shared/product/README.md) — what Nexa is and for whom.
- [Problem Foundation](01-shared/product/vision/problem.md) — current baseline and historical provenance.
- [Shared domain](01-shared/domain/README.md) — one business domain and 11 accepted Bounded Contexts.
- [Shared architecture](01-shared/architecture/README.md) — C4, technical architecture, data, security and reliability.
- [Web](02-web/README.md) — Website, Platform and Portal experience contracts; 133 confirmed stories.
- [Mobile](03-mobile/README.md) — the accepted 73-story Mobile V1 Product Generation envelope; historical bands, AV1 research evidence and implementation boundaries remain explicit.
- [Delivery](04-delivery/README.md) — AS-IS, runtime, quality and production gates, including the [2026-09-18 live repository baseline](04-delivery/as-is/live-repository-baseline-2026-09-18.md).
- [90-academic](90-academic/README.md) — isolated academic projections.
- [91-reference](91-reference/README.md) — historical, legacy, audit and external evidence.

## Authority boundary

Accepted decisions and canonical documentation outrank verified implementation evidence. AS-IS is evidence, not TARGET. Legacy is historical evidence. Web and Mobile are experiences over one shared domain; they do not own duplicate DDD.

Post-AV1 Mobile truth is indexed by the [owner decision record](01-shared/product/owner-decisions-2026-09.md), the [model authority](01-shared/architecture/model-authority.md), and the [academic backlog boundary](03-mobile/requirements/academic-backlog-boundary.md). Needfinding is complete at 9/9 interviews as problem/task evidence; Operations has partial implementation evidence on an unmerged branch, Buyer Mobile is not implemented, and Product Acceptance remains open.

Validate with:

```bash
bash tooling/scripts/validate-blueprint.sh
```
