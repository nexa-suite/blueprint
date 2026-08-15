# Repository map

This index describes independent repositories and their documentation boundary. Branch/SHA values below are immutable remote references verified on 2026-08-15; they are not claims about local checkout branches.

## Active V1 repositories

| Repository | Responsibility | Technology | Remote baseline | Release evidence |
|---|---|---|---|---|
| [API](https://github.com/nexa-suite/api) | Business and integration authority for IAM, tenant scope, catalog, commercial, inventory, logistics, documents, payments and notifications | Spring Boot 4 / Java 25 target / PostgreSQL | `develop @ 01af8c7cad833de4054fc90ee76a7c90ebe560bb` | `v0.8.0` reference in repository documentation |
| [Platform](https://github.com/nexa-suite/platform) | Internal Tenant Web Platform for Company Owner, administration and operations | Angular 22 / TypeScript / Angular Material | `develop @ 73f8bd2e8f70aacdb5456d3a87232316777d3cfc` | `v0.7.0` published baseline; development artifact is separate |
| [Portal](https://github.com/nexa-suite/portal) | Buyer self-service portal for catalog, requests, orders and delivery visibility | Angular 22 / TypeScript / Angular Material | `develop @ 730c605324f547335733af96a2f654ec8d41b5fa` | `v0.7.0` published baseline; development artifact is separate |
| [Website](https://github.com/nexa-suite/website) | Public product discovery and contact/demo entry point | Static HTML/CSS/vanilla JavaScript | `develop @ 3f98a1faf39886a303035b9ce0573518b5bbd766` | `v1.0.0` published baseline; API-backed contact flow is separate develop evidence |

## Runway repository

| Repository | Responsibility | Technology | Remote baseline | Status |
|---|---|---|---|---|
| [Mobile](https://github.com/nexa-suite/mobile) | Future native clients and delivery-driver runway | Flutter/Dart repository foundation | `develop @ 5bf962537a8c64af64ea3503537157cc63ebe69d` | RUNWAY; not V1 implementation |

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
