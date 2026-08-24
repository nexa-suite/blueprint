# Historical User Story catalog

Source: `report/30-chapter-3-requirements-specification/3-1-user-stories.md`, inspected at `e161fe522023bfe5929e76c4d7c66af211884b7e`.

This catalog is archaeology, not a current V1 backlog. No story is automatically added to current planning.

## Classification key

- `KEEP_CANDIDATE`: behavior remains plausible evidence for discovery.
- `REFINE`: useful behavior, but wording/contract/role needs current review.
- `SUPERSEDED`: conflicts with accepted current direction.
- `V2`: future/deferred scope in current direction.
- `DROP`: implementation or academic detail not worth carrying as product requirement.
- `NEEDS_REVIEW`: evidence useful, semantics or scope unresolved.

## Inventory by epic

| Epic | Stories and classification |
|---|---|
| EP01 Public website | `US01-US03` KEEP_CANDIDATE; `US04` V2; `US05-US06` KEEP_CANDIDATE. |
| EP02 IAM | `US07-US09` REFINE. Preserve authentication, recovery and negative validation; discard workspace-local identity assumption. |
| EP03 Organization onboarding | `US10-US13`, `US15-US16` REFINE/NEEDS_REVIEW; `US14` SUPERSEDED/V2 because public self-service slug/plan selection conflicts with approved-assisted provisioning and V2 subscriptions. |
| EP04 Tenant administration | `US17-US27`, `US31-US38` REFINE/NEEDS_REVIEW; `US28-US30` V2/SUPERSEDED because billing, plans, seats and feature tiers are future. |
| EP05 Buyer portal | `US39-US46`, `US49-US58` KEEP_CANDIDATE/REFINE; `US47` NEEDS_REVIEW; `US48` and `US59` NEEDS_REVIEW because payment semantics are referential/provider-sensitive. |
| EP06 Catalog/promotions | `US60-US61` REFINE; `US62-US64` NEEDS_REVIEW/V2; promotion evidence is useful, but no current entitlement or promotion contract follows. |
| EP07 Commercial validation | `US65-US73` KEEP_CANDIDATE/REFINE; preserve request review, reasoned rejection, availability visibility and order tracking; resolve Purchase Request vs Sales Order. |
| EP08 Assisted order capture | `US74-US77` KEEP_CANDIDATE/REFINE; `US78-US80` NEEDS_REVIEW because Client Account, Buyer relationship and credit ownership require current domain validation. |
| EP09 Inventory/warehouse/FEFO | `US81-US86` KEEP_CANDIDATE/REFINE; `US87` V2/NEEDS_REVIEW because promotion-by-expiry is not current authority. Preserve physical stock, lot, reservation and FEFO pain. |
| EP10 Logistics/delivery | `US88-US89`, `US91`, `US95` REFINE; `US90`, `US92-US94` NEEDS_REVIEW/V2 because mobile, POD, temperature and telemetry scope is future or unverified. |
| EP11 Documents/payments | `US96-US97`, `US101-US102` KEEP_CANDIDATE/REFINE; `US98-US100`, `US103` NEEDS_REVIEW/V2 because referential XML/PDF must not become fiscal capability. |
| EP12 Profile/preferences | `US104-US107` LOW_VALUE/REFINE; preserve accessibility and preference observations only. |
| EP13 REST technical stories | `TS01-TS17` DROP as current product stories; implementation details, endpoints and module boundaries must be rediscovered against modern contracts. |

## Exact story inventory

### EP01–EP04

