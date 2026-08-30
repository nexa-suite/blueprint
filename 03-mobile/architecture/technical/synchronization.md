# Mobile synchronization

Status: `OPEN / DISCOVERY`, with target safety rules baselined by the Product
catalog. V1 is online-first: safe cache, harmless drafts, temporary evidence
staging and retry metadata may survive connectivity loss; confirmation is
required for critical business facts. Retry reuses a durable idempotency key,
detects stale versions and exposes rejected/conflict/unknown outcomes. A
generic offline transaction engine, automatic reconciliation, background sync
cursor or last-write-wins authority is V2+.
