---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-15
---

# Architecture fitness register

These are lightweight guardrails for the accepted pre-Strategic-DDD baseline. They are not a claim that every application repository has been exhaustively verified.

| Rule | Evidence source | Current result |
|---|---|---|
| V1 C4 has exactly six containers | `04-architecture/c4/structurizr/workspace.dsl` and generated workspace | PASS after validator run |
| V1 external systems stay abstract | C4 model and relationships | PASS |
| V1 and Runway views remain distinct | C4 view definitions | PASS |
| Workspace is not a C4 Container | C4 rationale and DSL | PASS |
| Docker services are not C4 product containers | Compose evidence and C4 rationale | PASS |
| Java modules are not Bounded Contexts | API layering and discovery readiness | PASS |
| Application depends inward on ports, not Infrastructure | API layering principle | DOCUMENTED; application repository audit remains separate |
| C4 L3/component/deployment views are absent | Structurizr workspace | PASS after validator run |
| Strategic DDD outputs are absent | Domain discovery readiness | PASS |

Any future violation requires an explicit evidence-backed change and review. This register does not authorize new architecture.
