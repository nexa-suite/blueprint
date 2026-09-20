---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-09-19
---

# Mobile projection over the shared domain

Mobile adds no Bounded Context. It projects the frozen 11-context domain through
two OWNER-ACCEPTED V1 target surfaces: [Nexa Operations Mobile](../../../03-mobile/README.md)
and [Nexa Buyer Mobile](../../../03-mobile/README.md). A Mobile capability is an
experience/use-case composition, not ownership of a new business invariant.

| Research segment / actor | Capability projection | Existing BC authority | Contract / consistency |
|---|---|---|---|
| `MOB-SEG-01` Warehouse & Dispatch Operations — Warehouse Operator | package/label identification, receiving, lot/expiry/quantity, physical discrepancy, picking, and transfer/count/evidence when the story lifecycle allows; manual alternative when scanning is unavailable | BC-03, BC-05, BC-11 | server-authoritative physical mutation; capability, idempotency and explicit outcome required |
| `MOB-SEG-01` Warehouse & Dispatch Operations — Dispatch Coordinator | readiness, outgoing verification, assignment, Dispatch Handoff, exception and coordination | BC-05, BC-06, BC-11 | handoff is a source fact; photo/signature evidence is policy-driven, never universal |
| `MOB-SEG-02` Driver Delivery Execution — Driver / Delivery Operator | assigned Delivery work, Delivery Attempt, external navigation handoff, incident communication, optional policy-authorized evidence, Driver Outcome and POD | BC-06, BC-09, BC-10, BC-11 | no stored/background/live Driver tracking; POD remains immutable and server-authoritative |
| `MOB-SEG-03` B2B Buyers — Customer Buyer | critical Delivery context, handoff, Buyer Receipt and discrepancy; commercial/financial stories by their independent lifecycle | BC-02, BC-03, BC-04, BC-06, BC-07, BC-08, BC-09, BC-10, BC-11 | Buyer Portal remains the complete Web surface; Mobile is a projection, not authority |
| Shared Nexa actor — Sales Representative | eligible Operations Mobile product stories where applicable | applicable BC authority per story | not a currently prioritized Needfinding segment |
| Cross-functional secondary — Business Operations Manager | overview, critical exceptions and authorized decisions where stories require it | BC-01, BC-04, BC-05, BC-06, BC-07, BC-10, BC-11 | projection/read/drill-down; full Web parity is not Mobile V1 priority |

## Boundary decisions

- No Scanning, QR, Maps, Offline, Tracking, Push Notification or IoT BC.
- Camera, package/label scan, secure local storage and external navigation are
  application or integration concerns; Notifications remains BC-10 authority.
- Connectivity is online-first. Temporary evidence or drafts may be staged, but
  there is no generic offline synchronization, local business authority or
  hidden offline success; protected business success requires server authority.
- Dispatch Handoff is not POD. Driver Outcome is not Buyer Receipt; a
  discrepancy preserves both histories and creates an operations resolution.
- Any concept that cannot fit the frozen contexts is a `STRATEGIC DDD REVIEW
  CANDIDATE`, not an automatic new BC.
