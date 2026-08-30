# Mobile local storage

Status: `OPEN / DISCOVERY`. The logical local models are proposed only.

Allowed V1 candidates: secure session reference, active context reference,
freshness metadata, refreshable assigned/read projections, harmless local drafts,
temporary evidence staging and retry metadata. Forbidden: passwords, bearer
tokens, provider secrets, card/payment credentials and authoritative
inventory/allocation/pick/dispatch/Delivery/receipt/order/payment state. A
generic synchronization cursor or background sync engine is not a V1 feature.
Encryption, retention, wipe/revocation and platform keystore selection require
SPIKE-004 and security acceptance.
