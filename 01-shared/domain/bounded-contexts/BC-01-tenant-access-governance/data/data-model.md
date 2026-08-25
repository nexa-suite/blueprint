---
status: draft
maturity: DRAFT
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# BC-01 target relational model

TARGET logical ownership in shared PostgreSQL. Full import source:
[target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Table | PK | Same-owner FK | Scope / uniqueness |
|---|---|---|---|
| `tenant` | `tenant_id` | — | global tenant key; `slug` unique |
| `workspace` | `workspace_id` | `tenant_id -> tenant` | tenant 1:1; `tenant_id, name` unique |
| `human_identity` | `human_identity_id` | — | global identity; normalized email unique |
| `company_onboarding_request` | `request_id` | tenant, requested identity | tenant-scoped; status transition |
| `workforce_membership` | `membership_id` | workspace, human identity | workspace + identity unique |
| `role_definition` | `role_id` | workspace | workspace + code unique |
| `capability_definition` | `capability_id` | — | global capability code unique |
| `membership_role` | `assignment_id` | membership, role | pair unique |
| `role_capability` | `role_capability_id` | role, capability | pair unique |
| `membership_capability_override` | `override_id` | membership, capability | pair unique; `ALLOW/DENY` check |

All tenant/workspace rows carry explicit scope columns where applicable. SQL
has NOT NULL, status/amount checks, optimistic `version` on mutable roots and
indexes for scope/status/onboarding lookup. Deployment must apply tenant and
workspace RLS; SQL deliberately stays portable and does not invent policies.

`human_identity` and `capability_definition` are global exceptions. No
cross-BC FK is declared; future BC references use stable IDs. Membership,
role assignment and authorization decisions are mutable; audit/event history
is append-only in Shared Technical / BC-11 projections.

AS-IS anchors: `iam.user_account`, `password_credential`, `refresh_session`,
`tenant_management.tenant`, `workspace`, membership/role/permission tables and
onboarding tables. KEEP identity/security semantics; REFINE ownership into the
target aggregates. See [AS-IS reconstruction](../../../../data/as-is-reconstruction.md).