- `US01` Consultar landing page y propuesta de valor — KEEP_CANDIDATE
- `US02` Consultar soluciones y beneficios por segmento operativo — KEEP_CANDIDATE
- `US03` Consultar catálogo de funcionalidades y equipo de la distribuidora — KEEP_CANDIDATE
- `US04` Consultar precios, tarifas y capacidades del plan Standard — V2
- `US05` Consultar preguntas frecuentes y accesos legales — KEEP_CANDIDATE
- `US06` Enviar formulario de contacto comercial — KEEP_CANDIDATE
- `US07` Iniciar sesión en el workspace utilizando credenciales de acceso — REFINE
- `US08` Prevenir inicio de sesión con campos vacíos — REFINE
- `US09` Solicitar la recuperación de contraseña — REFINE
- `US10` Iniciar registro de organización y completar datos de la empresa — NEEDS_REVIEW
- `US11` Configurar tipo de operación y categorías de productos refrigerados — REFINE
- `US12` Registrar ubicación principal de almacenamiento y capacidad de la cámara — NEEDS_REVIEW
- `US13` Registrar datos del administrador y rol del workspace — REFINE
- `US14` Configurar nombre, slug de workspace y plan de suscripción — SUPERSEDED/V2
- `US15` Registrar términos y enviar solicitud de activación — REFINE
- `US16` Consultar estado pendiente de revisión del workspace — REFINE
- `US17` Consultar resumen de configuración — REFINE
- `US18` Editar perfil y datos básicos de la organización — REFINE
- `US19` Consultar workspaces y áreas operativas — NEEDS_REVIEW
- `US20` Consultar miembros del equipo — REFINE
- `US21` Registrar miembro del workspace — REFINE
- `US22` Editar o desactivar miembro del equipo — REFINE
- `US23` Consultar roles y mapa de accesos — REFINE
- `US24` Consultar reglas operativas — NEEDS_REVIEW
- `US25` Agregar regla operativa personalizada — NEEDS_REVIEW
- `US26` Consultar campos personalizados — NEEDS_REVIEW
- `US27` Agregar campo personalizado — NEEDS_REVIEW
- `US28` Consultar facturación y consumo del plan — V2
- `US29` Comparar planes y capacidades — V2
- `US30` Editar plan de revisión referencial — SUPERSEDED/V2
- `US31` Configurar ajustes regionales — REFINE
- `US32` Configurar unidades operativas — REFINE
- `US33` Configurar notificaciones del sistema — NEEDS_REVIEW
- `US34` Configurar comportamiento del workspace — NEEDS_REVIEW
- `US35` Configurar acceso y seguridad — REFINE
- `US36` Consultar perfil personal — REFINE
- `US37` Editar datos de cuenta — REFINE
- `US38` Consultar notificaciones del panel — NEEDS_REVIEW

### EP05–EP09

