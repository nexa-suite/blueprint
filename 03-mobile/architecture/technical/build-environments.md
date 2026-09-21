---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# Mobile build environments

Development, staging and production are conceptual construction environments.
This document does not claim deployed infrastructure, endpoints, certificates,
provider accounts or secrets.

| Client | Accepted build baseline |
|---|---|
| Operations Mobile | Kotlin `2.4.x` (reviewed `2.4.20`), Compose BOM `2026.09.00`, AGP `9.4.x`, Gradle `9.6.x`, JDK `17`, compile/target SDK `37`, min SDK `29` |
| Buyer Mobile | Flutter `3.47.x` (reviewed `3.47.2`), Dart `3.13.x` (reviewed `3.13.2`), Android min SDK `24`, compile SDK `37`, target SDK `36`, iOS `15` minimum |

Android API 37 target compatibility remains a V1 acceptance-hardening gate.
Flutter uses the modern Swift Package Manager default path; CocoaPods remains a
compatibility path only and no migration is authorized. Build configuration may
select non-secret environment labels and approved API base URLs; secrets,
private keys and provider credentials never belong in source, logs or package
artifacts.
