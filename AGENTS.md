# Repository Working Agreement

## Authority

This repository is the canonical Nexa Product, Domain and accepted architecture
decision source within the accepted authority chain. Before semantic work,
consult the current repository sources, including:

- `01-shared/product/current-decisions.md`;
- `01-shared/product/owner-decisions-2026-09.md`;
- `01-shared/engineering/governance/source-of-truth.md`;
- `01-shared/engineering/governance/publication-policy.md`.

Keep AS-IS, TARGET, FUTURE, OPEN and HISTORICAL states explicit. Verified
implementation evidence does not silently change accepted Product or Domain
meaning. Legacy is historical evidence only.

## Repository state

- Inspect the actual branch, worktree, remote metadata and working tree before
  editing.
- Fetch remote metadata before creating new work when permitted; do not merge
  fetched changes into a user's working branch.
- Preserve unrelated local work. Use an isolated worktree when the checkout is
  dirty.

## Architecture and evidence

- Do not derive Bounded Contexts from code structure, packages, modules,
  schemas, endpoints or repository folders.
- Preserve DDD, C4, data, security, reliability and Product consistency.
- Do not create C4 L3 views before the accepted Strategic DDD boundary and
  ownership are established.
- Major architectural changes require explicit accepted evidence. Do not alter
  Product or Domain semantics for implementation convenience.
- Keep diagrams and generated representations traceable to their source. They
  must not silently diverge from source documents.
- Distinguish proposal, target, implementation, verification, acceptance and
  production readiness. Never promote a TARGET or historical artifact into an
  implementation claim.

## Publication and validation

- Read the repository publication policy before publication work. Do not modify
  Git or release governance unless the task explicitly includes it.
- Validate relevant architecture tooling after architecture changes. The
  repository validator is:

  ```bash
  bash tooling/scripts/validate-blueprint.sh
  ```

- Report only checks actually executed. Do not fabricate diagram renders,
  metrics, acceptance, release readiness or deployment evidence.

## SCM and artifacts

- Follow the repository's current GitFlow and publication policy.
- Use Conventional Commits and preserve real authorship and signatures.
- Do not force-push, rewrite shared history, create fake commits, invent
  contributors, merge automatically, create releases or create tags for this
  governance change.
- Repository-facing artifacts must be neutral, professional and free of
  internal orchestration residue, temporary placeholders and AI attribution.

## Final handoff

Provide factual result, changes, validation, commits, risks, open decisions and
unverified items. Preserve historical evidence as historical and do not claim a
documentation baseline is publishable without the relevant evidence.
