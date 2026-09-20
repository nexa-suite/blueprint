---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# ADR-0018: Operations Mobile Native Android

## Status

Accepted TARGET.

## Context

Operations Mobile is a controlled workforce client for warehouse, dispatch and
Driver work. It needs Android device capabilities without creating a Mobile
Domain authority or separate backend.

## Decision

Use native Android, Kotlin and Jetpack Compose. Baseline: Kotlin 2.4.x, Compose
BOM 2026.09.00, compile/target SDK 37, min SDK 29, AGP 9.4.x, Gradle 9.6.x and
JDK 17 build tooling. Device boundaries include CameraX-style capture, barcode
or QR identification adapter, Android Keystore, DataStore, Room when structured
staging/cache is justified, WorkManager and external navigation handoff.

## Consequences

API 29 is a workforce-device compatibility assumption to verify before Product
Acceptance. No generic offline authority, tracking persistence, Mobile Bounded
Context, C4 Software System or database is created.

## Alternatives

Rejected keeping framework selection open, treating scanning/device capabilities
as Bounded Contexts and creating a Mobile backend.

## Evidence

[Current decisions](../../../product/current-decisions.md) and
[Technology baseline](../../technology-baseline.md).

## Supersedes / Superseded by

Supersedes the open Operations client-framework choice. No superseding ADR.
