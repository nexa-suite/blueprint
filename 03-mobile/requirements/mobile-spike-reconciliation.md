---
status: accepted
maturity: BASELINED
scope: runway
owner: architecture
last-reviewed: 2026-09-20
---

# Mobile spike reconciliation

The six existing spikes remain the research/decision backlog. No spike result
is fabricated by API v0.17.0. Framework selection is already closed by
[ADR-0018](../../01-shared/architecture/decisions/adr/adr-0018-operations-mobile-native-android.md)
and [ADR-0019](../../01-shared/architecture/decisions/adr/adr-0019-buyer-mobile-flutter.md);
unrelated device and provider research remains open.

| ID | Existing spike | Reconciled question | Current result |
|---|---|---|---|
| SPIKE-001 | Select the autonomous-learning feature and external technology | Not a Mobile product authority; keep separate from domain/mobile decisions. | OPEN / course or autonomous-learning scope; no Nexa architecture change. |
| SPIKE-002 | Evaluate Native versus Cross-Platform distribution | Historical framework-selection question for Operations Mobile and Buyer Mobile. | CLOSED / SUPERSEDED for framework selection by ADR-0018 (Operations Android/Kotlin/Jetpack Compose) and ADR-0019 (Buyer Flutter/Dart Android+iOS); unrelated device/provider research remains OPEN. |
| SPIKE-003 | Evaluate Barcode / QR / GS1 scanning | Validate camera/scanner UX, identifier mapping, QR TTL/replay and future GS1 boundary. | PARTIAL; API v0.17.0 supports identifier/handoff contracts, device research pending. |
| SPIKE-004 | Evaluate Mobile local storage and offline synchronization | Define safe cache/draft/evidence staging, retry, conflict and recovery behavior per story. | PARTIAL target; no client implementation, no offline critical success or generic V1 sync. |
| SPIKE-005 | Evaluate Push Notifications and deep links | Select provider/configuration, lifecycle, deep-link authorization and retry operations. | PARTIAL; API subscription foundation exists, provider/credentials open. |
| SPIKE-006 | Evaluate Maps, live location, privacy, battery consumption and fallback | Decide whether V2 stored/location sharing is justified; V1 is external navigation handoff only. | OPEN; v0.17.0 explicitly excludes GPS/live tracking/ETA/geofencing. |

Spike completion requires evidence, owner decision and links to the affected
story/technical contract. A spike cannot create a Bounded Context.

## Master backlog linkage

The six existing Spikes remain sufficient for the expanded runway:

- SPIKE-002 is retained as provenance. Its framework-selection question is
  CLOSED / SUPERSEDED by ADR-0018 and ADR-0019; it does not reopen Android,
  Flutter, Kotlin Multiplatform or SwiftUI selection. Device, package,
  compatibility and provider research remains open where separately scoped.
- SPIKE-003 covers the identity mechanisms used by MOB-US-011, 012, 034, 047
  and 055; no Scanner or hardware Bounded Context is created.
- SPIKE-004 covers safe local staging and conflict handling for MOB-US-035 and
  066; offline state never becomes authoritative truth.
- SPIKE-005 covers MOB-US-044, 061, 062, 067 and 068 notification delivery,
  deep links and consent lifecycle.
- SPIKE-006 covers MOB-US-029, 045, 059, 060, 072 and 073 where provider,
  location, carrier or automation decisions remain open.
- SPIKE-001 remains the separate autonomous-learning investigation and does
  not create a Mobile story or Product capability.
