# Mobile synchronization

Status: ACCEPTED TARGET. V1 is online-first. Safe cache, harmless drafts,
temporary evidence staging and retry metadata may survive interruption, but
critical business success requires an authoritative server result. Retry reuses
the durable idempotency key, checks freshness/version and exposes rejected,
conflict and unknown outcomes.

There is no generic offline transaction engine, automatic reconciliation,
background sync cursor or client-side last-write-wins authority. WorkManager is
permitted for Operations safe retryable work that must survive process death;
it never upgrades local state into API authority.
