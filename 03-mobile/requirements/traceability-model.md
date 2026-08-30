---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-29
---

# Mobile requirements traceability model

Canonical chain:

`MOB-US → App → Actor/Segment → CAP-01..CAP-16 → primary/secondary BC →
process/state → AC → research evidence → Design projection → TS/SPIKE →
implementation → technical/Product/System Acceptance`.

The [canonical story registry](mobile-v1-catalog.md) owns story behavior and
AC. The [Master Mobile Product Backlog](master-mobile-backlog.md) owns release
and lifecycle fields. The [reconciliation](reconciliation.md) owns historical
continuity. The shared technical catalog owns TS-001..020; no duplicate
MOB-TS namespace is created.

Research status stays `PENDING` until participant, method, date, provenance,
observed need, confidence and interpretation are recorded. Backend evidence
never becomes Mobile client evidence. Product and
BC authority remain in [Shared Product](../../01-shared/product/README.md) and
[Strategic DDD](../../01-shared/domain/strategic-ddd/README.md).
