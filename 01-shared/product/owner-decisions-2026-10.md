---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-10-08
---

# Owner decisions — 2026-10

## MOB-US-009 — Direct Order from field work

On 2026-10-08 the Owner explicitly authorized Direct Order creation and alignment of the story scope. This supersedes the Purchase Request-only wording in MOB-US-009; it does not change the separate approval-required Purchase Request workflow.

Operations Mobile uses the existing BC-04 Direct Order contract, `POST /api/v1/direct-orders`. Current API implementation evidence is `nexa-suite/api`, `origin/main`, commit `78a3060cb56796520fcf8e9be36c63f88b4f9f51`, `DirectOrderController` and its `DirectOrderUseCase`. A confirmed order returns 201; a server-side pending prepaid order returns 202. The client must preserve that distinction, send one durable command identity on an explicit retry, and reject stale or missing Tenant/Workspace/Membership authority.

Commercial confirmation, inventory commitments and credit decisions remain server-authoritative and atomic under the accepted domain rules. No local draft, cached quote, disconnected submission or uncertain result confirms a Sales Order. Approval-required Purchase Requests remain a distinct supported domain capability.

This record accepts scope only. It does not establish Mobile implementation, technical verification, solution validation, Product Acceptance, System Acceptance or Production Readiness. The historical planning band is provenance; the story remains in the Mobile V1 Product Generation envelope.
