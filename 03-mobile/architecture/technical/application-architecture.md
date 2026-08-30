# Mobile application architecture

Status: `OPEN / DISCOVERY`. Operations Mobile and Buyer Mobile remain two
client projections over the same API/domain authority. Framework, navigation
implementation, build distribution, dependency set and native bridges require
spike evidence and explicit technical acceptance.

Required properties: feature-oriented boundaries, explicit API contracts,
secure session/context handling, accessible loading/empty/error/stale/conflict
states, no client-owned business rules, online-first commands and no hidden
offline success.
