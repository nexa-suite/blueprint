# Shared Architecture

- [C4](c4/README.md)
- [Decisions](decisions/README.md)
- [Integrations](integrations/README.md)
- [Layering](layering/logical-system-layering.md)
- [Drivers](drivers/initial-drivers.md)
- [Model authority](model-authority.md)

Architecture models TARGET separately from implementation evidence. The
post-AV1 canonical baseline preserves one Nexa C4 software system, 11 Strategic
Bounded Contexts, 14 Published Integration Events and a 95-table TARGET data
inventory. Mobile is a client projection over that shared model: Operations is
Android/Kotlin/Jetpack Compose, Buyer is Flutter/Dart for Android+iOS;
Operations has partial unmerged AS-IS evidence and Buyer is not implemented.
Provider selection and Product Acceptance remain OPEN.
