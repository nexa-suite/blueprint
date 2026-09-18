---
status: planned
maturity: BASELINED
scope: runway
owner: delivery
last-reviewed: 2026-09-18
---

# Mobile implementation and delivery evidence plan

This is an evidence plan. Current implementation evidence remains AS-IS and
partial; no Mobile client completion or integrated release is claimed.

## Four-week construction target

| Phase | Target evidence | Current state |
|---|---|---|
| Android foundation | Kotlin project, build, architecture, auth/session, context, API client | Operations PARTIAL IMPLEMENTATION EVIDENCE; unmerged |
| Local persistence | secure session/context/freshness, safe read cache, harmless draft, temporary evidence and retry boundary | PARTIAL evidence on named branch; framework open |
| Device resource | camera barcode/QR/evidence proof with permission and fallback | NOT VERIFIED; physical device pending |
| REST integration | real Nexa API request, Problem Details, retry, stale/conflict state | API AS-IS PARTIAL; deployed client integration not verified |
| Core physical flow | Warehouse receiving or FEFO/pick on device | Operations PARTIAL evidence; not integrated or Product Accepted |
| Core Delivery flow | Driver Attempt/handoff or Buyer receipt/discrepancy on device | Buyer NOT IMPLEMENTED; end-to-end delivery flow not verified |
| Third-party service | selected Maps, Push or Payment PoC | OWNER_INPUT_REQUIRED |
| Distribution | Firebase App Distribution or accepted equivalent | NOT VERIFIED |

## Explicit implementation dimensions

| Slice | Current evidence |
|---|---|
| Operations Android | PARTIAL IMPLEMENTATION EVIDENCE on `origin/feature/native-foundation` and `origin/feature/connected-access-preview`; both unmerged into `develop` |
| Buyer Mobile | NOT IMPLEMENTED in the audited baseline |
| Cross-platform | NOT IMPLEMENTED; Product architecture choice OPEN; later academic Flutter/Dart plan only |
| Physical device | NOT VERIFIED |
| Deployed API on device | NOT VERIFIED |
| Camera hardware | NOT VERIFIED |

## Sprint review evidence

Each Sprint record must preserve:

- planning background, goal, velocity and points;
- LACX leaders/collaborators supplied by the team;
- Product Stories and implementation tasks separately;
- repository, branch, commit, message and date;
- unit/integration/acceptance test evidence;
- execution screenshots/video;
- OpenAPI service documentation;
- deployment configuration and proof;
- collaboration insights.

No participant, assignment, commit, URL, screenshot or Sprint result is
invented in Blueprint.

## SCM and naming

The course requires GitHub, GitFlow, Conventional Commits and Semantic
Versioning for the academic report repository. This Blueprint PR is evidence of
Blueprint documentation only; it is not the team’s academic report repository.

Expected course artifact names use the source pattern, for example:

```text
upc-pre-202620-1acc0238-4949-nexa-team-report-av1.pdf
upc-pre-202620-1acc0238-4949-nexa-team-report-tb1.pdf
upc-pre-202620-1acc0238-4949-nexa-team-report-av2.pdf
upc-pre-202620-1acc0238-4949-nexa-team-report-tb2.pdf
```

## Current AS-IS evidence boundary

- API v0.17.0 is backend candidate evidence only.
- Website, Platform and Portal release refs are recorded in the compatibility
  baseline; public deployment proof remains a separate gate.
- Mobile `main` remains documentation-only for the audited baseline; feature-branch evidence is partial and unmerged.
- Design Lab is visual-system evidence, not Mobile implementation evidence.
- Application repositories remain read-only evidence in this Blueprint wave.
