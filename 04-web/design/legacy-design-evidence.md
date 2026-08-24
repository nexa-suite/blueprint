---
status: reference
maturity: HISTORICAL
scope: cross-cutting
owner: design
last-reviewed: 2026-08-15
---

# Legacy design evidence

Source: curated Legacy ecosystem report at commit `e161fe522023bfe5929e76c4d7c66af211884b7e`. This is historical research and UX evidence, not current design or Product authority.

## Useful patterns for revalidation

| Historical evidence | Classification | Potential destination | Caveat |
|---|---|---|---|
| `Plus Jakarta Sans` / `Inter` typography references | CANDIDATE_FOR_REVALIDATION | Future visual foundations | No font selected for Nexa |
| Historic blue/cold-chain palette | HISTORICAL_REFERENCE | Future color semantics | Cold-chain signal must not narrow generic B2B positioning |
| 4px spacing grid and density concepts | CANDIDATE_FOR_REVALIDATION | Tokens/layout | Historical measurements are not current values |
| Sidebar/topbar patterns | HISTORICAL_REFERENCE | Platform information architecture | Current roles, navigation and responsive behavior require validation |
| Quick filters, dense tables and metric cards | CURRENTLY_RELEVANT_EVIDENCE | Platform patterns | Confirm metrics, permissions and task frequency |
| Persistent labels and status badges | CURRENTLY_RELEVANT_EVIDENCE | Accessibility/content patterns | Status must not rely on color alone |
| Timelines, request builder and product cards | CANDIDATE_FOR_REVALIDATION | Portal patterns | Preserve Purchase Request versus Sales Order distinction |
| Dispatch boards | CANDIDATE_FOR_REVALIDATION | Platform/dispatch research | Workflow ownership remains unresolved |
| Loading, empty and error states | CURRENTLY_RELEVANT_EVIDENCE | Shared state patterns | Revalidate copy and recovery against current contracts |
| Responsive transformations and mobile considerations | CURRENTLY_RELEVANT_EVIDENCE | Responsive research | Does not authorize Mobile V1 |

Historical validation records also report structured capture reducing rework, quick-filter needs, document visibility gaps, Buyer draft persistence and status visibility. Treat these as dated findings to revalidate, not current UI requirements.

## Explicitly reject as TARGET

Do not reuse PrimeVue/Vue implementation architecture, Vue routes, old role semantics, S1/S2/S3 role assumptions, Account Owner/Operations conflation, Tenant == Workspace, Legacy Bounded Context visual organization, anonymous Tenant self-registration, subscription/premium V1 semantics, Purchase Order wording for customer Sales Orders, tenant-owned Buyer identity or implemented IoT V1 assumptions.

## Good UX idea versus obsolete semantics

Dense tables, persistent labels, visible workflow status, request recovery and clear error states may be GOOD UX IDEAS. Their historical role names, data ownership, lifecycle transitions and technology implementation are OBSOLETE OR UNRESOLVED SEMANTICS until current Product and discovery work confirms them.

## Provenance boundary

Detailed source classifications remain in the [frontend reference map](../../91-reference/historical/legacy-ecosystem-report/frontend-reference-map.md), [validation findings](../../91-reference/historical/legacy-ecosystem-report/validation-findings.md), [artifact classification](../../91-reference/historical/legacy-ecosystem-report/artifact-classification.md) and [asset provenance](../../91-reference/historical/legacy-ecosystem-report/asset-provenance.md). Binary assets marked `REVIEW_BEFORE_REPUBLICATION` remain local.
