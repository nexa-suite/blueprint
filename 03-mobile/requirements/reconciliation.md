---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-30
---

# Mobile Requirements Reconciliation

This matrix preserves every historical `MOB-US-001..049` while extending the
canonical Product registry with independently valuable outcomes
`MOB-US-050..073`. Story bodies remain in
[mobile-v1-catalog.md](mobile-v1-catalog.md); lifecycle state is indexed in
[master-mobile-backlog.md](master-mobile-backlog.md).

## Count and disposition

| Measure | Historical | Final | Interpretation |
|---|---:|---:|---|
| Functional story IDs | 49 | 73 | All historical IDs remain recoverable; 24 new IDs represent independent outcomes. |
| V1 | 42 | 28 | V1 is frozen to access, warehouse, dispatch, Driver delivery proof and narrow Buyer handoff/receipt/update work. |
| V2 | 7 | 35 | Historical deferrals are distributed into refined operational, delivery, commercial and financial outcomes. |
| V3 | 0 | 9 | Higher-cost field coordination, location, selective recovery and Sales outcomes are roadmap-ready. |
| V4/Future | 0 | 1 | Advanced warehouse automation remains a hypothesis only. |
| Epics | 7 | 12 | Five V1 Epics are preserved; five new outcome groups and one Future Epic are added. |
| Technical stories | 20 shared | 20 shared | No Mobile-only technical story or new Bounded Context is created. |
| Spikes | 6 shared | 6 shared | Existing Spike contract is preserved; no new Spike is invented. |

## Historical reconciliation matrix

