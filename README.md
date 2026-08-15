# Nexa Blueprint

Nexa is a multi-tenant B2B SaaS platform for importers and distributors, with particularly strong support for cold-chain operations. It coordinates commercial operations, catalog and pricing, inventory, fulfillment, delivery, documents and buyer self-service in one product/codebase.

This repository is the canonical, publication-safe documentation baseline for `nexa-suite/blueprint`. It contains accepted product decisions, architecture baselines, AS-IS evidence, engineering and operations records, future-analysis indexes and safe publication guidance.

It does not contain the application source repositories as Blueprint content, a final TARGET architecture, Strategic DDD outputs, production cloud decisions, secrets, temporary runtime data or copied external copyrighted material. The local application checkouts under `10-repositories/active/` are workspace material only.

## Start here

1. Read [Source of truth](00-governance/source-of-truth.md).
2. Read [Current accepted decisions](00-governance/current-decisions.md).
3. Read [Current state](00-governance/current-state.md).
4. Use the area README for the question being investigated.
5. Treat [AS-IS evidence](11-reference/as-is/README.md) as evidence, never as TARGET authority.
6. Run `bash tooling/scripts/validate-blueprint.sh` before publication or review.

## Documentation authority

Authority is ordered as follows:

1. Explicit accepted Product and Architecture decisions.
2. Current canonical documentation in this workspace.
3. Verified Modern implementation as AS-IS evidence.
4. Legacy flows and screenshots as functional evidence.
5. Legacy source code.
6. Historical documentation.
7. Agent-generated reports unless independently verified.

See [Source of truth](00-governance/source-of-truth.md) for the canonical rule. Legacy is evidence, not authority. AS-IS is evidence, not TARGET.

## Current baseline status

| Area | Maturity / evidence status |
|---|---|
| Product and Business V1 baseline | FROZEN |
| AS-IS implementation baseline | CLOSED WITH CAVEAT |
| Exact remote baseline provenance | VERIFIED 2026-08-15 |
| C4 Level 1 | BASELINED |
| C4 Level 2 | BASELINED |
| Capability Mapping | NOT STARTED |
| EventStorming | NOT STARTED |
| Domain Storytelling | NOT STARTED |
| Strategic DDD | NOT STARTED |
| Subdomains, Bounded Contexts and Context Map | NOT STARTED |
| C4 Level 3 | NOT STARTED; intentionally not created |
| TARGET Data Architecture | NOT DEFINED |
| TARGET Security Architecture | NOT DEFINED |
| TARGET Cloud / Deployment Architecture | NOT DEFINED |

The preserved [V1 readiness baseline](11-reference/as-is/v1-readiness-baseline-2026-08-12.md) is historical evidence, not a completion claim.

## Directory map

| Directory | Purpose | Current status |
|---|---|---|
| [00-governance](00-governance/README.md) | Authority, decisions, states, standards and roadmap | BASELINED |
| [01-product](01-product/README.md) | Product vision, positioning, V1 scope and actors | FROZEN baseline |
| [02-domain](02-domain/README.md) | Discovery readiness and known terminology/rules | NOT STARTED for discovery |
| [03-design](03-design/README.md) | Design evidence and future system guidance | BASELINED / deferred polish |
| [04-architecture](04-architecture/README.md) | C4, ADRs, drivers and pre-DDD baseline | C4 BASELINED; TARGET work pending |
| [05-data](05-data/README.md) | AS-IS data evidence and TARGET readiness | TARGET NOT STARTED |
| [06-security](06-security/README.md) | Security evidence and architecture readiness | TARGET NOT DEFINED |
| [07-engineering](07-engineering/README.md) | Verified technology and engineering practice | BASELINED evidence |
| [08-operations](08-operations/README.md) | Local runtime, CI/observability evidence and gaps | LOCAL BASELINED; production pending |
| [09-evolution](09-evolution/README.md) | AS-IS to TARGET movement and future runway | BASELINED roadmap |
| [10-repositories](10-repositories/README.md) | Documentation-only index of independent repositories | INDEX; active clones excluded from Blueprint |
| [11-reference](11-reference/README.md) | Evidence catalogues and safe references | AS-IS evidence |
| [90-academic](90-academic/README.md) | Academic mapping and traceability | ISOLATED from production authority |
| [tooling](tooling/README.md) | Safe documentation and architecture tooling | LOCAL TOOLING |

## AS-IS and TARGET

AS-IS documents record observed code, runtime, tests, Git state, flows or historical evidence. TARGET documents require an accepted decision or a future architecture activity. Existing Spring modules, PostgreSQL schemas and frontend feature areas are implementation evidence; they are not accepted Bounded Contexts or final architecture.

The next analysis sequence is deliberately:

```text
Capability Mapping -> Big Picture EventStorming -> Process-Level EventStorming -> Domain Storytelling -> Ubiquitous Language -> Subdomain classification -> Bounded Context discovery -> Context Mapping -> Strategic DDD
```

Data Architecture, Security Architecture and Cloud/Deployment Architecture depend on the resulting domain and ownership decisions. C4 Level 3 remains uncreated until the required architecture work exists.

## Independent application repositories

The current application repositories are indexed in [10-repositories/repository-map.md](10-repositories/repository-map.md): API, Platform, Portal and Website are active independent Git repositories; Mobile is runway. Their source, Git history and repository-owned documentation stay in those repositories. `10-repositories/active/*` must not be committed into the Blueprint repository.

## Contribution and agent navigation

Keep one authoritative document per question, preserve existing evidence, use repository-relative links, label provisional or unresolved material, and never infer TARGET architecture from folder names. Before architectural work read governance first. Before publication review [Publication policy](00-governance/publication-policy.md).
