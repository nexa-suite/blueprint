---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# Mobile composition, DI and navigation

Each client has one explicit composition root. It assembles API adapters,
repository implementations, secure-session/context support, feature routes and
platform adapters without making the client an authority for tenant or business
state.

- Operations uses Hilt for Android dependency composition and stable Navigation
  3 `1.1.x` for route composition. Compose screens expose state/events; screen
  ViewModels own presentation orchestration and UDF state reduction.
- Buyer uses `provider` for composition/state and `go_router` for route
  composition. Views/Widgets call ViewModels and immutable Commands rather
  than repositories or platform adapters directly.
- Navigation must preserve authorized context, surface unavailable/stale state,
  and never manufacture permissions from a deep link or cached route argument.

Framework composition is construction guidance, not proof that either client,
route graph or dependency graph has been implemented.
