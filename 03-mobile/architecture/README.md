# Mobile Architecture

The two-app Mobile TARGET is accepted. Nexa Operations Mobile uses native
Android/Kotlin/Jetpack Compose; Nexa Buyer Mobile uses Flutter/Dart for Android
and iOS. Exact baseline lives in the shared
[Technology baseline](../../01-shared/architecture/technology-baseline.md).

Both clients are C4 Containers inside one Nexa Software System. Neither creates
a Bounded Context, API, backend/domain model, database authority or generic
offline synchronization engine. Operations has partial unmerged implementation
evidence; Buyer is not implemented. Those facts do not alter TARGET assignments
or prove Product Acceptance.

- [Technical architecture](technical/README.md)
- [Client-local data boundary](data/README.md)
- [Operations local persistence](data/operations-mobile-local-persistence.md)
- [Buyer local persistence](data/buyer-mobile-local-persistence.md)

Client local models are device-scoped, non-authoritative projections. The API
remains authority for protected business decisions.
