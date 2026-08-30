---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-30
---

# Mobile Epic Index

The Master Mobile Product Backlog has twelve outcome-oriented Epics. Five
remain the frozen V1 slice; Epics 06–11 organize V2/V3 refinement and Epic 12
holds the V4/Future hypothesis. Epic identity is a Product projection, not a
Bounded Context or deployment unit.

| Epic ID | Title | Primary Actors | Product Outcome | Primary Capabilities | Primary BCs | Target Releases | Story IDs | Status |
|---|---|---|---|---|---|---|---|---|
| MOBILE-EPIC-01 | Safe Access & Work Context | Mobile User | Return to the right permitted work in the right company context. | CAP-01, CAP-02 | BC-01, BC-02 | V1 | MOB-US-001, MOB-US-002, MOB-US-003 | BASELINED |
| MOBILE-EPIC-02 | Warehouse Receiving, Identification & Picking | Warehouse Operator | Receive, identify and pick stock with safe lot and condition facts. | CAP-07, CAP-08, CAP-10, CAP-15 | BC-03, BC-05, BC-06, BC-11 | V1 | MOB-US-011, MOB-US-012, MOB-US-013, MOB-US-014, MOB-US-015, MOB-US-016, MOB-US-017, MOB-US-019 | BASELINED |
| MOBILE-EPIC-03 | Dispatch Preparation & Handoff | Dispatch Coordinator | Prepare and release a delivery with clear goods and responsibility evidence. | CAP-09, CAP-15 | BC-05, BC-06, BC-09, BC-11 | V1 | MOB-US-020, MOB-US-021, MOB-US-022, MOB-US-023, MOB-US-024, MOB-US-025 | BASELINED |
| MOBILE-EPIC-04 | Driver Delivery Execution & Proof | Driver or Delivery Operator | Execute an assigned delivery and preserve outcome and proof. | CAP-09, CAP-15 | BC-01, BC-06, BC-09, BC-11 | V1 | MOB-US-026, MOB-US-027, MOB-US-028, MOB-US-031, MOB-US-032, MOB-US-033, MOB-US-034 | BASELINED |
| MOBILE-EPIC-05 | Delivery Handoff, Buyer Receipt & Critical Updates | Customer Buyer | Verify the intended handoff, record receipt and notice relevant change. | CAP-09, CAP-14, CAP-15 | BC-02, BC-06, BC-10, BC-11 | V1 | MOB-US-044, MOB-US-047, MOB-US-048, MOB-US-049 | BASELINED |
| MOBILE-EPIC-06 | Commercial & Operational Mobile Convenience | Business Operations Manager, Sales Representative, Customer Buyer | Prepare and follow permitted operational, commercial and financial work. | CAP-03, CAP-04, CAP-05, CAP-06, CAP-11, CAP-13, CAP-16 | BC-01, BC-02, BC-03, BC-04, BC-05, BC-07, BC-08, BC-09, BC-11 | V2 | MOB-US-004, MOB-US-005, MOB-US-006, MOB-US-007, MOB-US-008, MOB-US-009, MOB-US-010, MOB-US-036, MOB-US-037, MOB-US-038, MOB-US-039, MOB-US-040, MOB-US-041, MOB-US-042, MOB-US-043 | BASELINED |
| MOBILE-EPIC-07 | Advanced Field Mobility & Offline Operations | Warehouse Operator, Driver or Delivery Operator, Customer Buyer | Extend field work only where location, contact and recovery rules are accepted. | CAP-09, CAP-15, CAP-16 | BC-02, BC-06, BC-10, BC-11 | V2/V3 | MOB-US-018, MOB-US-029, MOB-US-030, MOB-US-035, MOB-US-045, MOB-US-046 | BASELINED |
| MOBILE-EPIC-08 | Warehouse Transfer & Inventory Accuracy | Warehouse Operator | Resolve transfer, count, disposition and richer warehouse accuracy outcomes. | CAP-07, CAP-08, CAP-10, CAP-15 | BC-03, BC-05, BC-06, BC-11 | V2/V3 | MOB-US-050, MOB-US-051, MOB-US-052, MOB-US-053, MOB-US-054, MOB-US-055, MOB-US-056 | BASELINED |
| MOBILE-EPIC-09 | Dispatch Exception & Delivery Coordination | Dispatch Coordinator, Driver or Delivery Operator, Customer Buyer | Recover dispatch and delivery coordination while preserving responsibility and evidence. | CAP-09, CAP-10, CAP-14, CAP-15 | BC-01, BC-02, BC-05, BC-06, BC-10, BC-11 | V2/V3 | MOB-US-057, MOB-US-058, MOB-US-059, MOB-US-060, MOB-US-061, MOB-US-062, MOB-US-063, MOB-US-064, MOB-US-065, MOB-US-066 | BASELINED |
| MOBILE-EPIC-10 | Buyer Delivery Continuity | Customer Buyer | Help the buyer prepare, understand and evidence delivery continuity. | CAP-09, CAP-15 | BC-02, BC-06, BC-11 | V2 | MOB-US-067, MOB-US-068, MOB-US-069 | BASELINED |
| MOBILE-EPIC-11 | Mobile Commercial & Financial Follow-through | Customer Buyer, Sales Representative | Bring documents, payment evidence and customer visit follow-through into authorized field work. | CAP-03, CAP-12, CAP-13 | BC-02, BC-04, BC-07, BC-08, BC-09, BC-11 | V2/V3 | MOB-US-070, MOB-US-071, MOB-US-072 | BASELINED |
| MOBILE-EPIC-12 | Future Intelligent Field Operations | Warehouse Operator | Explore controlled assistance from richer warehouse observations. | CAP-08, CAP-10 | BC-05, BC-06, BC-11 | V4_FUTURE | MOB-US-073 | HYPOTHESIS |

Canonical story content is in [mobile-v1-catalog.md](../mobile-v1-catalog.md).
The [master backlog](../master-mobile-backlog.md) owns lifecycle fields. The
seven historical Epic filenames are compatibility pointers; their historical
numeric grouping is evidence only. Reconciliation is in
[reconciliation.md](../reconciliation.md).
