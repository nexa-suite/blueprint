---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# Mobile module boundaries

Both clients are one accepted TARGET C4 container each. Gradle modules and
Flutter folders are construction boundaries, never Bounded Contexts, separate
servers or a second Nexa Domain Model.

## Operations Mobile

The Android/Kotlin/Jetpack Compose client may organize `app`, `core`, feature
areas for access, warehouse, dispatch and delivery, plus network, local
staging, security, Design System and test support. Feature ownership follows
client responsibilities, not `:bc01`-style modules. API remains the authority
for tenant scope, lifecycle, inventory, credit and delivery facts.

## Buyer Mobile

The Flutter/Dart Android+iOS client is feature-first: `app`, `core`,
`features`, client API/data adapters, local drafts/cache, platform adapters,
Design System and tests. It does not create a generic `domain/entities` layer
that duplicates Nexa aggregate semantics.

## Dependency rule

Presentation → ViewModel / action coordinator → client use case → repository →
remote or local adapter. UI does not call HTTP, Room, DataStore, secure storage
or platform APIs directly. Client models are DTOs, projections, view state or
temporary staging records; they do not own authoritative business rules.
