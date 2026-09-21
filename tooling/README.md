# Tooling

## Purpose

Provide safe, local documentation and architecture tooling for validating authored sources.

## Authoritative content

- [Structurizr source support](structurizr/README.md). Local runtime lives at
  `../complementary/structurizr/`, outside Blueprint and outside publication.
- [Blueprint validator](scripts/validate-blueprint.sh).
- [Structurizr semantic comparator](scripts/compare-structurizr-semantic.py).
- Tool configurations that are safe, reproducible and repository-relative.

## Current status

LOCAL TOOLING BASELINED where documented. Tooling does not define architecture or replace accepted decisions.

## Expected artifacts

Diagram validation/rendering instructions, link/lint helpers and safe documentation automation.

## Local Structurizr runtime

```bash
cd ../complementary/structurizr
docker compose up -d
docker compose logs -f structurizr
docker compose down
```

The Compose project is `nexa-blueprint-architecture`. It mounts the canonical
Blueprint Structurizr workspace read-only; no Compose runtime is versioned in
this repository.

## What must not live here

Secrets, machine-specific credentials, runtime dumps, generated application artifacts or speculative architecture.

## Related areas

[Architecture](../01-shared/architecture/README.md), [Operations](../04-delivery/README.md), [Publication policy](../01-shared/engineering/governance/publication-policy.md).
