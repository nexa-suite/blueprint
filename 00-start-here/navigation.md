# Navigation

One conceptual home per concern:

| Root | Question | Boundary |
|---|---|---|
| `00-start-here` | Where begin? | Navigation, status and governance pointers. |
| `01-shared` | What crosses surfaces? | Product, DDD, Design System, architecture, data, security, engineering. |
| `02-web` | How does Web work? | Website, Platform and Buyer Portal projections. |
| `03-mobile` | What is Mobile? | Two proposed apps; bounded research only. |
| `04-delivery` | What exists and what remains open? | AS-IS, runtime, quality and Production Gate. |
| `90-academic` | What supports coursework? | Isolated projections; not product authority. |
| `91-reference` | What is historical? | Legacy, research and source material. |
| `tooling` | How validate? | Repository-local scripts and tools. |

Web and Mobile do not own Bounded Contexts, Context Map, Ubiquitous Language
or shared business state machines.

For requirements, start with [Web's 37-story baseline](../02-web/requirements/current-story-baseline.md)
or [Mobile's research status](../03-mobile/requirements/requirements-status.md).
For capability derivation use [Shared actors](../01-shared/product/actors.md),
[Shared capabilities](../01-shared/product/capability-map.md) and the
[requirements standard](../01-shared/product/requirements-standard.md).
