---
status: reference
maturity: HISTORICAL
scope: cross-cutting
owner: research
last-reviewed: 2026-08-15
---

# Legacy evidence register

Source repository: `upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report`, commit `e161fe522023bfe5929e76c4d7c66af211884b7e`. Rows rescue evidence only. None creates Product authority, capability, subdomain, Bounded Context, Context Map, aggregate, C4 L3 or Data model.

| Source | Evidence | Classification | Potential destination | Authority | Provenance | Semantic danger / caveat |
|---|---|---|---|---|---|---|
| `research-evidence.md` interviews/needfinding | WhatsApp, calls, audio, photos, Excel and ERP coexist; repeated manual/duplicate entry | KEEP_AS_EVIDENCE | Product evidence; Capability Mapping input; Design input | Current discovery decides meaning | Pinned Legacy commit | Small qualitative sample; not market prevalence |
| `research-evidence.md` | Stock uncertainty and phone verification between commercial and warehouse | KEEP_AS_EVIDENCE | Capability Mapping; EventStorming; Data requirements | Current Product baseline | Pinned Legacy commit | Does not define availability model or ownership |
| `research-evidence.md`, `historical-event-inventory.md` | FEFO/expiry coordination, weak lot/traceability visibility | ADAPT_LATER | EventStorming; Domain Storytelling; Data requirements | Current cold-chain scope, later discovery | Pinned Legacy commit | No ColdChain Bounded Context or automation claim |
| `research-evidence.md` | Operational delays, human dependency and fragmented handoffs | KEEP_AS_EVIDENCE | Product evidence; Capability Mapping; E2E candidate | Current evidence review | Pinned Legacy commit | Historical workflow may differ from Modern AS-IS |
| `research-evidence.md` | Buyer needs availability, confirmation, ETA/status and documents without repeated calls | KEEP_AS_EVIDENCE | Product evidence; Design input; Portal E2E candidate | Current Product and Portal evidence | Pinned Legacy commit | Does not select notification/channel policy |
| `validation-findings.md` | Structured order capture can reduce transcription/rework | CURRENTLY_RELEVANT_EVIDENCE | Design input; E2E candidate | Revalidate with current contracts | Pinned Legacy commit | Historical validation context only |
| `validation-findings.md` | Cart/request draft persistence matters when returning to catalog | CANDIDATE_FOR_REVALIDATION | Design input; Portal E2E candidate | Current UX/runtime verification | Pinned Legacy commit | Later implementation claim is not current evidence |
| `validation-findings.md` | Quick filters, new-order visibility and document download affect task completion | CANDIDATE_FOR_REVALIDATION | Design input; E2E candidate | Current UX and Product review | Pinned Legacy commit | No universal UI requirement created |
| `frontend-reference-map.md` | Dense tables, status badges/timelines, request builder, product cards and dispatch-board patterns | CANDIDATE_FOR_REVALIDATION | Design input | Future Designer and current UX evidence | Pinned Legacy commit | Historical IA is not current module or BC structure |
| `frontend-reference-map.md` | Persistent labels, loading/empty/error states and non-color status communication | CURRENTLY_RELEVANT_EVIDENCE | Design/accessibility input | Current accessibility review | Pinned Legacy commit | No final component/token decision |
| `frontend-reference-map.md` | Responsive field-work and variable-connectivity concerns | KEEP_AS_EVIDENCE | Design input; Security/Runtime input | Current research | Pinned Legacy commit | Does not authorize Mobile V1 |
| `historical-event-inventory.md` | Request capture, stock/credit/FEFO validation, picking, dispatch and delivery closure event candidates | ADAPT_LATER | EventStorming; Domain Storytelling | Current workshops | Pinned Legacy commit | Event names and boundaries require re-creation |
| `historical-language-collisions.md` | Tenant/Workspace, Buyer/Profile, Customer/Client, Purchase Request/Purchase Order/Sales Order, Stock/Availability, Batch/Lot collisions | KEEP_AS_EVIDENCE | Ubiquitous Language input | Strategic DDD | Pinned Legacy commit | No term accepted automatically |
| `legacy-modern-diff.md` | Historical self-registration, role conflation, tenant-owned Buyer and subscription assumptions conflict with current direction | CONFLICTS_WITH_CURRENT | Product/DDD review input | Accepted current Product decisions | Pinned Legacy commit | Preserve conflict, do not migrate semantics |
| `validation-findings.md` | Delivery/POD closure and temperature capture appear in historical validation/material | REVIEW_BEFORE_REPUBLICATION | Domain discovery; Design input; future E2E | Current Product scope and rights review | Pinned Legacy commit | POD/telemetry are not automatically V1 requirements |
| `artifact-classification.md`, `asset-provenance.md` | Binary, participant, consent and Legacy architecture rights remain unresolved | DO_NOT_MIGRATE | Local review queue | Publication policy | Pinned Legacy commit | No binary asset publication |

Historical observations can inform future workshops. They do not override accepted generic tenancy, Product V1, C4 L1/L2 or Strategic DDD not-started status.
