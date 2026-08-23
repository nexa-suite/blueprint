---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: domain
last-reviewed: 2026-08-23
---

# Domain discovery readiness

Product baseline and Strategic DDD input: **FROZEN / CLOSED**. Domain discovery outputs are **ACCEPTED / BASELINED** for PRE-V1 and must preserve domain structure, not redefine Product V1.

| Future artifact | Status | What exists now | What resolves it |
|---|---|---|---|
| Capability Mapping | BASELINED | Accepted Product baseline, personas, rules and AS-IS evidence | future capability refinement |
| EventStorming | BASELINED | Accepted business facts, sequences and exceptions | event contract refinement |
| Domain Storytelling | BASELINED | Responsibility and exception stories | future process evidence |
| Ubiquitous Language | BASELINED | Accepted terms and rejected synonyms | explicit translation decision |
| Subdomains | BASELINED | Accepted Core/Supporting/Generic classification | strategic decision replacement |
| Bounded Contexts | 11 — FROZEN | Accepted ownership and lifecycle authority | explicit decision replacement |
| Context Map | BASELINED | Accepted authority direction and translations | contract evolution |

## Explicit non-decisions

The current API modules, PostgreSQL schemas and frontend feature areas are implementation evidence only. None becomes a strategic boundary merely by sharing a name with a Bounded Context.

The Product headings in `01-product/` are not a Capability Map. Do not derive capabilities, subdomains or Bounded Contexts from current folder/module names.

## Discovery input boundary

The current product baseline, personas, known rules, AS-IS behavior evidence and the [legacy evidence register](../11-reference/legacy-ecosystem-report/legacy-evidence-register.md) are inputs. Accepted outputs are maintained in [strategic-ddd](strategic-ddd/README.md); future discovery must preserve the source-of-truth hierarchy.

## Open evidence questions

Use the [architecture readiness gaps](../11-reference/as-is/architecture-readiness-gaps.md) as the evidence register. Do not answer those questions by renaming current folders or schemas.
