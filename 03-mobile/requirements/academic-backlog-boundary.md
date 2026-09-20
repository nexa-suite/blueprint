---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-09-18
---

# Academic backlog boundary

This record fixes the relationship between the canonical Mobile Product
catalog and the final AV1 academic projection.

## Distinct inventories

| Inventory | Count | Meaning | Authority |
|---|---:|---|---|
| Mobile Product functional stories | 73 | `MOB-US-001..073`, all in the Nexa Mobile V1 Product Generation planning envelope | Blueprint Product requirements |
| Academic functional elements | 79 | 73 `MOB` stories plus `LAND-US-001..006` | Mobile Report academic projection |
| Academic Technical Stories | 12 | `TS-MOB-001..012`; course technical planning elements | Mobile Report academic projection |
| Academic Spikes | 6 | `SPIKE-001..006`; course research/enabler elements | Mobile Report academic projection |
| Academic total | 97 | `73 MOB + 6 LAND + 12 Technical + 6 Spikes` | Mobile Report academic projection |

The academic backlog does not redefine the Product catalog. LAND stories are
not Mobile Product stories. Course Technical Stories are not additional
functional Product stories. Course Spikes are research/enabler work, not
Product functionality. Academic Story Points express course planning effort,
not implementation, velocity, verification or acceptance. The final academic
backlog totals **426 SP**.

Source: `nexa-suite/mobile-report` `v1.0.1`, annotated tag target commit
`77895a8950676ccdaec520a61c41107852268606`.

## Final AV1 academic Sprint projection

The following mapping covers every Mobile functional story exactly once. It is
academic planning and is independent of Product Generation and lifecycle.

| Academic Sprint | Mobile functional stories | Mobile count | Total academic PBIs | Total SP |
|---|---|---:|---:|---:|
| Sprint 1 | MOB-US-001, MOB-US-002, MOB-US-003, MOB-US-011 | 4 | 6 | 19 |
| Sprint 2 | MOB-US-004 through MOB-US-010; MOB-US-012 through MOB-US-025 | 21 | 36 | 144 |
| Sprint 3 | MOB-US-026 through MOB-US-049 | 24 | 29 | 129 |
| Sprint 4 | MOB-US-050 through MOB-US-073 | 24 | 26 | 134 |
| **Total** | **MOB-US-001..073** | **73** | **97** | **426** |

Sprint 1 contains four Mobile stories plus `TS-MOB-001` and `TS-MOB-007`.
Sprint 2 additionally contains 6 LAND stories, 5 Technical Stories and 4
Spikes. Sprint 3 contains 5 Technical Stories. Sprint 4 contains 2 Technical
Stories. The detailed academic publication remains in Mobile Report; this
Blueprint record preserves the durable boundary and assignment.

## Evidence boundary

Academic planning does not grant implementation, Technical Verification,
Product Acceptance, System Acceptance or production readiness. The old
28/35/9/1 labels are preserved in the Product backlog as historical planning
bands only.
