---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-24
---

# Web requirements traceability model

Future story traceability is directional and evidence-first:

`Story -> Epic namespace -> Surface -> Actor/segment -> Capability -> Primary
BC -> supporting BCs -> Process/state -> Business rule -> Event -> UX/research
evidence -> implementation evidence -> validation result`.

The [derivation source map](derivation-sources.md) is the index. A refined story
must link to the exact capability row, actor entry, domain rule/state/event,
research artifact and implementation evidence. If research is historical, mark
its provenance and current interpretation.

Current `US-001` through `US-037` remain baseline IDs. Historical academic IDs
remain under `90-academic`/`91-reference`. Future refinement may add a mapping:

`baselineStoryId -> classification -> supersededBy -> future current story ID`.

No future current IDs are generated here. A mapping without a target ID means
the story is still `REFINE`, `SPLIT`, `MERGE`, `REWRITE` or `DROP` pending review.
