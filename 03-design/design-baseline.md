---
status: accepted
maturity: BASELINED
scope: v1
owner: design
last-reviewed: 2026-08-19
---

# Design baseline

This document separates current Product/UX principles from future Design decisions. It does not select final tokens, fonts, colors, breakpoints, navigation or component architecture.

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

## Current status

The Product/UX principles remain accepted. The design baseline is active, not closed: the [Design Convergence Interface](../04-architecture/design-convergence-interface.md) defines the evidence that must be reviewed before TARGET frontend architecture is treated as implementation-ready.

## Future Design decisions

Future Designer work must define semantic tokens, component states, responsive rules, content guidance, surface-specific information architecture and accessibility acceptance criteria. It must preserve current Product decisions and revalidate Legacy evidence before reuse.

No final visual tokens, typography, spacing, radius, elevation, motion, breakpoints, navigation, component inventory or Figma library is accepted here.
