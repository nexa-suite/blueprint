---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-23
---

# Canonical C4 model

## Question answered

**¿Quién usa Nexa, de qué sistemas externos depende y qué aplicaciones o almacenes ejecutables componen el producto?**

Este documento fija la semántica C4 L1/L2 de Nexa independiente de los límites estratégicos. Modela el sistema real; no modela el árbol de carpetas, el número de servicios Docker ni módulos Java como si fueran contenedores C4 o Bounded Contexts.

## Fuente canónica

- [Structurizr DSL](structurizr/workspace.dsl) es la fuente semántica.
- [README de Structurizr](structurizr/README.md) documenta las vistas y su validación.
- [Level 4 code views](l4/README.md) use repository-derived or TARGET Mermaid views; they do not fake C4 Components or production classes.
- [L3/L4 technical views](l4/technical-lenses.md) index the requested API, Platform and Portal responsibility lenses and canonical workflows.
- `structurizr/generated/workspace.json` es representación generada; no debe editarse manualmente.
- `structurizr/workspace.json` es el espejo manual cargado para revisión académica; debe ser byte/semánticamente igual a la representación generada y no una segunda fuente.

Source authority: `structurizr/workspace.dsl` and its included files. Level
files are direct and unique: `structurizr/l1/l1.dsl`, `structurizr/l2/l2.dsl`
and `structurizr/l3/*.dsl`.

Vistas canónicas:

- `Nexa-SystemContext-V1`
- `Nexa-Containers-V1`
- `Nexa-SystemContext-Runway`
- `Nexa-Containers-Runway`

Las vistas L3 son selectivas TARGET PRE-V1, baselined donde explican ownership técnico e invariantes útiles:

- `Nexa-API-Overall-ASIS`
- `Nexa-API-IdentityTenantCustomer-TARGET`
- `Nexa-API-CommercialInventory-TARGET`
- `Nexa-API-FulfillmentDelivery-TARGET`
- `Nexa-API-CreditPaymentDocuments-TARGET`
- `Nexa-API-IntegrationReliability-ASIS`
- `Nexa-Platform-Frontend-TARGET`
- `Nexa-Portal-Frontend-TARGET`
- `Nexa-Website-Frontend-ASIS`
- `Nexa-Operations-Mobile-PROPOSED`
- `Nexa-Buyer-Mobile-PROPOSED`

No se crea una vista de componentes del Website: su implementación estática y frontera pública son simples y no agregan una decisión arquitectónica útil en este corte. No hay vista de deployment.

## L1 System Context

El sistema primario es **Nexa**: una plataforma B2B SaaS multi-tenant que coordina operaciones comerciales, catálogo, relaciones con clientes, inventario, fulfillment, entrega y autoservicio Buyer para importadores, distribuidores y mayoristas, con soporte especializado para cadena de frío.

El L1 usa tres actores legibles:

| Actor C4 | Responsabilidades conservadas | Motivo de agrupación |
|---|---|---|
| Prospective Customer Representative | Descubrimiento, contacto y solicitud de demo | Actor externo con flujo público propio. |
| Internal Tenant Workforce | Tenant Administrator, Company Owner, Business Operations Manager, Sales Representative, Warehouse Operator y Dispatch Coordinator | Comparten la aplicación interna; las diferencias de responsabilidad quedan explícitas en la descripción y en la documentación de personas. Separarlos en L1 haría ilegible el límite del sistema sin aportar una relación externa distinta. |
| B2B Buyer | Catálogo privado, compra, visibilidad de pedidos y autoservicio | No es workforce membership y puede mantener relaciones comerciales autorizadas con más de un Tenant. |

El L1 muestra únicamente Nexa y los sistemas externos V1:

- Payment Provider.
- Email Delivery Service.
- Maps & Geolocation Provider.

No muestra PostgreSQL, Angular, Spring Boot, Docker, Workspace, módulos Java, esquemas, RLS, colas, ClamAV o MinIO: todos pertenecen a niveles inferiores o a vistas de runtime.

## L2 Container model

Un C4 Container es una aplicación ejecutable/desplegable o un almacén de datos dentro de Nexa. No equivale automáticamente a un Docker container.

La lista canónica V1 es exactamente:

| C4 Container | Tecnología observada | Responsabilidad |
|---|---|---|
| Nexa Website | HTML/CSS/JavaScript estático servido por Nginx | Descubrimiento público, intake y entrada. |
| Nexa Platform | Angular 22 SPA servido por Nginx | Workforce interna y operaciones. |
| Nexa Buyer Portal | Angular 22 SPA servido por Nginx | Autoservicio B2B por relación autorizada. |
| Nexa API | Java 25, Spring Boot 4.1, Spring Modulith modular monolith | Autoridad de dominio, seguridad, workflows, integraciones y persistencia. |
| PostgreSQL | PostgreSQL | Persistencia transaccional/configuración compartida y lógicamente aislada. |
| Object Storage | Frontera S3-compatible; MinIO local | Bytes de documentos/media tenant-owned; la API conserva la autorización y metadatos asociados. |

