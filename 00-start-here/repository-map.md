# Repository map

Nexa is a coordinated set of independent Git repositories. This Blueprint
documents boundaries; it does not contain application source or a monorepo
checkout. Repository URLs are stable references. Branches, local SHAs and
working-tree state belong to each repository's own audit.

## Canonical repositories

| Repository | Role | Status |
|---|---|---|
| [Blueprint](https://github.com/nexa-suite/blueprint) | Product, Domain, Design governance, C4, evidence and delivery documentation | Canonical documentation |
| [Design Lab](https://github.com/nexa-suite/design-lab) | Executable Design System source and visual validation companion | Canonical implementation source for design |
| [API](https://github.com/nexa-suite/api) | Business and integration authority | Application; read-only from Blueprint |
| [Platform](https://github.com/nexa-suite/platform) | Internal Tenant Web Platform | Application; read-only from Blueprint |
| [Portal](https://github.com/nexa-suite/portal) | Buyer Portal | Application; read-only from Blueprint |
| [Website](https://github.com/nexa-suite/website) | Public acquisition and contact/demo entry point | Application; read-only from Blueprint |
| [Mobile](https://github.com/nexa-suite/mobile) | Operations Mobile and Buyer Mobile product projection | Operations partial evidence is on unmerged feature branches; Buyer implementation is not verified; read-only from Blueprint |
| [Mobile academic report](https://github.com/nexa-suite/mobile-report) | Current AV1 academic report and research evidence source | Academic/research evidence; not Product, Domain or Architecture authority |
| [Historical Web academic repository](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report) | Historical coursework and Web research evidence | Historical reference; not current Mobile authority |

## Authority order

1. Explicit accepted Owner decisions.
2. Current canonical `nexa-suite/blueprint` documentation.
3. Verified modern implementation evidence as AS-IS.
4. Current Design Lab evidence for UX/UI.
5. Current research/academic evidence after classification and provenance
   review.
6. Historical evidence.
7. Legacy repositories.
8. Previous summaries, generated reports or assumptions only after independent
   verification.

Legacy is evidence, not authority. AS-IS is evidence, not TARGET; OPEN and
FUTURE/RUNWAY remain distinct from accepted Product and Architecture decisions.

Applications are not modified by Blueprint documentation work. Application
repositories must be audited independently for branch, release and local
working-tree state.

## Local checkout convention

Preferred local layout is one direct checkout per repository under the local
workspace, for example:

```text
nexa-suite/
├── blueprint/
├── design/
├── api/
├── platform/
├── portal/
├── website/
├── mobile/
└── legacy/
```

These are independent Git roots. Do not initialize a parent repository, nest
`.git` metadata, copy application source into Blueprint, or treat an old
`10-repositories/` path as canonical. Local legacy material stays evidence and
must not silently enter Product, Domain or requirements truth.

## Reference links

- [Source of Truth](../01-shared/engineering/governance/source-of-truth.md)
- [Shared Design source relationship](../01-shared/design/design-system/source-of-truth.md)
- [Academic Mobile projection](../90-academic/mobile/course-1acc0238/README.md)
- [Academic evidence map](../90-academic/web-applications/evidence-map.md)
