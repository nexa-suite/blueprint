---
status: reference
maturity: HISTORICAL
scope: cross-cutting
owner: research
last-reviewed: 2026-08-24
---

# Academic Web evidence map

Read-only salvage register for
[nexa-ecosystem-report](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report),
inspected at commit `e161fe522023bfe5929e76c4d7c66af211884b7e`. Academic
period and source paths are retained for provenance; this projection is not
current Product authority.

| Source area | Evidence inventory | Classification | Current use |
|---|---|---|---|
| `report/10-chapter-1-introduction` | problem framing, positioning and scope | HISTORICAL / REFINE | compare against current Nexa positioning |
| `report/20-chapter-2-requirements-elicitation` | interviews, interview framework, assumptions and needs | KEEP / REFINE | Web discovery method and dated evidence |
| `report/30-chapter-3-requirements-specification` | 13 historical epics, 107 functional stories, 17 technical stories, 262 Gherkin scenario blocks | HISTORICAL / REFINE | evidence only; technical stories are not current product stories |
| `report/30-chapter-3-requirements-specification/3-2-impact-mapping` | actors, outcomes, impacts and deliverable links | REFINE / WEB-REUSABLE | capability-to-outcome review |
| `report/30-chapter-3-requirements-specification/3-3-product-backlog` | historical prioritization and backlog framing | HISTORICAL | do not import priority or Story Points |
| `report/40-chapter-4-product-design` | information architecture, UX guidelines, accessibility and style research | REFINE / WEB-REUSABLE | Web UX and Shared Design review |
| `annexes`, `wiki` | supporting definitions and course evidence | HISTORICAL | provenance lookup only |
| `assets` | screenshots and binary research material | HISTORICAL / NOT-REUSABLE by default | retain provenance; review before republishing |

## Recoverable artifacts

Lean UX Canvas, problem statements, assumptions, hypotheses, target segments,
interview framework/evidence, personas, empathy maps, task analysis, journeys,
impact mapping, historical User Stories, IA, UX guidelines, accessibility
findings and style/design research are discoverable through the curated [legacy
catalog](../../91-reference/legacy/legacy-ecosystem-report/historical-user-story-catalog.md),
[research evidence](../../91-reference/legacy/legacy-ecosystem-report/research-evidence.md)
and [salvage audit](../../91-reference/research/lean-ux-salvage-audit.md).

Historical stories retain `baselineStoryId` provenance. A future current story
may link `baselineStoryId -> supersededBy -> future current story ID`; this
wave creates no future IDs. Old DDD, implementation routes, plan tiers,
identity assumptions and technical story contracts are not promoted.

Mobile research is not backfilled from this Web evidence. Mobile remains
`PROPOSED / RESEARCH VALIDATION PENDING`.
