---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-09-10
---

# Memory projection contract

Blueprint is prepared for a later generated GPT/Nexa memory pack. This document
defines the projection contract; the final pack is intentionally **not
generated** by the September 2026 reconciliation because Owner review is still
required.

## Target files

The later pack must contain exactly these conceptual projections:

| File | Canonical source family | Boundary |
|---|---|---|
| `00-NEXA-MEMORY-MANIFEST.md` | Blueprint metadata and source map | generation identity, source refs, dates and exclusions |
| `01-NEXA-CURRENT-CANON.md` | accepted Product, Domain and governance | current accepted semantics only |
| `02-NEXA-PRODUCT-BUSINESS-AND-DOMAIN.md` | shared Product, strategic DDD and glossary | Product and domain model |
| `03-NEXA-ARCHITECTURE-AND-CONTRACTS.md` | C4, architecture, contracts and data | TARGET architecture and contracts |
| `04-NEXA-CURRENT-ASIS.md` | dated live repository audit | live implementation evidence only; never copied from old memory |
| `05-NEXA-WEB-AND-MOBILE.md` | Web/Mobile projections and current research boundaries | surfaces, backlog and evidence status |
| `06-NEXA-BUSINESS-ECONOMICS.md` | `01-shared/product/economics/` | proposed/researching economics only |
| `07-NEXA-OPEN-DECISIONS.md` | open Product, Architecture and economic registers | unresolved decisions and gates |
| `08-NEXA-ACADEMIC-AND-RESEARCH-EVIDENCE.md` | `90-academic/` and `91-reference/research/` | classified evidence, not accepted truth by default |
| `09-NEXA-HISTORY-AND-SUPERSEDED.md` | historical and superseded records | provenance without resurrection |

## Generation gates

Before regeneration, maintainers must:

- fetch and record live refs and GitHub Releases for the application repos;
- re-run Blueprint validators and record the exact results;
- rebuild `04-NEXA-CURRENT-ASIS.md` from the live audit, never from a previous
  memory pack;
- preserve `TARGET`, `AS-IS`, `RESEARCHING`, `PROPOSED`, `PRODUCT ACCEPTED` and
  `PRODUCTION READY` as separate claims;
- exclude secrets, tokens, unnecessary PII and unverified release claims;
- identify the Blueprint commit and audit date in the manifest;
- obtain Owner review before treating the generated pack as an accepted
  projection.

No generated memory file is a new Product or Architecture authority. The
canonical Blueprint files remain the source.
