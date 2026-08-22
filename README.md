<div align="center">

<br />

<br /><br />

# Nexa Blueprint

**Canonical product, domain, architecture and engineering knowledge workspace.**

<br />

[![Status](https://img.shields.io/badge/status-baselined-2563EB?style=flat-square)](00-governance/current-state.md) [![C4](https://img.shields.io/badge/C4-L1%20%2B%20L2%20baselined%20%2B%20L3%20proposed-0F766E?style=flat-square)](04-architecture/c4/README.md) [![Validation](https://img.shields.io/badge/validation-local-64748B?style=flat-square)](tooling/scripts/validate-blueprint.sh)

[Start here](#start-here) · [Governance](00-governance/README.md) · [Architecture](04-architecture/README.md) · [Validation](#validation)

</div>
---

## Purpose

Blueprint is the publication-safe documentation baseline for `nexa-suite/blueprint`. It records accepted product decisions, architecture baselines, AS-IS evidence, engineering and operations evidence, future-analysis indexes and safe publication guidance.

It does not contain application source as Blueprint content, final accepted TARGET architecture, production cloud decisions, secrets or copied external copyrighted material. Strategic DDD and technical TARGET proposals are documented with explicit review gates. Local application checkouts under `10-repositories/` are workspace material only.

## Start here

1. Read [Source of truth](00-governance/source-of-truth.md).
2. Read [Current accepted decisions](00-governance/current-decisions.md).
3. Read [Current state](00-governance/current-state.md).
4. Choose an area from the [workspace map](#workspace-map).
5. Treat [AS-IS evidence](11-reference/as-is/README.md) as evidence, never as TARGET authority.
6. Run the [Blueprint validator](#validation) before review or publication.

## Authority model

Accepted Product and Architecture decisions outrank current documentation. Current canonical documentation outranks verified implementation evidence. Legacy flows and source remain evidence only. Agent-generated reports require independent verification.

AS-IS records observed code, runtime, tests, Git state, flows or historical evidence. TARGET requires an accepted decision or future architecture activity. Existing modules, schemas and feature areas are not accepted Bounded Contexts.

## Baseline status

| Area | Status |
| --- | --- |
| Product and Business V1 | FROZEN / CLOSED |
| AS-IS implementation | CLOSED WITH CAVEAT |
| C4 Level 1 and Level 2 | BASELINED |
| Capability Mapping, EventStorming, Domain Storytelling | PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW |
| Strategic DDD, Bounded Contexts, Context Map | PROPOSED; not canonically accepted |
| C4 Level 3/4 | SELECTIVE PROPOSED / REVIEW-GATED |
| TARGET data, security and application architecture | PROPOSED / REVIEW-GATED |
| Production cloud/deployment architecture | DEFERRED / OPEN |

## Workspace map

<table>
<tr><td><a href="00-governance/README.md"><strong>Governance</strong></a><br />Authority, decisions, states and publication controls.</td><td><a href="01-product/README.md"><strong>Product</strong></a><br />Positioning, V1 scope and actors.</td></tr>
<tr><td><a href="02-domain/README.md"><strong>Domain</strong></a><br />Discovery readiness, terminology and rules.</td><td><a href="03-design/README.md"><strong>Design</strong></a><br />Design evidence and future system guidance.</td></tr>
<tr><td><a href="04-architecture/README.md"><strong>Architecture</strong></a><br />C4, ADRs, AS-IS audit and review-gated TARGET proposals.</td><td><a href="05-data/README.md"><strong>Data</strong></a><br />AS-IS evidence and review-gated TARGET ownership/concurrency.</td></tr>
<tr><td><a href="06-security/README.md"><strong>Security</strong></a><br />Evidence and architecture readiness.</td><td><a href="07-engineering/README.md"><strong>Engineering</strong></a><br />Technology and engineering practice.</td></tr>
<tr><td><a href="08-operations/README.md"><strong>Operations</strong></a><br />Runtime, CI and observability evidence.</td><td><a href="09-evolution/README.md"><strong>Evolution</strong></a><br />AS-IS to TARGET runway.</td></tr>
<tr><td><a href="10-repositories/README.md"><strong>Repositories</strong></a><br />Documentation-only independent repository index.</td><td><a href="11-reference/README.md"><strong>Reference</strong></a><br />Evidence catalogues and safe references.</td></tr>
</table>

## Repository reference

The organization profile owns the full public ecosystem map. Blueprint records repository identity without becoming another product card.

- [Nexa API](https://github.com/nexa-suite/api) — business and integration backbone.
- [Nexa Platform](https://github.com/nexa-suite/platform) — internal operational workspace.
- [Nexa Buyer Portal](https://github.com/nexa-suite/portal) — buyer-facing experience.
- [Nexa Website](https://github.com/nexa-suite/website) — public product experience.
- [Nexa Mobile](https://github.com/nexa-suite/mobile) — documentation and native runway.

## Project lineage

Historical repositories belong to old UPC organization. They remain visible provenance, not current Nexa product surfaces.

<table>
<tr><td width="50%" valign="top"><strong><a href="https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-platform">Legacy Backend</a></strong><br />nexa-platform. Predecessor REST/API service layer.<br /><a href="https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-platform">Open Repository</a><br /><img src="https://img.shields.io/badge/.NET-10-512BD4?style=flat-square&logo=dotnet&logoColor=white" alt=".NET 10" /> <img src="https://img.shields.io/badge/ASP.NET%20Core-REST-0EA5E9?style=flat-square" alt="ASP.NET Core" /> <img src="https://img.shields.io/badge/EF%20Core-PostgreSQL-512BD4?style=flat-square" alt="EF Core" /></td><td width="50%" valign="top"><strong><a href="https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-webapp">Legacy WebApp</a></strong><br />nexa-webapp. One unified historical application.<br /><a href="https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-webapp">Open Repository</a><br /><img src="https://img.shields.io/badge/Vue-3-35495E?style=flat-square&logo=vuedotjs&logoColor=white" alt="Vue 3" /> <img src="https://img.shields.io/badge/Vite-5-646CFF?style=flat-square&logo=vite&logoColor=white" alt="Vite" /> <img src="https://img.shields.io/badge/PrimeVue-4-0EA5E9?style=flat-square" alt="PrimeVue" /> <img src="https://img.shields.io/badge/Pinia-2-FFD859?style=flat-square" alt="Pinia" /></td></tr>
<tr><td width="50%" valign="top"><strong><a href="https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-website">Legacy Website</a></strong><br />nexa-website. Previous public Website lineage.<br /><a href="https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-website">Open Repository</a><br /><img src="https://img.shields.io/badge/HTML5-static-E34F26?style=flat-square&logo=html5&logoColor=white" alt="HTML5" /> <img src="https://img.shields.io/badge/CSS3-responsive-1572B6?style=flat-square&logo=css3&logoColor=white" alt="CSS3" /> <img src="https://img.shields.io/badge/JavaScript-vanilla-F7DF1E?style=flat-square&logo=javascript&logoColor=black" alt="JavaScript" /></td><td width="50%" valign="top"><strong><a href="https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report">Academic / Historical Reference</a></strong><br />nexa-ecosystem-report. Documentation and project evidence.<br /><a href="https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report">Open Repository</a><br /><img src="https://img.shields.io/badge/scope-documentation-64748B?style=flat-square" alt="Documentation" /></td></tr>
</table>

Legacy URLs provide provenance. They do not define current repository identity or TARGET architecture.

## Discovery sequence

```text
Capability Mapping -> Big Picture EventStorming -> Process-Level EventStorming
-> Domain Storytelling -> Ubiquitous Language -> Subdomain classification
-> Bounded Context discovery -> Context Mapping -> Strategic DDD
```

C4 Level 3/4 and TARGET data/security/application proposals remain review-gated by resulting ownership decisions; production deployment remains deferred.

## Validation

```bash
bash tooling/scripts/validate-blueprint.sh
```

Validator checks links, metadata, personal paths, forbidden files, nested repositories, secret heuristics and canonical Structurizr sources.

## Contribution and publication boundary

Keep one authoritative document per question. Preserve evidence. Label provisional or unresolved material. Read [Publication policy](00-governance/publication-policy.md) before changing publication scope. Do not publish application working trees, secrets, private binaries or unreviewed generated output.

## Security and legal

This workspace is documentation and architecture evidence. Do not report vulnerabilities through public issues; repository-specific policies live with each application repository. Existing legal ownership and licensing decisions remain unresolved; no license is selected here.

<div align="center">

<br />

Nexa · Product knowledge with evidence boundaries

</div>
