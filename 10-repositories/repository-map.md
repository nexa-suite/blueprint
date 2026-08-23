# Repository map

This index describes independent repositories and their documentation boundary. Branch/SHA values below are immutable remote references verified on 2026-08-23; they are not claims about local checkout branches.

## Active V1 repositories

| Repository | Responsibility | Technology | Remote baseline | Release evidence |
|---|---|---|---|---|
| [API](https://github.com/nexa-suite/api) | Business and integration authority for IAM, tenant scope, catalog, commercial, inventory, logistics, documents, payments and notifications | Spring Boot 4 / Java 25 target / PostgreSQL | `develop @ 440ac6c6988e0fbc0c512eea4055b75588bda74c` | `v0.8.0` reference in repository documentation |
| [Platform](https://github.com/nexa-suite/platform) | Internal Tenant Web Platform for Company Owner, administration and operations | Angular 22 / TypeScript / Angular Material | `develop @ c642473aa0778ed4cea2a3910c8c3c51218688e7` | `v0.7.0` published baseline; development artifact is separate |
| [Portal](https://github.com/nexa-suite/portal) | Buyer self-service portal for catalog, requests, orders and delivery visibility | Angular 22 / TypeScript / Angular Material | `develop @ b2d71173d60b97ee4f749526dc1b8d42bc2e0462` | `v0.7.0` published baseline; development artifact is separate |
| [Website](https://github.com/nexa-suite/website) | Public product discovery and contact/demo entry point | Static HTML/CSS/vanilla JavaScript | `develop @ 2bfeb6a37b3b75099a0c91b8d3c811a9ee89cdf0` | `v1.0.0` published baseline; API-backed contact flow is separate develop evidence |

## Design source repository

| Repository | Responsibility | Technology | Baseline | Status |
|---|---|---|---|---|
| [Design Lab](https://github.com/nexa-suite/design-lab) | Executable visual source and design-system validation companion for frontend convergence | Design-system lab / frontend tooling | `main @ d27e158569211a3afec171b1c9606f06906fc99a` | Visual source; not application runtime or Product authority |

## Runway repository

| Repository | Responsibility | Technology | Remote baseline | Status |
|---|---|---|---|---|
| [Mobile](https://github.com/nexa-suite/mobile) | Future native clients and delivery-driver runway | Flutter/Dart repository foundation | `develop @ 4a94db73336f93b460b564bddb9fa0a100114e87` | RUNWAY; not V1 implementation |

## Legacy references

| Local reference | Role | Status |
|---|---|---|
| `legacy/api-asp` | ASP.NET functional/history evidence | HISTORICAL; remote not established |
| `legacy/platform-vue` | Vue internal-platform visual/flow evidence | HISTORICAL; remote not established |
| `legacy/portal-vue` | Vue buyer-portal visual/flow evidence | HISTORICAL; remote not established |

Legacy is evidence, not authority. Vue and ASP.NET material is not copied into the Blueprint repository as application source.

## Local workspace boundary

The independent checkouts under `10-repositories/active/` and `10-repositories/runway/` are LOCAL WORKSPACE MATERIAL. They must not be moved, copied, rewritten, initialized as a monorepo, or committed into this Blueprint repository. The workspace root is the documentation repository; application checkouts remain independent repositories.

Current local checkouts may preserve feature branches for engineering work. That does not change the documented remote `develop` baseline and does not authorize application-repository mutations from this documentation workspace.
