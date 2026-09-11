---
status: reference
maturity: CLOSED WITH CAVEAT
scope: cross-cutting
owner: delivery
last-reviewed: 2026-09-10
---

# Live repository baseline — 2026-09-10

**Classification:** `IMPLEMENTATION_EVIDENCE` / `TECHNICALLY VERIFIED` for the
named ref and release inventory checks below. This is AS-IS evidence, not
Product Acceptance, System Acceptance or Production Readiness.

## Audit method

On 2026-09-10, maintainers fetched all refs with `git fetch --all --prune` in
the current Blueprint, API, Platform, Portal, Website, Mobile, Design Lab and
Mobile Report checkouts and queried GitHub Releases with `gh`. The working-tree
state is recorded because dirty files are not release evidence.

Release listing order is not treated as semantic “latest” order. The live API
shows non-monotonic publication dates and tags; no old Blueprint version is
reused as a current release claim.

## Current refs used

| Repository | Working ref/state | Fetched refs used | Release/tag evidence consulted |
|---|---|---|---|
| Blueprint | reconciliation branch `docs/blueprint-canonical-memory-reconciliation`, local `5783d0e3d1ae743b8c7d24d1a2e69463d6269b7f` | `origin/main` `fce3ba6f8ca1622084a2114424086364e1f7d93f`; branch remote `217d2bf2429d602d5d08771ed88fa0d1de12ba36` | no GitHub Release |
| API | local `develop`, clean | `origin/main` `380e2427bc3883f23fbd7e9a82d452888f2074a8`; `origin/develop` `72493f8669962a31743aa9daf06426f1af29e2d2` | `v0.17.0` tag object `236f0a2e1925c47779a6a906255dc6c41ccb9fa6`, target `4c955ca35331fd3afc58c01f666fc7b0cec9c755`; GitHub Releases `v0.10.0` published 2026-08-31 and `v0.17.0` published 2026-08-29 |
| Platform | local `develop`, dirty | `origin/main` `f8285f1bf0de83ed6fa95aa86d1dcc6efd4897f7`; `origin/develop` `2a1f2f0db95561920f23eab6158903458c01d215` | GitHub Releases `v0.8.0` published 2026-08-31 and `v0.12.0` published 2026-08-29; tag object `59e3b97556a160554db12f545ba8bc7c0390f94d`, target `3b3bb71366f221fdcf7fd106772eaba94ed3a58d` |
| Portal | local `develop`, dirty | `origin/main` `672836b8369ea16cb1374d348d73ccacbebbc954`; `origin/develop` `ab60951cc0c755aee1926f3ed8807438d010aa6c` | GitHub Releases `v0.8.0` published 2026-08-31 and `v0.12.0` published 2026-08-29; tag object `db9b4d5d6f3343d0fe5d43fb655a0bd89363a816`, target `c4fb42d93ca84855019e008f7400ee0375d45bbc` |
| Website | local `develop`, clean | `origin/main` `96ab63a95f923114627048283c323a501238ff53`; `origin/develop` `13e3a4c3114931e635adf15fd2c8f3740397b29b` | GitHub Release `v1.1.0` published 2026-08-31; tag object `edc43202e5f66b46918322a6ef05211b0c9f96a9`, target `ddd299617fe56df90f145a5ed0478a081397883d` |
| Mobile | local `develop`, untracked `.DS_Store` and `.idea/` | `origin/main` `88c99a1079d17ce4514791087451452bdbf17c51`; `origin/develop` `730b23143b2e100cd1e8c290313aa83d42b4b5a0` | GitHub Release `v0.1.1` published 2026-08-31; tag object `07c334105a61302bb12921777761ff2f19947ee3`, target `e48ef7d629f9547a74c04f3f9621bbee4551b36c` |
| Design Lab | local `feature/mobile-guidelines-foundation`, dirty | `origin/main` `c16c1f4b64af688754a7c3bc989db9308f825c66` | GitHub Release `v1.0.1` published 2026-08-31; tag object `809f4241cc21e2dd6cd975c8b725e6dee4dc4d71`, target `da21de9967896389c0db948da479a77027f43353` |
| Mobile Report | local `main`, clean | `origin/main` / `origin/develop` `7205469f032fd0b3acd31195ad4084a4bdb0640a`; `origin/feature/chapter-01` `c5f44d40992fffdf01d51d5eff602c5456e70eae` | annotated `v0.2.0` tag object `2c8a5b85bea5d85a68bafe2e793f81d7d885335e`, target `7205469f032fd0b3acd31195ad4084a4bdb0640a`, GitHub Release published 2026-09-10; local tag signature verification passed |

The requested `webs-report` checkout was absent. The historical candidate and
its ref are recorded in [Historical Web research — 2026](../../91-reference/research/historical-web-research-2026.md).

## Evidence boundaries

- The refs above identify repository state; they do not prove that all Product
  requirements are implemented.
- GitHub Release tags prove release existence only. They do not prove
  `PRODUCT ACCEPTED`, System Acceptance or `PRODUCTION READY`.
- Dirty Platform, Portal and Design Lab worktrees, and Mobile untracked files,
  are preserved and excluded from release claims.
- Website was inspected only for ecosystem state. Website commercial
  pricing/plans/registration drift was explicitly not reconciled.
- Current Blueprint status remains open for Product Acceptance, System
  Acceptance and Production Readiness gates.
