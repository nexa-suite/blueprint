---
status: planned
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-10-08
---

# Mobile product status

| Dimension | Status | Evidence / meaning |
|---|---|---|
| Product direction | ACCEPTED | Two-app direction and the 73-story Mobile V1 Product Generation envelope are accepted; implementation and acceptance remain separate. |
| Product research | RESEARCH EVIDENCE AVAILABLE | Needfinding is COMPLETE at 9/9 interviews for problem/task evidence; solution validation remains OPEN. |
| Requirements | BASELINED | 73 functional IDs in V1 Product Generation; old 28/35/9/1 bands are historical provenance only. |
| Backend support | PARTIAL | API v0.17.0 provides selected contracts; exclusions and operational gaps remain explicit. |
| Mobile client | PARTIAL / OPERATIONS RELEASED | Operations Android `v1.1.0` is integrated and published for controlled direct distribution against the validation API. Buyer remains NOT IMPLEMENTED; post-release corrective work is unmerged. Release publication does not establish Product/UX Acceptance, System Acceptance or Production Readiness. |
| Design | OPEN | Design Lab is executable Design System evidence; solution prototype validation and Product/UX Acceptance remain open. |
| Production | OPEN | Cloud providers, secrets, push, observability, recovery and acceptance gates remain open. |

Operations Mobile projects Warehouse, Dispatch and Driver work in V1. Buyer
Mobile projects critical Delivery updates, handoff, receipt and discrepancy
work while Buyer Portal remains feature-complete for broader commerce. Both
reuse the same API and eleven accepted Bounded Contexts.

## Operations implementation evidence — 2026-10-08

- Operations Mobile [release v1.1.0](https://github.com/nexa-suite/mobile/releases/tag/v1.1.0)
  is published at immutable Mobile commit
  `6cdb4318fa2e41a0268cce8900c138caffc93aec`, integrated through
  [Mobile PR #39](https://github.com/nexa-suite/mobile/pull/39).
- [Mobile PR #42](https://github.com/nexa-suite/mobile/pull/42) contains
  post-release corrections. The inspected checkpoint
  `176dbfb9be04fc4781e22f6888c781cdcb06b50e` is not part of the published tag;
  its [CI run](https://github.com/nexa-suite/mobile/actions/runs/37857238448)
  passed. Further audit-driven changes remain candidate implementation until
  separately verified and integrated.
- This is AS-IS implementation/publication evidence only. It does not close
  solution validation, physical-device evidence, Product/UX Acceptance,
  System Acceptance or Production Readiness. Buyer runtime remains absent.
