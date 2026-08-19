# Operations

## Purpose

Index the canonical local runtime, Docker/Compose, observability and CI evidence, while separating production-readiness gaps from local proof.

## Authoritative content

- [Local runtime baseline](containers/local-runtime-baseline.md).
- [Docker runtime architecture evidence](containers/compose-runtime-architecture-evidence.md).
- The distinction between C4 containers, local Docker services and future deployment is maintained in the [C4 model rationale](../04-architecture/c4/README.md) and the runtime mapping in the Compose evidence.
- Production and operational gaps in [AS-IS evidence](../11-reference/as-is/architecture-readiness-gaps.md).
- Repository-specific CI and runbooks remain in independent application repositories.
- [Runtime and reliability TARGET](runtime-reliability-target.md) records proposed operational contracts and open production gates.

## Current status

Canonical local Compose and observability are BASELINED as local evidence. Production deployment/cloud architecture, providers, secrets, backup/restore, disaster recovery, SLI/SLO, alerting, rollback and runbooks are NOT STARTED or NOT DEFINED as applicable.

## Expected artifacts

Local runtime, container guidance, observability baseline, CI evidence, reliability records, production-readiness gaps and future deployment/cloud architecture.

## What must not live here

Local Compose presented as production architecture, credentials, unverified provider/SLA claims or application source changes.

## Related areas

[Data](../05-data/README.md), [Security](../06-security/README.md), [Engineering](../07-engineering/README.md), [Evolution](../09-evolution/README.md).