- `US39` Consultar panel del comprador — KEEP_CANDIDATE
- `US40` Consultar catálogo de productos — KEEP_CANDIDATE
- `US41` Buscar y filtrar productos — KEEP_CANDIDATE
- `US42` Consultar detalle de producto — REFINE
- `US43` Visualizar promociones aplicadas al catálogo — NEEDS_REVIEW
- `US44` Agregar productos al constructor de solicitudes — KEEP_CANDIDATE
- `US45` Prevenir solicitud de compra vacía — KEEP_CANDIDATE
- `US46` Registrar datos de entrega y observaciones — REFINE
- `US47` Consultar vista previa de ruta — NEEDS_REVIEW
- `US48` Seleccionar preferencia de pago — NEEDS_REVIEW
- `US49` Revisar resumen de solicitud — KEEP_CANDIDATE
- `US50` Enviar solicitud de compra — REFINE
- `US51` Consultar solicitudes enviadas — KEEP_CANDIDATE
- `US52` Consultar detalle de solicitud — REFINE
- `US53` Consultar observaciones comerciales de la solicitud — KEEP_CANDIDATE
- `US54` Consultar estado de cancelación o rechazo de solicitud — KEEP_CANDIDATE
- `US55` Consultar órdenes confirmadas — REFINE
- `US56` Consultar seguimiento del despacho — KEEP_CANDIDATE
- `US57` Consultar documentos comerciales — REFINE
- `US58` Consultar deudas y cobros — NEEDS_REVIEW
- `US59` Registrar método de pago referencial — NEEDS_REVIEW
- `US60` Administrar catálogo, precios, visibilidad y desactivación — REFINE
- `US61` Buscar y filtrar productos en el catálogo de ventas — KEEP_CANDIDATE
- `US62` Crear y configurar promociones comerciales — NEEDS_REVIEW
- `US63` Editar o pausar promoción comercial — NEEDS_REVIEW
- `US64` Desactivar promoción — NEEDS_REVIEW
- `US65` Consultar panel comercial — KEEP_CANDIDATE
- `US66` Consultar bandeja de solicitudes de compra — KEEP_CANDIDATE
- `US67` Auditar RUC y línea de crédito comercial — NEEDS_REVIEW
- `US68` Consultar disponibilidad comercial de existencias — REFINE
- `US69` Enviar observaciones de ajuste de stock — KEEP_CANDIDATE
- `US70` Rechazar solicitud comercial registrando motivo — KEEP_CANDIDATE
- `US71` Aceptar solicitud y formalizar orden de compra — REFINE
- `US72` Consultar historial de órdenes — KEEP_CANDIDATE
- `US73` Consultar detalle de orden y timeline de tracking — KEEP_CANDIDATE
- `US74` Iniciar pedido manual seleccionando cliente — KEEP_CANDIDATE
- `US75` Seleccionar productos y cantidades — KEEP_CANDIDATE
- `US76` Configurar despacho y prioridad — REFINE
- `US77` Confirmar y crear orden manual — REFINE
- `US78` Consultar listado de clientes B2B — NEEDS_REVIEW
- `US79` Registrar nueva cuenta de cliente B2B — NEEDS_REVIEW
- `US80` Editar ficha de cliente B2B y suspender crédito — NEEDS_REVIEW
- `US81` Consultar panel operativo — KEEP_CANDIDATE
- `US82` Consultar inventario físico total y por lote — KEEP_CANDIDATE
- `US83` Consultar lotes activos ordenados por FEFO — REFINE
- `US84` Registrar movimientos de stock por importación — NEEDS_REVIEW
- `US85` Registrar salidas por merma con motivo obligatorio — REFINE
- `US86` Consultar reservas físicas de stock asociadas a la orden — REFINE
- `US87` Crear y activar promociones de productos de almacén — V2/NEEDS_REVIEW

### EP10–EP13

- `US88` Consultar despachos en el tablero Kanban — REFINE
- `US89` Consultar y actualizar estado de despacho desde el tablero — REFINE
- `US90` Registrar inicio de ruta del despacho — V2/NEEDS_REVIEW
- `US91` Consultar bandeja de despachos entregados — REFINE
- `US92` Registrar conformidad de entrega con datos de receptor y evidencia referencial — V2/NEEDS_REVIEW
- `US93` Consultar registros de temperatura del despacho — V2/NEEDS_REVIEW
- `US94` Registrar incidencia logística del despacho — NEEDS_REVIEW
- `US95` Consultar reporte analítico y métricas de despacho — REFINE
- `US96` Consultar cola de documentos de facturación — REFINE
- `US97` Agregar documento comercial manual a la orden — KEEP_CANDIDATE
- `US98` Generar factura XML referencial — NEEDS_REVIEW
- `US99` Generar guía de remisión PDF referencial — NEEDS_REVIEW
- `US100` Regenerar archivo de documento comercial — NEEDS_REVIEW
- `US101` Consultar detalle y logs de documento — KEEP_CANDIDATE
- `US102` Consultar cola de documentos logísticos de almacén — REFINE
- `US103` Generar y regenerar facturas XML/PDF y guías PDF referenciales de almacén — NEEDS_REVIEW
- `US104` Consultar perfil personal del vendedor — LOW_VALUE/REFINE
- `US105` Cambiar idioma de la interfaz del vendedor — LOW_VALUE/REFINE
- `US106` Consultar y editar perfil personal del Logistics Manager — LOW_VALUE/REFINE
- `US107` Cambiar idioma de la interfaz de almacén — LOW_VALUE/REFINE
- `TS01` Autenticación mediante RESTful API — DROP
- `TS02` Gestión de usuarios mediante RESTful API — DROP
- `TS03` Registro de organizaciones mediante RESTful API — DROP
- `TS04` Consulta y actualización de tenants mediante RESTful API — DROP
- `TS05` Gestión de clientes B2B mediante RESTful API — DROP
- `TS06` Gestión del catálogo mediante RESTful API — DROP
- `TS07` Gestión de categorías mediante RESTful API — DROP
- `TS08` Gestión de marcas mediante RESTful API — DROP
- `TS09` Gestión de órdenes mediante RESTful API — DROP
- `TS10` Gestión de solicitudes de crédito mediante RESTful API — DROP
- `TS11` Gestión de facturas mediante RESTful API — DROP
- `TS12` Gestión de pagos mediante RESTful API — DROP
- `TS13` Gestión de envíos mediante RESTful API — DROP
- `TS14` Gestión de almacenes mediante RESTful API — DROP
- `TS15` Gestión y reserva de inventario mediante RESTful API — DROP
- `TS16` Consulta de auditoría mediante RESTful API — DROP
- `TS17` Consulta de datos de referencia mediante RESTful API — DROP

