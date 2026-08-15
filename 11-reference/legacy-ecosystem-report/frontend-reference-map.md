# Frontend reference map

Source: `report/40-chapter-4-product-design/4-1-style-guidelines.md` through `4-5-web-applications-prototyping.md`, inspected at `e161fe522023bfe5929e76c4d7c66af211884b7e`.

Use as historical design evidence for modern Website, Platform and Portal work. Do not port Vue code or PrimeVue implementation. Validate current IA, contracts, accessibility and visual intent before implementation.

## Surface map

| Modern surface | Useful Legacy evidence | Classification |
|---|---|---|
| Website | Hierarchical public navigation: Home, Platform, Solutions, Company, Pricing, FAQ, legal, contact; clear value proposition and CTA. | KEEP_AS_EVIDENCE / ADAPT_LATER |
| Platform | Dense operational console: dashboards, requests/orders, clients, catalog, inventory/lots, dispatch, documents, administration. | ADAPT_LATER; modules are not current bounded contexts. |
| Portal | Buyer discovery, catalog/detail, request builder, request/order status, documents, payments/profile views. | KEEP_AS_EVIDENCE / REFINE |

## DESIGN INTENT

- Serious, formal, calm and reliable tone for B2B operational decisions.
- Fast recognition of state, next action and exception.
- Structured capture reduces ambiguity from WhatsApp/audio/photo/list input.
- Dense data belongs in readable tables, filters, cards and timelines with clear hierarchy.
- Buyer experience should expose catalog, conditions, request progress and delivery visibility without removing human support.
- Critical meaning cannot depend on color alone; pair status color with text/icon/description.
- Responsive behavior must account for field work, mobile urgency and variable connectivity.
- Forms use persistent labels, immediate validation and clear recovery.
- Empty, loading, error, pending and blocked states are first-class UX states.

## Navigation and user flows

### Website

`Home` supports value proposition and entry; `Platform` explains scope; `Solutions` groups audience/problem narratives; `Company` provides trust/contact/team; `Pricing` and `FAQ` answer commercial questions; legal links support confidence. Current Website must not expose tenant catalogs, products, prices or commercial data without authentication.

### Platform

Historical navigation groups work by commercial coordination, operations and account administration. Useful tasks: review request; validate customer/availability; capture assisted order; inspect physical stock/lots; prepare dispatch; consult documents; administer members/access. Keep task grouping as evidence, not module/BC design.

### Portal

Historical sequence: Home/discovery, Product Catalog, Product Detail, Request Builder, My Requests, My Orders/Order Detail, tracking/documents, Payments/Profile/Support. Key distinction to preserve: a buyer request is not automatically a confirmed Sales Order.

## Component and state evidence

| Pattern | Historical intent | Modern use note |
|---|---|---|
| Page header/breadcrumb | Context, location and global action. | Useful for dense Platform tasks. |
| Metric card | Quick operational KPI. | Verify metrics and semantics before use. |
| Status badge/timeline | State and next step. | Use text plus semantic visual; avoid color-only status. |
| Product card/detail | Product image, commercial data, temperature badge, selection. | Validate Product/SKU, Brand, Category and price contracts. |
| Request builder | Structured item selection and delivery details. | Preserve draft/recovery behavior; distinguish request/order. |
| Dispatch card/Kanban | Operational queue by state, ID, carrier/alerts. | Current workflow needs validation. |
| Table/filter | Dense lists for orders, inventory, documents and members. | Quick filters are historically validated need. |
| Empty state | Explains no data and next action. | Keep actionable, accessible copy. |
| Loading/pending | Makes server or review state explicit. | Never imply persistence or completion without evidence. |
| Error/blocked | Immediate message and recovery. | Include negative paths in browser tests. |
| Notification | Visual alert for temperature, new order, credit or exception. | Current channels/policy not decided. |

## Historical design tokens

Keep as visual reference, not current design-system authority:

- Typography: `Plus Jakarta Sans` display; `Inter` body/labels; `Fira Code / JetBrains Mono` technical identifiers.
- Primary blue: `#2563EB`; hover/deep blue `#1D4ED8` / `#1E3A8A`.
- Surfaces: base `#F6FAFF`, cards `#FFFFFF`, divider `#E5E7EB`.
- Semantic examples: success `#15803D` on `#DCFCE7`; warning `#B45309` on `#FEF3C7`; danger `#EF4444`; info `#1D4ED8` on `#DBEAFE`.
- Spacing grid: 4px; historical range `4px`–`96px`; compact/medium/large spacing explicitly documented.
- Historical layout measurements: Platform sidebar `240px`, topbar `56px`, content max `1280px`; Portal topbar `60px`, content max `1680px`. These are not mandatory current dimensions.
- Radius/shadow/motion tokens are documented in source and can inform a later token review.

## Accessibility and responsive evidence

- Visible labels; clear focus; contextual validation; ARIA when appropriate.
- WCAG-oriented contrast and non-color status communication.
- Responsive Platform sidebar collapse and mobile navigation concept.
- Responsive Portal navigation with mobile bottom bar concept.
- Auth layout stacks on narrow screens.
- Test Safari/Chrome and mobile/desktop contexts suggested by interviews; source browser assumptions are not participant facts where marked as assumptions.

## Selected asset index

| Evidence | Copied assets |
|---|---|
| Research visuals | `assets/research/` personas, journeys, empathy maps. |
| Task flows | `assets/design/flows/`, `assets/design/wireflows/`. |
| Platform frames | `assets/design/wireframes/s1/`, `s2/`. |
| Portal frames | `assets/design/wireframes/s3/`. |
| Visual language | `assets/design/style/`. |

Original paths and publication flags: [asset-provenance.md](asset-provenance.md).

## VUE / PRIMEVUE IMPLEMENTATION DETAIL — EXCLUDED

Source names Vue 3, PrimeVue, PrimeFlex, PrimeIcons, Vue I18n, Vue routes and CSS implementation. These are historical implementation facts only. Do not port components, routes, module names or code to Angular. Extract intent, then reimplement against current Angular 21+, Angular Material customization, current REST contracts and current accessibility validation.
