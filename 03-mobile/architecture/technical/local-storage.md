# Mobile local storage

Status: ACCEPTED TARGET BOUNDARY / NON-AUTHORITATIVE. Allowed device state is
a secure session reference, active context reference, safe cache, harmless
draft/evidence staging, freshness metadata and retry metadata. Operations may
use Android Keystore, DataStore and Room where structured local staging/cache is
justified. Buyer uses a secure platform-storage abstraction; specific Flutter
package selection remains implementation-level.
WorkManager may carry safe, durable retry/background work after an intent is
persisted; it does not make local state authoritative.

Forbidden authority includes passwords, bearer tokens, provider secrets,
payment credentials, Inventory/Allocation/Pick/Dispatch/Delivery finalization,
Purchase Request, Sales Order, Credit, Payment and authorization state. A local
write is not business success until API confirms it. No generic synchronization
cursor, offline transaction engine or last-write-wins authority is V1.
