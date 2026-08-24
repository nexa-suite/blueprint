---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: domain
last-reviewed: 2026-08-23
---

# Domain Discovery

Product baseline and Strategic DDD input: **ACCEPTED**. Discovery material is
evidence input, not semantic authority, and must not redefine Product V1.

| Concern | Research status | Evidence | Next decision |
|---|---|---|---|
| Capability Mapping | PARTIALLY_VALIDATED | Accepted Product baseline, personas, rules and AS-IS evidence | future capability refinement |
| EventStorming | PARTIALLY_VALIDATED | Accepted business facts, sequences and exceptions | event contract refinement |
| Domain Storytelling | PARTIALLY_VALIDATED | Responsibility and exception stories | future process evidence |
| Ubiquitous Language | VALIDATED | Accepted terms and rejected synonyms | explicit translation decision |
| Subdomains | VALIDATED | Accepted Core/Supporting/Generic classification | strategic decision replacement |
| Bounded Contexts | 11 — FROZEN | Accepted ownership and lifecycle authority | explicit decision replacement |
| Context Map | VALIDATED | Accepted authority direction and translations | contract evolution |

## Explicit non-decisions

The current API modules, PostgreSQL schemas and frontend feature areas are implementation evidence only. None becomes a strategic boundary merely by sharing a name with a Bounded Context.

The Product headings in `01-shared/product/` are not a Capability Map. Do not derive capabilities, subdomains or Bounded Contexts from current folder/module names.

## Discovery input boundary

The current product baseline, personas, known rules, AS-IS behavior evidence and the [legacy evidence register](../../../91-reference/legacy/legacy-ecosystem-report/legacy-evidence-register.md) are inputs. Accepted outputs are maintained in [Strategic DDD](../strategic-ddd/README.md); future discovery must preserve source-of-truth hierarchy.

## Open evidence questions

Use the [architecture readiness gaps](../../../04-delivery/as-is/architecture-readiness-gaps.md) as the evidence register. Do not answer those questions by renaming current folders or schemas.
