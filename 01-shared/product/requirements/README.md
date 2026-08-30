---
status: accepted
maturity: FROZEN
scope: cross-cutting
owner: product
last-reviewed: 2026-08-29
---

# Shared Requirements

Shared requirements contain cross-surface delivery and research-enabler
catalogs. Functional Web and Mobile stories remain in their surface Product
areas.

- [Requirements authoring standard](../requirements-standard.md)
- [Technical Stories](technical-stories.md)
- [Spike Stories](spike-stories.md)
- [Shared technical coverage](coverage.md)

Catalog freeze for this wave:

| Category | Count | Status |
|---|---:|---|
| Web functional User Stories | 133 | CONFIRMED / V1 |
| Mobile functional User Stories | 73 | 28 V1; 35 V2; 9 V3; 1 V4/Future; lifecycle tracked in Mobile master backlog |
| Technical Stories | 20 | SHARED / DELIVERY |
| Spike Stories | 6 | RESEARCH / ENABLER |
| Total requirement items | 232 | BASELINED CATALOG; acceptance gates open |

Technical and Spike entries do not create Bounded Contexts or application
repositories. They point to shared contracts, delivery concerns and explicit
research questions.

The canonical Mobile behavior and acceptance-criteria projection is in
[Mobile story registry](../../../03-mobile/requirements/mobile-v1-catalog.md);
release and lifecycle fields are in the [Mobile master backlog](../../../03-mobile/requirements/master-mobile-backlog.md);
historical continuity is in the [reconciliation matrix](../../../03-mobile/requirements/reconciliation.md).
