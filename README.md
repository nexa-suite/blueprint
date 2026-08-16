<div align="center">

<br />

<img src="https://raw.githubusercontent.com/nexa-suite/api/develop/docs/assets/nexa.svg" alt="Nexa" width="220" />

<br /><br />

# Nexa Blueprint

**Canonical product, domain, architecture and engineering knowledge workspace.**

<br />

[![Status](https://img.shields.io/badge/status-baselined-2563EB?style=flat-square)](00-governance/current-state.md) [![C4](https://img.shields.io/badge/C4-L1%20%2B%20L2%20baselined-0F766E?style=flat-square)](04-architecture/c4/README.md) [![Validation](https://img.shields.io/badge/validation-local-64748B?style=flat-square)](tooling/scripts/validate-blueprint.sh)

[Start here](#start-here) · [Governance](00-governance/README.md) · [Architecture](04-architecture/README.md) · [Validation](#validation)

</div>
---

## Purpose

Blueprint is the publication-safe documentation baseline for `nexa-suite/blueprint`. It records accepted product decisions, architecture baselines, AS-IS evidence, engineering and operations evidence, future-analysis indexes and safe publication guidance.

It does not contain application source as Blueprint content, final TARGET architecture, Strategic DDD outputs, production cloud decisions, secrets or copied external copyrighted material. Local application checkouts under `10-repositories/` are workspace material only.

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
| Product and Business V1 | FROZEN |
| AS-IS implementation | CLOSED WITH CAVEAT |
| C4 Level 1 and Level 2 | BASELINED |
| Capability Mapping, EventStorming, Domain Storytelling | NOT STARTED |
| Strategic DDD, Bounded Contexts, Context Map | NOT STARTED |
| C4 Level 3 | BLOCKED until Strategic DDD |
| TARGET data, security and cloud architecture | NOT DEFINED |

## Workspace map

<table>
<tr><td><a href="00-governance/README.md"><strong>Governance</strong></a><br />Authority, decisions, states and publication controls.</td><td><a href="01-product/README.md"><strong>Product</strong></a><br />Positioning, V1 scope and actors.</td></tr>
<tr><td><a href="02-domain/README.md"><strong>Domain</strong></a><br />Discovery readiness, terminology and rules.</td><td><a href="03-design/README.md"><strong>Design</strong></a><br />Design evidence and future system guidance.</td></tr>
<tr><td><a href="04-architecture/README.md"><strong>Architecture</strong></a><br />C4, ADRs, drivers and pre-DDD baseline.</td><td><a href="05-data/README.md"><strong>Data</strong></a><br />AS-IS evidence and TARGET readiness.</td></tr>
<tr><td><a href="06-security/README.md"><strong>Security</strong></a><br />Evidence and architecture readiness.</td><td><a href="07-engineering/README.md"><strong>Engineering</strong></a><br />Technology and engineering practice.</td></tr>
<tr><td><a href="08-operations/README.md"><strong>Operations</strong></a><br />Runtime, CI and observability evidence.</td><td><a href="09-evolution/README.md"><strong>Evolution</strong></a><br />AS-IS to TARGET runway.</td></tr>
<tr><td><a href="10-repositories/README.md"><strong>Repositories</strong></a><br />Documentation-only independent repository index.</td><td><a href="11-reference/README.md"><strong>Reference</strong></a><br />Evidence catalogues and safe references.</td></tr>
</table>

## Current Nexa Product Ecosystem

The current product family uses exact repository identities: [Website](https://github.com/nexa-suite/website), [Platform](https://github.com/nexa-suite/platform), [Buyer Portal](https://github.com/nexa-suite/portal), [API](https://github.com/nexa-suite/api) and [Mobile](https://github.com/nexa-suite/mobile). Mobile remains documentation and native runway; no application framework is selected.

## Project lineage

Historical repositories belong to the old UPC organization and remain evidence only:

- [Legacy Backend](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-platform): predecessor .NET 10 / ASP.NET Core REST service layer.
- [Legacy WebApp](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-webapp): one unified Vue 3 / Vite / PrimeVue / Pinia application.
- [Legacy Website](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-website): previous HTML5, CSS3 and JavaScript Website lineage.
- [Academic / Historical Reference](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report): reports, requirements and historical architecture material.

Legacy URLs provide provenance. They do not define current repository identity or TARGET architecture.

## Discovery sequence

```text
Capability Mapping -> Big Picture EventStorming -> Process-Level EventStorming
-> Domain Storytelling -> Ubiquitous Language -> Subdomain classification
-> Bounded Context discovery -> Context Mapping -> Strategic DDD
```

C4 Level 3, TARGET data, security and deployment architecture wait for resulting ownership decisions.

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
