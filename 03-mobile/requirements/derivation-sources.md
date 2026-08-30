---
status: accepted
maturity: BASELINED
scope: runway
owner: product
last-reviewed: 2026-08-29
---

# Mobile Requirements Derivation Sources

Derivation follows `Product Goal → Actor → Goal → CAP → BC → App → Epic →
Story → AC → UX/technical evidence`. Product direction is accepted for
planning; research validation is still pending.

| Area | Actor/app | Shared source | Live/backend evidence | Research state |
|---|---|---|---|---|
| Identity/context | Mobile User; both apps | CAP-02; BC-01 | API identity/context baseline | PENDING |
| Field sales | Sales Representative; Operations | CAP-03..06; BC-02/03/04/05/07 | API v0.17.0 contracts; no client | PENDING |
| Warehouse | Warehouse Operator; Operations | CAP-04/07/08/10/15; BC-03/05/06/11 | SKU/lot/FEFO/pick foundation | PENDING |
| Dispatch/Driver | Dispatch Coordinator/Driver; Operations | CAP-09/10/13/15; BC-06/09/11 | handoff/outcome/evidence foundation; location partial | PENDING |
| Buyer commerce | Customer Buyer; Buyer | CAP-03..07/11/12/13; BC-02/03/04/05/07/08/09 | commitment/finance/document foundation | PENDING |
| Buyer handoff | Customer Buyer; Buyer | CAP-09/15; BC-02/06/11 | ephemeral token, receipt/discrepancy foundation | PENDING |
| Notifications/sync | Mobile User; both apps | CAP-14; BC-10 plus technical contracts | subscription/retry/dead-letter foundation | PENDING |

Historical Web/academic wording is source evidence, not Mobile research. Open
questions cover offline, push provider, camera/GS1/QR, location/privacy,
temperature/evidence, accessibility and recovery.
