---
status: accepted
maturity: BASELINED
scope: v1
owner: engineering
last-reviewed: 2026-08-23
---

# Construction readiness

## Entry gate

- Product V1 closure and exclusions are accepted.
- Strategic DDD, ownership matrix, context map and decision register are accepted for PRE-V1.
- AS-IS evidence is tied to exact refs and current working-tree status.
- Aggregate, transaction, authorization, data and event contracts are baselined.
- API OpenAPI, frontend states, design evidence and runtime assumptions are aligned.
- The two current Purchase Request write paths are mapped and a target authoritative write model is accepted before deletion or consolidation.
- Catalog identifier translation (`catalogItemId`, `productId`, `skuId`) is explicit; Product -> sellable SKU remains Product authority.
- Buyer Relationship migration/translation is defined across membership, Client Account and Buyer access evidence.
- Payment/document surface gaps are classified; backend bank-transfer capability is not counted as Buyer UI proof.
- Modulith OPEN-module pressure has an accepted fitness plan; no blanket module-closing is assumed.

## Vertical-slice definition

The first slice is the smallest traceable path that crosses identity/scope, commercial commitment, availability, fulfillment visibility, notification/traceability and both Platform/Portal projections. The [vertical slice contract](../../architecture/vertical-slice-contract.md) defines required evidence; it does not claim that the slice is implemented.

## Exit gate

Build/tests, architecture verification, migration checks, tenant isolation, concurrency/idempotency, contract/runtime parity, accessibility, authenticated browser proof, observability and rollback evidence are all required before construction slice closure. Current counts and refs belong to dated AS-IS evidence; do not copy them as current runtime certification. A static document or green compile is not full readiness.

## Change control

Keep one logical change per bounded concern. Preserve compatibility during migrations. Record rejected alternatives and unresolved provider/production decisions. No rewrite, microservice split or new V1 product capability is implied.
