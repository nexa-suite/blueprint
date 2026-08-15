---
status: reference
maturity: HISTORICAL
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-12
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
