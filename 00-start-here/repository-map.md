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
| [Mobile](https://github.com/nexa-suite/mobile) | Operations Mobile and Buyer Mobile runway | Application; read-only from Blueprint |
| [Academic report](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report) | Historical coursework and product research evidence | Reference; not authority |

## Authority order

1. Blueprint Product and accepted Domain decisions.
2. Design Lab executable visual evidence for Design System consumption.
3. API contracts and application repositories for AS-IS implementation evidence.
4. Academic report and legacy repositories for dated research and migration
   evidence only.

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
- [Academic evidence map](../90-academic/web/evidence-map.md)
