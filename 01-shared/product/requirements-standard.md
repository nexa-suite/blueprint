---
status: accepted
maturity: FROZEN
scope: cross-cutting
owner: product
last-reviewed: 2026-08-29
---

# Requirements Authoring Standard

This standard governs the frozen catalog and prepares later requirements
refinement. It does not reopen accepted Product, Domain or C4 decisions.

## Product Generalization Rule

Nexa requirements describe capabilities of the Nexa product for its target
market, not bespoke workflows of the ICISA Reference Tenant.

ICISA may provide domain evidence, examples, acceptance scenarios and reference
configuration.

A behavior becomes canonical Nexa Product scope only when it expresses a
reusable capability, invariant or policy applicable to the defined target
market.

Tenant-specific variations must be represented through configuration,
commercial policy, authorization or explicitly scoped extensions rather than
hard-coded ICISA semantics.

## Catalog freeze contract

Functional catalog status for this wave:

| Category | Count | Status |
|---|---:|---|
| Web functional User Stories | 133 | CONFIRMED / V1 |
| Mobile functional User Stories | 73 | 28 V1; 35 V2; 9 V3; 1 V4/Future; lifecycle and research tracked separately |
| Technical Stories | 20 | SHARED / DELIVERY |
| Spike Stories | 6 | RESEARCH / ENABLER |
| Total requirement items | 232 | BASELINED CATALOG; acceptance gates open |

The catalog records identity, target product scope and story-level AC. The
Mobile master backlog at
`03-mobile/requirements/master-mobile-backlog.md` owns release and lifecycle
fields for all 73 functional stories. The academic projection at
`90-academic/mobile/course-1acc0238/requirements-projection.md` adds the
course-only join fields for the 28-row Product Backlog ordering, Story Points,
Sprints, milestones and evidence. Those fields are projections, not Product
Acceptance or implementation claims. Personas, interviews, statistics, Mobile
validation and client implementation remain separate dimensions.

## Required functional story fields

Every functional story records:

ID, Status, Product, Surface, Actor, Epic, Priority, Title, concise User Story
statement, owning Bounded Context, capability or family when obvious and
current refinement status.

The Mobile catalog additionally records App, shared capability, secondary BCs,
research status, offline/idempotency expectation, authorization, device/evidence
implication, dependencies and release classification. The master backlog also
records Backend Support, Client Status, Sprint Planned, Sprint Implemented,
Implemented In, Verified In and Product Accepted In using controlled values.

Use the wording:

As a [actor],
I want [goal],
so that [business value].

Stories express a business slice. Do not write button, CRUD, endpoint,
database-table, component or implementation stories as product requirements.

### Actor qualification

Use the canonical actors from [the shared actor catalog](actors.md) whenever
the responsible product actor is identifiable. `Authorized User`, `User with
multiple relationships`, `Invited Workforce Member`, `Mobile User`, and
capability-qualified forms such as `Authorized Commercial Actor` or `Authorized
Financial Actor` describe an access, lifecycle or capability boundary; they do
not create new organizational roles. Later refinement binds these descriptors
to the applicable canonical actor and capability under Tenant policy. No
Finance actor is implied.

## Functional User Stories

The later Acceptance Criteria must:

- contain multiple scenarios where behavior warrants it;
- be testable and use Given / When / Then;
- be in present tense;
- avoid UI implementation details;
- represent observable behavior;
- distinguish happy path, business rejection and relevant exception;
- avoid arbitrary minimum scenario counts.

Guideline:

- Simple story: 2-3 Acceptance Criteria normally.
- Normal story: 3-5 Acceptance Criteria normally.
- Lifecycle or business-critical story: 4-6 Acceptance Criteria normally.
- Concurrency, finance or high-risk story: 5-8 when behavior genuinely
  requires them.

Never pad Acceptance Criteria merely to hit a count.

## Technical Stories

Actor: Developer.

Use Technical Stories only for capabilities without direct end-user
interaction, such as REST APIs, transactional correctness, security/isolation,
infrastructure, integrations, local storage and background reliability.

## Spike Stories

Each Spike records:

- uncertainty or question;
- investigation goal;
- expected evidence;
- completion criteria;
- output or recommendation.

A Spike does not pretend to deliver normal production functionality.

## Acceptance Criteria and refinement

Later refinement adds Preconditions, Business Rules, complete Acceptance
Criteria, Event references, Dependencies, Out of Scope, Story Points and
academic traceability. The academic projection must preserve tenant scope,
authorization, lifecycle, state conflict, concurrency, failure/retry and
durable result where relevant. Do not invent API contracts.

## Story Points

Story Points are not assigned in the catalog freeze. Later refinement may use
1, 2, 3, 5 or 8. If a story appears larger than 8, consider splitting by
user or business outcome.

## Priority and status

Product Backlog ordering follows business value. Product priority is not
implementation dependency order. Technical prerequisites do not automatically
become Product priority one.

Keep dimensions separate:

- decision: ACCEPTED / PROPOSED / DEFERRED;
- research: VALIDATED / PARTIALLY_VALIDATED / PENDING;
- implementation: IMPLEMENTED / PARTIAL / PLANNED / FUTURE;
- production: READY / OPEN.

## Canonical context references

Stories point to the existing:

- [11 Bounded Contexts](../domain/bounded-contexts/README.md);
- [Context Map](../domain/strategic-ddd/context-map.md);
- [Ubiquitous Language](../domain/ubiquitous-language/README.md);
- [Business Rules](../domain/business-rules/README.md);
- [State Machines](../domain/state-machines/README.md);
- [Published Events](../domain/events/published-events.md);
- [C4](../architecture/c4/README.md);
- [ADRs](../architecture/decisions/README.md);
- [Shared Design foundations](../design/README.md).