Inventory total: 13 epics, 107 `US`, 17 `TS`, plus epic rows. Source contains Gherkin criteria inline for functional stories.

## Acceptance-criteria inventory

Source rows contain 107 functional stories with 262 historical `Escenario` blocks. Scenario counts by epic: EP01 `12`, EP02 `7`, EP03 `19`, EP04 `58`, EP05 `52`, EP06 `10`, EP07 `21`, EP08 `18`, EP09 `16`, EP10 `19`, EP11 `22`, EP12 `8`. Technical story rows also carry source-level acceptance text but are classified `DROP` as implementation detail.

Every functional story row is therefore accounted for by ID/title above and by its inline source Gherkin. Preserve source wording at `report/30-chapter-3-requirements-specification/3-1-user-stories.md`; this curated package extracts only reusable acceptance patterns below.

## Acceptance evidence worth salvaging

### Unit/integration candidates

- Required fields block submission.
- Invalid email format is rejected.
- Invalid credentials and unknown/inactive workspace are rejected.
- Duplicate member email is rejected.
- Self-deactivation of owner is blocked.
- Empty request/cart cannot advance.
- Invalid or occupied slug is rejected (historical only; not current onboarding contract).
- Request review can observe, reject with reason, cancel or formalize after review.
- Physical stock, lot and reservation views must not silently claim sellable availability.
- Document states/logs remain distinguishable from fiscal issuance.

### Browser E2E candidates

- Buyer browses catalog, filters product, adds items, reviews delivery data, returns to catalog and verifies draft retention.
- Buyer distinguishes `My Requests` from confirmed orders and reads next status.
- Sales captures an assisted order from informal input without losing customer, quantities or conditions.
- Operations finds low/at-risk lot, reads FEFO ordering, opens dispatch and identifies next action.
- Buyer sees request observations/rejection reason and can recover.

### Security negative candidates

- Tenant/workspace data isolation.
- Buyer relationship to multiple Tenants without cross-tenant leakage.
- Internal role cannot access unauthorized modules.
- Deactivated member cannot regain access.
- Public contact/request does not auto-create Tenant.
- Company Owner and Tenant Administrator responsibilities must not grant each other unintended authority.

### UX acceptance candidates

- Status is visible in text, not color alone.
- New/attention states are discoverable.
- Quick filters reduce lookup effort.
- Credit/availability context is visible where decision occurs.
- Human support remains available for exceptions.

## Do not import

Do not import story IDs, Story Points, source endpoints, Vue routes, ASP.NET modules, legacy plan tiers, or source acceptance wording as current contracts. Re-run current discovery and align any future story with current Product & Business V1 and Strategic DDD outputs.
