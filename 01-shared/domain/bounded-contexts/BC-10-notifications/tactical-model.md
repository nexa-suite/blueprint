---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-09-20
---

# BC-10 Notifications — Tactical Model

**State:** TARGET generic context. Notification intent and delivery state are
owned here; source business state never changes because delivery fails.

## Purpose and product participation

Own notification intent, recipient policy, in-app/email delivery and retry
history. Platform and Portal consume notifications; provider-neutral Mobile
subscription support does not create a new context or accept a Push provider.

## Aggregate boundaries

| Aggregate Root | Boundary and invariant | External references |
|---|---|---|
| `Notification` | intent, recipient/channel selection and lifecycle | source event/subject IDs |
| `NotificationTemplate` | versioned channel template key/content policy | no source ownership |
| `NotificationPreference` | recipient/channel preference and suppression | identity/membership IDs |

Attempts are Notification-owned delivery facts. In-app and email are V1
channels; WhatsApp remains external/manual. `PushSubscription` is an internal,
provider-neutral technical record associated with recipient preference and an
installation; it is not a business Aggregate Root or an external Push provider
acceptance.

## Domain Layer class dictionary

| Class | Category | Key attributes | Business behavior | Relationships / status |
|---|---|---|---|---|
| `Notification` | Aggregate Root | notification ID, source event, category, status, createdAt, version | `create()`, `selectChannel()`, `suppress()`, `markDelivered()`, `markTerminalFailure()` | composes recipients/attempts |
| `NotificationRecipient` | Entity | recipient reference, channel, destination projection, preference result | `select()` | owned by Notification |
| `NotificationAttempt` | Entity / fact | attempt ID, channel, status, retryAt, provider ref | `recordAttempt()`, `scheduleRetry()`, `recordOutcome()` | owned by Notification |
| `NotificationPreference` | Aggregate Root | recipient scope, channel, category, enabled, version | `enable()`, `disable()` | recipient preference authority |
| `NotificationTemplate` | Aggregate Root | template key/version, channel, content policy, status | `publish()`, `retire()` | template lifecycle |
| `PushSubscription` | Entity / technical record | installation identity, `provider_token_hash`, platform/surface, lifecycle, version | `register()`, `rotate()`, `disable()`, `unregister()` | provider-neutral internal record; not a business channel decision or Aggregate Root |
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
| `ManagePushSubscriptionHandler` | provider-neutral subscription lifecycle | validates recipient scope, persists only `provider_token_hash` and applies idempotent rotation/disable |

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
- `PushSubscription` support does not accept a V1 external Push provider,
  credentials or Product channel beyond in-app/email; those remain FUTURE/OPEN.
- Current PostgreSQL TARGET persists `provider_token_hash` only. Endpoint
  material is **FUTURE / PROVIDER-ADAPTER INPUT** and is **NOT PERSISTED IN
  CURRENT POSTGRESQL TARGET**.

## Persistence concurrency guards

`notification` and `notification_preference` use SQL `version` CAS: each
mutable update includes `WHERE <root_id> = :id AND version = :expectedVersion`
and increments `version`. `notification_template.version` is immutable content
versioning, not an optimistic token; its lifecycle uses an expected-state
predicate (`WHERE template_id = :id AND status = :expectedStatus`). The local
template FK is composite-scoped, and `PushSubscription` remains an internal
technical record rather than an Aggregate Root.

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
`provider_token_hash`, installation identity, platform/surface, lifecycle and
version. Subscription registration, rotation and disable/unregister are
provider-neutral application/technical reliability behavior, not a Device or
Mobile aggregate. Endpoint material is **FUTURE / PROVIDER-ADAPTER INPUT** and
is **NOT PERSISTED IN CURRENT POSTGRESQL TARGET**. Future provider delivery,
retry, claim fencing, invalid-token handling and dead-letter behavior require
separate provider and Product channel acceptance; they do not mutate source
business state. API v0.17.0 is partial provider-neutral evidence only; native
provider/config/credential operations remain OPEN.
