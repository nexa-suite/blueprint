---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# Wave 3 construction baseline

## Canonical now

Nexa has one Software System, eleven frozen Strategic Bounded Contexts, one
shared PostgreSQL TARGET model and two accepted client Containers. Canonical
semantic sources are Markdown, per-BC target SQL, Structurizr DSL and PlantUML.
SVG/PNG/workspace JSON are generated review artifacts.

## Reference

- Source baseline: Blueprint main ef0bb1c92dd2553d95511d3c990a5e87ac5ced39.
- Wave 3 ref: docs/wave3-construction-blueprint-canonization.
- Publication commit: recorded in the signed Git history for this document.

## TARGET and AS-IS

- TARGET: Operations Mobile is Android/Kotlin/Jetpack Compose; Buyer Mobile is
  Flutter/Dart on Android+iOS; both are C4 Containers inside Nexa.
- AS-IS: Operations has partial unmerged evidence; Buyer Mobile is not
  implemented. Application conformance is not implied.
- API remains domain/business authority. Device-local state is scoped and
  non-authoritative. Shared PostgreSQL remains the one authoritative relational
  topology.

## Authoritative paths

- Product/domain decisions: [current decisions](../../product/current-decisions.md).
- Client technology: [technology baseline](../../architecture/technology-baseline.md).
- Tactical/domain/data sources: [bounded contexts](../../domain/bounded-contexts/README.md)
  and [master data model](../../data/master-data-model.md).
- C4 semantic source: [Structurizr DSL](../../architecture/c4/structurizr/workspace.dsl).
- Generated-artifact manifest: [C4 exports](../../architecture/c4/exports/README.md).

## Open gates

Mobile implementation conformance, solution validation, Product Acceptance,
System Acceptance, Production Readiness and final V1 release remain OPEN.
Provider selection and operational production gates remain separate.

## Historical-label hygiene

`PRE-V1` remains only where a document is explicitly historical or provenance.
Current TARGET client, C4 and construction labels use Post-AV1/V1 terminology.
