---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-08-14
---

# Blueprint publication manifest

This is the publication boundary for `nexa-suite/blueprint`. It is checked against the filesystem and candidate Git tree before a push. GitHub visibility, releases and branch governance are separate controls.

| Area | Publication decision | Boundary |
|---|---|---|
| `00-governance` | INCLUDE | Safe governance and authority documents |
| `01-product` | INCLUDE | Accepted and clearly labeled product documentation |
| `02-domain` | INCLUDE | Discovery readiness and authored evidence; no invented DDD |
| `03-design` | INCLUDE | Safe authored design sources and indexes |
| `04-architecture` | INCLUDE | Accepted C4/ADR sources and pre-DDD baseline |
| `05-data` | INCLUDE | AS-IS indexes and safe readiness documentation |
| `06-security` | INCLUDE | Evidence indexes; no secrets or false final architecture |
| `07-engineering` | INCLUDE | Safe engineering baselines |
| `08-operations` | INCLUDE | Safe local/runtime evidence and production-gap indexes |
| `09-evolution` | INCLUDE | Roadmap and runway documentation |
| `10-repositories` | INCLUDE DOCUMENTATION ONLY | Repository maps and references; not application clones |
| `11-reference` | INCLUDE SAFE/AUTHORED EVIDENCE ONLY | No secrets, dumps, private binaries or external copyrighted source |
| `90-academic` | INCLUDE IF GOVERNANCE ALLOWS | Academic mapping remains non-authoritative |
| `tooling` | INCLUDE SAFE TOOLING | No machine-specific secrets or transient runtime output |
| `AGENTS.md` | INCLUDE | Workspace operating instructions |
| `README.md` | INCLUDE | Blueprint entry point |

## Exclude from Blueprint

- `10-repositories/active/*` local application checkouts.
- Local secrets, credentials, tokens, `.env` files and provider configuration.
- Temporary runtime data, build output, caches, logs, screenshots or generated artifacts unless explicitly authored and safe.
- External copyrighted books, PDFs or copied course material.
- Git metadata, worktrees and release-management state.

The authoritative allowlist is the reviewed candidate tree, not this table alone. A validator must reject secrets, private material, nested Git metadata, active checkouts, runtime state, personal machine paths and unreviewed binaries. `REVIEW_BEFORE_REPUBLICATION` assets remain excluded.
