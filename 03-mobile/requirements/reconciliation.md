---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-30
---

# Mobile requirements reconciliation

This matrix preserves all 49 historical IDs and titles while making the
Mobile Surface Scope Amendment / Rebaseline explicit. The amendment changes
surface exposure, story refinement, Epic composition and academic planning
only. It does not change the eleven accepted Bounded Contexts, Core Domain,
invariants, finance semantics or the fourteen Published Integration Events.

## Count and disposition

| Measure | Before | After | Interpretation |
|---|---:|---:|---|
| Mobile story IDs | 49 | 49 | Every historical ID remains recoverable. |
| V1 candidates | 42 | 28 | V1 is narrowed to access, warehouse, dispatch, Driver delivery proof and narrow Buyer handoff/receipt/update work. |
| V2/deferred | 7 | 21 | Field Sales, broad Buyer commerce, generic offline sync, stored location, maps, contact and advanced warehouse work are deferred. |
| Epics | 7 | 7 | Epic IDs remain; membership is re-composed by human/business outcome. |
| V1 functional acceptance criteria | pending | cataloged | Four Gherkin-style scenarios are present per V1 story; Product Acceptance remains open. |

## Migration matrix

| Historical ID | Historical title | Disposition | Current title | Current Epic | Scope and reason |
|---|---|---|---|---|---|
| MOB-US-001 | Authenticate on Mobile | REFINE | Continue authorized work safely after returning to Nexa | MOBILE-EPIC-01 | V1; safe return to authorized work, not a framework claim. |
| MOB-US-002 | Select an active business context | REFINE | Work in the intended company and business context | MOBILE-EPIC-01 | V1; Tenant, Workspace and Buyer Relationship remain distinct. |
| MOB-US-003 | Access role-appropriate mobile work and navigation | REFINE | See only work permitted for the person's role | MOBILE-EPIC-01 | V1; server-side authorization remains authoritative. |
| MOB-US-004 | Review the operational overview on Mobile | DEFER | Review operational work at a glance | MOBILE-EPIC-06 | V2+; accepted operational projection and freshness rules are not closed. |
| MOB-US-005 | Review critical operational exceptions | DEFER | Notice critical operational exceptions | MOBILE-EPIC-06 | V2+; exception taxonomy and response ownership remain open. |
| MOB-US-006 | Search Customer Accounts | DEFER | Find a customer and buyer relationship | MOBILE-EPIC-06 | V2+; field commercial access is removed from V1. |
| MOB-US-007 | Review catalog, pricing and availability | DEFER | Review products, prices and availability | MOBILE-EPIC-06 | V2+; broad commercial convenience is not the V1 slice. |
| MOB-US-008 | Prepare a commercial operation for a Customer | DEFER | Prepare a customer request | MOBILE-EPIC-06 | V2+; drafts remain distinct from commitments. |
| MOB-US-009 | Capture a Purchase Request or Direct Order on Mobile | DEFER | Submit a purchase request from field work | MOBILE-EPIC-06 | V2+; no Platform-on-phone parity in V1. |
| MOB-US-010 | Review Orders, Credit and Customer history | DEFER | Follow customer commitments and credit | MOBILE-EPIC-06 | V2+; broad commercial and finance visibility deferred. |
| MOB-US-011 | Identify a SKU using the device camera and code scanning | REFINE | Identify a product from a package or label code | MOBILE-EPIC-02 | V1; code camera plus safe fallback, with product identity authoritative in Catalog. |
| MOB-US-012 | Identify a SKU manually when scanning is unavailable | REFINE | Find a product manually when scanning is unavailable | MOBILE-EPIC-02 | V1; manual fallback does not guess or create stock truth. |
| MOB-US-013 | Record incoming inventory | REFINE | Record stock that has just arrived | MOBILE-EPIC-02 | V1; lot, quantity, authorization and connected confirmation required. |
| MOB-US-014 | Record Lot, expiry and quantity | REFINE | Record the actual lot, expiry and quantity | MOBILE-EPIC-02 | V1; actual physical facts support FEFO and availability. |
| MOB-US-015 | Review stock and Lots | REFINE | Check current lot and stock condition before physical work | MOBILE-EPIC-02 | V1; physical, sellable, held and quarantined states stay distinct. |
| MOB-US-016 | Confirm Picking using scanning | REFINE | Pick the correct lot and quantity for prepared work | MOBILE-EPIC-02 | V1; FEFO, allocation binding and no over-pick. |
| MOB-US-017 | Record discrepancy or inventory adjustment | REFINE | Report a physical discrepancy or authorized stock disposition | MOBILE-EPIC-02 | V1; discrepancy and authorized disposition preserve corrective evidence. |
| MOB-US-018 | Execute transfer or inventory-count operations | DEFER | Move stock or perform a count | MOBILE-EPIC-07 | V2+; transfer/count rules and concurrency evidence remain open. |
| MOB-US-019 | Record temperature and evidence | REFINE | Record temperature evidence for relevant stock | MOBILE-EPIC-02 | V1; manual attributable evidence, not IoT or continuous telemetry. |
| MOB-US-020 | Review Deliveries ready for Dispatch | REFINE | See deliveries ready for dispatch preparation | MOBILE-EPIC-03 | V1; readiness gates precede handoff. |
| MOB-US-021 | Assign a Driver | REFINE | Assign a driver to a ready delivery | MOBILE-EPIC-03 | V1; eligibility, current state and safe retry apply. |
| MOB-US-022 | Verify outgoing goods | REFINE | Check outgoing goods against the prepared delivery | MOBILE-EPIC-03 | V1; lot and quantity must match physical allocation. |
| MOB-US-023 | Capture photographic handoff evidence | REFINE | Preserve warehouse-to-driver handoff evidence | MOBILE-EPIC-03 | V1; evidence is distinct from POD and may be staged temporarily. |
| MOB-US-024 | Generate or register a handoff identifier | REFINE | Reliably identify a dispatch handoff | MOBILE-EPIC-03 | V1; dispatch identity is distinct from Buyer acceptance. |
| MOB-US-025 | Confirm Delivery dispatch | REFINE | Confirm goods left warehouse control | MOBILE-EPIC-03 | V1; final dispatch gate requires current upstream facts. |
| MOB-US-026 | Review assigned Deliveries | REFINE | See deliveries assigned to the driver | MOBILE-EPIC-04 | V1; assigned Delivery read and freshness. |
| MOB-US-027 | Accept and start a Delivery | REFINE | Begin an assigned delivery | MOBILE-EPIC-04 | V1; starts an Attempt, not implicit acceptance or location tracking. |
| MOB-US-028 | Navigate to the delivery destination | REFINE | Open directions to the authorized delivery destination | MOBILE-EPIC-04 | V1; external navigation handoff only. |
| MOB-US-029 | Share location during an active Delivery | DEFER | Share a delivery location during an active delivery | MOBILE-EPIC-07 | V2+; stored, periodic, background and live location are deferred. |
| MOB-US-030 | Contact the Buyer in Delivery context | DEFER | Contact the buyer during delivery | MOBILE-EPIC-07 | V2+; provider, consent and audit channel are not accepted. |
| MOB-US-031 | Record a Delivery Attempt | REFINE | Record the delivery attempt outcome | MOBILE-EPIC-04 | V1; Driver outcome is separate from Buyer receipt. |
| MOB-US-032 | Record partial delivery or rejection | REFINE | Record a partial or rejected delivery and what remains | MOBILE-EPIC-04 | V1; delivered, rejected, remaining and continuation facts stay distinct. |
| MOB-US-033 | Capture POD using photo/signature where required | REFINE | Preserve proof of delivery | MOBILE-EPIC-04 | V1; policy-driven immutable proof, not false completion. |
| MOB-US-034 | Generate a Delivery verification QR | REFINE | Present a bounded delivery handoff code | MOBILE-EPIC-04 | V1; code identifies handoff and is not acceptance. |
| MOB-US-035 | Safely finalize a Delivery despite temporary connectivity loss | DEFER | Continue delivery evidence after connection loss | MOBILE-EPIC-07 | V2+; generic offline evidence queue/sync is deferred. |
| MOB-US-036 | Browse the supplier catalog | DEFER | Browse supplier products | MOBILE-EPIC-06 | V2+; Buyer catalog convenience remains in Portal/V2. |
| MOB-US-037 | Review SKU, price and availability | DEFER | Review product price and availability | MOBILE-EPIC-06 | V2+; broad Buyer commerce is not V1. |
| MOB-US-038 | Build and edit a purchase | DEFER | Prepare a purchase request | MOBILE-EPIC-06 | V2+; local draft never becomes a commitment. |
| MOB-US-039 | Repeat a previous purchase | DEFER | Repeat a previous purchase | MOBILE-EPIC-06 | V2+; current revalidation and reorder policy remain open. |
| MOB-US-040 | Submit a PR or confirm a Direct Order | DEFER | Submit a request or place a direct order | MOBILE-EPIC-06 | V2+; PR and Direct Order remain distinct paths. |
| MOB-US-041 | Respond to proposed material changes | DEFER | Respond to a material change | MOBILE-EPIC-06 | V2+; versioned commitment response remains deferred. |
| MOB-US-042 | Track Purchase Requests and Sales Orders | DEFER | Follow requests, orders and documents | MOBILE-EPIC-06 | V2+; broad history/document convenience remains deferred. |
| MOB-US-043 | Review Credit and Receivables and make a Payment | DEFER | Review credit and report payment evidence | MOBILE-EPIC-06 | V2+; Payment Reported remains distinct from Payment Confirmed. |
| MOB-US-044 | Receive Delivery push notifications | REFINE | Know when a delivery needs attention | MOBILE-EPIC-05 | V1; human outcome is critical Delivery awareness; subscription lifecycle is technical. |
| MOB-US-045 | Track an active Driver on a map | SUPERSEDE + DEFER | See an active driver on a map | MOBILE-EPIC-07 | V2+; V1 uses MOB-US-028 external navigation only. |
| MOB-US-046 | Contact the Driver | DEFER | Contact the driver | MOBILE-EPIC-07 | V2+; provider, consent and audit channel remain open. |
| MOB-US-047 | Scan the Driver-generated Delivery QR | REFINE | Verify a delivery through the handoff code | MOBILE-EPIC-05 | V1; verification is not receipt, POD, payment or completion. |
| MOB-US-048 | Confirm correct receipt | REFINE | Confirm the quantities actually received | MOBILE-EPIC-05 | V1; Buyer receipt is a separate immutable fact. |
| MOB-US-049 | Report discrepancy or rejection during receipt | REFINE | Report a discrepancy without erasing the facts | MOBILE-EPIC-05 | V1; discrepancy preserves receipt, Driver and evidence history. |

## Historical handling

The seven former Epic filenames remain compatibility pointers. Historical
numeric grouping is evidence only; the current canonical catalog and Epic
index are authoritative for scope. No story is promoted to PRODUCT ACCEPTED,
IMPLEMENTED or production-ready by this rebaseline.
