---
status: accepted
maturity: VERIFIED
scope: v1
owner: data
last-reviewed: 2026-08-25
---

# AS-IS PostgreSQL schema reconstruction

## Evidence boundary

This is a point-in-time reconstruction of API `origin/develop` at
`a19c6bfb4229549f91597f69c09aa6955517dfda`. It is AS-IS evidence only. It does
not redefine accepted TARGET Bounded Contexts and does not authorize a Flyway
migration.

| Evidence | Result |
|---|---|
| API source | `nexa-suite/api` `origin/develop` `a19c6bfb4229549f91597f69c09aa6955517dfda` |
| Runtime database image | `postgres:18.4-alpine`, from `ops/compose/modern.compose.yml` |
| Migration chain | V1 through V86, applied in numeric order; latest source migration `V86__create_organization_onboarding_drafts.sql` |
| Reconstruction method | Ephemeral PostgreSQL container; each migration executed in one transaction |
| Production mutation | None; no application repository or persistent volume changed |
| Data | No seed data treated as architecture; migration-created reference rows excluded |
| Flyway history | Harness reconstructed structural state from SQL and did not create durable application `flyway_schema_history`; boundary recorded as source V86, not live runtime history |

**Verdict: AS-IS SCHEMA RECONSTRUCTION PASS (STRUCTURAL / POINT-IN-TIME).**
Runtime production state, row counts and deployment readiness remain unverified.

## Reconstructed inventory

Final catalog contained **129 tables**, **1 view**, **1,448 columns**, **400
indexes**, **1,848 catalog constraints** including generated `NOT NULL`
constraints, and **56 RLS policies** across twelve logical PostgreSQL schemas.
Schema names below are implementation namespaces, not Bounded Contexts.

| AS-IS schema | Tables | Main implementation families |
|---|---:|---|
| `audit` | 1 | `event` business/audit timeline projection |
| `business_documents` | 4 | documents, generation requests, evidence and object metadata |
| `catalog_management` | 19 | product/category/brand, canonical SKU/family, price and promotion |
| `iam` | 12 | identity, credentials, sessions, reset, public intake and security outbox |
| `integration` | 3 | outbox, inbox and change feed |
| `logistics` | 12 + 1 view | dispatch, delivery attempts, POD, temperature and buyer tracking |
| `notifications` | 1 | in-app notification inbox |
| `payments` | 9 | credit, reservations, receivables, payment/provider and reconciliation |
| `reference_data` | 4 | geographic and road reference data |
| `sales` | 23 | client accounts, drafts, PR/SO, commitments, events and idempotency |
| `tenant_management` | 25 | tenant/workspace, membership, roles/capabilities and onboarding |
| `warehouse` | 16 | warehouse, lots, movements, reservations, allocation and transfer |

## Tenant isolation evidence

Final state confirms repeated `tenant_id` + `workspace_id` scope on business
tables, with global exceptions such as `iam.user_account`,
`reference_data.*` and selected tenant-level configuration. RLS policies use
transaction-local `app.current_tenant_id` and `app.current_workspace_id` for
protected families. Some direct tenant hardening arrived in later migrations,
so final state, not filenames, is evidence.

| Evidence fact | Interpretation |
|---|---|
| `tenant_management.workspace` has tenant reference and V84 enforces one workspace per tenant | Conforms to accepted V1 `Tenant 1:1 Workspace` target |
| `iam.user_account` has no tenant key | Global Human Identity evidence; membership/relationship provides tenant context |
| `sales.client_account_membership` and V71 uniqueness | AS-IS buyer relationship evidence; target owner is BC-02 |
| RLS predicates reference tenant and workspace | Defense in depth; application authorization and worker scope remain required |
| `integration.outbox_event`, `integration.inbox_event` and lease columns | Shared technical infrastructure; not duplicated into eleven domain owners |

## Reconstruction limitations

- No live production database was inspected.
- API checkout stayed read-only; no migration, seed or application code changed.
- Ephemeral database did not prove worker behavior, RLS role bypass, provider
  callbacks or retention.
- Current schema names remain AS-IS names. TARGET tables are canonical owner
  lenses, not a request to rename current schemas.

See [AS-IS to TARGET mapping](as-is-to-target-mapping.md) for object-level
classification and [TARGET master model](master-data-model.md) for target
relational ownership.
