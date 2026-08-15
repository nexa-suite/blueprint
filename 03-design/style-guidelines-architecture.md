---
status: planned
maturity: NOT STARTED
scope: cross-cutting
owner: design
last-reviewed: 2026-08-15
---

# Style guidelines and design-system architecture

This is a design-system direction, not a finished implementation. Future work should establish semantic tokens, component states, interaction patterns, responsive behavior, content guidance and accessibility acceptance criteria before coding broad UI changes.

## Guardrails

- Prefer semantic tokens over component-specific literals.
- Keep tenant data, role permissions and business state visible in the interaction model.
- Define loading, empty, error, validation, disabled and permission-denied states.
- Target WCAG 2.2 AA as a product quality goal; validate keyboard access, focus, contrast and non-color state communication.
- Treat Material 3 and Angular Material as references for foundations, not permission to replace Nexa product decisions.

Official references: [WCAG 2.2](https://www.w3.org/TR/WCAG22/), [Material 3](https://m3.material.io/), [Angular Material](https://material.angular.dev/), and the [Design Tokens Community Group](https://www.w3.org/community/design-tokens/). Reverify versions when implementation is authorized.
