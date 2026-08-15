# Historical EventStorming inventory

Input only for human Capability Mapping, Big Picture EventStorming and Domain Storytelling. This is not the current EventStorming board and does not decide current domain events.

Source: `report/20-chapter-2-requirements-elicitation/2-4-big-picture-event-storming.md`.

## Historical events

| Historical event | Source block | Classification | Evidence/pain attached |
|---|---|---|---|
| `CommercialContactRequested` | Contact and registration | STILL_RELEVANT_TO_EXPLORE | Intake begins through commercial contact. |
| `OrganizationRegistrationSubmitted` | Contact and registration | STILL_RELEVANT_TO_EXPLORE | Organization information submitted for review. |
| `OrganizationEligibilityReviewed` | Organization evaluation | STILL_RELEVANT_TO_EXPLORE | Manual eligibility review and clarification burden. |
| `OrganizationApproved` | Organization evaluation | STILL_RELEVANT_TO_EXPLORE | Approval precedes operating access in legacy flow. |
| `OrganizationRejected` | Organization evaluation | STILL_RELEVANT_TO_EXPLORE | Negative onboarding outcome needs explicit reason. |
| `AdditionalOrganizationInformationRequested` | Organization evaluation | STILL_RELEVANT_TO_EXPLORE | Fragmented registration/pending clarification. |
| `OperationalAccountOwnerIdentified` | Responsibilities/workspace | CONFLICTS_WITH_CURRENT | Legacy merges Account Owner with operations/admin. |
| `BusinessResponsibilitiesAssigned` | Responsibilities/workspace | STILL_RELEVANT_TO_EXPLORE | Responsibility assignment is useful; names/authority need rework. |
| `OperationalRulesDefined` | Responsibilities/workspace | UNCERTAIN | Legacy may imply configurable rules beyond V1. |
| `CompanyWorkspaceEnabled` | Responsibilities/workspace | CONFLICTS_WITH_CURRENT | Public/self-service activation conflicts with approved-assisted direction. |
| `ClientRegistered` | Client | STILL_RELEVANT_TO_EXPLORE | Commercial relationship and customer onboarding evidence. |
| `CustomerOnboarded` | Client | LIKELY_RENAMED | Customer, Client, Buyer and account terms collide. |
| `CatalogPublished` | Catalog | STILL_RELEVANT_TO_EXPLORE | Tenant catalog visibility need. |
| `ProductAddedToCatalog` | Catalog | STILL_RELEVANT_TO_EXPLORE | Product/SKU and Tenant-scoped catalog input. |
| `CatalogProductDeactivated` | Catalog | STILL_RELEVANT_TO_EXPLORE | Availability and lifecycle need. |
| `PromotionActivated` | Catalog | V2_OR_FUTURE | Promotion/feature-tier semantics not current V1 authority. |
| `InventorySynced` | Inventory | LIKELY_RENAMED | Physical stock vs sellable availability must be separated. |
| `InventoryReserved` | Inventory | STILL_RELEVANT_TO_EXPLORE | Committed availability is important; rule not decided. |
| `LotsAssigned` | Inventory | STILL_RELEVANT_TO_EXPLORE | Lot/warehouse/FEFO evidence. |
| `PurchaseRequestSubmitted` | Request | STILL_RELEVANT_TO_EXPLORE | Strong buyer and assisted-capture evidence. |
| `PurchaseRequestApproved` | Request | LIKELY_RENAMED | Approval semantics and transition to Sales Order need validation. |
| `OrderRejected` | Request | LIKELY_RENAMED | Request/order distinction unresolved in source. |
| `OrderCancelled` | Request | STILL_RELEVANT_TO_EXPLORE | Negative lifecycle case useful for tests. |
| `ClientContacted` | Alternative coordination | STILL_RELEVANT_TO_EXPLORE | Human exception/support remains adoption constraint. |
| `ManualOrderRegistered` | Alternative coordination | LIKELY_RENAMED | Legacy calls customer order Purchase Order; preserve assisted capture pain. |
| `ShipmentStarted` | Dispatch | STILL_RELEVANT_TO_EXPLORE | Outbound execution visibility. |
| `TemperatureRecorded` | Dispatch | V2_OR_FUTURE | IoT/temperature capture future; manual evidence may still need validation. |
| `DeliveryRescheduled` | Dispatch | STILL_RELEVANT_TO_EXPLORE | Exception and communication pain. |
| `OrderDelivered` | Delivery | LIKELY_RENAMED | Sales Order/delivery semantics need current language work. |
| `BusinessDocumentAssociated` | Documents | STILL_RELEVANT_TO_EXPLORE | Document visibility and closure evidence. |
| `InvoiceIssued` | Documents | CONFLICTS_WITH_CURRENT | Source says referential; must not imply fiscal issuance. |
| `PaymentReceived` | Payment | CONFLICTS_WITH_CURRENT | Historical referential/simulated semantics; provider adapter distinction absent. |
| `PaymentDeclined` | Payment | CONFLICTS_WITH_CURRENT | Same payment/provider ambiguity. |

## Historical pains attached to timeline

- `Fragmented Organization Registration`: distributed information, clarification and review delay.
- `Manual Validation Bottleneck`: human checks delay request continuity and increase rework.
- `Manual Payment Reconciliation`: weak shared visibility of referential payment state.
- Fragmented visibility across commercial, operations and buyer.
- Human coordination dependency for clarification, incidents and rescheduling.
- Delayed communication affects validation, dispatch and delivery.

## Human-session guardrails

- Rebuild current board from observed behavior, not from source event names.
- Challenge event boundaries, actor names, request/order terminology and payment/document semantics.
- Keep cold-chain, lot and FEFO evidence as domain questions; do not elevate them into current aggregates or bounded contexts.
