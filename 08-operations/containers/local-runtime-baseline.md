---
status: reference
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-12
---

# Local runtime baseline

Verified local runtime topology for the Modern V1 evidence environment. This document records local execution only; it is not production deployment architecture.

## Canonical Compose

File:

`/Users/diegosandoval284/Developer/nexa-suite/10-repositories/active/api/ops/compose/modern.compose.yml`

From the API repository root:

```bash
./ops/compose/scripts/modern-up.sh
./ops/compose/scripts/modern-down.sh
```

The local environment uses the repository-owned `.env.local` without recording its values here. No secrets belong in this baseline.

## Services and classification

| Service | Port | Purpose | Classification |
|---|---:|---|---|
| API | 8080 | Nexa business and integration API | C4 PRODUCT CONTAINER + runtime service |
| Platform | 4200 | Internal role-focused web application | C4 PRODUCT CONTAINER + runtime service |
| Portal | 4300 | Buyer self-service web application | C4 PRODUCT CONTAINER + runtime service |
| PostgreSQL | internal only | V1 system database | C4 PRODUCT CONTAINER + runtime service |
| MinIO | 9000/9001 | Local binary object storage | RUNTIME IMPLEMENTATION of Object Storage |
| Mailpit | 8025 | Local email inspection | LOCAL DEV/TEST DEPENDENCY |
| ClamAV | 3310 | Malware scanning | LOCAL DEV/TEST DEPENDENCY / integration adapter |
| Stripe Mock / WireMock | 12111 | Payment provider simulation | EXTERNAL SYSTEM TEST DOUBLE |
| OpenTelemetry Collector | internal | Telemetry receive/process/export | OBSERVABILITY INFRASTRUCTURE |
| Jaeger | 16686/4318 | Local trace backend/OTLP endpoint | LOCAL OBSERVABILITY INFRASTRUCTURE |

## Runtime topology

```text
Browser
  |
  +--> Platform :4200
  +--> Portal :4300
  +--> API :8080
          |
          +--> PostgreSQL
          +--> MinIO
          +--> Mailpit
          +--> ClamAV
          +--> Stripe Mock / WireMock
          +--> OpenTelemetry Collector
                    |
                    +--> Jaeger
```

## Verified local purposes

- Platform and Portal consume the API through the local edge.
- PostgreSQL persists V1 application state and Flyway schema migrations.
- MinIO implements the local Object Storage runtime boundary.
- Mailpit receives local SMTP traffic.
- ClamAV scans uploaded content.
- WireMock simulates payment-provider behavior.
- OTEL Collector and Jaeger provide local trace evidence.

## Explicit non-claims

- This topology is not a production deployment design.
- Local images are not a production support decision.
- Mailpit is not a production email provider.
- WireMock is not Stripe.
- Jaeger local is not a production observability platform.
- MinIO local does not define the future cloud provider.
- No backup, restore, DR, SLO or production rollout is implied.
