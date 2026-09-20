---
status: reference
maturity: CLOSED WITH CAVEAT
scope: cross-cutting
owner: delivery
last-reviewed: 2026-09-18
---

# Live repository baseline — 2026-09-18

**Classification:** `IMPLEMENTATION_EVIDENCE` and named
`TECHNICAL_VERIFICATION_EVIDENCE` only. This is an AS-IS baseline for the
Post-AV1 Blueprint/Mobile/Report reconciliation. It is not Product Acceptance,
System Acceptance or Production Readiness.

## Audit method and scope

On 2026-09-18, refs were fetched with `git fetch --all --prune` in the existing
Blueprint, API, Platform, Portal, Website, Mobile, Design Lab and Mobile Report
checkouts. This record uses the exact refs required by the Post-AV1 execution
prompt. Application repositories were not modified or audited as implementation
changes in this wave; their detailed state remains outside scope.

The historical donor Blueprint commit was inspected read-only and was not
merged, rebased or cherry-picked.

## Audited refs

| Repository / evidence | Exact ref | Classification |
|---|---|---|
| Blueprint `origin/main` | `fce3ba6f8ca1622084a2114424086364e1f7d93f` | audited baseline; new Wave 1 branch starts here |
| Blueprint historical donor | `5f31c10200fbe896ebd5d0bccc105b91ccdc5a91` | read-only donor evidence; not current authority |
| Mobile Report annotated tag target `v1.0.1` | `77895a8950676ccdaec520a61c41107852268606` | immutable AV1 academic/research evidence |
| Mobile `origin/main` | `88c99a1079d17ce4514791087451452bdbf17c51` | documentation/runway only |
| Mobile `origin/develop` | `730b23143b2e100cd1e8c290313aa83d42b4b5a0` | integration baseline; no feature merge inferred |
| Mobile `origin/feature/native-foundation` | `954033d3702eac2378f65b664c97fddcb8599c09` | partial Android implementation evidence; unmerged |
| Mobile `origin/feature/connected-access-preview` | `30a045f4c9e844cee42ab451df92cb87655f1a33` | partial connected access/warehouse evidence; unmerged |

The native branch is 19 commits ahead of Mobile main. The connected preview is
41 commits ahead of main and 22 commits beyond native-foundation. These are
branch relationships, not release or integration claims.

## Pull request state

| PR | Head → base | State | Scope evidence |
|---|---|---|---|
| [#10](https://github.com/nexa-suite/mobile/pull/10) | `feature/native-foundation` → `develop` | OPEN; not merged; 5 commits; approximately +2464 / -31 | native Android foundation, Operations shell and technical gates |
| [#11](https://github.com/nexa-suite/mobile/pull/11) | `feature/connected-access-preview` → `develop` | OPEN; not merged; 27 commits; approximately +6009 / -31 | connected access, session recovery, warehouse identification and CameraX/ML Kit preview |

Feature branch evidence is not `develop/main` integration and is not a release.

## Mobile implementation classification

- `mobile/main`: documentation/runway only; no integrated Mobile application.
- `feature/native-foundation`: `PARTIAL IMPLEMENTATION EVIDENCE`, `UNMERGED`,
  `NOT PRODUCT ACCEPTED`, `NOT PRODUCTION READY`.
- `feature/connected-access-preview`: `PARTIAL IMPLEMENTATION EVIDENCE`,
  `UNMERGED`, `NOT PRODUCT ACCEPTED`, `NOT PRODUCTION READY`.
- Buyer Mobile: `TARGET / NOT IMPLEMENTED`.
- Cross-platform client: academic planning exists; Product architecture choice
  is `OPEN`, not implemented.
- Physical-device evidence, deployed API networking from Android, physical
  camera/ML Kit and Product Acceptance are `NOT VERIFIED` / `OPEN`.

Recorded branch technical evidence includes the named Gradle unit/lint/build
gate, local isolated API fixtures and API 36 emulator smoke. That evidence is
not rerun in Wave 1 and does not equal Product Acceptance.

## Boundary

This dated record supersedes no historical content. Older baselines remain
point-in-time evidence. No application repository, Mobile Report or Blueprint
`AGENTS.md` was edited by the reconciliation.
