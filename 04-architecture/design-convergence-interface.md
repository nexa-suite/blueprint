---
status: accepted
maturity: BASELINED
scope: v1
owner: design
last-reviewed: 2026-08-23
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

Structural shell/feature contracts may proceed from the [Frontend Product Contract](../01-product/frontend-product-contract.md). Final token/component adoption remains governed by the Design Lab release evidence and human review; Blueprint does not freeze a candidate merely because it renders. Legacy and Design Lab assets do not establish domain decisions.
