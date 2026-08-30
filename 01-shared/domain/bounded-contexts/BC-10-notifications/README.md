---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-23
---

# BC-10 Notifications

| Canvas field | Canonical target |
|---|---|
| Purpose / classification | Owns notification intent and channel delivery state; Generic. Strategic importance: reliable communication without becoming business authority. |
| Language / actors | Notification, candidate, template, recipient, channel, preference, attempt, retry, failure. Actors: Buyer, workforce recipients and delivery worker. |
| Responsibilities / data | Candidate creation, recipient/channel policy, in-app/email delivery, retries, terminal failure and delivery evidence. |
| Invariants | At-least-once delivery; retryable failure is explicit; failure never changes source business state; not every event becomes push. |
| Commands | CreateNotificationCandidate, SelectChannel, DispatchNotification, RetryNotification, MarkDeliveryFailed, SuppressNotification. |
| Domain / published events | Internal: NotificationCandidateCreated, NotificationAttempted, NotificationDelivered. Published: NotificationDeliveryFailed.v1. |
| Upstream / downstream | Upstream: source BC published facts. Downstream: recipients and Business Traceability. Sync: candidate persistence; async: delivery/retry. |
| Failure / transaction | Outbox/inbox, retry and dead-letter/reviewable terminal state; provider outage does not roll back source fact. |
| Security / tenant | Recipient and channel preferences are scoped; payload avoids secrets and unnecessary personal data; authorization applies to in-app projections. |
| Web / Mobile consumers | Web: Platform/Portal in-app and email. Mobile: push is core proposed capability for Buyer, Driver, Warehouse and BOM; this context remains authority. |
| Out of scope | Source business lifecycle, push-device BC, chat, permanent tracking and a Mobile Notifications BC. |

## Tactical DDD target

Aggregate Root: Notification. Entities: NotificationAttempt, Recipient, ChannelPreference. Value Objects: NotificationId, TemplateKey, Channel, DeliveryStatus. Domain Services: ChannelSelectionPolicy, RetryPolicy. Repositories: NotificationRepository. Lifecycle: candidate → queued → attempted → delivered/retryable-failed/terminal-failed.

## Tactical wave artifacts

- [Tactical model](tactical-model.md)
- [Domain UML source](diagrams/domain-model.puml)
- [Rendered UML SVG](diagrams/BC10_Notifications.svg)
- [Rendered UML PNG](diagrams/BC10_Notifications.png)
- [Target data model](data/data-model.md)
- [Target SQL](data/target-relational-model.sql)
- [Database ERD SVG](data/database-diagram.svg) · [PNG](data/database-diagram.png)
