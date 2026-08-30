---
status: draft
maturity: DRAFT
scope: v1
owner: domain
last-reviewed: 2026-08-25
---

# BC-10 Notifications — Tactical Model

**State:** TARGET generic context. Notification intent and delivery state are
owned here; source business state never changes because delivery fails.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `Notification` | intent, recipient/channel selection and lifecycle | source event/subject IDs |
| `NotificationTemplate` | versioned channel template key/content policy | no source ownership |
| `NotificationPreference` | recipient/channel preference and suppression | identity/membership IDs |

Attempts are Notification-owned delivery facts. In-app and email are V1
channels; WhatsApp remains external/manual.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `Notification` | Aggregate Root | notification ID, source event, category, status, createdAt | `create()`, `selectChannel()`, `suppress()`, `markDelivered()`, `markTerminalFailure()` | composes recipients/attempts |
| `NotificationRecipient` | Entity | recipient reference, channel, destination projection, preference result | `select()` | owned by Notification |
| `NotificationAttempt` | Entity / fact | attempt ID, channel, status, retryAt, provider ref | `recordAttempt()`, `scheduleRetry()`, `recordOutcome()` | owned by Notification |
| `NotificationPreference` | Aggregate Root | recipient scope, channel, category, enabled | `enable()`, `disable()` | recipient preference authority |
| `NotificationTemplate` | Aggregate Root | template key/version, channel, content policy, status | `publish()`, `retire()` | template lifecycle |
| `Channel` / `DeliveryStatus` | Enum | `IN_APP`, `EMAIL`; queued/sent/delivered/failed | none | V1 constraints |
| `RecipientReference` / `TemplateKey` | Value Objects | safe identity/durable key | `normalize()` | no secret payload |
| `ChannelSelectionPolicy` | Domain Service | none | `choose(preference, channel availability)` | no notification ownership |
| `RetryPolicy` | Domain Service | max/backoff | `nextAttempt()` | delivery reliability |
| `NotificationRepository` / `NotificationPreferenceRepository` | Repository interfaces | none | `save()`, `byId()` | roots only |
| `NotificationDeliveryFailed` | Domain Event | notification ID, reason, occurredAt | immutable fact | existing published event only |

## Application Layer dictionary

| Class | Capability | Orchestration |
|---|---|---|
| `CreateNotificationCandidateHandler` | consume source event | persist intent, recipient policy and outbox/inbox dedupe |
| `DispatchNotificationHandler` | deliver selected channel | provider adapter, attempt fact and retry state |
| `RetryNotificationHandler` | retry transient failure | lease/fencing and bounded backoff |
| `ManageNotificationPreferenceHandler` | user preference | scoped preference mutation; cannot suppress mandatory security notices without policy |
| `ProjectNotificationHandler` | in-app projection | writes recipient view without changing source state |

## Interface / Presentation Layer dictionary

| Class | Role | AS-IS / TARGET |
|---|---|---|
| `NotificationController` | in-app read/preferences boundary | AS-IS; KEEP/REFINE |
| `NotificationDeliveryConsumer` | email/channel worker input | TARGET application interface |
| `NotificationProjectionConsumer` | Platform/Portal/Mobile reader | TARGET projection interface |

## Infrastructure Layer dictionary

| Class | Role | Status |
|---|---|---|
| `NotificationRepositoryAdapter` | PostgreSQL intent/attempt/preference persistence | AS-IS `JdbcNotification...`; KEEP |
| `EmailDeliveryAdapter` | SMTP provider ACL | AS-IS; provider remains external |
| `InAppNotificationAdapter` | recipient inbox projection | AS-IS `notifications.inbox_item`; KEEP |
| `NotificationOutboxWorker` | at-least-once retry worker | shared technical lease/outbox |

## Invariants and transactions

- Delivery is at-least-once; duplicate attempts are deduped and visible.
- Retryable/terminal failure never changes source PR, SO, payment or delivery
  state.
- Payload excludes secrets and unnecessary personal/payment data.
- V1 channels are in-app and email; WhatsApp is not a hidden third channel.

## Events, persistence and evidence

See [BC-10 data model](data/data-model.md), [target SQL](data/target-relational-model.sql)
and [domain UML](diagrams/domain-model.puml). `NotificationDeliveryFailed.v1`
remains within 14 published events.

AS-IS evidence at API main: `notifications` application/service/controller,
`notifications.inbox_item`, tenant notification preference and V36/V44/V59.
Classification: in-app inbox/preferences **KEEP**, durable intent/attempt
separation **REFINE**, full email retry worker **PARTIAL / NOT IMPLEMENTED**.

## Mobile v0.17 reconciliation

`PushSubscription` is a BC-10-owned recipient/device delivery record with
provider-token hash, installation identity, platform/surface, lifecycle and
version. Subscription registration, rotation, disable/unregister and push
delivery attempts are application/technical reliability behavior, not a Device
or Mobile aggregate. Retry, claim fencing and dead-letter state preserve
at-least-once delivery without mutating source business state. API v0.17.0
provides the provider-neutral foundation in V94–V100; native provider/config/
credential operations remain open.
