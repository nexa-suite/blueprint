---
status: accepted
maturity: BASELINED
scope: v1
owner: design
last-reviewed: 2026-08-15
---

# Design baseline

This document separates current Product/UX principles from the v1 design-system baseline. Detailed normative guidance now lives under the versioned `00-governance` through `06-release-baselines` sections. It does not authorize application implementation, backend contracts or a production package release.

## Current Product/UX principles

### Distinct surfaces

`Website != Platform != Buyer Portal`.

- **Website:** product discovery, trust, capability explanation, commercial contact and Request Demo. It does not expose Tenant commerce, catalogs, prices or product data anonymously.
- **Platform:** role-focused internal operations; relatively dense where needed; efficient for repetitive work; permissions and role responsibilities shape navigation and available actions.
- **Buyer Portal:** Buyer-focused, low cognitive load, purchase confidence, clear product/SKU presentation, clear price/availability, order and delivery visibility; hides unnecessary ERP implementation complexity.

Shared foundations may coexist with different density and surface expression. One visual system does not require identical layouts or workflows.

### Quality principles

- Empty-Tenant experiences must explain setup state, available next actions and permission boundaries without pretending business data exists.
- Loading, skeleton, empty, error, validation, disabled, read-only, permission-denied and degraded/offline states are first-class states where applicable.
- Responsive behavior must cover desktop operations, narrow screens and field urgency without inventing a mobile V1 product.
- Accessibility is a quality goal: keyboard access, visible focus, labels, semantic structure, contrast and non-color-only status communication.
- Do not claim visual parity without matched authenticated captures, current contracts and an evidence matrix.

## v1 design-system relationship

The v1 baseline defines semantic tokens, component states, responsive rules, content guidance, surface-specific information architecture and accessibility acceptance criteria. It preserves the Product decisions above and treats Legacy evidence as a source to revalidate, never as authority.

Open product decisions remain open even when the visual composition is documented. The Design Lab provides executable evidence for the baseline; it does not close domain ownership, authentication, payment, map or mobile decisions.
