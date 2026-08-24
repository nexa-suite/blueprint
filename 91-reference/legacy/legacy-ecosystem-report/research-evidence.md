# Research evidence

Source: `report/20-chapter-2-requirements-elicitation/2-2-interviews.md`, `2-3-needfinding.md`, `report/10-chapter-1-introduction/1-2-solution-profile.md`, `1-3-target-segments.md`, inspected at `e161fe522023bfe5929e76c4d7c66af211884b7e`.

## OBSERVED EVIDENCE

### Interview sample

Eight recorded profiles are described: three commercial coordination, three operations/warehouse/logistics and two B2B buyers. Source records names, devices, tools, timing and links to consolidated or individual video evidence. Sample is qualitative and small; percentages describe this sample, not market prevalence.

### Repeated operational patterns

- WhatsApp, calls, audio, photos, Excel and ERP coexist. Orders arrive unstructured, then get interpreted and retyped.
- Commercial staff repeatedly verify stock, credit and conditions outside one unified flow.
- Stock shown by existing tools is reported as not reliably matching physical stock; warehouse calls fill the gap.
- Slow, unstable or overloaded software pushes users back to informal channels.
- Field work makes mobile responsiveness, fast feedback and low click count adoption conditions.
- Operations depends on documents, expiry dates, temperature, lot visibility and coordination with warehouse.
- FEFO information is not consistently integrated and may require verbal coordination.
- Buyers want availability, confirmation, ETA/status and documents without repeated calls, while retaining human support for exceptions.
- Delivery closure can lack durable evidence, creating disputes about quantities, delay or cold-chain condition.

### Role/task evidence

| Role evidence | Repeated tasks | Pain signal |
|---|---|---|
| Commercial coordination | receive request, interpret line items, check stock/credit, register order, follow up | double entry, ambiguity, fragmented validation |
| Operations/logistics | inspect stock/lots, manage expiry, prepare/pick, dispatch, record incidents/evidence | physical/theoretical mismatch, FEFO coordination, weak closure traceability |
| B2B buyer | re-stock, browse/ask availability, submit request, track delivery, reconcile receipt | uncertainty, stockouts, dependence on seller |

### Needfinding artifacts

- Three personas: Valeria (commercial), Roberto (operations), Elena (buyer).
- Task matrix marks high frequency/high importance for price/stock, order lists, expiry, delivery status and receipt confirmation across different roles.
- As-Is journeys separate capture/rework, operational coordination/incidents and buyer uncertainty.
- Six-stage As-Is scenario: need/replenishment; request capture; stock/credit/FEFO validation; picking; dispatch/transit; delivery/closure.
- Empathy synthesis: S1 needs less rework; S2 needs control and traceability; S3 needs autonomy and predictable status.

### Qualitative validation evidence

The later AV2/TB2 records report concrete usability findings: missing XML/PDF document generation/download, weak quick filters, no clear `New` marker for orders and no visible credit-available view. One session reports successful operational navigation without critical usability problems. The buyer validation records a cart/return-to-catalog issue as a historical finding; source conclusions say persistence was later added, but this is an implementation claim, not current Nexa evidence.

## LEGACY INTERPRETATION

- Source frames Nexa primarily as a cold-chain-specific web MVP with three formal segments and a tenant/workspace model.
- Source turns observations into proposed capabilities such as FEFO views, POD, route status, credit controls and assisted order capture.
- Source presents competitor positioning and adoption claims as a dated academic landscape.
- Source counts 6/8 WhatsApp, 7/8 fragmentation, 6/8 re-digitization/manual validation, 5/8 logistics visibility gaps, 4/8 instability/latency and 8/8 openness to adoption. These are source coding results, not independent statistical evidence.

## CURRENT ARCHITECTURE INFERENCE

Minimal only:

- Current discovery should revisit request capture, availability truth, fulfillment coordination, delivery evidence and adoption with the real modern product direction.
- Cold-chain evidence is a strong specialization signal, not proof that cold-chain is the exclusive product boundary.
- Role and task observations can inform Capability Mapping, EventStorming and Domain Storytelling; they do not define capabilities, subdomains or bounded contexts.

## Competitor research: dated evidence

Source compares Riqra (B2B commerce), Drivin (TMS/routing), OnTracking/RedGPS (tracking/IoT) and Defontana (ERP). Useful evidence: the legacy team saw fragmentation between commercial, logistics, monitoring and ERP tools. Do not present feature, pricing or market claims as current. Any competitor comparison requires modern revalidation before product or architecture decisions.

## Adoption constraints

- Keep first-use flow fast and legible.
- Preserve human support for exceptions.
- Make status and next step visible.
- Reduce repeated typing and cross-window validation.
- Treat mobile and variable connectivity as research constraints, not proof of a mobile V1 product.

## Caveats

- Interview videos are external links and may expire.
- Some source percentages and browser/device fields include analyst coding or compatibility assumptions.
- Historical roles merge operations and account ownership; current Nexa separates Company Owner, Tenant Administrator and business operations responsibilities.
- No observation here overrides current Product & Business V1 or governance.
