---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-08-15
---

# Blueprint publication policy

The Blueprint publishes authored architecture and documentation only. The candidate tree is reviewed against the filesystem, the manifest and the validator before a push.

## Included

- Governance, product, discovery-readiness, design guidance, architecture, data/security readiness, engineering and operations evidence.
- Safe repository maps and immutable remote evidence pointers.
- Authored Markdown, Structurizr DSL and its generated workspace representation when the generated-file policy is explicit.
- Safe validation tooling and CI configuration.

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

The check covers links, metadata, personal paths, forbidden files, nested repositories, secret heuristics and the canonical Structurizr source/views. An ignore rule never makes unsafe content publishable.
