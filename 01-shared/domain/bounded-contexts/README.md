---
status: accepted
maturity: FROZEN
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# Canonical Bounded Contexts

The accepted set is exactly 11. Each folder is independently readable; its
`README.md` is the canonical canvas. No second catalog or canvas index exists.

1. [BC-01 Tenant & Access Governance](BC-01-tenant-access-governance/README.md)
2. [BC-02 Customer & Buyer Relationships](BC-02-customer-buyer-relationships/README.md)
3. [BC-03 Catalog & Commercial Policy](BC-03-catalog-commercial-policy/README.md)
4. [BC-04 Sales Commitment](BC-04-sales-commitment/README.md)
5. [BC-05 Inventory Availability](BC-05-inventory-availability/README.md)
6. [BC-06 Fulfillment & Delivery](BC-06-fulfillment-delivery/README.md)
7. [BC-07 Credit & Receivables](BC-07-credit-receivables/README.md)
8. [BC-08 Payments](BC-08-payments/README.md)
9. [BC-09 Business Documents](BC-09-business-documents/README.md)
10. [BC-10 Notifications](BC-10-notifications/README.md)
11. [BC-11 Business Traceability](BC-11-business-traceability/README.md)

Strategic classification and cross-context rules live in [Strategic DDD](../strategic-ddd/README.md).
No Web/Mobile context copy exists.

Tactical DDD in each context README is TARGET design aid. It does not claim
that current Spring modules, packages or schemas already match strategic model.

## Tactical wave artifacts

Each context also carries its complete TARGET tactical/data lens:

- `tactical-model.md` — Domain, Application, Interface and Infrastructure responsibilities.
- `diagrams/domain-model.puml` — primary Domain UML source with rendered review artifacts.
- `data/data-model.md` and `data/target-relational-model.sql` — relational ownership lens.

The shared [TARGET data model](../../data/master-data-model.md), [traceability
matrix](../../data/tactical-traceability-matrix.md) and [C4 component coverage](../../architecture/c4/component-rubric-coverage.md)
reconcile all eleven contexts. These artifacts are TARGET design evidence;
current API packages and Flyway tables remain AS-IS evidence.
