# Mobile synchronization

Status: `OPEN / DISCOVERY`, with target safety rules baselined by the Product
catalog. Selective cache/draft/evidence queues may survive connectivity loss;
server acceptance is required for critical business facts. Retry reuses a
durable idempotency key, detects stale versions and exposes rejected/conflict/
unknown outcomes. There is no generic offline transaction engine or
last-write-wins authority.
