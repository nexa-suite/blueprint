---
status: draft
maturity: DRAFT
scope: cross-cutting
owner: domain
last-reviewed: 2026-08-19
---

# Domain discovery readiness

Product baseline input: **FROZEN / CLOSED**. Domain discovery outputs are **PROPOSED / READY FOR BUSINESS ARCHITECT REVIEW** and must understand domain structure, not redefine Product V1.

| Future artifact | Status | What exists now | What resolves it |
|---|---|---|---|
| Capability Mapping | PROPOSED / READY FOR REVIEW | Closed Product baseline, personas, known rules and AS-IS behavior evidence | Business Architect review |
| EventStorming | PROPOSED / READY FOR REVIEW | Business behavior evidence and open lifecycle questions | Process validation |
| Domain Storytelling | PROPOSED / READY FOR REVIEW | Selected responsibility and exception stories | Workshop validation |
| Ubiquitous Language | PROPOSED / READY FOR REVIEW | Contextual terminology and rejected synonyms | Business language review |
| Subdomains | PROPOSED / READY FOR REVIEW | Differentiation/value/complexity hypotheses | Strategic DDD review |
| Bounded Contexts | PROPOSED / READY FOR REVIEW | Ownership, lifecycle and invariant candidates | Business Architect acceptance |
| Context Map | PROPOSED / READY FOR REVIEW | Directional authority and adapter hypotheses | Boundary review |

## Explicit non-decisions

The current API modules, PostgreSQL schemas and frontend feature areas are implementation evidence only. None is a declared capability, subdomain, Bounded Context, aggregate or context-map relationship.

The Product headings in `01-product/` are not a Capability Map. Do not derive capabilities, subdomains or Bounded Contexts from current folder/module names.

## Discovery input boundary

The current product baseline, personas, known rules, AS-IS behavior evidence and the [legacy evidence register](../11-reference/legacy-ecosystem-report/legacy-evidence-register.md) are inputs. The proposed outputs are maintained in [strategic-ddd](strategic-ddd/README.md) and remain review-gated.

## Open evidence questions

Use the [architecture readiness gaps](../11-reference/as-is/architecture-readiness-gaps.md) as the evidence register. Do not answer those questions by renaming current folders or schemas.
