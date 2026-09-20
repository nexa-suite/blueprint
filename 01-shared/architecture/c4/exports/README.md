---
status: reference
source: ../structurizr/workspace.dsl
format: SVG + PNG
scope: cross-cutting
owner: architecture
last-reviewed: 2026-09-20
---

# Versioned C4 visuals

These SVGs and same-basename PNGs are versioned review artifacts generated
from the canonical Structurizr DSL. SVG is the vector source for review; PNG
is the quick visual preview. They are not an alternative source of architecture
semantics.

Source of truth:

- DSL workspace: [Structurizr workspace](../structurizr/workspace.dsl)
- Deterministic workflow: [Structurizr README](../structurizr/README.md)

The folders map directly to the C4 levels. These generated review artifacts are
kept with the Blueprint cut; the Structurizr DSL remains the semantic source and
`structurizr/workspace.json` is its generated review mirror.

- `l1/`: system context views.
- `l2/`: container views.
- `l3/`: selected technical/component views.
- `dynamic/`: critical workflow views using the static model; no duplicate
  software elements are introduced for sequencing.
- `deployment/`: Local AS-IS and provider-neutral V1 TARGET deployment views.

## Current canonical view manifest

| Group | View keys |
|---|---|
| L1 | `Nexa-SystemContext-ASIS`, `Nexa-SystemContext-V1-TARGET`, `Nexa-SystemContext-Future-Runway` |
| L2 | `Nexa-Containers-ASIS`, `Nexa-Containers-V1-TARGET` |
| L3 | `Nexa-API-Overall-ASIS`, `Nexa-API-TechnicalArchitecture-TARGET`, `Nexa-API-DomainOwnershipMapping-TARGET`, `Nexa-API-IdentityTenantCustomer-TARGET`, `Nexa-API-CommercialInventory-TARGET`, `Nexa-API-FulfillmentDelivery-TARGET`, `Nexa-API-CreditPaymentDocuments-TARGET`, `Nexa-API-IntegrationReliability-ASIS`, `Nexa-Platform-Frontend-TARGET`, `Nexa-Portal-Frontend-TARGET`, `Nexa-Website-Frontend-ASIS`, `Nexa-Operations-Mobile-TARGET`, `Nexa-Buyer-Mobile-TARGET` |
| Dynamic | `Nexa-Workflow-SubmitPurchaseRequest`, `Nexa-Workflow-ConfirmDirectOrder`, `Nexa-Workflow-ConvertPurchaseRequestToSalesOrder`, `Nexa-Workflow-FulfillmentPickDispatchHandoff`, `Nexa-Workflow-DeliveryPartialOutcomeContinuation`, `Nexa-Workflow-BuyerHandoffReceiptDiscrepancy`, `Nexa-Workflow-PaymentConfirmationReceivableApplication` |
| Deployment | `Nexa-Deployment-Local-ASIS`, `Nexa-Deployment-V1-TARGET` |

Regenerate after a deliberate DSL change with the pinned Structurizr image.
First use `merge` to generate both workspace JSON mirrors from DSL while
preserving existing layout where available. Then export and render PlantUML
with PlantUML `1.2026.6` (the renderer used by this cut), copying only the
non-`-key` views into this directory:

```sh
OUTPUT_DIR="$(mktemp -d)"
chmod 777 "$OUTPUT_DIR"

docker run --rm \
  -v "$PWD/01-shared/architecture/c4/structurizr:/usr/local/structurizr:ro" \
  structurizr/structurizr:2026.06.28 validate \
  -workspace /usr/local/structurizr/workspace.dsl

# Export PlantUML into an ephemeral writable directory, render SVG + PNG, and
# copy matching Nexa view basenames into this directory's l1/l2/l3/dynamic/deployment.
docker run --rm \
  -v "$PWD/01-shared/architecture/c4/structurizr:/usr/local/structurizr:ro" \
  -v "$OUTPUT_DIR:/out" \
  structurizr/structurizr:2026.06.28 export \
  -workspace /usr/local/structurizr/workspace.dsl \
  -format plantuml \
  -output /out

plantuml -tsvg "$OUTPUT_DIR"/structurizr-Nexa-*.puml
plantuml -tpng "$OUTPUT_DIR"/structurizr-Nexa-*.puml
```

Keep filenames aligned with the Structurizr view keys. Legend/key exports are
not versioned here. Validate DSL-to-generated semantic equivalence and export
counts through `bash tooling/scripts/validate-blueprint.sh`; no screenshot or
manual graphic edit substitutes for this workflow.
