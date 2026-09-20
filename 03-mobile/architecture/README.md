# Mobile Architecture

The two-app Mobile Product Generation is accepted for planning and Needfinding
is complete (`9/9`) for problem/task evidence. Technical/client architecture
and solution validation remain `OPEN`. Current Operations AS-IS evidence is
partial and unmerged and uses Android/Kotlin/Jetpack Compose; this does not
establish a final canonical framework assignment or accepted production
runtime. Buyer Mobile is not implemented and final cross-platform architecture
remains open.

- [Technical projection](technical/README.md)
- [Data boundary](data/README.md)
- [Operations Mobile local persistence](data/operations-mobile-local-persistence.md)
- [Buyer Mobile local persistence](data/buyer-mobile-local-persistence.md)

Local models are non-authoritative projections. They reuse the shared API and
eleven Bounded Contexts and do not add PostgreSQL tables or a Mobile BC.
