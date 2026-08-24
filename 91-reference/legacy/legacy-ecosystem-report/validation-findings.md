# Historical validation findings

Sources: `report/50-chapter-5-implementation-validation-deployment/5-3-validation-interviews.md`, `report/annexes/annex-c-validation-evidence.md`, `report/90-conclusions.md`.

Classification separates `HISTORICALLY VALIDATED` from `HISTORICAL CLAIM REQUIRING REVALIDATION`.

## Findings

| Finding | Status | Evidence | Current use |
|---|---|---|---|
| Structured order capture can reduce repeated transcription/rework. | HISTORICALLY VALIDATED | Needfinding plus S1 interviews and H1 validation narrative. | Re-test with modern assisted capture and real contracts. |
| Stock visibility and physical/theoretical mismatch cause repeated manual checks. | HISTORICALLY VALIDATED | Multiple interviews; S1/S2 analysis. | Strong input for availability/fulfillment exploration. |
| Order, stock and dispatch coordination is fragmented. | HISTORICALLY VALIDATED | As-Is journeys, EventStorming pains, S2 validation. | Input to Capability Mapping and current EventStorming. |
| Buyer self-service/status visibility can reduce calls. | HISTORICALLY VALIDATED | S3 interviews and H3 narrative. | Revalidate with current Portal and support model. |
| Cart/request draft persistence matters when buyer returns to catalog. | HISTORICALLY VALIDATED as historical usability finding | AV2/TB2 records and conclusion say persistence was added. | Re-test; do not assume current implementation. |
| New-order visual notification helps operational discovery. | HISTORICALLY VALIDATED as heuristic finding | TB2 `New` marker finding. | Include browser/UX acceptance candidate. |
| Quick filters are needed in order/document lists. | HISTORICALLY VALIDATED as heuristic finding | TB2 S1/S2 findings. | Include usability acceptance candidate. |
| Credit-available visibility matters at buyer billing/validation point. | HISTORICALLY VALIDATED as observed gap | TB2 S3-02 and heuristic table. | Revalidate current pricing/credit authority. |
| XML/PDF document generation/download gap harms task completion. | HISTORICALLY VALIDATED as observed gap | TB2 S1 and heuristic evidence. | Preserve document usability need; do not infer fiscal capability. |
| Human support and WhatsApp coexistence are adoption constraints. | HISTORICALLY VALIDATED as qualitative adoption evidence | S3 interview and H4 narrative. | Preserve as adoption hypothesis; current channels not decided. |
| FEFO/expiry visibility improves cold-chain operations. | HISTORICAL CLAIM REQUIRING REVALIDATION | Interviews, task matrix and design narratives. | Re-test with current Inventory domain and physical operations. |
| POD/photos/signatures and temperature capture are required V1 capabilities. | HISTORICAL CLAIM REQUIRING REVALIDATION | Legacy stories/mockups; partly future/mobile/IoT. | Keep as future/research question; no current V1 assertion. |
| Buyer autonomy, tracking and documents are sufficient for adoption. | HISTORICAL CLAIM REQUIRING REVALIDATION | Lean UX H3 and source conclusions are partial. | Re-test with real buyers and current Portal. |
| Product reduces market-level losses or proves commercial viability. | HISTORICAL CLAIM REQUIRING REVALIDATION | Conclusion and literature framing. | Do not use as current KPI or market fact. |

## Dated competitor evidence

Legacy competitor assertions about Riqra, Drivin, OnTracking/RedGPS and Defontana are dated research, not current capability facts. Modern revalidation required before positioning, procurement or architecture decisions.

## Validation limitations

- Small qualitative samples; no statistical significance.
- Some participants and links are external; accessibility/consent must be reviewed before republication.
- Source conclusion mixes research, implementation and architecture claims; only the research observations are rescued here.
- Legacy “validated” means observed in its academic test context, not proven in modern Nexa production.
