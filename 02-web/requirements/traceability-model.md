---
status: accepted
maturity: FROZEN
scope: v1
owner: product
last-reviewed: 2026-08-24
---

# Web Requirements Traceability Model

The frozen direction is:

Story -> Epic namespace -> Surface -> Actor -> Capability/family -> Priority ->
Owning Bounded Context -> Process/state -> Business rule -> Event ->
UX/research evidence -> implementation evidence -> validation result.

The [derivation source map](derivation-sources.md) is the index. Each refined
story must link to exact capability, actor, domain rule/state/event, research
artifact and implementation evidence. Historical research must retain
provenance and current interpretation.

The current namespaced catalog is WEB-US-001 through WEB-US-133. The former
US-001 through US-037 register is superseded historical context. No silent
one-to-one mapping is implied; future review may classify stories as KEEP,
REFINE, SPLIT, MERGE, SUPERSEDE or DROP and record explicit mapping.
