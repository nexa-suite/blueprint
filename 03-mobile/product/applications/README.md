# Mobile applications

| Application | Primary actors/segment | Product direction | Research | Client/backend state |
|---|---|---|---|---|
| [Nexa Operations Mobile](operations-mobile.md) | Workforce: Sales, Warehouse, Dispatch, Driver | ACCEPTED two-app Product Generation; Android/Kotlin/Jetpack Compose TARGET | EVIDENCE AVAILABLE (3/3) | partial AS-IS evidence on unmerged branches; API PARTIAL; not integrated |
| [Nexa Buyer Mobile](buyer-mobile.md) | Customer Buyer | ACCEPTED two-app Product Generation; Flutter/Dart for Android+iOS TARGET | EVIDENCE AVAILABLE (3/3) | client NOT_IMPLEMENTED; API contracts only; no runtime verified |

Neither row creates a Mobile Bounded Context or owns business truth. Framework
assignments are accepted construction decisions in
[ADR-0018](../../../01-shared/architecture/decisions/adr/adr-0018-operations-mobile-native-android.md)
and [ADR-0019](../../../01-shared/architecture/decisions/adr/adr-0019-buyer-mobile-flutter.md);
they do not prove implementation, solution validation or Product Acceptance.
Both use [the shared role/surface model](../../../01-shared/product/surface-role-matrix.md).
