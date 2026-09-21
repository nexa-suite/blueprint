---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-09-20
---

# Technology baseline

This document records the verified current technology baseline. It is not a technology strategy, upgrade proposal or production vendor decision.

## Application

| Technology | Baseline status |
|---|---|
| Java target | `CURRENT BASELINE`: Java 25 |
| Spring Boot | `CURRENT BASELINE`: 4.1.0 |
| Spring Modulith | `CURRENT BASELINE`: 2.1.0 |
| Angular | `CURRENT BASELINE`: 22 |
| TypeScript | `CURRENT BASELINE`: 6.0.x |
| RxJS | `CURRENT BASELINE`: 7.8 |
| Angular Material/CDK | `CURRENT BASELINE`: 22 |

## Mobile client TARGET

These are accepted construction assignments. They do not claim a generated
client, integrated runtime, solution validation or Product Acceptance.

| Client | Accepted TARGET | Construction baseline | Boundary |
|---|---|---|---|
| Nexa Operations Mobile | Native Android / Kotlin / Jetpack Compose | Kotlin `2.4.x` (reviewed stable reference `2.4.20`); Compose BOM `2026.09.00`; compile/target SDK `37`; min SDK `29`; AGP `9.4.x`, Gradle `9.6.x`, JDK `17` build tooling | API 29 is a controlled-workforce compatibility assumption to verify against actual rugged-device fleet before Product Acceptance. CameraX-style boundary, barcode/QR adapter, Android Keystore, DataStore, Room when structured staging/cache is justified, WorkManager and external navigation remain client/platform concerns. |
| Nexa Buyer Mobile | Flutter / Dart for Android + iOS | Flutter `3.47.x` (reviewed stable reference `3.47.2`); Dart `3.13.x` (reviewed stable reference `3.13.2`); Android min SDK `24`, compile SDK `37`, target SDK construction baseline `36`; iOS minimum `15` | Android API 37 target compatibility is a V1 acceptance-hardening gate once selected Flutter toolchain/plugins are verified. Flutter Web, desktop targets and a large offline database are not V1 surfaces. |

### Accepted mobile construction detail

Operations construction uses Hilt and stable Jetpack Navigation 3 `1.1.x`.
CameraX feeds ML Kit Barcode Scanning with the bundled model; manual
identification fallback is mandatory. Android Keystore protects local key
material, DataStore holds small settings/context metadata, Room is permitted
only for justified structured cache/staging, and WorkManager handles safe
durable retry/background work. These are TARGET construction decisions, not
implementation evidence.

Buyer construction uses the Flutter package `provider` for dependency
composition/state foundation and `go_router` for routing/deep links. Flutter
native dependencies use Swift Package Manager as the modern path; CocoaPods
remains an available compatibility path. Riverpod, BLoC, GetX, Dio, a Flutter
relational database package, analytics vendor and secure-storage package are
not selected by this baseline. The package `provider` means client
composition/state tooling, not an external service provider.

Version references were checked against official Kotlin, Android Developers and
Flutter documentation on 2026-09-20. Patch-level build versions stay out of C4
diagrams. Flutter secure-storage/local-database package choice remains an
implementation decision.

## Data

| Technology | Baseline status |
|---|---|
| PostgreSQL | `CURRENT BASELINE`: 18.4 |
| Flyway | `CURRENT BASELINE`: schema migration mechanism |
| JPA/Hibernate | `CURRENT BASELINE`: persistence stack |
| Spring JDBC | `CURRENT BASELINE`: explicit SQL/persistence boundary |
| MinIO | `LOCAL IMPLEMENTATION`: local Object Storage implementation |
| S3-compatible Object Storage | `TARGET ABSTRACTION`: provider remains pending |

## Security and integration

| Technology | Baseline status |
|---|---|
| Spring Security | `CURRENT BASELINE` |
| JWT | `CURRENT BASELINE` |
| ClamAV | `LOCAL IMPLEMENTATION`: malware scanning adapter |
| Stripe | `PRODUCTION DECISION PENDING`: provider adapter and local mock exist |
| SMTP | `CURRENT BASELINE`: email integration boundary |
| Mailpit | `LOCAL ONLY`: development/test email sink |
| Maps adapter | `PRODUCTION DECISION PENDING`: provider remains open |
| WireMock | `TEST ONLY`: external-system test double |

## Observability

| Technology | Baseline status |
|---|---|
| Spring Actuator | `CURRENT BASELINE` |
| OpenTelemetry | `CURRENT BASELINE` |
| OTEL Collector | `LOCAL IMPLEMENTATION`: local telemetry pipeline |
| Jaeger | `LOCAL OBSERVABILITY BACKEND` |

Production telemetry backend, retention, alerting and ownership remain production decisions pending.

## Testing

| Technology | Baseline status |
|---|---|
| JUnit | `CURRENT BASELINE` |
| Testcontainers | `CURRENT BASELINE` |
| ArchUnit | `CURRENT BASELINE` |
| Vitest | `CURRENT BASELINE` |
| Playwright | `CURRENT BASELINE` |
| k6 | `TEST ONLY`: load scripts/gates |
| OWASP ZAP | `TEST ONLY`: security scan gate |
| WireMock | `TEST ONLY`: external-system simulation |

## Delivery and supply chain

| Technology | Baseline status |
|---|---|
| Docker | `CURRENT BASELINE` |
| Docker Compose | `CURRENT BASELINE`: local multi-container topology |
| GitHub Actions | `CURRENT BASELINE`: CI/security workflows |
| CodeQL | `CURRENT BASELINE`: code scanning workflow |
| Trivy | `CURRENT BASELINE`: vulnerability/secret/misconfiguration scanning |
| SBOM/provenance | `CURRENT BASELINE`: API supply-chain workflow |

## Java baseline note

Canonical application target:

```text
Java 25
```

Observed developer runtime:

```text
Java 26.0.1
```

Java 25 remains the intended V1 build/runtime baseline unless a later Technical Architecture decision changes it. No build configuration was modified.

## Boundary

This baseline does not select a future cloud vendor, replace current technologies, or authorize upgrades. It records facts needed before Capability Mapping and later architecture work.
