---
status: accepted
maturity: FROZEN
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-29
---

# Nexa architecture constitution

This constitution preserves accepted Product and Strategic DDD decisions while
allowing implementation evolution through `KEEP → REFINE → REWORK`. It is
normative for TARGET; AS-IS code is evidence and may be incomplete.

## Boundary and authority

- Nexa is a multi-tenant B2B SaaS platform for importers, distributors and
  wholesalers, with strong cold-chain specialization.
- The TARGET has exactly eleven accepted Bounded Contexts: BC-01 Tenant &
  Access Governance; BC-02 Customer & Buyer Relationships; BC-03 Catalog &
  Commercial Policy; BC-04 Sales Commitment; BC-05 Inventory Availability;
  BC-06 Fulfillment & Delivery; BC-07 Credit & Receivables; BC-08 Payments;
  BC-09 Business Documents; BC-10 Notifications; BC-11 Business Traceability.
- Bounded Context != Spring Modulith ApplicationModule != Java package !=
  PostgreSQL schema != C4 Container != deployment unit.
- Tenant is the maximum isolation boundary. V1 Tenant 1:1 Workspace.
- Domain rules live in domain/application boundaries, not controllers, UI or
  persistence adapters.

## Technology and deployment

- The current target is a Java 25 / Spring Boot 4.1 / Spring Modulith modular
  monolith with PostgreSQL, REST/OpenAPI, Flyway, Object Storage and explicit
  external provider ports.
- Do not introduce Redis, Kafka, RabbitMQ, GraphQL, Kubernetes, MongoDB,
  microservices or other infrastructure without extraordinary evidence and
  accepted Architecture authority.
- Web and Mobile are product projections over the same API/domain authority.
  Mobile does not imply a new service or BC.

## Consistency and reliability

- Commitments, credit reservation, scarce inventory, allocation, payment
  application and terminal lifecycle transitions use the smallest correct
  synchronous transaction/lock/CAS mechanism.
- External I/O is outside long database transactions: persist/claim intent,
  commit, perform I/O, then finalize through a fenced/idempotent transaction.
- Reliable asynchronous propagation is source state plus durable outbox in the
  same transaction; consumers use inbox/deduplication and tolerate at-least-once
  delivery.
- No last-write-wins for business-critical state. Conflicts and stale state are
  explicit outcomes.

## Tenancy, security and history

- Authentication, authorization, object-level checks, explicit context,
  server-side predicates, PostgreSQL RLS and isolation tests form defense in
  depth. Missing tenant scope fails closed.
- Workers reconstruct and clear an explicit SYSTEM Tenant/Workspace context.
- Secrets, tokens, payment credentials, Tenant IDs and unnecessary PII never
  enter logs, metrics or events.
- Inventory movements, payments, receivables, POD, issued documents and
  traceability are immutable facts; corrections append explicit reversals,
  addenda or adjustments.

## Mobile and event constraints

- Operations Mobile and Buyer Mobile are two projections, currently
  OWNER-ACCEPTED as product direction, with research pending and no client
  implementation claim.
- Offline may cache, draft or queue selected evidence. It cannot display
  authoritative success for payment, credit, PR submission, SO confirmation,
  authorization mutation, inventory mutation or delivery finalization without
  server acceptance.
- QR is an ephemeral handoff mechanism, not receipt acceptance. Driver outcome,
  Buyer receipt and Buyer discrepancy remain separate facts.
- The published integration event catalog remains exactly fourteen events.
  Scan, QR, push and device facts are internal/application/traceability facts
  unless an explicit event decision is accepted.