Planned L2 adds only `Nexa Operations Mobile` and `Nexa Buyer Mobile`, both
`PLANNED / PROPOSED`; they are not current V1 implementation claims.

### Por qué las superficies están separadas

- **Platform y Portal** tienen actores, permisos, navegación, workflows y ritmo de UX diferentes. Separarlos permite una experiencia interna orientada a operaciones y una experiencia Buyer orientada a autoservicio sin convertirlas en dos backends ni afirmar dos Bounded Contexts.
- **Website** es público, anónimo y de contenido/marketing; tiene ciclo de cache, seguridad y publicación distinto de las SPA autenticadas. Su formulario estructurado sí llama al API cuando está configurado; no contiene catálogo ni datos tenant.
- **API modular monolith** concentra la autoridad transaccional, la seguridad multi-tenant y los handoffs actuales en un despliegue coherente. Spring Modulith y los puertos permiten modularidad interna; accepted Strategic DDD ownership does not require one deployment per context.
- **PostgreSQL compartido** corresponde al V1 aceptado: una base relacional común favorece transacciones, migraciones y operación iniciales. Database-per-Tenant no está aceptado; la garantía pretendida es aislamiento lógico por contexto autorizado, predicados tenant/workspace y RLS. La cobertura completa sigue siendo una pregunta de Security/Data Architecture.
- **Object Storage separado** evita tratar bytes grandes como filas relacionales: tiene lifecycle, streaming, autorización de descarga y controles de scanning propios. PostgreSQL conserva referencias y metadatos, no sustituye el almacenamiento de objetos.

## Dependencias externas y adapters

Payment, email y maps/geolocation aparecen como sistemas externos abstractos, no como marcas o proveedores productivos concretos. El API es el dueño actual de las fronteras de integración observadas:

- Payment: Payment es concepto de negocio; Stripe es la dirección de pago online V1 de Nexa; WireMock es test double. El contrato productivo y decisiones técnicas siguen abiertos.
- Email: SMTP y entrega son infraestructura; Mailpit es un sink local.
- Maps/geolocation: el API contiene `GoogleMapsRoutingAdapter` y `LocalDeterministicMapAdapter`. El navegador puede obtener geolocalización del dispositivo, pero no se observó una integración client-side directa con Google/Apple/LinkedIn Maps.

Las decisiones de proveedor, credenciales, SLA y deployment productivo siguen abiertas en [Unresolved product decisions](../../product/rules/future-scope.md).

## Mobile projection

Las vistas Runway incluyen las dos aplicaciones planificadas con tags
`PLANNED,PROPOSED`. Driver / Delivery Operator is a planned actor. The full
projection and BC mapping is in [Mobile domain projection](../../domain/strategic-ddd/mobile-projection.md).

- Nexa Operations Mobile.
- Nexa Buyer Mobile.
- Nexa Control Center.
- Google, Apple y LinkedIn como identity providers opcionales futuros.
- IoT / Telemetry Integrations.

Estos elementos no están presentes en las vistas V1 ni deben describirse como implementados V1. No se introduce microservicio alguno.

## Exclusiones deliberadas

- **Workspace** es un concepto operativo/domain de la relación Tenant 1:1 V1, no un proceso desplegable ni un C4 Container independiente.
- Los módulos Java (`catalogmanagement`, `sales`, `warehouse`, `logistics`, etc.) son evidencia de organización de implementación. No son Bounded Contexts ni containers C4.
- ClamAV, Mailpit, Stripe mock, OTEL Collector y Jaeger son infraestructura/adapters locales; se documentan en la [evidencia de runtime](../../../04-delivery/as-is/compose-runtime-architecture-evidence.md), no en el L1 ni en la lista primaria L2.
- Docker Compose es runtime local AS-IS, no Cloud Deployment Architecture.
- C4 L3/L4 aquí son vistas técnicas derivadas de `Capability Mapping -> EventStorming -> Domain Storytelling -> Strategic DDD` aceptado; no convierten nombres de paquetes en Bounded Contexts ni autorizan refactor.

## Preguntas críticas resueltas por esta baseline

La respuesta defendible es: **Nexa es el producto; las superficies web son experiencias separadas; el API modular monolith es la autoridad; PostgreSQL y Object Storage son almacenes C4; los providers son dependencias externas abstractas; el runtime local se mapea aparte; Workspace y módulos no se convierten en containers por nombre**.

La semántica de identidad global, membership workforce, Buyer relationship, propagación de contexto y RLS se detalla separadamente en [Multi-tenant context propagation](../../security/multi-tenancy/context-propagation.md). La organización lógica se detalla en [Logical system layering](../layering/logical-system-layering.md).

## Tactical rubric coverage

[Component-level rubric coverage](component-rubric-coverage.md) maps all eleven
Bounded Contexts to existing Structurizr component views. Reuse is deliberate:
the views are logical seams inside accepted containers, not one container per
context. Versioned SVG exports under [exports](exports/README.md) are review
artifacts; the Structurizr DSL remains semantic source.
