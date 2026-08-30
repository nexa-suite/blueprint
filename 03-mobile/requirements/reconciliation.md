---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-29
---

# Mobile requirements reconciliation

The former seven epic files were a 49-story proposal with acceptance criteria
explicitly pending. This reconciliation preserves every ID and title as a
traceable input, moves authority to [the V1 catalog](mobile-v1-catalog.md), and
does not silently delete history. The old filenames remain compatibility
pointer documents so there is one canonical story source.

## Count and disposition

| Measure | Before | After | Interpretation |
|---|---:|---:|---|
| Mobile story IDs | 49 | 49 | All historical IDs retained; no unnecessary NEW IDs. |
| V1 candidates | 49 proposed | 42 | Refined with complete AC and explicit backend/client caveats. |
| V2/deferred | 0 explicit | 7 | BOM/exception overview, transfer/count, Driver contact, reorder, active map and Buyer-Driver contact are deferred. |
| Epics | 7 | 7 | Names re-aligned to the Product/App chain; IDs retained. |
| Acceptance criteria | pending | cataloged | AC is still subject to research/Product Acceptance; it is not a product acceptance result. |

## Migration matrix

| Historical ID | Historical title | Disposition | Current ID/title | Reason / source |
|---|---|---|---|---|
| MOB-US-001 | Authenticate on Mobile | REFINE | MOB-US-001 Restore an authenticated Mobile session | Adds revocation, secure storage and offline failure behavior; BC-01/API auth. |
| MOB-US-002 | Select an active business context | REFINE | MOB-US-002 Resolve an active business context | Separates Tenant/Workspace and Buyer Relationship scope; BC-01/02. |
| MOB-US-003 | Access role-appropriate mobile work and navigation | REFINE | MOB-US-003 Render capability-authorized Mobile work | Makes UI non-authoritative and capability version explicit; BC-01. |
| MOB-US-004 | Review the operational overview on Mobile | DEFER | MOB-US-004 Review operational visibility | No accepted BOM Mobile read contract in API v0.17.0; CAP-16 gate. |
| MOB-US-005 | Review critical operational exceptions | DEFER | MOB-US-005 Review critical operational exceptions | Requires accepted exception taxonomy/read projection; CAP-16 gate. |
| MOB-US-006 | Search Customer Accounts | REFINE | MOB-US-006 Find a Customer Account and Buyer Relationship | Relationship authorization made explicit; BC-02. |
| MOB-US-007 | Review catalog, pricing and availability | REFINE | MOB-US-007 Review catalog, price and Sellable Availability | Distinguishes commercial authority from availability projection; BC-03/05. |
| MOB-US-008 | Prepare a commercial operation for a Customer | REFINE | MOB-US-008 Prepare assisted commercial intent in a Request Draft | Draft is not PR/SO/reservation; BC-04. |
| MOB-US-009 | Capture a Purchase Request or Direct Order on Mobile | REFINE | MOB-US-009 Submit a Purchase Request from field workflow | Field Sales story is PR-specific; Direct Order remains explicit in Buyer story 040. |
| MOB-US-010 | Review Orders, Credit and Customer history | REFINE | MOB-US-010 Review PR/SO and contextual Customer credit | Separates query projections from credit authority; BC-02/04/07/11. |
| MOB-US-011 | Identify a SKU using the device camera and code scanning | REFINE | MOB-US-011 Resolve a SKU by physical identifier | Camera is an input abstraction; API v0.17.0 resolution authority is BC-03. |
| MOB-US-012 | Identify a SKU manually when scanning is unavailable | REFINE | MOB-US-012 Resolve a known SKU manually | Manual input is not identifier proof or inventory authority. |
| MOB-US-013 | Record incoming inventory | REFINE | MOB-US-013 Record an inbound inventory receipt | Adds lot/quantity, scope, idempotency and no-offline-success rules; BC-05. |
| MOB-US-014 | Record Lot, expiry and quantity | REFINE | MOB-US-014 Capture received Lot, expiry and quantity | Makes UTC expiry and duplicate receipt behavior explicit. |
| MOB-US-015 | Review stock and Lots | REFINE | MOB-US-015 Review physical and sellable stock/Lots | Separates physical/sellable/disposition states. |
| MOB-US-016 | Confirm Picking using scanning | REFINE | MOB-US-016 Validate FEFO scan and execute an allocated pick | Aligns with API v0.17.0 FEFO/over-pick/override contract; BC-05 owns authority. |
| MOB-US-017 | Record discrepancy or inventory adjustment | REFINE | MOB-US-017 Record a picking discrepancy or authorized inventory disposition | Distinguishes discrepancy from privileged correction and preserves facts. |
| MOB-US-018 | Execute transfer or inventory-count operations | DEFER | MOB-US-018 Execute transfer or inventory-count operations | API v0.17.0 explicitly excludes advanced transfer/count; no V1 authority. |
| MOB-US-019 | Record temperature and evidence | REFINE | MOB-US-019 Record receiving or warehouse temperature evidence | Manual V1 evidence; IoT/continuous telemetry remains Future. |
| MOB-US-020 | Review Deliveries ready for Dispatch | REFINE | MOB-US-020 Review Fulfillment-ready Deliveries | Readiness, allocation and evidence gates made explicit. |
| MOB-US-021 | Assign a Driver | REFINE | MOB-US-021 Assign a Driver | Adds assignment eligibility/version/idempotency. |
| MOB-US-022 | Verify outgoing goods | REFINE | MOB-US-022 Verify outgoing goods against allocation | Makes allocation binding and stale mismatch rejection explicit. |
| MOB-US-023 | Capture photographic handoff evidence | REFINE | MOB-US-023 Record dispatch handoff evidence | Handoff evidence, Object Storage metadata and no-POD confusion. |
| MOB-US-024 | Generate or register a handoff identifier | REFINE | MOB-US-024 Record a stable Dispatch Handoff identifier | Separates stable dispatch reference from ephemeral Buyer token/QR. |
| MOB-US-025 | Confirm Delivery dispatch | REFINE | MOB-US-025 Confirm Delivery dispatch after handoff | Requires complete upstream evidence and atomic lifecycle transition. |
| MOB-US-026 | Review assigned Deliveries | REFINE | MOB-US-026 View assigned Deliveries | Assignment filtering and stale cache safety. |
| MOB-US-027 | Accept and start a Delivery | REFINE | MOB-US-027 Start a Delivery Attempt | Uses canonical Attempt lifecycle; no implicit acceptance. |
| MOB-US-028 | Navigate to the delivery destination | REFINE | MOB-US-028 Launch external navigation from Delivery context | Maps are external; navigation cannot mutate Delivery state. |
| MOB-US-029 | Share location during an active Delivery | REFINE | MOB-US-029 Capture location only within an active Delivery | Bounded active lifecycle replaces permanent/continuous tracking; API support NOT IMPLEMENTED. |
| MOB-US-030 | Contact the Buyer in Delivery context | DEFER | MOB-US-030 Contact the Buyer from Delivery context | Provider/consent/personal contact excluded from API v0.17.0. |
| MOB-US-031 | Record a Delivery Attempt | REFINE | MOB-US-031 Record a Delivery Attempt outcome | Makes outcome and retry semantics explicit. |
| MOB-US-032 | Record partial delivery or rejection | REFINE | MOB-US-032 Record partial or rejected Delivery and continuation | Preserves delivered/rejected/remaining facts and one continuation. |
| MOB-US-033 | Capture POD using photo/signature where required | REFINE | MOB-US-033 Capture policy-driven POD evidence | Evidence policy, Object Storage and immutable POD clarified. |
| MOB-US-034 | Generate a Delivery verification QR | REFINE | MOB-US-034 Issue or present an ephemeral Buyer Delivery Handoff QR | Aligns with API v0.17.0 bounded one-time token; QR != acceptance. |
| MOB-US-035 | Safely finalize a Delivery despite temporary connectivity loss | REFINE | MOB-US-035 Queue and synchronize critical Driver evidence safely | Removes fake offline finalization; selective evidence queue only. |
| MOB-US-036 | Browse the supplier catalog | REFINE | MOB-US-036 Browse the supplier catalog | Buyer Relationship and stale cache constraints added. |
| MOB-US-037 | Review SKU, price and availability | REFINE | MOB-US-037 Review authoritative SKU price and Sellable Availability | Separates BC-03 price from BC-05 availability. |
| MOB-US-038 | Build and edit a purchase | REFINE | MOB-US-038 Maintain a Request Draft | Draft boundary and no-reservation semantics added. |
| MOB-US-039 | Repeat a previous purchase | DEFER | MOB-US-039 Reorder a previous purchase | Advanced Buyer quick actions excluded from API v0.17.0. |
| MOB-US-040 | Submit a PR or confirm a Direct Order | REFINE | MOB-US-040 Submit a PR or place a Direct Order under policy | Explicit two branches; Direct Order is not fake PR. |
| MOB-US-041 | Respond to proposed material changes | REFINE | MOB-US-041 Respond to a material change | Versioned accept/reject and unchanged original on rejection. |
| MOB-US-042 | Track Purchase Requests and Sales Orders | REFINE | MOB-US-042 Review PR/SO status, history and Business Documents | Adds immutable documents and traceability projections. |
| MOB-US-043 | Review Credit and Receivables and make a Payment | REFINE | MOB-US-043 Review Credit/Receivables and report allowed Payment evidence | Payment Reported != Payment Confirmed; no offline confirmation. |
| MOB-US-044 | Receive Delivery push notifications | REFINE | MOB-US-044 Register/refresh a Push Subscription and receive critical notifications | Aligns with API v0.17.0 subscription lifecycle; provider remains deferred. |
| MOB-US-045 | Track an active Driver on a map | SUPERSEDE + DEFER | MOB-US-029 bounded location for V1; MOB-US-045 retained as V2 | V1 replaces continuous map tracking with bounded active-delivery location. |
| MOB-US-046 | Contact the Driver | DEFER | MOB-US-046 Contact the Driver | Provider/consent/chat not established; no V1 contact channel. |
| MOB-US-047 | Scan the Driver-generated Delivery QR | REFINE | MOB-US-047 Scan and resolve a Delivery Handoff QR | Adds one-time/TTL/relationship authorization; QR != receipt. |
| MOB-US-048 | Confirm correct receipt | REFINE | MOB-US-048 Review handoff and confirm received quantities | Buyer Receipt Fact is separate from Driver outcome/POD. |
| MOB-US-049 | Report discrepancy or rejection during receipt | REFINE | MOB-US-049 Report Buyer discrepancy and preserve receipt fact | Immutable discrepancy/reason/evidence; no hidden returns/RMA. |

## History handling

The original 2026-08-24 epic inventory is represented above exactly enough to
recover ID, title, status and semantic disposition. Its former AC-pending
state is superseded by the cataloged AC blocks; no story is silently promoted
to `PRODUCT ACCEPTED` or `IMPLEMENTED`.
