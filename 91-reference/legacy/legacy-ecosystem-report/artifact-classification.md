# Artifact classification

Source: `upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report` at `e161fe522023bfe5929e76c4d7c66af211884b7e`.

## High-value report artifacts

| Source path | Classification | Rescue decision |
|---|---|---|
| `report/10-chapter-1-introduction/1-1-startup-profile.md` | HISTORICAL_ONLY | Preserve positioning history; compare against current generic B2B SaaS direction. |
| `report/10-chapter-1-introduction/1-2-solution-profile.md` | KEEP_AS_EVIDENCE | Preserve problem framing and operational pain claims; revalidate citations and market claims. |
| `report/10-chapter-1-introduction/1-3-target-segments.md` | KEEP_AS_EVIDENCE | Preserve role/task evidence; do not treat S1/S2/S3 as current bounded contexts. |
| `report/20-chapter-2-requirements-elicitation/2-1-competitors.md` | HISTORICAL_ONLY | Preserve dated landscape; current competitor capabilities require fresh audit. |
| `report/20-chapter-2-requirements-elicitation/2-2-interviews.md` | KEEP_AS_EVIDENCE | Highest-value qualitative source; preserve observations, sample limits and links. |
| `report/20-chapter-2-requirements-elicitation/2-3-needfinding.md` | KEEP_AS_EVIDENCE | Preserve personas, task matrix, As-Is journeys and empathy findings; revalidate interpretation. |
| `report/20-chapter-2-requirements-elicitation/2-4-big-picture-event-storming.md` | KEEP_AS_EVIDENCE | Historical event/pain input only; current EventStorming remains unperformed. |
| `report/20-chapter-2-requirements-elicitation/2-5-ubiquitous-language.md` | ADAPT_LATER | Collision input; no term accepted automatically. |
| `report/30-chapter-3-requirements-specification/3-1-user-stories.md` | ADAPT_LATER | Catalog and acceptance ideas only; not current V1 backlog. |
| `report/30-chapter-3-requirements-specification/3-2-impact-mapping.md` | HISTORICAL_ONLY | Historical hypotheses and outcomes; revalidate before reuse. |
| `report/30-chapter-3-requirements-specification/3-3-product-backlog.md` | SUPERSEDED | Historical prioritization; do not import into current backlog. |
| `report/40-chapter-4-product-design/4-1-style-guidelines.md` | ADAPT_LATER | Preserve visual intent and token ideas; implementation stack excluded. |
| `report/40-chapter-4-product-design/4-2-information-architecture.md` | KEEP_AS_EVIDENCE | Preserve navigation/task grouping; current IA must be validated against modern surfaces. |
| `report/40-chapter-4-product-design/4-3-landing-page-ui-design.md` | ADAPT_LATER | Website visual/storytelling evidence; no code port. |
| `report/40-chapter-4-product-design/4-4-web-applications-ux-ui-design.md` | ADAPT_LATER | Preserve UX intent, states and flows; implementation details excluded. |
| `report/40-chapter-4-product-design/4-5-web-applications-prototyping.md` | KEEP_AS_EVIDENCE | Selected prototypes copied; treat as historical visual reference. |
| `report/40-chapter-4-product-design/4-6-domain-driven-software-architecture.md` | DO_NOT_MIGRATE | Legacy Design-Level DDD, aggregates and bounded contexts are not current authority. |
| `report/40-chapter-4-product-design/4-7-software-object-oriented-design.md` | DO_NOT_MIGRATE | Legacy class/module boundaries. |
| `report/40-chapter-4-product-design/4-8-database-design.md` | DO_NOT_MIGRATE | Legacy persistence model, not TARGET data architecture. |
| `report/50-chapter-5-implementation-validation-deployment/5-3-validation-interviews.md` | KEEP_AS_EVIDENCE | Preserve validation tasks, observations and caveats. |
| `report/annexes/annex-c-validation-evidence.md` | KEEP_AS_EVIDENCE | Preserve dated AV2/TB2 findings; revalidate access and claims. |
| `report/90-conclusions.md` | HISTORICAL_ONLY | Preserve conclusions as authored interpretation, never as current fact. |
| `report/99-bibliography.md` | ADAPT_LATER | Bibliographic leads; verify source identity, date and licensing. |

## Deliberately not migrated

| Source family | Classification | Reason |
|---|---|---|
| `report/assets/images/chapter-4/architecture/c4/` | DO_NOT_MIGRATE | Legacy C4 tied to Vue/ASP.NET implementation. |
| `report/assets/images/chapter-4/architecture/class-diagrams/` | DO_NOT_MIGRATE | Legacy classes and persistence boundaries. |
| `report/assets/images/chapter-4/architecture/ddd/design-level-final/` | DO_NOT_MIGRATE | Declares legacy aggregates, policies and bounded contexts. |
| `report/assets/images/chapter-4/database/` | DO_NOT_MIGRATE | Legacy database design. |
| `report/50-chapter-5-*/sprint-evidence/` | LOW_VALUE | Repetitive sprint/SCM evidence; inventoried, not copied. |
| `releases/` (41 release notes) | HISTORICAL_ONLY | Release history inventoried; no current release authority. |
| `wiki/` technical stack, workflow and deployment pages | HISTORICAL_ONLY / DO_NOT_MIGRATE | Useful provenance only; obsolete implementation/governance context. |
| `.github/` policies and workflows | DO_NOT_MIGRATE | Legacy repository governance, outside current workspace authority. |

## Repository inventory

Snapshot contains 103 Markdown files, 264 PNG, 33 JPG, 13 JPEG, 12 SVG, 1 JSON, 3 YAML, 2 TXT, 1 shell script and standard repository metadata. Deep review covered requested report chapters, annexes, wiki index, release notes and relevant referenced assets.