| Historical ID | Historical title | Action | Current title | Current Epic | Target Release | Status | New replacement (if any) |
|---|---|---|---|---|---|---|---|
| MOB-US-001 | Authenticate on Mobile | REFINE | Continue authorized work safely after returning to Nexa | MOBILE-EPIC-01 | V1 | PLANNED | — |
| MOB-US-002 | Select an active business context | REFINE | Work in the intended company and business context | MOBILE-EPIC-01 | V1 | PLANNED | — |
| MOB-US-003 | Access role-appropriate mobile work and navigation | REFINE | See only work permitted for the person's role | MOBILE-EPIC-01 | V1 | PLANNED | — |
| MOB-US-004 | Review the operational overview on Mobile | RELEASE_MOVE | Review operational work at a glance | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-005 | Review critical operational exceptions | RELEASE_MOVE | Notice critical operational exceptions | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-006 | Search Customer Accounts | RELEASE_MOVE | Find a customer and buyer relationship | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-007 | Review catalog, pricing and availability | RELEASE_MOVE | Review products, prices and availability | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-008 | Prepare a commercial operation for a Customer | RELEASE_MOVE | Prepare a customer request | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-009 | Capture a Purchase Request or Direct Order on Mobile | RELEASE_MOVE | Submit a purchase request from field work | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-010 | Review Orders, Credit and Customer history | RELEASE_MOVE | Follow customer commitments and credit | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-011 | Identify a SKU using the device camera and code scanning | REFINE | Identify a product from a package or label code | MOBILE-EPIC-02 | V1 | PLANNED | — |
| MOB-US-012 | Identify a SKU manually when scanning is unavailable | REFINE | Find a product manually when scanning is unavailable | MOBILE-EPIC-02 | V1 | PLANNED | — |
| MOB-US-013 | Record incoming inventory | REFINE | Record stock that has just arrived | MOBILE-EPIC-02 | V1 | PLANNED | — |
| MOB-US-014 | Record Lot, expiry and quantity | REFINE | Record the actual lot, expiry and quantity | MOBILE-EPIC-02 | V1 | PLANNED | — |
| MOB-US-015 | Review stock and Lots | REFINE | Check current lot and stock condition before physical work | MOBILE-EPIC-02 | V1 | PLANNED | — |
| MOB-US-016 | Confirm Picking using scanning | REFINE | Pick the correct lot and quantity for prepared work | MOBILE-EPIC-02 | V1 | PLANNED | — |
| MOB-US-017 | Record discrepancy or inventory adjustment | REFINE | Report a physical discrepancy or authorized stock disposition | MOBILE-EPIC-02 | V1 | PLANNED | — |
| MOB-US-018 | Execute transfer or inventory-count operations | SPLIT_REFINE | Move stock between warehouse locations | MOBILE-EPIC-07 | V2 | DEFERRED | MOB-US-052, MOB-US-053 |
| MOB-US-019 | Record temperature and evidence | REFINE | Record temperature evidence for relevant stock | MOBILE-EPIC-02 | V1 | PLANNED | — |
| MOB-US-020 | Review Deliveries ready for Dispatch | REFINE | See deliveries ready for dispatch preparation | MOBILE-EPIC-03 | V1 | PLANNED | — |
| MOB-US-021 | Assign a Driver | REFINE | Assign a driver to a ready delivery | MOBILE-EPIC-03 | V1 | PLANNED | — |
| MOB-US-022 | Verify outgoing goods | REFINE | Check outgoing goods against the prepared delivery | MOBILE-EPIC-03 | V1 | PLANNED | — |
| MOB-US-023 | Capture photographic handoff evidence | REFINE | Preserve warehouse-to-driver handoff evidence | MOBILE-EPIC-03 | V1 | PLANNED | — |
| MOB-US-024 | Generate or register a handoff identifier | REFINE | Reliably identify a dispatch handoff | MOBILE-EPIC-03 | V1 | PLANNED | — |
| MOB-US-025 | Confirm Delivery dispatch | REFINE | Confirm goods left warehouse control | MOBILE-EPIC-03 | V1 | PLANNED | — |
| MOB-US-026 | Review assigned Deliveries | REFINE | See deliveries assigned to the driver | MOBILE-EPIC-04 | V1 | PLANNED | — |
| MOB-US-027 | Accept and start a Delivery | REFINE | Begin an assigned delivery | MOBILE-EPIC-04 | V1 | PLANNED | — |
| MOB-US-028 | Navigate to the delivery destination | REFINE | Open directions to the authorized delivery destination | MOBILE-EPIC-04 | V1 | PLANNED | — |
| MOB-US-029 | Share location during an active Delivery | RELEASE_MOVE | Share a delivery location during an active delivery | MOBILE-EPIC-07 | V3 | DEFERRED | — |
| MOB-US-030 | Contact the Buyer in Delivery context | RELEASE_MOVE | Contact the buyer during delivery | MOBILE-EPIC-07 | V2 | DEFERRED | — |
| MOB-US-031 | Record a Delivery Attempt | REFINE | Record the delivery attempt outcome | MOBILE-EPIC-04 | V1 | PLANNED | — |
| MOB-US-032 | Record partial delivery or rejection | REFINE | Record a partial or rejected delivery and what remains | MOBILE-EPIC-04 | V1 | PLANNED | — |
| MOB-US-033 | Capture POD using photo/signature where required | REFINE | Preserve proof of delivery | MOBILE-EPIC-04 | V1 | PLANNED | — |
| MOB-US-034 | Generate a Delivery verification QR | REFINE | Present a bounded delivery handoff code | MOBILE-EPIC-04 | V1 | PLANNED | — |
| MOB-US-035 | Safely finalize a Delivery despite temporary connectivity loss | RELEASE_MOVE | Continue delivery evidence after connection loss | MOBILE-EPIC-07 | V2 | DEFERRED | — |
| MOB-US-036 | Browse the supplier catalog | RELEASE_MOVE | Browse supplier products | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-037 | Review SKU, price and availability | RELEASE_MOVE | Review product price and availability | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-038 | Build and edit a purchase | RELEASE_MOVE | Prepare a purchase request | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-039 | Repeat a previous purchase | RELEASE_MOVE | Repeat a previous purchase | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-040 | Submit a PR or confirm a Direct Order | RELEASE_MOVE | Submit a request or place a direct order | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-041 | Respond to proposed material changes | RELEASE_MOVE | Respond to a material change | MOBILE-EPIC-06 | V2 | DEFERRED | — |
| MOB-US-042 | Track Purchase Requests and Sales Orders | SPLIT_REFINE | Follow requests and orders | MOBILE-EPIC-06 | V2 | DEFERRED | MOB-US-070 |
| MOB-US-043 | Review Credit and Receivables and make a Payment | SPLIT_REFINE | Review credit and payment status | MOBILE-EPIC-06 | V2 | DEFERRED | MOB-US-071 |
| MOB-US-044 | Receive Delivery push notifications | REFINE | Know when a delivery needs attention | MOBILE-EPIC-05 | V1 | PLANNED | — |
| MOB-US-045 | Track an active Driver on a map | RELEASE_MOVE | See an active driver on a map | MOBILE-EPIC-07 | V3 | DEFERRED | — |
| MOB-US-046 | Contact the Driver | RELEASE_MOVE | Contact the driver | MOBILE-EPIC-07 | V2 | DEFERRED | — |
| MOB-US-047 | Scan the Driver-generated Delivery QR | REFINE | Verify a delivery through the handoff code | MOBILE-EPIC-05 | V1 | PLANNED | — |
| MOB-US-048 | Confirm correct receipt | REFINE | Confirm the quantities actually received | MOBILE-EPIC-05 | V1 | PLANNED | — |
| MOB-US-049 | Report discrepancy or rejection during receipt | REFINE | Report a discrepancy without erasing the facts | MOBILE-EPIC-05 | V1 | PLANNED | — |

