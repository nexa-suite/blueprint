# Nexa Design System — executable evidence

This detailed folder is shared Design System evidence, relocated from the old
Web-only home. Normative cross-surface policy lives in `01-shared/design/`; this
folder defines intent, vocabulary, tokens, component contracts, patterns,
quality gates and adoption rules. It does not claim production consumption.

## Authority and evidence

- [v1 release baseline](06-release-baselines/v1.md) — release-scoped baseline and classification rules.
- [Design baseline](design-baseline.md) — current Product/UX principles and boundary to versioned design guidance.
- [Design system charter](00-governance/design-system-charter.md) — authority, scope and laws.
- [Shared Design source](../../README.md) — authority order and adoption boundary.
- [Contribution and review](00-governance/contribution-and-review.md), [maturity model](00-governance/maturity-model.md) and [release policy](00-governance/release-policy.md) — governance controls.
- [Foundations](01-foundations/README.md) — semantic visual language.
- [Components](02-components/README.md) — reusable contracts and maturity.
- [Patterns](03-patterns/README.md) — product-safe composition guidance.
- [Quality](04-quality/README.md) — accessibility, contrast, heuristics and regression.
- [Engineering](05-engineering/README.md) — Angular consumption, tokens, APIs and adoption.
- [Legacy design evidence](legacy-design-evidence.md) — historical evidence only.
- [Style guidelines](style-guidelines-architecture.md) — cross-surface composition and architecture guidance.

The executable companion is the Nexa Design Lab `v1.0.1` release (metadata correction over `v1.0.0`). It renders evidence and runs gates; it does not replace this Blueprint or define domain contracts.

## Classification

`FROZEN` means a human-approved direction that must not drift casually. `CANDIDATE` means reviewable and usable as evidence, not production certification. `EXPERIMENTAL` means a bounded investigation. `DEFERRED` means intentionally outside v1. Every page names its maturity and owner.

## Boundaries

The Website, Internal Web Platform and Buyer Portal share foundations but do not share identical information architecture or density. Legacy Vue is evidence only. Mobile, IoT, Control Center, subscriptions and provider-specific production contracts remain outside the v1 design baseline unless separately accepted.
