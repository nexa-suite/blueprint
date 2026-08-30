---
status: accepted
maturity: BASELINED
scope: v1
owner: product
last-reviewed: 2026-08-29
---

# BC-10 — Notifications functional contract

**Purpose:** turn committed source facts into authorized notification intent,
channel attempts, retryable failure and recipient projection.

| Contract element | Definition |
|---|---|
| Concepts / roots | Notification, Recipient, Template, Preference, Channel, Attempt, Retry, Dead Letter |
| Value objects | NotificationId, RecipientReference, TemplateKey, Channel, DeliveryStatus, RetryAt |
| Boundary | Owns notification intent/delivery state; source BCs remain business authority. |
| Commands | CreateNotificationCandidate, RegisterPushSubscription, RotatePushSubscription, DisablePushSubscription, DispatchNotification, RetryNotification, SuppressNotification |
| Queries | ReadInbox, ReadNotificationStatus, ReadPreferences, ReadPushSubscriptions |
| Invariants | Delivery is at-least-once and deduped; provider failure never mutates source business state; payload avoids secrets/avoidable PII; not every event is push. |
| Actors / surfaces | Authorized recipients; Platform, Buyer Portal, Operations Mobile and Buyer Mobile. |
| Synchronous dependencies | Recipient authorization from BC-01/02; source fact committed before notification intent. |
| Events / consumers | `NotificationDeliveryFailed.v1`; consumes existing source events; push subscription/attempt facts stay internal. |
| Trace / idempotency / concurrency | subscription token hash and device lifecycle keys; attempt dedupe, lease/fencing, bounded retry/dead-letter, safe payload trace. |
| Scope | V1: in-app/email plus provider-neutral push subscription/retry foundation. V2/Future: provider campaigns, rich preferences and chat. |
| AS-IS evidence | API v0.17.0 push subscription registration/rotation/disable/unregister and durable retry/dead-letter foundation; native provider is deferred. |
