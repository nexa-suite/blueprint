---
status: accepted
maturity: BASELINED
scope: v1
owner: data
last-reviewed: 2026-08-29
---

# BC-10 target relational model

TARGET. Import source: [target-relational-model.sql](target-relational-model.sql).
Visual ERD: [PlantUML](database-diagram.puml) · [SVG](database-diagram.svg) · [PNG](database-diagram.png).

| Table | PK / local FK | Integrity |
|---|---|---|
| `notification_template` | `template_id` | scoped event/channel/version unique; immutable content version |
| `notification` | `notification_id`; template FK | event ID external; delivery state/version |
| `notification_recipient` | `recipient_id`; notification FK | recipient pair unique; address/status checks |
| `notification_preference` | `preference_id` | scoped recipient/event/channel unique |
| `push_subscription` | `push_subscription_id` | installation-scoped provider-token hash and lifecycle |
| `notification_attempt` | `attempt_id`; notification/recipient FK | retry attempt history |

SQL defines tenant/workspace scope, PK/FK, NOT NULL, channel/status checks,
uniques and queue/retry indexes. RLS is required by deployment. Template
content is a versioned JSON snapshot; it does not own business truth.

V1 business notification channels remain exactly `IN_APP` and `EMAIL`.
`push_subscription` is the provider-neutral Mobile delivery foundation and
does not make provider tokens or devices business authority. Delivery retry,
claim fencing, invalid-token disablement and dead-letter handling remain
application/technical reliability behavior.

Event IDs and recipient identity keys are stable references. Delivery failure
does not rewrite the source event. AS-IS anchors: `notifications.inbox_item`
and `tenant_management.notification_preference`.
