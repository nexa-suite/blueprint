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

## Role surface construction — Driver Mobile and Buyer Mobile

On 2026-10-09 the Owner explicitly requested construction of the remaining Web and Mobile role workflows and confirmed that Driver must have no Web interface. Driver execution belongs to Operations Mobile only. Platform may coordinate dispatch and query authorized operational evidence without providing Driver execution screens.

The construction request includes the separate Buyer Mobile client, using the already accepted Flutter/Dart target and `PORTAL` business surface with `NATIVE` transport. Earlier story deferrals do not prohibit constructing this authorized client scope. Research, solution validation, technical verification, Product Acceptance and release remain independent gates; the request does not establish their completion. The eleven-context catalog and server business authority remain unchanged.

## Physical database isolation by Tenant

On 2026-10-09 the Owner explicitly confirmed a central database for identity, Tenant registration and suite governance, plus a physically independent business database for each Tenant. Orders, inventory, fulfillment, payments and other Tenant business facts must not share a business database with another Tenant. This supersedes the shared-database deployment target for future construction; it does not establish migration of the current API or cloud environment.

The current API implementation uses shared PostgreSQL schemas with explicit Tenant/Workspace scope and RLS. That remains AS-IS evidence until a verified cutover. The eleven Bounded Contexts and their business ownership remain unchanged; a database is an isolation/deployment boundary, not a Bounded Context.

Routing must use server-verified membership and a trusted provisioned Tenant-to-database binding. Missing, suspended, ambiguous or unavailable bindings fail closed, without fallback to the central database or another Tenant database. Provisioning, database credentials, pools, migrations, backup/restore, object storage, workers and support sessions require explicit Tenant isolation. Identity credentials must not be copied into Tenant business databases. Cross-database operations must use explicit consistency and retry contracts rather than pretending to retain a single local transaction.

Construction must preserve published migration history and user data. An additive, rehearsed migration must prove data reconciliation, isolation under concurrent requests and background work, and safe rollback or roll-forward before enabling the target on existing Tenants. No production cutover is authorized by this construction decision.

Relational models must document candidate keys and functional, multivalued and join dependencies. BCNF, 4NF and 5NF decompositions apply where those dependencies justify them and must preserve lossless reconstruction; immutable evidence snapshots remain explicitly distinguished from mutable master data. Normalization prevents update anomalies and redundancy; it does not replace authentication, authorization, database isolation or least-privilege credentials.


## Buyer wallet — supplier balance and separate commercial credit

On 2026-10-09 the Owner explicitly approved a Buyer wallet showing commercial credit, debt and payments, plus rechargeable funds. The accepted TARGET is a PEN balance per Buyer and supplier Tenant, credited only after confirmation from the payment provider and usable for that supplier's orders. Commercial credit remains separate: a top-up is not a credit-limit increase or a receivable adjustment.

This initial approval accepted Product direction, not an implemented stored-value account, provider integration, launch date or production capability. Existing credit exposure, receivables and payment-history queries are AS-IS evidence only. The 11-context strategic catalog remains unchanged; BC-07 owns commercial credit/receivables and BC-08 owns payment processing. The subsequent construction contract below resolves the initially open ownership and settlement direction. Client screens cannot credit balances, mark provider payments successful or settle orders.

Construction must preserve supplier isolation and server authority. No client-provided Buyer or Tenant selector establishes ownership. Duplicate provider callbacks and uncertain retries must not mint funds twice; the final ledger/event contracts and verification evidence must establish this property before a recharge capability is described as verified. Mobile and Web must consume the same authoritative balance/payment contract once accepted and implemented.

### Accepted construction contract — 2026-10-09

The Owner subsequently accepted BC-08 ownership of an immutable stored-funds ledger per Buyer and supplier Tenant in PEN. BC-04 requests a reservation when placing a supplier order and consumes the reservation upon authoritative order confirmation. Cancellation releases an unconsumed reservation. Explicit refund movements restore consumed funds to that supplier balance without rewriting prior facts. BC-07 commercial credit remains separate. Cash withdrawals and transfers between supplier balances are excluded from this initial scope.

This closes the Product decisions on ownership, reservation, consumption, release, refund destination and excluded transfers. Provider confirmation, concurrency, durable callback deduplication, reconciliation and integration contracts require implementation and verification. Operational and regulatory release conditions remain OPEN; construction authorization is not Production Readiness or a release authorization.

## Internal Nexa console — onboarding, health and authorized support

On 2026-10-09 the Owner explicitly approved planning an internal Nexa console for onboarding, suite health and temporary authorized customer support. This is accepted TARGET scope, superseding the prior deferral only for planning these capabilities; it does not declare Control Center or Support implemented or part of a released generation.

“Nexa generic” in this decision means an internal operator surface. It is distinct from the Generic Tenant, which remains a normal tenant of the same product/release line. An operator may inspect non-customer operational health or authorized onboarding work without borrowing a customer membership. This does not introduce a tenantless business-data principal or a universal developer permission.

Support over customer data must use explicit temporary authorization, scoped to the approved Tenant, purpose and permitted resources/actions, with expiry, revocation and traceable access. An internal console cannot bypass normal business, payment or inventory decisions. The subsequent construction contract below resolves consent, independent approval, duration and read-only scope. No standing cross-tenant access is authorized by this decision.

The console is a surface over existing owners, not a twelfth Bounded Context. Platform roles retain their canonical meaning: CA refers to Company Owner; Business Operations Manager and Tenant Administrator remain distinct workforce roles. These records do not establish implementation, Technical Verification, Product Acceptance, System Acceptance or Production Readiness.

### Accepted support construction contract — 2026-10-09

The Owner subsequently accepted initial customer-data support sessions restricted to read-only access, a maximum duration of one hour, explicit Company Owner consent and approval by a different named internal operator. The session must carry explicit Tenant/resource scope, immediate revocation and an immutable access audit. Impersonation, standing customer access and business mutations are excluded. Internal authentication, consent evidence, approval, expiry and fencing must be implemented and verified before any customer-data support route becomes accessible. Emergency break-glass remains governed separately by ADR-0017; this decision does not authorize bypassing its controls.
