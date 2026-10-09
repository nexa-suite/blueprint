---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-10-09
---

# Owner decisions — 2026-10

## MOB-US-009 — Direct Order from field work

On 2026-10-08 the Owner explicitly authorized Direct Order creation and alignment of the story scope. This supersedes the Purchase Request-only wording in MOB-US-009; it does not change the separate approval-required Purchase Request workflow.

Operations Mobile uses the existing BC-04 Direct Order contract, `POST /api/v1/direct-orders`. Current API implementation evidence is `nexa-suite/api`, `origin/main`, commit `78a3060cb56796520fcf8e9be36c63f88b4f9f51`, `DirectOrderController` and its `DirectOrderUseCase`. A confirmed order returns 201; a server-side pending prepaid order returns 202. The client must preserve that distinction, send one durable command identity on an explicit retry, and reject stale or missing Tenant/Workspace/Membership authority.

Commercial confirmation, inventory commitments and credit decisions remain server-authoritative and atomic under the accepted domain rules. No local draft, cached quote, disconnected submission or uncertain result confirms a Sales Order. Approval-required Purchase Requests remain a distinct supported domain capability.

This record accepts scope only. It does not establish Mobile implementation, technical verification, solution validation, Product Acceptance, System Acceptance or Production Readiness. The historical planning band is provenance; the story remains in the Mobile V1 Product Generation envelope.


## Buyer wallet — supplier balance and separate commercial credit

On 2026-10-09 the Owner explicitly approved a Buyer wallet showing commercial credit, debt and payments, plus rechargeable funds. The accepted TARGET is a PEN balance per Buyer and supplier Tenant, credited only after confirmation from the payment provider and usable for that supplier's orders. Commercial credit remains separate: a top-up is not a credit-limit increase or a receivable adjustment.

This accepts Product direction, not an implemented stored-value account, provider integration, launch date or production capability. Existing credit exposure, receivables and payment-history queries are AS-IS evidence only. The 11-context strategic catalog remains unchanged; BC-07 owns commercial credit/receivables and BC-08 owns payment processing. The precise stored-value ledger model and owner, reservation/settlement interface with BC-04, refunds, reversals, reconciliation, and operational/regulatory release conditions remain OPEN before construction of money-moving commands. Client screens cannot credit balances, mark provider payments successful or settle orders.

Construction must preserve supplier isolation and server authority. No client-provided Buyer or Tenant selector establishes ownership. Duplicate provider callbacks and uncertain retries must not mint funds twice; the final ledger/event contracts and verification evidence must establish this property before a recharge capability is described as verified. Mobile and Web must consume the same authoritative balance/payment contract once accepted and implemented.

## Internal Nexa console — onboarding, health and authorized support

On 2026-10-09 the Owner explicitly approved planning an internal Nexa console for onboarding, suite health and temporary authorized customer support. This is accepted TARGET scope, superseding the prior deferral only for planning these capabilities; it does not declare Control Center or Support implemented or part of a released generation.

“Nexa generic” in this decision means an internal operator surface. It is distinct from the Generic Tenant, which remains a normal tenant of the same product/release line. An operator may inspect non-customer operational health or authorized onboarding work without borrowing a customer membership. This does not introduce a tenantless business-data principal or a universal developer permission.

Support over customer data must use explicit temporary authorization, scoped to the approved Tenant, purpose and permitted resources/actions, with expiry, revocation and traceable access. An internal console cannot bypass normal business, payment or inventory decisions. The grant issuer, approval workflow, maximum duration, consent/evidence contract and emergency procedure remain OPEN for a dedicated security/domain design; no standing cross-tenant access is authorized by this decision.

The console is a surface over existing owners, not a twelfth Bounded Context. Platform roles retain their canonical meaning: CA refers to Company Owner; Business Operations Manager and Tenant Administrator remain distinct workforce roles. These records do not establish implementation, Technical Verification, Product Acceptance, System Acceptance or Production Readiness.
