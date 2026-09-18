---
status: planned
maturity: BASELINED
scope: runway
owner: architecture
last-reviewed: 2026-09-18
---

# Academic architecture projection

UPC diagrams project one shared Nexa C4 model. Academic diagrams do not create
Web C4 and Mobile C4 competitors, Mobile Bounded Contexts or one deployment per
context. The shared Blueprint C4 DSL remains the authority; these views are
derived academic projections.

## C4 coverage

| Rubric artifact | Canonical source | Projection | Status |
|---|---|---|---|
| Context Diagram | `01-shared/architecture/c4/structurizr/workspace.dsl` | `Nexa-SystemContext-ASIS`, `Nexa-SystemContext-V1-TARGET` | Shared authority; academic projection; rendered evidence pending |
| Container Diagram | same shared workspace | `Nexa-Containers-ASIS`, `Nexa-Containers-V1-TARGET` | Shared authority; academic projection; rendered evidence pending |
| Component Diagrams | shared model and component coverage matrix | API, Platform, Portal, Website where useful, plus narrow Operations Mobile and Buyer Mobile V1 target views | Coverage mapped; no duplicate components |
| Deployment Diagram | shared workspace deployment model | `Nexa-Deployment-Local-ASIS`, `Nexa-Deployment-V1-TARGET` | Provider-neutral target; local rendering pending |
| Future/runway | shared workspace | genuinely deferred IoT, future identity/provider and V2/V3 concepts | No V1 implementation claim |

## L1 and L2 boundaries

AS-IS shows currently evidenced Website, Platform, Buyer Portal, API,
PostgreSQL and Object Storage. TARGET V1 adds Operations Mobile and Buyer
Mobile as planned application surfaces. Operations implementation evidence now
exists on unmerged feature branches, but it does not change the shared C4
AS-IS/TARGET model or claim integration, Product Acceptance or a release.

L2 containers are deployable applications/data stores. Docker services such as
Mailpit, ClamAV, Jaeger and OTel Collector remain local infrastructure nodes,
not Product containers. PostgreSQL remains shared physical infrastructure with
logical BC ownership.

## Deployment model

The target is provider-neutral:

- Android physical device for representative Operations Mobile and Buyer Mobile flows.
- Static Web Hosting/CDN for Website, Platform and Buyer Portal.
- API Compute for the Nexa API.
- Managed PostgreSQL.
- Object Storage.
- Abstract Email, Payment, Maps/Navigation and Push providers.
- Observability destination remains an open Production Gate decision.

Local AS-IS may show Developer Machine, Docker Compose, API, PostgreSQL,
Object Storage/MinIO, Mailpit, ClamAV, OTel Collector and Jaeger. A local node
does not elevate a test double to a Product dependency.

## Tactical and code-level mapping

The shared per-BC tactical model supplies Domain Layer, Interface/Application/
Infrastructure descriptions, domain class diagrams and SQL-authoritative
database diagrams. The academic report should reference these projections and
add explanation/screenshots required by the rubric; it must not author a second
class or database authority.

## Post-AV1 evidence boundary

The Mobile Report C4/DDD/UML/PlantUML/PNG/SVG material is derived academic
architecture evidence. Strategic DDD, tactical semantics, target data and C4
remain owned by shared Blueprint records. C4 AS-IS/TARGET structural
reconciliation is intentionally deferred to Wave 2; no C4 source or generated
asset is changed by this projection.

## Framework decision

Academic constraints require native Android/Kotlin and allow Flutter/Dart or
Kotlin Multiplatform/Kotlin for cross-platform work. `SPIKE-002` remains open.
Operations Mobile may be evaluated for native Android because of device/field
interaction; Buyer Mobile may be evaluated for cross-platform delivery. The
final AV1 plan places Flutter/Dart work in later academic Sprints. This is
academic planning, not an accepted Product architecture; framework choice
remains open pending evidence and Owner acceptance.
