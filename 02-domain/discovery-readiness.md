---
status: draft
maturity: DRAFT
scope: cross-cutting
owner: domain
last-reviewed: 2026-08-18
---

# Domain discovery readiness

Product baseline input: **READY / FROZEN**. Product questions are no longer the primary blocker. Domain discovery remains **NOT STARTED** and must understand domain structure, not decide what Product V1 should be.

| Future artifact | Status | What exists now | What resolves it |
|---|---|---|---|
| Capability Mapping | READY / NOT STARTED | Closed Product baseline, personas, known rules and AS-IS behavior evidence | Collaborative Capability Mapping |
| EventStorming | NOT STARTED | Business behavior evidence and open lifecycle questions | EventStorming |
| Domain Storytelling | NOT STARTED | Flow references and observed behavior evidence | Domain Storytelling |
| Ubiquitous Language | NOT STARTED | Current terminology evidence with semantic collisions | Discovery and Strategic DDD |
| Subdomains | NOT STARTED | No accepted decomposition | Strategic DDD |
| Bounded Contexts | NOT STARTED | No accepted boundaries | Strategic DDD |
| Context Map | NOT STARTED | No accepted context relationships | Strategic DDD |

## Explicit non-decisions

The current API modules, PostgreSQL schemas and frontend feature areas are implementation evidence only. None is a declared capability, subdomain, Bounded Context, aggregate or context-map relationship.

The Product headings in `01-product/` are not a Capability Map. Do not derive capabilities, subdomains or Bounded Contexts from current folder/module names.

## Discovery input boundary

The current product baseline, personas, known rules, AS-IS behavior evidence and the [legacy evidence register](../11-reference/legacy-ecosystem-report/legacy-evidence-register.md) are workshop inputs only. They are not a Capability Map, EventStorming board, Domain Storytelling result, Ubiquitous Language, subdomain model, Bounded Context model or Context Map.

## Open evidence questions

Use the [architecture readiness gaps](../11-reference/as-is/architecture-readiness-gaps.md) as the evidence register. Do not answer those questions by renaming current folders or schemas.
