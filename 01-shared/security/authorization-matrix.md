---
status: accepted
maturity: BASELINED
scope: v1
owner: security
last-reviewed: 2026-08-23
---

# Authorization matrix TARGET

Capabilities are examples for review; role labels do not replace relationship and object checks.

| Use case | Tenant admin | Company owner | Ops manager | Sales | Warehouse | Dispatch | Buyer | System worker |
|---|---|---|---|---|---|---|---|---|
| Tenant settings / membership | manage technical access | manage organization/workforce membership | read | no | no | no | no | bounded |
| Role/capability change | manage technical capabilities | manage workforce roles, audited | no | no | no | no | bounded |
| Buyer relationship approve/suspend | manage | manage | propose/read | manage within grant | no | no | read own | no |
| Product/SKU and price policy | manage | manage | manage | manage within grant | read | read needed | read allowed | projection |
| Purchase Request review | manage/read | manage/read | manage | create/review | read operational | read handoff | create/read own | no |
| Sales Order accept/cancel | manage | manage | manage | manage within grant | read | read | request/cancel allowed state | no |
| Inventory adjustment | audited manage | audited manage | manage | no | manage within grant | read | no | bounded job |
| Commercial Commitment / Physical Allocation | manage/read | manage/read | manage | request/read | manage | read | read allowed | bounded job |
| Fulfillment/pick/pack | read | read | manage | read | manage | read | read own status | bounded job |
| Dispatch/POD/incident | read | read | manage | read | read handoff | manage | read own delivery | bounded job |
| Credit terms and status | manage | manage | read | read allowed | no | no | read own credit status | bounded |
| Payment/refund/reconciliation | manage | manage | manage within grant | initiate/read | no | no | initiate/read own | provider worker |
| Business document issue/download | manage | manage | manage | read/issue grant | read needed | read/attach grant | read own | bounded |
| Audit/export | manage, audited | manage, audited | read/export grant | read own work | read own work | read own work | read own | no raw export |

Every cell still requires Tenant/Workspace scope, object ownership/relationship, state transition and audit policy. Tenant Administrator governs technical access eligibility; Company Owner governs company identity and workforce roles. `no` means no capability, not merely a hidden UI action.
