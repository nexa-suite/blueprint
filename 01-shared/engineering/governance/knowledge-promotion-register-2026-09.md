---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-09-10
---

# Knowledge promotion register — September 2026

This register records how meaningful material from the September audit was
classified before it entered durable Blueprint navigation. Classification is
not itself Owner acceptance.

| Source or finding | Classification | Durable destination | Promotion boundary |
|---|---|---|---|
| Explicit September 2026 market, Mobile and governance decisions | `OWNER_DECISION` | [Owner decisions](../../product/owner-decisions-2026-09.md) and affected canonical links | accepted where explicitly stated; no implementation claim |
| Exactly eleven strategic Bounded Contexts and existing product distinctions | `ALREADY_CANONICAL` | current decisions, Strategic DDD, glossary and tactical records | preserved; no new context |
| Mobile functional inventory `MOB-US-001..073` and release distribution | `ALREADY_CANONICAL` | [Mobile backlog](../../../03-mobile/requirements/master-mobile-backlog.md) | 73 functional stories remain distinct from academic 97 |
| Mobile Report personas, Lean UX, hypotheses, Needfinding, Business Outcomes and planned experiments | `ACADEMIC_PROJECTION` / `RESEARCH_EVIDENCE` | academic projection and Mobile research boundaries | not promoted to accepted Product truth |
| Mobile Report `6 LAND + 73 MOB + 12 Technical + 6 Spikes = 97` | `ACADEMIC_PROJECTION` | [Academic backlog boundary](../../../03-mobile/requirements/academic-backlog-boundary.md) | academic planning count only |
| Mobile Report C4, Strategic DDD, Tactical DDD and UML | `DERIVED_FROM_CANON` / `ACADEMIC_PROJECTION` | [Model authority](../../architecture/model-authority.md) | useful semantics reconciled; PlantUML and exports are not a second authority |
| Historical Web interview themes | `RESEARCH_EVIDENCE` / `HISTORICAL_ONLY` | [Historical Web research — 2026](../../../91-reference/research/historical-web-research-2026.md) | de-identified themes seed hypotheses only |
| Legacy Web architecture, old role/tenant/order/subscription semantics | `SUPERSEDED` / `HISTORICAL_ONLY` | research salvage audit and historical evidence | blocked from current canon |
| Live repository refs, release objects and worktree caveats | `IMPLEMENTATION_EVIDENCE` | [Live repository baseline](../../../04-delivery/as-is/live-repository-baseline-2026-09-10.md) | exact named refs only; no Product/System acceptance |
| Design Lab current ref and visual evidence | `IMPLEMENTATION_EVIDENCE` | live baseline and existing Design interface | UX/UI evidence only; no domain authority |
| ICP, buyer, value, pricing, TCO, SaaS, adoption and GTM models | `PROPOSED` / `RESEARCHING` | [Business economics](../../product/economics/README.md) | no public prices or measured results |
| Website pricing/plans/registration drift | `OPEN_DECISION` | open economic decisions; source-side issue remains out of scope | not redesigned or promoted |
| Missing requested `webs-report` checkout versus historical candidate repo | `CONFLICT` / `HISTORICAL_ONLY` | historical Web research provenance | candidate is not current authority |

## Review rule

Any future promotion from `PROPOSED`, `RESEARCHING`, `RESEARCH_EVIDENCE`,
`ACADEMIC_PROJECTION`, `OPEN_DECISION` or `CONFLICT` requires a named Owner or
Architecture decision and updated provenance. Do not use an unscoped
`VALIDATED` label as a shortcut.
