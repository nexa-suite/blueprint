# Historical language collisions

Input for current Ubiquitous Language work. No final term is selected here.

| Term | Legacy usage | Collision/risk | Current review question | Classification |
|---|---|---|---|---|
| Tenant | Company SaaS space and data boundary. | Often treated as Workspace. | What is customer boundary vs operational environment? | CONFLICTS_WITH_CURRENT |
| Workspace | Tenant/company operating environment; sometimes physical areas. | Can mean Tenant, warehouse or URL slug. | Which environment does user act within? | CONFLICTS_WITH_CURRENT |
| Organization | Applicant/company being reviewed. | May overlap with Company, Tenant and customer. | What exists before provisioning and after acceptance? | NEEDS_REVIEW |
| Company | Legal/business entity or owner context. | Mixed with Organization and Tenant. | Which business identity is authoritative? | NEEDS_REVIEW |
| Account Owner | Operational and administrative owner of workspace. | Merged with Operations; conflicts with Tenant Administrator/Company Owner. | Who owns business decisions vs access governance? | CONFLICTS_WITH_CURRENT |
| Customer | External buyer/client. | Can mean SaaS customer or buyer customer. | Is customer Nexa Tenant or commercial account? | CONFLICTS_WITH_CURRENT |
| Client | External B2B account. | Used alongside Customer and Buyer. | Which relationship and records does it name? | NEEDS_REVIEW |
| Buyer | External person/company ordering from Tenant. | Buyer profile appears tenant-owned. | How does global identity relate to Tenant relationships? | CONFLICTS_WITH_CURRENT |
| Buyer Profile | Contact, address, conditions and preferences. | May be reusable/global or tenant-owned. | What is identity vs commercial relationship data? | CONFLICTS_WITH_CURRENT |
| Client Account | Tenant-side B2B customer account with credit. | Could be confused with global Buyer relationship. | What account is scoped to which Tenant? | NEEDS_REVIEW |
| Purchase Request | Initial buyer/assisted request. | Sometimes becomes Purchase Order; status names mix. | What distinguishes request from confirmed Sales Order? | CONFLICTS_WITH_CURRENT |
| Purchase Order | Legacy name for confirmed customer order. | Current product requires Sales Order distinction. | Is this buyer procurement document or Nexa sales transaction? | CONFLICTS_WITH_CURRENT |
| Sales Order | Appears rarely/implicitly; source uses Purchase Order. | Missing authoritative legacy term. | What is confirmed commercial order? | NEEDS_REVIEW |
| Reservation | Stock separation for request/order. | Timing, authority and release rules unspecified. | What availability is committed and when? | NEEDS_REVIEW |
| Stock | Physical, available or reserved quantity. | One word hides materially different states. | Physical stock vs sellable availability vs reserved stock? | CONFLICTS_WITH_CURRENT |
| Availability | Usually stock available to new orders. | May equal physical stock in source. | What rules derive sellable availability? | CONFLICTS_WITH_CURRENT |
| Lot | Expiry-tracked inventory unit. | Batch used interchangeably in broader language. | Lot vs batch/source traceability? | NEEDS_REVIEW |
| Batch | Source/import traceability idea. | Overlaps with Lot. | Which term matches physical and source concepts? | NEEDS_REVIEW |
| Dispatch | Outbound preparation/route start. | Can overlap Shipment and Delivery. | What operational transition does it name? | NEEDS_REVIEW |
| Shipment | Legacy transport execution. | Dispatch may be same or preceding concept. | Distinguish fulfillment, outbound movement and transport? | NEEDS_REVIEW |
| Delivery | Customer receipt and close. | Could include route/tracking/POD. | What is receipt vs movement vs proof? | NEEDS_REVIEW |
| Invoice | Referential XML/PDF document, sometimes “issued”. | Risk of implying fiscal integration. | What document capability is actually in V1? | CONFLICTS_WITH_CURRENT |
| Payment | Referential status, card or reconciliation. | Domain concept mixed with provider processing. | What is Payment, what is Stripe adapter behavior? | CONFLICTS_WITH_CURRENT |
| Capability | Feature available by plan/tier. | Current Feature tiers/Entitlements future. | Is capability product scope or subscription entitlement? | CONFLICTS_WITH_CURRENT |
| Subscription | SaaS plan and seats. | V2/future, not current V1 authority. | Should it appear in current V1 language? | CONFLICTS_WITH_CURRENT |

## Legacy terms needing explicit review

`S1/S2/S3`, `Commercial Coordination`, `Operations / Account Owner`, `Company Owner`, `Tenant Administrator`, `B2B Buyer Portal`, `Product`, `SKU`, `Client Account`, `Purchase Request`, `Sales Order`, `Dispatch Order`, `Proof of Delivery`, `Business Documents`, `Payment Status`, `Promotion`, `Feature Gate`, `Plan`, `Workspace`.

Do not silently normalize source documents. Preserve original wording when citing evidence, then record current interpretation separately.
