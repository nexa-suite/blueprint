---
status: draft
maturity: DRAFT
scope: v1
owner: security
last-reviewed: 2026-08-19
---

# Security architecture TARGET

## Identity and scope

Global identity authenticates a person or system actor. Authorization then resolves the requested surface, Tenant, Workspace, workforce membership or Buyer relationship, capabilities and object scope. Tenant ID in a request body is data to validate, never authority.

| Subject | Relationship | Allowed scope |
|---|---|---|
| Internal workforce | Tenant membership + role/capability | current Tenant/Workspace and granted operational resources |
| Buyer | Buyer relationship to supplier Tenant | current authorized relationship and Buyer projections |
| System worker | explicit system actor + bounded job scope | only recorded Tenant/workspace/object set |
| External provider | signed/verified integration identity | provider event/resource mapped to known Nexa object |

Tenant-wide V1 semantics are the accepted default. Workspace is a product/domain relationship and must not be used to invent a separate deployment or security boundary.

## Authorization

- Enforce capability and object/relationship checks in the API application boundary.
- Use surface checks to keep Platform and Portal roles separated.
- Company Owner is a special Tenant governance role, not a bypass of audit, scope or destructive-action policy.
- Read and write permissions are separate where risk differs.
- File download, payment mutation, export, role change, inventory adjustment and delivery evidence require explicit capability checks.
- RLS and repository predicates are defense in depth. Admin/bypass roles and worker paths require a separate inventory and test.

## Session and secrets

Use short-lived access credentials, refresh rotation/reuse detection, revocation and logout semantics already evidenced in AS-IS. Store secrets only in approved runtime secret management; never in source, events, logs, URLs, screenshots or object metadata. Provider signature verification occurs before persistence or side effect.

## Audit and incident evidence

Audit records actor, identity, Tenant/Workspace/relationship scope, capability, action, target, outcome, correlation and source. Security audit is not the same as domain event or business document. Sensitive values are minimized/redacted. Retain enough evidence for support and incident investigation subject to an approved legal/retention policy; no numeric retention is invented here.

## Security gates

Cross-tenant BOLA tests, RLS runtime tests, worker-scope tests, object authorization, webhook signature/replay tests, session revocation, role-change concurrency, rate limiting for public intake and dependency scanning are required before claiming production readiness.
