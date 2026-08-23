# Nexa Design System v1 baseline

This branch contains the normative v1 design-system baseline. It defines intent, vocabulary, tokens, component contracts, patterns, quality gates and adoption rules. It does not copy application implementation or claim that production applications already consume the system.

## Authority and evidence

- [v1 release baseline](06-release-baselines/v1.md) — release-scoped baseline and classification rules.
- [Design system charter](00-governance/design-system-charter.md) — authority, scope and laws.
- [Source of truth](00-governance/source-of-truth.md) — authority order and adoption boundary.
- [Foundations](01-foundations/README.md) — semantic visual language.
- [Components](02-components/README.md) — reusable contracts and maturity.
- [Patterns](03-patterns/README.md) — product-safe composition guidance.
- [Quality](04-quality/README.md) — accessibility, contrast, heuristics and regression.
- [Engineering](05-engineering/README.md) — Angular consumption, tokens, APIs and adoption.
- [Legacy design evidence](legacy-design-evidence.md) — historical evidence only.

The executable companion is the Nexa Design Lab `v1.0.1` release (metadata correction over `v1.0.0`). It renders evidence and runs gates; it does not replace this Blueprint or define domain contracts.

## Classification

`FROZEN` means a human-approved direction that must not drift casually. `CANDIDATE` means reviewable and usable as evidence, not production certification. `EXPERIMENTAL` means a bounded investigation. `DEFERRED` means intentionally outside v1. Every page names its maturity and owner.

## Boundaries

The Website, Internal Web Platform and Buyer Portal share foundations but do not share identical information architecture or density. Legacy Vue is evidence only. Mobile, IoT, Control Center, subscriptions and provider-specific production contracts remain outside the v1 design baseline unless separately accepted.
