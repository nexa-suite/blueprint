---
status: draft
maturity: DRAFT
scope: v1
owner: design
last-reviewed: 2026-08-19
---

# Design convergence interface

Design remains active. This interface prevents frontend architecture from silently becoming a visual or product redesign.

## Required evidence before convergence

| Evidence | Owner | Acceptance |
|---|---|---|
| Product flow and actor scope | Product/Business | Matches frozen V1 and current role/relationship rules |
| Authenticated Vue/Angular or current-surface captures where applicable | Frontend/QA | Same data, viewport, locale and permission context |
| Token/component/state proposal | Design | States include loading, empty, error, disabled, forbidden, stale and conflict |
| API contract and projection | Architecture/API | No client-only authorization or invented endpoint |
| Accessibility and responsive checks | Design/Frontend | Keyboard, focus, labels, contrast and narrow-screen behavior evidenced |
| Visual parity matrix | QA/Design | Differences classified intentional, defect, unavailable evidence or pending |

## Decision boundary

The target frontend architecture may proceed with structural shell/feature contracts, but final tokens, typography, component inventory, navigation, visual parity and Figma library remain review-gated. Legacy and Design Lab assets are evidence only; they do not establish canonical decisions.
