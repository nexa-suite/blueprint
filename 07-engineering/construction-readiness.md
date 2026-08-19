---
status: draft
maturity: DRAFT
scope: v1
owner: engineering
last-reviewed: 2026-08-19
---

# Construction readiness

## Entry gate

- Product V1 closure and exclusions are accepted.
- Strategic DDD, ownership matrix, context map and decision register have Business Architect disposition.
- AS-IS evidence is tied to exact refs and current working-tree status.
- Aggregate, transaction, authorization, data and event contracts are reviewed.
- API OpenAPI, frontend states, design evidence and runtime assumptions are aligned.

## Vertical-slice definition

The first slice is the smallest traceable path that crosses identity/scope, commercial commitment, availability, fulfillment visibility, notification/audit and both Platform/Portal projections. The [vertical slice contract](vertical-slice-contract.md) defines the required evidence; it does not authorize implementation before the gates above.

## Exit gate

Build/tests, architecture verification, migration checks, tenant isolation, concurrency/idempotency, contract/runtime parity, accessibility, authenticated browser proof, observability and rollback evidence are all named. A static document or green compile is not full readiness.

## Change control

Keep one logical change per bounded concern. Preserve compatibility during migrations. Record rejected alternatives and unresolved provider/production decisions. No rewrite, microservice split or new V1 product capability is implied.
