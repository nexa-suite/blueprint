---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# Architecture fitness register

These are lightweight guardrails for the accepted PRE-V1 baseline. They are not a claim that every application repository has been exhaustively verified.

| Rule | Evidence source | Current result |
|---|---|---|
| V1 C4 has exactly six V1 containers; Runway future containers remain separate | `01-shared/architecture/c4/structurizr/workspace.dsl` and generated workspace | PASS after validator run |
| V1 external systems stay abstract | C4 model and relationships | PASS |
| V1 and Runway views remain distinct | C4 view definitions | PASS |
| Workspace is not a C4 Container | C4 rationale and DSL | PASS |
| Docker services are not C4 product containers | Compose evidence and C4 rationale | PASS |
| Java modules are not Bounded Contexts | API layering and discovery readiness | DOCUMENTED; application repository audit remains separate |
| Application depends inward on ports, not Infrastructure | API layering principle | DOCUMENTED; application repository audit remains separate |
| Selective C4 L3/L4 views are explicit; deployment remains absent | Structurizr workspace and code views | BASELINED; technical target only |
| Strategic DDD outputs are accepted and linked | Domain discovery readiness | ACCEPTED / 11 Bounded Contexts FROZEN |
| Canonical DSL and committed generated workspace remain semantically equivalent | `tooling/scripts/validate-blueprint.sh` and `compare-structurizr-semantic.py` | PASS after validator run; stale semantic drift is a CI failure |

Any future violation requires an explicit evidence-backed change and review. This register does not authorize new architecture.
