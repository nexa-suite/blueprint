---
status: reference
source: ../structurizr/workspace.dsl
format: SVG + PNG
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-24
---

# Versioned C4 visuals

These SVGs and same-basename PNGs are versioned review artifacts generated
from the canonical local Structurizr workspace. SVG is the vector source for
review; PNG is the quick visual preview. They are not an alternative source
of architecture semantics.

Source of truth:

- DSL workspace: [Structurizr workspace](../structurizr/workspace.dsl)
- Local renderer: [Structurizr README](../structurizr/README.md)

The folders map directly to the C4 levels. These manually uploaded exports are
canonical review evidence for this Blueprint cut; the Structurizr DSL remains
the semantic source and `structurizr/workspace.json` is the reviewed mirror.

- `l1/`: system context views.
- `l2/`: container views.
- `l3/`: selected technical/component views.

Regenerate after a deliberate DSL change from:

```sh
cd 01-shared/architecture/c4/structurizr
docker compose up
```

Then use Structurizr Local at `http://localhost:9090`, select the requested
view, and export it as SVG. Keep filenames aligned with the Structurizr view
keys. Legend/key exports are not versioned here; the diagrams remain the
reviewable canonical visual artifacts.
