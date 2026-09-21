# Structurizr source support

`01-shared/architecture/c4/structurizr/` is the versioned canonical DSL and
generated-workspace location. It contains no Docker runtime definition.

The local-only runtime is intentionally outside Blueprint at
`../complementary/structurizr/`, with Compose project name
`nexa-blueprint-architecture`, pinned image `structurizr/structurizr:2026.06.28`
and host port `9090` mapped to container port `8080`.

```bash
# from the blueprint/ repository root
cd ../complementary/structurizr
docker compose up -d
docker compose logs -f structurizr
docker compose down
```

Open http://localhost:9090. The runtime mounts the canonical DSL read-only;
validation and exports remain driven from Blueprint tooling.
