---
status: accepted
maturity: BASELINED
scope: v1
owner: security
last-reviewed: 2026-08-23
---

# Security Architecture TARGET — PRE-V1

This is the accepted construction target. Runtime and penetration proof remain separate gates; current controls are AS-IS evidence until verified against current refs.

## Tenant and object isolation

- Tenant is maximum business/data isolation boundary; V1 Workspace is 1:1 operational context.
- Server authorization checks authenticated Human Identity, Workforce Membership or Buyer Relationship, selected Tenant/Workspace and object ownership/capability.
- Client-supplied Tenant, Workspace, Customer Account, order or document IDs are never sufficient authorization.
- RLS is defense in depth. Application predicates, object authorization, RLS and repository scope all fail closed when context is missing or invalid.
- Buyer Relationship is not Workforce Membership. Buyer Portal shows only current authorized supplier Tenant data.

## Worker contract

Every tenant-scoped worker must:

1. claim work with lease and fencing token;
2. reconstruct explicit `SYSTEM` Tenant/Workspace context from durable work item;
3. establish transaction-local PostgreSQL scope (`SET LOCAL`);
4. verify lease/fencing before reads and writes;
5. process idempotently;
6. perform provider side effect through an ACL when required;
7. finalize only while fencing token is valid;
8. guarantee context cleanup;
9. persist retry or terminal state and observability.

Pooled session state must not leak between Tenants. Mandatory tests prove Tenant A scope is cleared/fails closed before a reused connection serves Tenant B.

## Authentication and authorization

- One Nexa Human Identity may have multiple independent Tenant relationships.
- Capabilities are evaluated server-side per surface and relationship. UI guards are presentation aids, not authority.
- Security Audit records authentication, authorization, scope, break-glass and security events separately from Business Traceability.
- Secrets, bearer tokens, private keys, card PAN/CVV and unnecessary sensitive provider payloads are excluded from logs/events.

## Privileged support / break-glass

Break-glass is a privileged emergency path, not a Company Owner or ordinary Support role. Production implementation must require:

- named authorized operator and separate emergency role;
- explicit incident/reason and affected Tenant/object scope;
- time-limited access with automatic expiry;
- two-person approval or equivalent independent control;
- least-privilege action allowlist, read/write distinction and no blanket impersonation;
- immediate revocation and session termination;
- immutable Security Audit with actor, approver, scope, reason, timestamps, actions and outcome;
- post-incident review and evidence retention under Production/Legal Gate policy.

No break-glass bypass is considered implemented by this document.

## Threat and recovery priorities

Protect against cross-tenant data leakage, stale worker finalization, replayed provider callbacks, duplicate financial effects, unauthorized document/media access, privilege escalation, secret exposure and audit tampering. Production proof must include RLS coverage, pool-leakage tests, worker-fencing tests, webhook replay tests, restore/rollback, secret rotation and incident response.
