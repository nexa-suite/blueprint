---
status: deprecated
maturity: SUPERSEDED
scope: cross-cutting
owner: design
last-reviewed: 2026-08-15
---

# Style Guidelines and Design System architecture — superseded

This planning note is retained for provenance. The accepted v1 guidance is split into the focused documents linked from [Design](README.md) and the [v1 release baseline](06-release-baselines/v1.md). It is not a second source of truth.

## Foundations

- Product/design principles and relationship to Nexa brand.
- Accessibility baseline and quality gates.
- Surface context for Website, Platform and Buyer Portal.

## Tokens and visual foundations

Use primitive, semantic and component token roles. Naming, ownership, deprecation and design-to-code alignment require explicit governance. Future foundations cover color semantics, typography, spacing, density, shape/radius, elevation/surfaces, motion, iconography and imagery without selecting values here.

## Layout

Future guidance covers grids, page shells, content widths, responsive strategy, breakpoints and information density. Platform may need dense operational layouts; Portal prioritizes confidence and low cognitive load; Website prioritizes discovery and trust.

## Components

Future inventory should cover buttons, inputs, selects, date/time controls, cards, tables, status indicators, badges, navigation, dialogs, drawers, menus, tooltips, pagination, tabs, notifications and file/media interactions. Each component needs semantic states, accessibility behavior, content rules and surface usage guidance.

## States

Document loading, skeleton, empty, error, validation, disabled, read-only, permission denied and offline/degraded states where applicable. State communication must not rely on color alone.

## Patterns

Document search/filter, forms, bulk actions, dashboards, operational tables, workflows, timelines/status progression, confirmation/destructive actions, data entry and responsive operational behavior. Patterns must preserve Tenant, role, business status and authorization meaning.

## Accessibility

Future acceptance checks cover keyboard operation, visible focus, contrast, labels, error association, semantic structure, non-color-only communication, touch targets and reduced-motion preferences. Target WCAG 2.2 AA as a quality goal; validate against current product context.

## Content and surface expression

Govern terminology, microcopy, errors, confirmations and status labels. Shared foundations may support different Website, Platform and Portal expression; Angular Material/CDK may be an implementation substrate/reference, Material 3 a reference, not automatic Nexa identity.

## Implementation relationship and governance

Design tokens, code parity and incremental adoption are now governed by the focused v1 documents. Shared versus surface-specific components require evidence. Design ownership, change review, versioning, accessibility regression checks and design debt are not inferred from this historical planning note.

Official references: [WCAG 2.2](https://www.w3.org/TR/WCAG22/), [Material 3](https://m3.material.io/), [Angular Material](https://material.angular.dev/), and [Design Tokens Community Group](https://www.w3.org/community/design-tokens/). Reverify current versions when implementation is authorized.
