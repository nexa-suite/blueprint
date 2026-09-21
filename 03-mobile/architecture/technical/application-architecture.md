# Mobile application architecture

Status: ACCEPTED TARGET. Both clients use one conceptual dependency flow:

Presentation / UI
Application / Use Cases
Data / Repositories
Data Sources & Platform Adapters

Presentation renders screens, owns UI state/actions/navigation and exposes
loading, empty, error, stale and conflict states. It does not call persistence
or HTTP directly. Application use cases selectively coordinate client flows,
freshness, idempotency-key reuse and explicit unknown-result/retry handling;
they never decide authoritative inventory, payment, credit, commercial
commitment, authorization or Delivery completion.

Repositories mediate remote, local and device sources, map API DTOs into client
models, carry cache/freshness/retry metadata and stage harmless drafts/evidence.
Their rendered state may be the UI local single source of truth; Nexa API
remains business authority. Cache is a Data-source concern, not a top-level
architecture layer.

Operations uses Compose, screen ViewModels, StateFlow and UDF. Buyer uses
Flutter Views/Widgets, ViewModels, reactive state and a command/action pattern.
Platform-specific code stays in adapters. Client models are DTOs, projections,
UI models or staging models, never a second Nexa Domain Model.
