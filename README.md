<div align="center">

<img src="./01-shared/engineering/docs/assets/nexa.svg" alt="Nexa" width="240" />

# Nexa Blueprint

**Canonical Product, Domain and Architecture documentation authority.**

![Authority](https://img.shields.io/badge/authority-canonical-0F766E?style=flat-square) ![Format](https://img.shields.io/badge/docs-Markdown-000000?style=flat-square&logo=markdown&logoColor=white) ![Latest Git tag](https://img.shields.io/github/v/tag/nexa-suite/blueprint?sort=semver&style=flat-square&label=latest%20Git%20tag)

[Orientation](./00-start-here/README.md) · [Product](./01-shared/product/README.md) · [Architecture](./01-shared/architecture/README.md) · [Delivery](./04-delivery/README.md) · [Validation](./tooling/scripts/validate-blueprint.sh)

</div>

Canonical documentation for Nexa Product, Domain, System, Web, accepted Mobile projections, delivery evidence, academic projections, and historical reference.

## Authority boundary

This repository is the documentation authority for accepted Product, Domain, Architecture, and technical data decisions. It is not a runtime application, a deployed service, or a substitute for verified implementation evidence. AS-IS evidence and TARGET design remain explicitly separated; planned or accepted decisions are not presented as implemented or production-ready without supporting evidence.

The current authority records one Nexa system, 11 accepted Strategic Bounded Contexts, 14 published integration events, and 95 TARGET tables. Needfinding is complete at 9/9 interviews as problem and task evidence. Operations Mobile has partial implementation evidence integrated in the current Mobile repository baseline; this does not mean Mobile V1 is complete or accepted. Buyer Mobile remains a TARGET projection and is not implemented. Product Acceptance, device evidence, and production readiness remain open where the delivery records say so.

## Nexa Product Ecosystem

<table>
<tr>
<td><strong><a href="https://github.com/nexa-suite/mobile-report">Mobile Report</a></strong><br>Academic and product research evidence.</td>
<td><strong><a href="https://github.com/nexa-suite/mobile">Mobile</a></strong><br>Accepted mobile projections and implementation workspace.</td>
</tr>
<tr>
<td><strong><a href="https://github.com/nexa-suite/api">API</a></strong><br>Shared backend and domain integration surface.</td>
<td><strong><a href="https://github.com/nexa-suite/website">Website</a></strong><br>Public acquisition and product context.</td>
</tr>
<tr>
<td><strong><a href="https://github.com/nexa-suite/portal">Buyer Portal</a></strong><br>Buyer-facing web experience.</td>
<td><strong><a href="https://github.com/nexa-suite/platform">Platform</a></strong><br>Operations and platform web experience.</td>
</tr>
</table>

## Start here

- [Orientation and current status](00-start-here/README.md)
- [Shared product](01-shared/product/README.md)
- [Problem foundation](01-shared/product/vision/problem.md)
- [Shared domain](01-shared/domain/README.md)
- [Shared architecture](01-shared/architecture/README.md)
- [Web](02-web/README.md) — Website, Platform, and Portal experience contracts.
- [Mobile](03-mobile/README.md) — the accepted 73-story Mobile V1 Product Generation envelope and its implementation boundaries.
- [Delivery](04-delivery/README.md) — AS-IS, runtime, quality, and production gates, including the [2026-09-18 live repository baseline](04-delivery/as-is/live-repository-baseline-2026-09-18.md).
- [Academic projections](90-academic/README.md)
- [Reference material](91-reference/README.md)

## Mobile boundary

The accepted Mobile target includes Operations Android with Kotlin and Jetpack Compose, and Buyer Mobile with Flutter and Dart for Android and iOS. Current evidence distinguishes implementation from acceptance: partial Operations implementation is integrated in the current Mobile baseline; Buyer Mobile has no verified implementation. Neither integration nor the accepted target proves Mobile V1 completion, Product Acceptance, System Acceptance or Production Readiness. The [mobile requirements](03-mobile/requirements/README.md), [mobile architecture](03-mobile/architecture/README.md), and [delivery records](04-delivery/README.md) are authoritative for the boundary and open gates.

## Documentation and validation stack

| Concern | Current basis |
| --- | --- |
| Documentation | Markdown with repository-local navigation and evidence references |
| Architecture | C4 and related architecture records maintained in this repository |
| Data design | TARGET SQL and model records, explicitly separated from runtime schema evidence |
| Academic evidence | Isolated projections under `90-academic/` with their own status boundary |
| Validation | Repository validators and narrow documentation checks |

Run the repository validator from this directory:

```bash
bash tooling/scripts/validate-blueprint.sh
```

## Repository structure

```text
00-start-here/       orientation and current status
01-shared/           product, domain, architecture, data, security
02-web/              web experience contracts
03-mobile/           mobile requirements and architecture
04-delivery/         AS-IS evidence, quality, security, and release gates
90-academic/         isolated academic projections
91-reference/        historical and external reference material
tooling/             repository validation utilities
```

## Ownership and contribution boundary

Blueprint owns canonical documentation and accepted architecture records. It does not own application runtime behavior, deployment state, or repository implementation details. Changes to implementation repositories should be reflected here only when supported by current authority records and verified evidence.

Before changing canonical material, read the relevant local guidance and current decision records. Preserve the distinction between accepted, implemented, verified, and production-ready states. Use the repository validator and review the generated diff before opening a pull request.

## Further reading

- [Current decisions](01-shared/product/current-decisions.md)
- [Owner decisions](01-shared/product/owner-decisions-2026-09.md)
- [Model authority](01-shared/architecture/model-authority.md)
- [Engineering guidance](01-shared/engineering/README.md)
- [Security guidance](01-shared/security/README.md)
- [Delivery guidance](04-delivery/README.md)

## Nexa Engineering & Documentation

<table>
<tr>
<td><strong><a href="https://github.com/nexa-suite/blueprint">Blueprint</a></strong><br>Canonical architecture and decision records.</td>
<td><strong><a href="https://github.com/nexa-suite/web-report">Web Report</a></strong><br>Structured report and documentation workspace.</td>
</tr>
<tr>
<td><strong><a href="https://github.com/nexa-suite/complementary">Complementary</a></strong><br>Supporting research and reproducible utilities.</td>
<td><strong><a href="https://github.com/nexa-suite/design-lab">Design Lab</a></strong><br>Executable design-system evidence.</td>
</tr>
</table>

## Legal

Nexa Blueprint is maintained for the Nexa project. Consult the repository license and local policy files for permitted use and contribution requirements.
