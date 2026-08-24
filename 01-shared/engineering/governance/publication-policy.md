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
| `00-start-here` | INCLUDE | Authority, decisions, maturity and publication controls |
| `01-shared` | INCLUDE | Shared product, DDD, Design System, architecture, data, security and engineering |
| `02-web` | INCLUDE | Web surface, requirement, journey and quality contracts |
| `03-mobile` | RUNWAY | Proposed/discovery-only native surface; no invented requirements |
| `04-delivery` | INCLUDE | AS-IS, runtime, CI/CD, quality and production-gate evidence |
| `90-academic` | ISOLATED | Coursework projections and provenance only |
| `91-reference` | SAFE EVIDENCE ONLY | Historical, research and source material |
| `90-academic` | ISOLATED | Non-authoritative academic mapping |
| `91-reference` | SAFE EVIDENCE ONLY | Historical, legacy, audit and external evidence |
| `tooling`, `AGENTS.md`, `README.md` | INCLUDE | Safe reproducible repository guidance |

## Excluded

- Local application working trees outside this repository (`../api`, `../platform`, `../portal`, `../website`, `../mobile`), `.git` metadata and application history.
- `.env*`, credentials, tokens, private keys, dumps, runtime volumes, caches, logs, temporary worktrees and machine-local state.
- Commercial books, PDFs, EPUBs and other binaries without explicit redistribution rights.
- Legacy assets marked `REVIEW_BEFORE_REPUBLICATION`, copied source trees and unsafe screenshots.
- Generated output unless it is an intentional, reviewed artifact such as `01-shared/architecture/c4/structurizr/generated/workspace.json`.

## Required checks

Run:

```bash
bash tooling/scripts/validate-blueprint.sh
```

The check covers links, metadata, personal paths, forbidden files, nested repositories, secret heuristics and canonical Structurizr source/views. An ignore rule never makes unsafe content publishable.
