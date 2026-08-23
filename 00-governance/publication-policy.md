---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-08-19
---

# Blueprint publication policy

The Blueprint publishes authored architecture and documentation only. This document is the single durable publication authority. Candidate tree is reviewed against filesystem and validator before push.

## Included

- Governance, product, discovery-readiness, design guidance, architecture, data/security readiness, engineering and operations evidence.
- Safe repository maps and immutable remote evidence pointers.
- Authored Markdown, Structurizr DSL and its generated workspace representation when the generated-file policy is explicit.
- Safe validation tooling and CI configuration.

## Publication matrix

| Area | Decision | Boundary |
|---|---|---|
| `00-governance` | INCLUDE | Authority, decisions, maturity and publication controls |
| `01-product` | INCLUDE | Accepted Product baseline and clearly labeled open decisions |
| `02-domain` | INCLUDE | Discovery readiness and known evidence; no invented DDD |
| `03-design` | INCLUDE | Authored design guidance and classified historical evidence |
| `04-architecture` | INCLUDE | Accepted C4/ADR, AS-IS audit and PRE-V1 TARGET construction architecture |
| `05-data`, `06-security` | INCLUDE | Accepted PRE-V1 ownership, concurrency and security construction target; production gates explicit |
| `07-engineering`, `08-operations`, `09-evolution` | INCLUDE | Quality, construction, runtime evidence and controlled runway guidance |
| `10-repositories` | DOCUMENTATION ONLY | Maps and immutable pointers; no application clones |
| `11-reference` | SAFE EVIDENCE ONLY | No secrets, dumps, private binaries or copyrighted source |
| `90-academic` | ISOLATED | Non-authoritative academic mapping |
| `tooling`, `AGENTS.md`, `README.md` | INCLUDE | Safe reproducible repository guidance |

## Excluded

- `10-repositories/active/` and `10-repositories/runway/` working trees, `.git` metadata and application history.
- `.env*`, credentials, tokens, private keys, dumps, runtime volumes, caches, logs, temporary worktrees and machine-local state.
- Commercial books, PDFs, EPUBs and other binaries without explicit redistribution rights.
- Legacy assets marked `REVIEW_BEFORE_REPUBLICATION`, copied source trees and unsafe screenshots.
- Generated output unless it is an intentional, reviewed artifact such as `04-architecture/c4/structurizr/workspace.json`.

## Required checks

Run:

```bash
bash tooling/scripts/validate-blueprint.sh
```

The check covers links, metadata, personal paths, forbidden files, nested repositories, secret heuristics and canonical Structurizr source/views. An ignore rule never makes unsafe content publishable.
