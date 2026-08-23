---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-23
---

# UI State Contract

Every business-critical workflow intentionally represents these states. Labels may be localized, but semantics cannot collapse into one generic error.

| State | Meaning | Required behavior |
|---|---|---|
| `LOADING` | authoritative data/command is pending | show progress; prevent duplicate irreversible action; preserve context |
| `EMPTY` | valid scope has no records | explain whether no data, no eligible records or no history; offer safe next action |
| `SUCCESS` | authoritative operation/data completed | show resulting source state, identifier, timestamp/correlation where useful |
| `VALIDATION_ERROR` | input/shape cannot be accepted | identify fields/rules; no business state mutation |
| `BUSINESS_REJECTION` | domain policy rejects a validly shaped request | explain current reason and safe alternative; no optimistic success |
| `TECHNICAL_FAILURE` | infrastructure/provider/system failure | preserve entered intent, show retry/reconciliation path and reference; do not claim business outcome |
| `CONFLICT / STALE_STATE` | revision, availability, credit or lifecycle changed | refetch authoritative state, show what changed and require deliberate retry |
| `PERMISSION_DENIED` | actor lacks current scope/capability | do not reveal protected data; explain access boundary without leaking existence |

## Critical operation rules

- PR submit, material-change acceptance, PR-to-SO, direct order, cancellation, inventory adjustment, transfer receive, fulfillment/POD finalization, payment confirmation/application and document issuance require explicit pending/result state.
- `SUCCESS` is shown only after authoritative response or durable accepted result. A browser event, provider callback or change-feed hint alone is not success.
- Provider pending/failure is distinct from business rejection. Payment pending does not equal Payment Confirmed; email failure does not undo source state.
- Partial fulfillment/delivery shows delivered, rejected, remaining and continuation quantities separately.
- Traceability and document views show immutable historical facts and linked corrections rather than rewriting old content.

## Accessibility and design boundary

States must be perceivable without color alone, keyboard reachable, announced appropriately and responsive at narrow widths and 400% reflow. Design Lab provides visual/interaction evidence; Blueprint defines product-state semantics.
