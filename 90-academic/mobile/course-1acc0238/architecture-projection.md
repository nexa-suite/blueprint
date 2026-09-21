---
status: reference
maturity: BASELINED
scope: runway
owner: architecture
last-reviewed: 2026-09-19
---

# Academic architecture projection

UPC diagrams project one shared Nexa C4 model. Academic diagrams do not create
Web C4 and Mobile C4 competitors, Mobile Bounded Contexts or one deployment per
context. The shared Blueprint C4 DSL remains the authority; these views are
derived academic projections.

## C4 coverage

| Rubric artifact | Canonical source | Projection | Status |
|---|---|---|---|
| Context Diagram | `01-shared/architecture/c4/structurizr/workspace.dsl` | `Nexa-SystemContext-ASIS`, `Nexa-SystemContext-V1-TARGET`, `Nexa-SystemContext-Future-Runway` | Shared authority; derived academic projection |
| Container Diagram | same shared workspace | `Nexa-Containers-ASIS`, `Nexa-Containers-V1-TARGET` | Shared authority; derived academic projection |
| Component Diagrams | shared model and component coverage matrix | API, Platform, Portal, Website where useful, plus narrow Operations Mobile and Buyer Mobile V1 target views | Coverage mapped; no duplicate components |
| Deployment Diagram | shared workspace deployment model | `Nexa-Deployment-Local-ASIS`, `Nexa-Deployment-V1-TARGET` | Provider-neutral derived target |
| Future/runway | shared workspace | genuinely deferred IoT, identity/provider and other behavior concepts; historical V2/V3 labels remain provenance only | No Product Generation or implementation claim |

## L1 and L2 boundaries

AS-IS shows currently evidenced Website, Platform, Buyer Portal, API,
PostgreSQL and Object Storage. TARGET V1 adds owner-accepted Operations Mobile
and Buyer Mobile surfaces. Operations implementation evidence exists only on
unmerged feature branches (Android/Kotlin/Compose); Buyer Mobile is not
implemented. Neither fact changes the shared C4 AS-IS/TARGET model or claims
integration, Product Acceptance or a release. The L1 uses the granular accepted
actors and does not replace them with a generic Tenant Workforce actor.

L2 containers are deployable applications/data stores. Docker services such as
Mailpit, ClamAV, Jaeger and OTel Collector remain local infrastructure nodes,
not Product containers. PostgreSQL remains shared physical infrastructure with
logical BC ownership.

## Deployment model

The target is provider-neutral:

- Separate logical Operations Mobile Device and Buyer Mobile Device nodes, each with technology `Mobile device`; Buyer is not forced to Android.
- Static Web Hosting/CDN for Website, Platform and Buyer Portal.
- API Compute for the Nexa API.
- Managed PostgreSQL.
- Object Storage.
- Abstract Email, Payment and Maps/Navigation providers only.
- Observability destination remains an open Production Gate decision.

Local AS-IS may show Developer Machine, Docker Compose, API, PostgreSQL,
Object Storage/MinIO, Mailpit, ClamAV, OTel Collector and Jaeger. A local node
does not elevate a test double to a Product dependency.

Push Delivery Service belongs only to the Future/OPEN C4 runway. It is not a V1
system-context, container, deployment or accepted provider claim.

## Tactical and code-level mapping

The shared per-BC tactical model supplies Domain Layer, Interface/Application/
Infrastructure descriptions, domain class diagrams and SQL-authoritative
database diagrams. The academic report should reference these projections and
add explanation/screenshots required by the rubric; it must not author a second
class or database authority.

## Post-AV1 evidence boundary

The Mobile Report C4/DDD/UML/PlantUML/PNG/SVG material is immutable derived
academic architecture evidence. Strategic DDD, tactical semantics, target data
and C4 remain owned by shared Blueprint records. Wave 2 reconciled canonical
AS-IS/TARGET and generated artifacts from the shared DSL; this projection does
not create another source of truth.

## Framework decision closure

Operations Mobile is the accepted TARGET Android/Kotlin/Jetpack Compose
construction client by ADR-0018. Buyer Mobile is the accepted TARGET
Flutter/Dart Android+iOS construction client by ADR-0019. `SPIKE-002` retains
historical framework evaluation, including Kotlin Multiplatform/Kotlin, but its
framework-selection question is **CLOSED / SUPERSEDED** by those ADRs.
Technology selection is not implementation proof, solution validation or
Product Acceptance. Unrelated device/provider research remains OPEN.
