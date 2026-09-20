---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# ADR-0021: Mobile Local Persistence Is Non-Authoritative

## Status

Accepted TARGET boundary.

## Context

Device clients require safe session/context references, cached projections,
drafts/evidence staging and retry metadata. Protected Nexa facts still require
server authorization, concurrency and tenant isolation.

## Decision

Allow device-scoped secure session references, active context, safe caches,
harmless drafts/evidence staging, freshness and retry metadata. Operations may
use Keystore/DataStore/Room as appropriate; Buyer uses a secure storage
abstraction. Critical business facts remain API-authoritative.

## Consequences

No generic offline transaction engine, local Payment/Credit/PR/SO authority,
local Inventory/Delivery finalization authority or last-write-wins sync is V1.
Local storage success does not establish business success.

## Alternatives

Rejected an authoritative Mobile database and generic offline-first
synchronization.

## Evidence

[Operations local persistence](../../../../03-mobile/architecture/data/operations-mobile-local-persistence.md)
and [Buyer local persistence](../../../../03-mobile/architecture/data/buyer-mobile-local-persistence.md).

## Supersedes / Superseded by

Supersedes the proposed-only local-persistence boundary. No superseding ADR.