## New independent story inventory

| ID | Why historical stories do not cover it | Actor | Independent outcome | Release | Epic | Primary BC | CAP |
|---|---|---|---|---|---|---|---|
| MOB-US-050 | Existing receiving stories do not isolate inbound inspection differences and evidence. | Warehouse Operator | Handle an inbound receiving discrepancy with evidence. | V2 | MOBILE-EPIC-08 | BC-05 | CAP-08 |
| MOB-US-051 | Existing disposition wording does not provide a complete hold, quarantine and resolution lifecycle. | Warehouse Operator | Place stock on hold or quarantine and resolve it. | V2 | MOBILE-EPIC-08 | BC-05 | CAP-10 |
| MOB-US-052 | MOB-US-018 covers movement; it does not cover destination confirmation. | Warehouse Operator | Confirm destination receipt for an internal warehouse transfer. | V2 | MOBILE-EPIC-08 | BC-05 | CAP-08 |
| MOB-US-053 | MOB-US-018 combines movement and counting; count correction has a distinct concurrency and audit outcome. | Warehouse Operator | Perform a cycle count and request a stock correction. | V2 | MOBILE-EPIC-08 | BC-05 | CAP-08 |
| MOB-US-054 | No historical story covers an authorized FEFO exception and lot substitution decision. | Warehouse Operator | Apply a reasoned lot substitution when FEFO cannot fulfill work. | V3 | MOBILE-EPIC-08 | BC-05 | CAP-07 |
| MOB-US-055 | Existing code identification is narrow; richer package, lot and storage identity is a separate warehouse outcome. | Warehouse Operator | Use richer product, package and storage identity information. | V3 | MOBILE-EPIC-08 | BC-03 | CAP-08 |
| MOB-US-056 | Existing stories operate on individual tasks; grouped warehouse work needs item-level traceability. | Warehouse Operator | Prepare a batch warehouse operation. | V3 | MOBILE-EPIC-08 | BC-05 | CAP-08 |
| MOB-US-057 | Existing dispatch stories do not provide an exception resolution path before handoff. | Dispatch Coordinator | Resolve a dispatch discrepancy before handoff. | V2 | MOBILE-EPIC-09 | BC-06 | CAP-09 |
| MOB-US-058 | Assignment exists in V1, but safe reassignment and rescheduling is a distinct recovery outcome. | Dispatch Coordinator | Reassign a driver or reschedule dispatch safely. | V2 | MOBILE-EPIC-09 | BC-06 | CAP-09 |
| MOB-US-059 | Existing dispatch work does not cover compatibility rules for grouped and multi-stop loads. | Dispatch Coordinator | Prepare grouped and multi-stop delivery loads. | V3 | MOBILE-EPIC-09 | BC-06 | CAP-09 |
| MOB-US-060 | Warehouse handoff is not the same as carrier responsibility transfer. | Dispatch Coordinator | Complete a carrier handoff with traceable responsibility. | V3 | MOBILE-EPIC-09 | BC-06 | CAP-09 |
| MOB-US-061 | MOB-US-019 concerns stock evidence; dispatch temperature release is a separate delivery decision. | Dispatch Coordinator | Record temperature evidence at dispatch. | V2 | MOBILE-EPIC-09 | BC-06 | CAP-10 |
| MOB-US-062 | Delivery start and completion do not express an explicit arrival signal. | Driver or Delivery Operator | Signal arrival for an active delivery. | V2 | MOBILE-EPIC-09 | BC-06 | CAP-09 |
| MOB-US-063 | Existing contact stories do not provide a scoped instruction and authorized-contact outcome for the driver. | Driver or Delivery Operator | Follow delivery instructions and authorized contact details. | V2 | MOBILE-EPIC-09 | BC-06 | CAP-09 |
| MOB-US-064 | Existing buyer contact does not let a buyer request a schedule change with a separate decision outcome. | Customer Buyer | Request a delivery reschedule from the field. | V2 | MOBILE-EPIC-09 | BC-06 | CAP-09 |
| MOB-US-065 | Existing attempt outcomes do not capture a richer incident context for follow-up. | Driver or Delivery Operator | Record a richer delivery incident. | V2 | MOBILE-EPIC-09 | BC-06 | CAP-09 |
| MOB-US-066 | MOB-US-035 is exploratory; selective evidence recovery is a distinct V3 outcome with explicit conflict handling. | Driver or Delivery Operator | Recover an active delivery through selective offline operation. | V3 | MOBILE-EPIC-09 | BC-06 | CAP-09 |
| MOB-US-067 | Existing receipt stories do not cover buyer-provided instructions and an alternate contact before handoff. | Customer Buyer | Provide delivery instructions and an alternate receipt contact. | V2 | MOBILE-EPIC-10 | BC-06 | CAP-09 |
| MOB-US-068 | Existing receipt and notification stories do not provide a buyer-facing timeline and acknowledgement outcome. | Customer Buyer | Review the delivery timeline and acknowledge completion. | V2 | MOBILE-EPIC-10 | BC-06 | CAP-09 |
| MOB-US-069 | MOB-US-049 reports a discrepancy; adding evidence is a separately reviewable outcome. | Customer Buyer | Attach evidence to a delivery discrepancy. | V2 | MOBILE-EPIC-10 | BC-06 | CAP-15 |
| MOB-US-070 | MOB-US-042 follows progress; retrieving an immutable business document has a distinct access outcome. | Customer Buyer or Sales Representative | View business documents linked to a request or order. | V2 | MOBILE-EPIC-11 | BC-09 | CAP-13 |
| MOB-US-071 | MOB-US-043 shows status; reporting payment evidence and its review result has a distinct financial outcome. | Customer Buyer | Report payment evidence and see its review outcome. | V2 | MOBILE-EPIC-11 | BC-08 | CAP-12 |
| MOB-US-072 | Historical Sales stories prepare commercial work but do not cover an authorized field visit and follow-up. | Sales Representative | Work with a customer through an authorized field visit. | V3 | MOBILE-EPIC-11 | BC-02 | CAP-03 |
| MOB-US-073 | No historical story covers a controlled hypothesis for automated warehouse observations. | Warehouse Operator | Use advanced warehouse automation evidence in controlled work. | V4_FUTURE | MOBILE-EPIC-12 | BC-05 | CAP-08 |

## Historical handling

The seven former Epic filenames remain compatibility pointers. Numeric grouping
in historical documents is evidence only; the current Epic index and master
registry are authoritative. No story is promoted to `IMPLEMENTED`, `VERIFIED`
or `PRODUCT_ACCEPTED` by this reconciliation.
