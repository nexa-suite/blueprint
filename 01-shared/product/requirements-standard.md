---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-08-24
---

# Requirements authoring standard

This standard prepares future refinement. It does not create a final Web or
Mobile backlog and does not reopen Product, Domain or C4 decisions.

## Required fields

Every future story records: `ID`, `Epic`, `Surface`, `Actor`, `Segment`,
`Capability`, `Primary BC`, `Supporting BCs`, `Priority`, `V1 status`,
`Research status`, `Story Points`, `User Story`, `Business Value`,
`Preconditions`, `Business Rules`, `Acceptance Criteria`, `Dependencies`,
`Out of Scope`, `Related Events`, `Related State`, and `Sources`.

Use the wording: **As a [actor], I want [business outcome], so that [value].**
Stories express a business slice. Do not write button, CRUD, endpoint,
database-table, component or implementation stories as product requirements.

## Acceptance criteria

Use Given/When/Then. Include only relevant cases, but cover the applicable
happy path, alternative or rejection, authorization, state conflict,
concurrency, failure/retry and durable result. Criteria must be observable and
must not invent an API contract.

## Refinement and identifiers

Story Points use Fibonacci `1, 2, 3, 5, 8, 13` only after refinement. `13`
requires a review for splitting or a documented reason. Current Web stories
remain `TBD — DELIVERY REFINEMENT`.

Future namespaces are reserved: `WEB-EPIC-*`, `WEB-US-*`, `MOB-EPIC-*`,
`MOB-US-*`, plus explicit technical/spike namespaces. Do not generate future
IDs in this preservation wave. Historical IDs remain historical and map only
through the [baseline migration mechanism](../../91-reference/legacy/legacy-ecosystem-report/historical-user-story-catalog.md).

## Status dimensions

Keep dimensions separate: decision `ACCEPTED / PROPOSED / DEFERRED`; research
`VALIDATED / PARTIALLY_VALIDATED / PENDING`; implementation `IMPLEMENTED /
PARTIAL / PLANNED / FUTURE`; production `READY / OPEN`.
