# Mobile Architecture

Product direction is `OWNER-ACCEPTED`; technical/client architecture is
`OPEN / DISCOVERY`; no framework or production Mobile runtime is claimed.

- [Technical projection](technical/README.md)
- [Data boundary](data/README.md)
- [Operations Mobile local persistence](data/operations-mobile-local-persistence.md)
- [Buyer Mobile local persistence](data/buyer-mobile-local-persistence.md)

Local models are non-authoritative projections. They reuse the shared API and
eleven Bounded Contexts and do not add PostgreSQL tables or a Mobile BC.
