---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-30
---

# Mobile Feature-Family Coverage Audit

This audit evaluates the feature families named in the Mobile backlog prompt
against the canonical 73-story registry. A mechanism is not promoted to a
story or Bounded Context when an existing business outcome already covers it.

| Feature family | Canonical coverage | Release posture | Disposition |
|---|---|---|---|
| Foundation and secure access | MOB-US-001..003; TS-015, TS-020 | V1 | Covered by access, context and authorization outcomes. |
| Warehouse receiving and picking | MOB-US-011..017, MOB-US-019; MOB-US-050..056, MOB-US-073 | V1 to V4/Future | V1 keeps the narrow safe flow; discrepancies, disposition, transfer receipt, counts and richer operations are staged. |
| Dispatch and handoff | MOB-US-020..025; MOB-US-057..061 | V1 to V3 | Exceptions, reassignment, grouped loads, carrier handoff and dispatch temperature evidence are separate outcomes. |
| Driver delivery execution | MOB-US-026..034; MOB-US-030, MOB-US-035, MOB-US-062..066 | V1 to V3 | Arrival, instructions, incidents and selective recovery extend the existing delivery lifecycle. |
| Buyer delivery continuity | MOB-US-044, MOB-US-047..049; MOB-US-064, MOB-US-067..069; MOB-US-045..046 | V1 to V3 | Buyer receipt, discrepancy, instructions, timeline, reschedule, contact and consented location remain distinct. |
| Buyer commerce | MOB-US-036..043; MOB-US-070..071 | V2 | Catalog, drafts, requests, orders, documents and payment evidence are not V1 commitments. |
| Field Sales | MOB-US-006..010, MOB-US-072 | V2 to V3 | Calls, email, WhatsApp and navigation are mechanisms within relationship work, not extra Mobile stories. |
| BOM / Company Owner workflows | MOB-US-004..005 and existing governance references | V2+ hypothesis | Approval, dashboards and owner-specific actions remain open until a distinct accepted outcome is evidenced. No invented IDs. |
| Device-native capture | MOB-US-011..012, MOB-US-034, MOB-US-049, MOB-US-069; TS-016 | V1 to V2 | Camera, code, manual fallback and evidence are mechanisms under existing outcomes. |
| Cold chain | MOB-US-019, MOB-US-051, MOB-US-061, MOB-US-073; TS-018 | V1 to V4/Future | Manual attributable evidence is in scope; automatic sensor/telemetry behavior remains a hypothesis. |
| Offline | TS-015, TS-019; MOB-US-035, MOB-US-066 | V2 to V3 | Selective staging/recovery only; no offline authority or generic synchronization promise. |
| Location and navigation | MOB-US-028; MOB-US-029, MOB-US-045, MOB-US-072; TS-017 | V1 to V3 | V1 is external navigation only; stored/background/live tracking requires future consent and retention decisions. |
| Payments and notifications | MOB-US-043, MOB-US-044, MOB-US-071; TS-018 | V1 to V2 | Critical attention and payment evidence are distinct from provider, confirmation and preference mechanisms. |
| Future carriers, route support and IoT | MOB-US-059, MOB-US-060, MOB-US-073; SPIKE-006 | V3 to V4/Future | Grouped loads, handoff and automation evidence are bounded by existing BCs; no carrier, route or IoT BC is created. |

## Duplicate and overinflation audit

- No story is created solely for a scanner, QR code, map, notification
  provider, device, sensor, offline queue or communication channel.
- MOB-US-018 is limited to transfer movement; MOB-US-052 covers destination
  receipt; MOB-US-053 covers cycle count and correction. These are distinct
  warehouse outcomes.
- MOB-US-042 is progress; MOB-US-070 is document retrieval. MOB-US-043 is
  status; MOB-US-071 is payment evidence and review outcome.
- MOB-US-049 is the discrepancy report; MOB-US-069 is evidence attachment.
- MOB-US-028 is navigation handoff; MOB-US-029 and MOB-US-045 are future
  location outcomes with separate consent and retention questions.
- The final count is 73 because the independent outcomes above were missing
  from the historical 49; the count is not a fixed target.
