---
status: planned
maturity: DRAFT
scope: runway
owner: academic
last-reviewed: 2026-08-27
---

# Big Picture EventStorming — Guía de diagramación de los 10 pasos

## Propósito

Esta guía permite que un compañero construya manualmente las diez capturas
progresivas del `Big Picture EventStorming` de Nexa. Es una proyección
académica sobre el dominio canónico; no es una nueva fuente de verdad ni un
rediseño de Product o Strategic DDD.

El tablero debe ser el mismo durante toda la sesión. Cada captura conserva lo
anterior y agrega una capa visible:

```text
1 Unstructured Exploration  -> Domain Events
2 Timelines                -> chronology and branches
3 Pain Points              -> business friction / risk
4 Pivotal Points           -> semantic or lifecycle pivots
5 Commands                -> Actor -> Command -> Domain Event
6 Policies                -> Domain Event -> Policy -> Command
7 Read Models             -> decision information
8 External Systems        -> external participants
9 Aggregates              -> consistency/model boundaries
10 Bounded Contexts        -> candidate semantic boundaries
```

No se deben producir diez tableros independientes ni reemplazar estos diez
pasos por el antiguo pipeline de Strategic DDD. `Candidate Context Discovery`,
`Domain Storytelling`, `Bounded Context Canvases` y `Context Mapping` son
artefactos académicos posteriores y separados.

## Contrato de lenguaje

Las explicaciones están en español. Los identificadores canónicos de Nexa y
DDD permanecen en inglés: `Customer Buyer`, `PurchaseRequestSubmitted`,
`Commercial Commitment`, `BC-04 Sales Commitment`.

Usa nombres de evento como hechos ya ocurridos y en pasado. Para no mezclar
contratos, en el tablero se puede escribir `SalesOrderConfirmed`; cuando se
describa su integración publicada, el identificador canónico es
`SalesOrderConfirmed.v1`.

## Autoridad y límites

La autoridad semántica es `01-shared/`, no las carpetas de aplicaciones,
paquetes Java, módulos Spring, tablas PostgreSQL, endpoints ni pantallas.
`AS-IS` es evidencia; no redefine `TARGET`. Esta guía tampoco crea un Mobile
Bounded Context: Mobile es una proyección propuesta, con investigación de
validación pendiente.

Orden de consulta recomendado:

1. [Source of truth](../../01-shared/engineering/governance/source-of-truth.md)
2. [Current accepted decisions](../../01-shared/product/current-decisions.md)
3. [Strategic DDD](../../01-shared/domain/strategic-ddd/README.md)
4. [EventStorming baseline](../../01-shared/domain/processes/eventstorming.md)
5. [Domain Stories](../../01-shared/domain/processes/domain-stories.md)
6. [Business ownership matrix](../../01-shared/domain/ownership/business-ownership-matrix.md)
7. [Ubiquitous Language](../../01-shared/domain/ubiquitous-language/glossary.md)
8. [Integration and Event Architecture](../../01-shared/architecture/integrations/README.md)
9. [Canonical Bounded Context canvases](../../01-shared/domain/bounded-contexts/README.md)
10. [Final Project statement](enunciado-trabajo-final.md), únicamente para la estructura académica

La comprobación de existencia de una guía equivalente no encontró otra guía
canónica de estos diez pasos en el árbol consultado. Este archivo es, por
tanto, la proyección única para la diagramación; no duplica el modelo DDD.

## Historia representativa y carriles

La historia principal cruza el `Core Domain`: una intención comercial
autorizada se convierte en compromiso, se protege contra disponibilidad real,
se ejecuta físicamente y termina en una entrega trazable.

Se recomienda dibujar un tablero ancho con estos carriles, manteniendo los
eventos en un único flujo:

| Carril | Enfoque | Fuente canónica |
|---|---|---|
| Tenant / relationship | `TenantProvisioningRequested`, `TenantActivated`, `WorkforceMembershipGranted`, `BuyerRelationshipApproved` | [EventStorming](../../01-shared/domain/processes/eventstorming.md) |
| Commercial intent | `CartDraftCreated`, `AuthoritativePriceResolved`, `PurchaseRequestSubmitted` | [EventStorming](../../01-shared/domain/processes/eventstorming.md) |
| Commitment | `CommercialCommitmentEstablished`, `CreditReservationEstablished`, `SalesOrderConfirmed` | [BC-04 Sales Commitment](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md) |
| Availability | `StockReceived`, `LotCreated`, `SellableAvailabilityChanged`, `AllocationExecuted` | [BC-05 Inventory Availability](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/README.md) |
| Fulfillment | `FulfillmentPlanned`, `FulfillmentAllocated`, `PickingCompleted`, `Packed`, `Staged`, `ReadyForDispatch` | [BC-06 Fulfillment & Delivery](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) |
| Delivery | `HandedOver`, `DeliveryDispatched`, `DeliveryAttempted`, `DeliveryCompleted` | [Workflows](../../01-shared/domain/processes/workflows.md) |
| Financial/document evidence | `ReceivablePosted`, `PaymentReported`, `PaymentConfirmed`, `BusinessDocumentIssued` | [Published events](../../01-shared/domain/events/published-events.md) |
| Traceability | `BusinessFactTraced`, `NotificationDeliveryFailed` | [Domain message flows](../../01-shared/domain/processes/message-flows.md) |

Las ramas no deben convertirse en un segundo tablero:

- `APPROVAL_REQUIRED`: `PurchaseRequestSubmitted` → revisión →
  `SalesOrderConfirmed`.
- `DIRECT_ORDER`: confirmación directa del `Sales Order`, sin fabricar un
  `Purchase Request` inexistente.
- `PREPAID`, `IMMEDIATE` y `credit/net` tienen órdenes financieros distintas;
  no se debe dibujar una secuencia universal.
- `PartialDeliveryRecorded` → `ContinuationDeliveryCreated` es una rama de
  resultado parcial, no un nuevo `Delivery Attempt` ni un nuevo backorder.
- Una excursión de temperatura conduce a `HOLD` y a `ColdChainDisposition`;
  `REJECT` no significa automáticamente `RETURN_TO_SUPPLIER` o `WASTE`.

## Leyenda visual

Usa una leyenda clara y consistente. Si la clase no fija colores, prioriza la
semántica y documenta el color elegido en la captura; no lo presentes como una
decisión de marca de Nexa.

| Tipo | Convención sugerida | Significado |
|---|---|---|
| `Domain Event` | sticky naranja | hecho de negocio ocurrido |
| `Actor` | sticky amarillo | persona o participante de negocio |
| `Command` | sticky azul | intención/acción que solicita un cambio |
| `Policy` | sticky morado | reacción o regla que conecta hechos y acciones |
| `Read Model` | sticky verde | información de consulta para decidir |
| `External System` | borde o sticky gris | sistema fuera de la interacción Nexa modelada |
| `Aggregate` | contorno discontinuo | límite de consistencia/modelo, no tabla |
| `Pain Point` | hotspot rojo | fricción, riesgo o incertidumbre de negocio |
| `Pivotal Point` | marcador vertical | cambio de fase, intención, responsabilidad o semántica |
| `Bounded Context` | contorno grande rotulado | límite semántico y de ownership |

---

## Step 1 — `Unstructured Exploration`

### Objetivo

Capturar hechos significativos del paisaje B2B de Nexa antes de imponer
cronología, actores, reglas o límites. La pregunta es: ¿qué hechos ocurren en
el negocio?

### Qué se conserva del paso anterior

Nada. Este es el primer estado del tablero. No se debe comenzar con cajas de
`Bounded Contexts` ni con un flujo técnico.

### Qué se agrega en este paso

Solo `Domain Events` verificados. La cobertura debe ser amplia, pero legible:
acceso/tenant, relación Buyer, oferta comercial, Purchase Request,
commitment, disponibilidad, fulfillment, delivery, cold-chain, crédito,
pagos, documentos, notificaciones y trazabilidad.

### Elementos visuales

`Domain Event` únicamente; se pueden usar carriles provisionales de lectura,
pero todavía no se dibujan `Actor`, `Command`, `Policy`, `Read Model`,
`External System`, `Aggregate` o `Bounded Context`.

### Datos de Nexa a colocar

Usa este inventario inicial, reducido a hechos del [baseline canónico](../../01-shared/domain/processes/eventstorming.md):

```text
TenantProvisioningRequested
TenantActivated
WorkforceMembershipGranted
CapabilityChanged
BuyerRelationshipRequestedOrInvited
BuyerRelationshipApproved
BuyerIdentityLinked

CartDraftCreated
AuthoritativePriceResolved
PurchaseRequestSubmitted
CommercialCommitmentEstablished
CreditReservationEstablished                 (cuando aplica)
PurchaseRequestVisibleToSales
MaterialChangeProposed                       (alternativo)
BuyerChangeAccepted                          (cuando se requiere)
SalesOrderConfirmed
CommitmentOwnershipTransferred

StockReceived
LotCreated
SellableAvailabilityChanged
CommitmentDemandObserved
AllocationExecuted
InventoryMoved
ShortageDetected                             (excepción)

FulfillmentPlanned
FulfillmentAllocated
PickingCompleted
Packed
Staged
ReadyForDispatch
HandedOver
DeliveryDispatched
DeliveryAttempted
DeliveryAttemptFailed                        (alternativo)
PartialDeliveryRecorded                      (alternativo)
ContinuationDeliveryCreated                  (alternativo)
DeliveryCompleted
PODAmended                                   (posterior, si ocurre)

ReceivablePosted                             (credit/net)
PaymentReported
PaymentConfirmed
PaymentApplied
BusinessDocumentIssued
NotificationDeliveryFailed                   (excepción de comunicación)
BusinessFactTraced
```

En esta etapa no hace falta colocar todos los eventos de tenant/onboarding,
pero deben quedar disponibles en la exploración si el equipo decide ampliar
la captura. No se debe introducir `Order`, `Shipment`, `Billing` u otro nombre
histórico si no coincide con el lenguaje actual.

### Orden / posición sugerida

Coloca los eventos de forma aparentemente desordenada, como una exploración
colaborativa. Agrupa solo por proximidad temática o por color de carril; no
dibujes flechas causales definitivas.

### Ejemplo mínimo

```text
PurchaseRequestSubmitted
CommercialCommitmentEstablished
SalesOrderConfirmed
PhysicalAllocationCreated.v1  (contrato publicado; evento de tablero: AllocationExecuted)
DeliveryCompleted
```

La distinción entre `AllocationExecuted` y `PhysicalAllocationCreated.v1`
evita confundir un `Internal Domain Event` con su contrato de integración.

### Fuente canónica

[EventStorming PRE-V1 baseline](../../01-shared/domain/processes/eventstorming.md),
[published event contracts](../../01-shared/domain/events/published-events.md),
y [Ubiquitous Language](../../01-shared/domain/ubiquitous-language/glossary.md).

### Qué NO hacer

- No usar endpoints, HTTP, tablas, módulos Java o nombres de pantallas.
- No convertir un `Command` en un evento.
- No incluir todavía límites de `Bounded Context`.
- No presentar todos los eventos como `Published Integration Event`.
- No inventar eventos para llenar espacio.

### Criterio de finalización

La captura muestra un paisaje reconociblemente B2B/cold-chain y cada sticky es
un hecho de negocio verificable, sin decisiones de ownership ni estructura
técnica.

## Step 2 — `Timelines`

### Objetivo

Organizar exactamente los eventos del Step 1 en cronologías, caminos
alternativos, excepciones y ramas concurrentes. La pregunta es: ¿en qué orden
ocurren y dónde divergen los flujos?

### Qué se conserva del paso anterior

Se conserva el inventario completo del Step 1 y sus textos. Solo cambia la
posición para hacer visible la historia.

### Qué se agrega en este paso

Orden de izquierda a derecha, flechas de lectura y separación vertical de las
ramas `APPROVAL_REQUIRED`, `DIRECT_ORDER`, `credit/net`, `PREPAID`,
`IMMEDIATE`, shortage y partial delivery.

### Elementos visuales

Los mismos `Domain Event` y marcadores de flujo. No se agregan aún
`Pain Point`, `Policy`, `Read Model`, `External System`, `Aggregate` ni
`Bounded Context`.

### Datos de Nexa a colocar

Usa estas secuencias como organización, no como un reemplazo del inventario:

```text
APPROVAL_REQUIRED
CartDraftCreated
  -> AuthoritativePriceResolved
  -> PurchaseRequestSubmitted
  -> CommercialCommitmentEstablished
  -> CreditReservationEstablished (cuando aplica)
  -> PurchaseRequestVisibleToSales
  -> MaterialChangeProposed (opcional)
  -> BuyerChangeAccepted (cuando se requiere)
  -> SalesOrderConfirmed
  -> CommitmentOwnershipTransferred

DIRECT_ORDER
AuthoritativePriceResolved
  -> CommercialCommitmentEstablished
  -> SalesOrderConfirmed
  -> CommitmentOwnershipTransferred

AVAILABILITY / EXECUTION
StockReceived -> LotCreated -> SellableAvailabilityChanged
  -> CommitmentDemandObserved -> AllocationExecuted -> InventoryMoved
  -> FulfillmentPlanned -> FulfillmentAllocated -> PickingCompleted
  -> Packed -> Staged -> ReadyForDispatch -> HandedOver
  -> DeliveryDispatched -> DeliveryAttempted -> DeliveryCompleted

ALTERNATIVES
ShortageDetected or FulfillmentShortage
DeliveryAttemptFailed
PartialDeliveryRecorded -> ContinuationDeliveryCreated
```

La rama financiera se coloca junto a la parte que explica la decisión:

```text
credit/net: SalesOrderConfirmed -> ReceivablePosted
  -> PaymentReported -> PaymentConfirmed -> PaymentApplied
PREPAID: PaymentReported -> PaymentConfirmed -> SalesOrderConfirmed
IMMEDIATE: SalesOrderConfirmed -> PaymentReported -> PaymentConfirmed
```

### Orden / posición sugerida

Tiempo de izquierda a derecha. Carriles verticales para los caminos
alternativos y una línea de retorno visual solo cuando el proceso realmente
lo requiere. La rama parcial debe volver a la obligación restante mediante
`ContinuationDeliveryCreated`, no a un nuevo intento del mismo `Delivery`.

### Ejemplo mínimo

```text
PurchaseRequestSubmitted
  -> CommercialCommitmentEstablished
  -> SalesOrderConfirmed
  -> FulfillmentPlanned
  -> DeliveryCompleted
```

### Fuente canónica

[Canonical V1 workflows](../../01-shared/domain/processes/workflows.md),
[EventStorming baseline](../../01-shared/domain/processes/eventstorming.md),
y [Domain message flows](../../01-shared/domain/processes/message-flows.md).

### Qué NO hacer

- No borrar los eventos del Step 1 para dibujar un happy path más corto.
- No afirmar que todos los pedidos siguen la misma rama financiera.
- No introducir `UNDER_REVIEW` como estado persistido de `Purchase Request`.
- No hacer que una notificación o un callback cree por sí solo la consistencia
  comercial.

### Criterio de finalización

La segunda captura es visiblemente el mismo tablero, pero permite seguir una
progresión normal y al menos una excepción sin perder la cobertura del Step 1.

## Step 3 — `Pain Points`

### Objetivo

Hacer visibles la fricción, el riesgo, la incertidumbre o la complejidad de
negocio que aparecen al leer las timelines. La etiqueta que debe aparecer es
`Pain Points`.

### Qué se conserva del paso anterior

Se conserva toda la cronología y todas sus ramas. No se cambia el nombre de
los eventos para que encajen con un problema.

### Qué se agrega en este paso

Hotspots rojos vinculados a situaciones reales de Nexa. Son observaciones de
negocio, no una lista de bugs técnicos.

### Elementos visuales

`Pain Point` / `Hotspot` además de los `Domain Event` y las timelines.

### Datos de Nexa a colocar

Usa como candidatos verificados:

| `Pain Point` | Evidencia que lo justifica |
|---|---|
| La disponibilidad debe protegerse sin doble conteo | `Commercial Commitment`, `Inventory Reservation/Warehouse Backing` y `Physical Allocation` son hechos distintos. |
| Una solicitud materialmente modificada puede requerir aceptación y revalidación | Las reglas de `Purchase Request` exigen reemplazo/ajuste atómico. |
| Un shortage puede aparecer entre compromiso y ejecución física | `ShortageDetected` / `FulfillmentShortage` son excepciones explícitas. |
| Una entrega parcial deja una obligación restante | `PartialDeliveryRecorded` crea `ContinuationDeliveryCreated`. |
| Una excursión de temperatura requiere decisión | `HOLD` y `ColdChainDisposition` separan el resultado de la acción física posterior. |
| El pago confirmado puede quedar sin orden asignada | `UNALLOCATED / RECONCILIATION_REQUIRED` conserva el historial y exige reconciliación. |
| La falla de notificación no debe alterar el estado fuente | `NotificationDeliveryFailed` se reintenta sin mutar el hecho comercial. |

### Orden / posición sugerida

Coloca cada `Pain Point` junto al evento o transición donde se descubre. No
los apiles todos al final: el profesor debe poder ver qué parte del negocio
expone cada hotspot.

### Ejemplo mínimo

```text
CommercialCommitmentEstablished
  [Pain Point: el compromiso comercial no selecciona Warehouse/Lot]
AllocationExecuted
  [Pain Point: la disponibilidad física puede producir shortage]
PartialDeliveryRecorded
  [Pain Point: queda una obligación restante que debe seguir siendo trazable]
```

### Fuente canónica

[Current accepted decisions](../../01-shared/product/current-decisions.md),
[Domain Stories](../../01-shared/domain/processes/domain-stories.md),
y [Strategic decision register](../../01-shared/domain/ownership/strategic-decision-register.md).

### Qué NO hacer

- No inventar problemas porque una zona del tablero quedó vacía.
- No usar un bug de UI como `Pain Point` si no expresa un problema del negocio.
- No presentar `Payment`, `Receivable` y `Credit` como un único problema
  semántico: su separación es una decisión vigente.
- No cambiar la timeline para ocultar una excepción.

### Criterio de finalización

Cada hotspot está ligado a una transición o situación documentada y explica
por qué la regla importa para la operación B2B/cold-chain.

## Step 4 — `Pivotal Points`

### Objetivo

Marcar eventos donde cambia la fase, intención, responsabilidad, ownership o
semántica del negocio. La pregunta es: ¿qué hechos cambian la historia?

### Qué se conserva del paso anterior

Se conserva el mismo tablero, incluidos `Pain Points`, ramas y eventos. Los
marcadores no crean límites de contexto todavía.

### Qué se agrega en este paso

Marcadores verticales `Pivotal Point` y una justificación breve por cada uno.

### Elementos visuales

`Pivotal Point`, `Domain Event`, `Pain Point` y sus timelines. No dibujar
`Bounded Context` boxes en esta etapa.

### Datos de Nexa a colocar

Los pivotes recomendados, verificables en ownership y workflows, son:

| Evento marcado | Por qué es pivotal |
|---|---|
| `PurchaseRequestSubmitted` | La intención se vuelve una solicitud válida y activa efectos de commitment. |
| `SalesOrderConfirmed` | La decisión comercial se vuelve una obligación confirmada; el `Sales Order` nace `CONFIRMED`. |
| `AllocationExecuted` | La demanda comercial pasa a selección de lotes bajo autoridad de `Inventory Availability`. |
| `ReadyForDispatch` / `HandedOver` | La preparación interna cambia a handoff y ejecución de entrega. |
| `PartialDeliveryRecorded` | El resultado físico no cierra toda la obligación y exige continuación. |
| `DeliveryCompleted` | La entrega alcanza un resultado terminal respaldado por `POD`. |
| `ReceivablePosted` | Para `credit/net`, la obligación formal se registra al confirmar el `Sales Order`. |
| `PaymentConfirmed` | El movimiento de dinero pasa de reporte/proveedor a hecho confirmado y provider-neutral. |

No es obligatorio marcar todos; elige los que la captura pueda explicar
oralmente.

### Orden / posición sugerida

Traza una línea vertical atravesando los carriles en cada pivot y escribe una
frase de una línea. Conserva los `Pain Points` cerca del pivot relacionado.

### Ejemplo mínimo

```text
PurchaseRequestSubmitted
  | Pivotal Point: intent -> controlled commercial demand
SalesOrderConfirmed
  | Pivotal Point: commercial decision -> confirmed obligation
AllocationExecuted
  | Pivotal Point: demand -> physical lot authority
DeliveryCompleted
  | Pivotal Point: operational execution -> terminal physical evidence
```

### Fuente canónica

[Strategic DDD](../../01-shared/domain/strategic-ddd/README.md),
[Business ownership matrix](../../01-shared/domain/ownership/business-ownership-matrix.md),
y [Canonical workflows](../../01-shared/domain/processes/workflows.md).

### Qué NO hacer

- No tratar cada pivot como un `Bounded Context`.
- No afirmar que el tablero conserva una historia de descubrimiento que no está
  documentada.
- No crear un pivot técnico por cada API, módulo o transacción de base de datos.

### Criterio de finalización

Los marcadores hacen evidente por qué la historia cambia de fase y dejan
señales reutilizables para `Candidate Context Discovery`, sin anticipar sus
decisiones.

## Step 5 — `Commands`

### Objetivo

Mostrar la intención que provoca cada hecho y quién puede iniciarla. La forma
principal es `Actor` → `Command` → `Domain Event`.

### Qué se conserva del paso anterior

Se conserva todo el tablero, incluyendo `Pain Points` y `Pivotal Points`.

### Qué se agrega en este paso

`Actor` y `Command` para los eventos seleccionados. Los comandos deben estar
en imperativo; los eventos permanecen como hechos en pasado.

### Elementos visuales

`Actor`, `Command`, `Domain Event` y sus conectores.

### Datos de Nexa a colocar

Usa únicamente actores y comandos del catálogo compartido y de los canvases:

| Actor | Command | Domain Event |
|---|---|---|
| `Customer Buyer` | `SubmitPurchaseRequest` | `PurchaseRequestSubmitted` |
| `Customer Buyer` | `AcceptBuyerChange` | `BuyerChangeAccepted` |
| `Sales Representative` | `ProposeMaterialChange` | `MaterialChangeProposed` |
| `Sales Representative` | `ConfirmSalesOrder` | `SalesOrderConfirmed` |
| `Warehouse Operator` | `ReceiveStock` | `StockReceived` |
| `Warehouse Operator` | `CompletePicking` | `PickingCompleted` |
| `Dispatch Coordinator` | `RecordDispatchHandoff` | `DispatchHandoffRecorded` |
| `Driver / Delivery Operator` | `RecordDeliveryOutcome` | `DeliveryAttempted` |
| `Driver / Delivery Operator` | `CapturePOD` | `PODRecorded` |
| `Customer Buyer` | `ReportPayment` | `PaymentReported` |
| `Business Operations Manager` | `RecordFinancialAdjustment` | `FinancialAdjustmentRecorded` |
| `Payment Provider` | `ConfirmProviderPayment` | `PaymentConfirmed` |

`ConfirmDirectOrderHandler` existe como design aid de aplicación para el
camino directo. No se debe convertir automáticamente el nombre del handler en
un nuevo contrato de dominio; mostrar `DIRECT_ORDER` como variante solo si la
explicación usa el comando canónico disponible.

### Orden / posición sugerida

Pon el `Actor` a la izquierda, el `Command` en el centro y el evento que
resulta a la derecha. Para comandos del sistema, rotula el participante como
`SYSTEM` solo cuando el hecho sea realmente disparado por una política o un
worker; no uses `Controller`, `REST API`, `PostgreSQL` o `Spring Service`.

### Ejemplo mínimo

```text
Customer Buyer
  -> SubmitPurchaseRequest
  -> PurchaseRequestSubmitted
```

### Fuente canónica

[Shared actors](../../01-shared/product/actors.md),
[BC-04 Sales Commitment](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md),
[BC-06 Fulfillment & Delivery](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md),
y [BC-08 Payments](../../01-shared/domain/bounded-contexts/BC-08-payments/README.md).

### Qué NO hacer

- No traducir `SubmitPurchaseRequest` a un identificador nuevo.
- No usar un evento como si fuera un comando.
- No atribuir `SalesOrderConfirmed` a `Payment Provider` si la regla de pago no
  lo establece.
- No agregar actores técnicos.

### Criterio de finalización

Las conexiones Actor → Command → Event explican la causalidad de los eventos
principales y hacen visibles los responsables de la historia.

## Step 6 — `Policies`

### Objetivo

Capturar reacciones de negocio: un hecho ocurrido activa una regla y una
acción posterior. La forma visual es `Domain Event` → `Policy` → `Command`.

### Qué se conserva del paso anterior

Se conserva el mismo tablero con todos sus conectores, hotspots y pivots.

### Qué se agrega en este paso

Notas `Policy` concisas, distinguiendo reacciones síncronas dentro de una
decisión atómica de publicaciones asíncronas posteriores.

### Elementos visuales

`Policy`, `Domain Event`, `Command` y conectores de reacción.

### Datos de Nexa a colocar

| Hecho | `Policy` que se puede escribir | Command posterior | Naturaleza |
|---|---|---|---|
| `PurchaseRequestSubmitted` | `When a PR is submitted, establish the required commitment and applicable credit protection atomically` | `EstablishCreditReservation` / decisión de commitment | síncrona; no esperar un evento para proteger stock |
| `SalesOrderConfirmed` | `When a confirmed SO has an executable obligation, plan fulfillment` | `PlanFulfillment` | reacción de ejecución |
| `AllocationExecuted` | `When physical allocation is available, prepare fulfillment for the allocated quantity` | `PlanFulfillment` | contrato entre ownership y ejecución |
| `PartialDeliveryRecorded` | `When delivery is partial, preserve the remaining obligation and create one continuation` | `CreateContinuation` | regla explícita de partial delivery |
| `SalesOrderConfirmed` | `For credit/net terms, post the receivable without double counting the reservation` | `ConvertReservationToReceivable` | regla financiera de `BC-07` |
| `PaymentConfirmed` | `When a payment is confirmed, apply its financial effect idempotently` | `ApplyPayment` | reacción de `BC-07` |
| `DeliveryCompleted` | `When immutable delivery evidence exists, request the appropriate document` | `RequestDocument` | downstream, no cambio del source fact |
| `NotificationDeliveryFailed` | `Retry delivery and expose terminal failure without changing source state` | `RetryNotification` | entrega asíncrona |

La primera fila no representa un proceso asíncrono que cree el commitment más
tarde: la protección comercial, de inventario y crédito es una frontera lógica
atómica. La nota de policy sirve para explicar la regla al profesor.

### Orden / posición sugerida

Coloca la policy entre el evento que la activa y el comando que propone. Usa
un color consistente y una nota pequeña `SYNC` o `ASYNC` para no esconder la
semántica de consistencia.

### Ejemplo mínimo

```text
PartialDeliveryRecorded
  -> When delivery is partial, create continuation for remaining obligation
  -> CreateContinuation
  -> ContinuationDeliveryCreated
```

### Fuente canónica

[Business rules](../../01-shared/domain/business-rules/README.md),
[EventStorming baseline](../../01-shared/domain/processes/eventstorming.md),
[BC-07 Credit & Receivables](../../01-shared/domain/bounded-contexts/BC-07-credit-receivables/README.md),
y [BC-10 Notifications](../../01-shared/domain/bounded-contexts/BC-10-notifications/README.md).

### Qué NO hacer

- No convertir cada invariant estático en una policy de reacción.
- No afirmar que los eventos publicados crean la consistencia que ya debe estar
  protegida dentro de la transacción fuente.
- No hacer que la falla de email revierta `DeliveryCompleted`.
- No inventar una regla de límite universal de intentos de entrega.

### Criterio de finalización

Las policies explican reacciones de negocio observables y distinguen con una
nota clara lo síncrono, lo asíncrono y lo que solo es una proyección.

## Step 7 — `Read Models`

### Objetivo

Mostrar qué información necesita un actor o una policy para decidir y emitir un
`Command`. Un `Read Model` es información útil para consulta, no una tabla.

### Qué se conserva del paso anterior

Se conserva el tablero enriquecido hasta `Policies`; no se reemplazan los
eventos por consultas.

### Qué se agrega en este paso

Read models próximos a los comandos y decisiones que los consumen. Los nombres
abajo son proyecciones de diagramación basadas en conceptos canónicos; no
crean nuevos aggregates ni contratos REST.

### Elementos visuales

`Read Model` conectado al `Actor`, `Policy` o `Command` que lo necesita.

### Datos de Nexa a colocar

| `Read Model` para el tablero | Consumidor | Qué permite decidir | Estado |
|---|---|---|---|
| `Authorized Buyer Relationship and Customer Account` | `Customer Buyer` / `SubmitPurchaseRequest` | si existe relación autorizada y contexto de cuenta | proyección de conceptos canónicos |
| `Resolved Offer Snapshot` | `Customer Buyer` / `SubmitPurchaseRequest` | SKU, precio, terms, promotion y requisito de cold-chain | proyección de BC-03 |
| `Sellable Availability by SKU + Warehouse` | Sales / commitment decision | si existe disponibilidad utilizable sin seleccionar lotes todavía | concepto autoritativo de BC-05 proyectado |
| `Purchase Request Details and Revision` | `Sales Representative` | revisar cambios, consentimiento y expiración | proyección de BC-04 |
| `Available Credit` | Sales / credit decision | evaluar exposición con la fórmula canónica | concepto autoritativo de BC-07 proyectado |
| `Sales Order Remaining Quantities` | fulfillment / delivery | qué obligación sigue abierta | proyección de Sales Commitment |
| `Delivery and POD Timeline` | `Customer Buyer` | distinguir intentos, partial delivery, continuation y evidencia | proyección autorizada de BC-06/BC-11 |
| `Authorized Business Documents` | `Customer Buyer` | consultar documentos emitidos e inmutables | proyección de BC-09 |

### Orden / posición sugerida

Coloca el read model inmediatamente antes del `Command` o de la `Policy` que
lo consulta. Haz visible que la información puede ser una proyección y que el
owner de la verdad no cambia.

### Ejemplo mínimo

```text
Sellable Availability by SKU + Warehouse
  -> SubmitPurchaseRequest
  -> PurchaseRequestSubmitted
```

La etiqueta no significa que el Buyer elija un Warehouse/Lot: el commitment es
Warehouse-neutral y la autoridad de allocation se ejerce después.

### Fuente canónica

[Ubiquitous Language](../../01-shared/domain/ubiquitous-language/glossary.md),
[Business ownership matrix](../../01-shared/domain/ownership/business-ownership-matrix.md),
[Domain message flows](../../01-shared/domain/processes/message-flows.md),
y [API target query rules](../../01-shared/architecture/api-architecture-target.md).

### Qué NO hacer

- No rotular `inventory_reservation` o una tabla como read model.
- No exponer una entidad completa sin propósito de decisión.
- No convertir una proyección Mobile en autoridad de precio, stock, payment o
  delivery.
- No esconder la diferencia entre `Sellable Availability`, `Inventory
  Reservation` y `Physical Allocation`.

### Criterio de finalización

Cada decisión importante tiene información legible antes de su comando y el
tablero no confunde consulta con ownership o persistencia.

## Step 8 — `External Systems`

### Objetivo

Identificar qué sistemas externos participan realmente en la historia modelada.
La pregunta es: ¿qué sistema está fuera del límite de Nexa y aporta una
interacción de negocio o integración relevante?

### Qué se conserva del paso anterior

Se conserva el mismo tablero y se añaden sistemas solo en los puntos donde
intervienen; no se redibuja Nexa como una caja técnica.

### Qué se agrega en este paso

Los sistemas externos abstractos aceptados por C4 y la arquitectura de
integraciones.

### Elementos visuales

`External System` y la relación con el `Command`, `Domain Event` o `Policy`
correspondiente.

### Datos de Nexa a colocar

| `External System` | Interacción en la historia | Fuente |
|---|---|---|
| `Payment Provider` | report/callback de pago; `Payment` traduce el lenguaje externo mediante ACL | [C4](../../01-shared/architecture/c4/README.md) |
| `Email Delivery Service` | envío, retry y terminal failure de `Notification` | [C4](../../01-shared/architecture/c4/README.md) |
| `Maps & Geolocation Provider` | apoyo a ruta/geolocalización durante `Delivery`, sujeto a las decisiones de provider | [C4](../../01-shared/architecture/c4/README.md) |

El nombre `Stripe` puede aparecer como dirección de proveedor V1 detrás de
`Payment Provider`, pero no debe transformarse en un `Stripe Bounded Context`.
Las decisiones productivas de proveedor siguen siendo abiertas.

### Orden / posición sugerida

Coloca cada sistema en el borde del tablero junto al tramo de integración:
`Payment Provider` cerca de `PaymentReported`/`PaymentConfirmed`, email cerca
de `NotificationDeliveryFailed` y maps cerca de la ejecución de `Delivery`.

### Ejemplo mínimo

```text
Payment Provider
  -> ConfirmProviderPayment
  -> PaymentConfirmed
```

La relación representa verificación/traducción de un callback externo; la
autoridad del hecho `Payment` sigue en `BC-08 Payments`.

### Fuente canónica

[Integration architecture](../../01-shared/architecture/integrations/README.md)
y [C4 System Context](../../01-shared/architecture/c4/README.md).

### Qué NO hacer

- No dibujar `PostgreSQL`, `Spring Boot`, `Angular`, `Docker` o `Nexa API` como
  sistemas externos del flujo de negocio.
- No tratar `Object Storage` como integración de negocio salvo que el alcance
  de la captura lo justifique explícitamente.
- No inventar proveedor, SLA, credencial o decisión cloud.

### Criterio de finalización

Se entiende qué integración externa participa, en qué punto y con qué
traducción, sin confundir sistema externo, adapter interno y Bounded Context.

## Step 9 — `Aggregates`

### Objetivo

Identificar límites de consistencia/modelo responsables de procesar comandos y
proteger invariants. La pregunta es: ¿qué modelo debe permanecer coherente?

### Qué se conserva del paso anterior

Se conserva todo el tablero hasta `External Systems`. Los aggregates se
dibujan sobre las secuencias existentes; no se reemplaza un flujo por un ERD.

### Qué se agrega en este paso

Contornos de aggregates con la etiqueta de certeza. Usa `ACCEPTED TARGET DESIGN
AID` para los nombres que ya están en los canvases tácticos y
`DIAGRAMMING CANDIDATE` para una proyección que solo se necesita para la
captura.

### Elementos visuales

`Aggregate` como contorno discontinuo que agrupa comandos, invariants y
eventos relacionados. No incluir tablas, repositorios o packages como si
fueran aggregates.

### Datos de Nexa a colocar

Para la historia representativa, usa los siguientes aggregates aceptados como
design aid táctico:

| `Aggregate Root` | Contexto | Qué protege en el tablero | Clasificación |
|---|---|---|---|
| `PurchaseRequest` | `BC-04 Sales Commitment` | lifecycle de PR, expiry, revisión y consentimiento | `ACCEPTED TARGET DESIGN AID` |
| `CommercialCommitment` | `BC-04 Sales Commitment` | demanda Warehouse-neutral y ownership transfer | `ACCEPTED TARGET DESIGN AID` |
| `SalesOrder` | `BC-04 Sales Commitment` | obligación confirmada, snapshot y cancel/replacement | `ACCEPTED TARGET DESIGN AID` |
| `InventoryReservation` | `BC-05 Inventory Availability` | backing de demanda sin seleccionar lotes | `ACCEPTED TARGET DESIGN AID` |
| `PhysicalAllocation` | `BC-05 Inventory Availability` | selección autorizada de Inventory Lot(s) | `ACCEPTED TARGET DESIGN AID` |
| `Fulfillment` | `BC-06 Fulfillment & Delivery` | ejecución de pick/pack/stage | `ACCEPTED TARGET DESIGN AID` |
| `Delivery` | `BC-06 Fulfillment & Delivery` | attempts, partial result, continuation y POD | `ACCEPTED TARGET DESIGN AID` |
| `Receivable` | `BC-07 Credit & Receivables` | obligación formal y aplicaciones/correcciones | `ACCEPTED TARGET DESIGN AID` |
| `Payment` | `BC-08 Payments` | reporte, confirmación, refund y reconciliation | `ACCEPTED TARGET DESIGN AID` |

Si el espacio no permite todos, prioriza `PurchaseRequest`,
`CommercialCommitment`, `SalesOrder`, `InventoryReservation`,
`PhysicalAllocation`, `Fulfillment` y `Delivery`; deja una nota de que
`Receivable` y `Payment` pertenecen a la rama financiera.

### Orden / posición sugerida

Dibuja el contorno rodeando los comandos y eventos que el aggregate coordina.
No cruces un contorno para atribuir a un context la escritura de otro. Las
relaciones entre aggregates/contextos usan IDs, snapshots y contratos.

### Ejemplo mínimo

```text
Aggregate: CommercialCommitment
  SubmitPurchaseRequest -> PurchaseRequestSubmitted
  establishes SKU + quantity demand
  does not choose Warehouse or Inventory Lot
```

### Fuente canónica

[Canonical Bounded Contexts](../../01-shared/domain/bounded-contexts/README.md),
[BC-04 tactical design aid](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md),
[BC-05 tactical design aid](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/README.md),
[BC-06 tactical design aid](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md),
[BC-07 tactical design aid](../../01-shared/domain/bounded-contexts/BC-07-credit-receivables/README.md),
y [BC-08 tactical design aid](../../01-shared/domain/bounded-contexts/BC-08-payments/README.md).

### Qué NO hacer

- No derivar aggregates de entidades SQL, controladores o módulos Spring.
- No convertir cada `Bounded Context` en un solo aggregate.
- No colapsar `CommercialCommitment`, `InventoryReservation`,
  `PhysicalAllocation` y `Physical Stock`.
- No agregar un aggregate que el Blueprint no establezca; rotúlalo
  `DIAGRAMMING CANDIDATE` o marca `NOT ESTABLISHED / DO NOT INVENT`.

### Criterio de finalización

Los contornos explican qué reglas se protegen, tienen una fuente canónica y
mantienen separados los límites de consistencia de los límites estratégicos.

## Step 10 — `Bounded Contexts`

### Objetivo

Mostrar las hipótesis de límites semánticos que emergen al acumular eventos,
commands, policies, read models, sistemas y aggregates. La pregunta es:
¿dónde cambian el lenguaje, ownership o reglas?

### Qué se conserva del paso anterior

Se conserva el mismo tablero completo. Solo se añaden contornos grandes
rotulados; no se elimina la evidencia que llevó a ellos.

### Qué se agrega en este paso

Los boundaries candidatos del EventStorm, contrastados al final con el modelo
TARGET aceptado de exactamente 11 `Bounded Contexts`.

### Elementos visuales

`Bounded Context` con contorno grande, `Aggregate` dentro de su contexto,
`Domain Event` compartido mediante contratos y notas de ownership.

### Datos de Nexa a colocar

Si la captura muestra el estado TARGET aceptado, usa exactamente estos nombres
y no los traduzcas:

1. `BC-01 Tenant & Access Governance`
2. `BC-02 Customer & Buyer Relationships`
3. `BC-03 Catalog & Commercial Policy`
4. `BC-04 Sales Commitment`
5. `BC-05 Inventory Availability`
6. `BC-06 Fulfillment & Delivery`
7. `BC-07 Credit & Receivables`
8. `BC-08 Payments`
9. `BC-09 Business Documents`
10. `BC-10 Notifications`
11. `BC-11 Business Traceability`

Para la historia central, los contornos más visibles serán `BC-03` a `BC-08`,
`BC-09`, `BC-10` y `BC-11`; `BC-01` y `BC-02` pueden aparecer como contextos
upstream de autorización y relación. No inventes un `Cold Chain BC`, `Mobile
BC`, `Tracking BC`, `QR/POD BC` o `Finance BC`.

### Orden / posición sugerida

Rodea grupos cohesivos y marca la autoridad de cada uno. Por ejemplo,
`BC-04 Sales Commitment` publica el compromiso y `BC-05 Inventory Availability`
aporta la decisión de disponibilidad; `BC-06 Fulfillment & Delivery` ejecuta
la operación física. No dibujes una caja de base de datos compartida como
contexto.

### Ejemplo mínimo

```text
BC-04 Sales Commitment
  PurchaseRequest -> CommercialCommitment -> SalesOrder

BC-05 Inventory Availability
  SellableAvailability -> InventoryReservation -> PhysicalAllocation

BC-06 Fulfillment & Delivery
  Fulfillment -> Delivery -> POD
```

### Fuente canónica

[Strategic DDD](../../01-shared/domain/strategic-ddd/README.md),
[Canonical Bounded Contexts](../../01-shared/domain/bounded-contexts/README.md),
[Context Map](../../01-shared/domain/strategic-ddd/context-map.md),
y [Business ownership matrix](../../01-shared/domain/ownership/business-ownership-matrix.md).

### Qué NO hacer

- No presentar Step 10 como si los 11 contextos hubieran sido conocidos desde
  Step 1.
- No inferir contextos desde Java, Spring, PostgreSQL, REST, Angular, Mobile o
  Docker.
- No fusionar `BC-10 Notifications` con `BC-11 Business Traceability`.
- No convertir esta captura en `Candidate Context Discovery`.

### Criterio de finalización

La décima captura muestra claramente cómo los hechos y los aggregates sugieren
fronteras semánticas y, a la vez, identifica que la aceptación/refinamiento de
esas fronteras pertenece al artefacto separado de `Candidate Context Discovery`.

---

## Continuación hacia Strategic-Level DDD

Estas diez capturas son el artefacto `Needfinding / Big Picture EventStorming`.
No deben numerarse como Steps 11–14. La continuación académica es:

1. `Candidate Context Discovery`: desafiar las hipótesis de Step 10 usando
   `start-with-value`, `start-with-simple` y `look-for-pivotal-events`. El
   Blueprint conserva el resultado aceptado y sus decisiones, pero no se debe
   fabricar una historia intermedia no documentada.
2. `Domain Message Flows Modeling`: usar [Domain Storytelling / Domain
   Stories](../../01-shared/domain/processes/domain-stories.md) y [Domain
   Message Flows](../../01-shared/domain/processes/message-flows.md), no
   sustituirlos por una secuencia de controllers o endpoints.
3. `Bounded Context Canvases`: usar el [índice canónico de los 11 canvases](../../01-shared/domain/bounded-contexts/README.md)
   y el proceso académico de overview, reglas/lenguaje, capabilities,
   layering, dependencies y critique.
4. `Context Mapping`: explicar únicamente las relaciones verificadas en el
   [Context Map](../../01-shared/domain/strategic-ddd/context-map.md),
   incluyendo ACL, Conformist, Customer/Supplier o Shared Kernel solo cuando
   la relación real lo soporte. No forzar un patrón para llenar una flecha.

El [Ubiquitous Language canónico](../../01-shared/domain/ubiquitous-language/README.md)
se usa aparte bajo Needfinding. Esta guía no crea un segundo glossary.

## Matriz de producción del tablero

Esta tabla es un índice para dibujar, no una segunda fuente de verdad. Cada
fila debe volver a su fuente antes de la sesión.

| Board element | Canonical Nexa label | Type | Source | First appears in Step | Notes |
|---|---|---|---|---:|---|
| `CartDraftCreated` | `CartDraftCreated` | Domain Event | [EventStorming](../../01-shared/domain/processes/eventstorming.md) | 1 | Draft no crea commitment. |
| `PurchaseRequestSubmitted` | `PurchaseRequestSubmitted` | Domain Event | [EventStorming](../../01-shared/domain/processes/eventstorming.md) | 1 | Public contract: `.v1`. |
| `CommercialCommitmentEstablished` | `CommercialCommitmentEstablished` | Domain Event | [Published events](../../01-shared/domain/events/published-events.md) | 1 | Demand Warehouse-neutral. |
| `SalesOrderConfirmed` | `SalesOrderConfirmed` | Domain Event | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md) | 1 | SO nace `CONFIRMED`. |
| `AllocationExecuted` | `AllocationExecuted` | Domain Event | [BC-05](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/README.md) | 1 | Public contract: `PhysicalAllocationCreated.v1`. |
| `FulfillmentPlanned` | `FulfillmentPlanned` | Domain Event | [BC-06](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) | 1 | Inicia ejecución operativa. |
| `DeliveryCompleted` | `DeliveryCompleted` | Domain Event | [Published events](../../01-shared/domain/events/published-events.md) | 1 | Después de POD inmutable. |
| `PartialDeliveryRecorded` | `PartialDeliveryRecorded` | Domain Event | [EventStorming](../../01-shared/domain/processes/eventstorming.md) | 1 | Rama excepcional. |
| `ContinuationDeliveryCreated` | `ContinuationDeliveryCreated` | Domain Event | [Published events](../../01-shared/domain/events/published-events.md) | 1 | No es otro attempt. |
| `PaymentConfirmed` | `PaymentConfirmed` | Domain Event | [Published events](../../01-shared/domain/events/published-events.md) | 1 | Provider-neutral. |
| `ReceivablePosted` | `ReceivablePosted` | Domain Event | [Published events](../../01-shared/domain/events/published-events.md) | 1 | Credit/net, sin doble conteo. |
| `BusinessDocumentIssued` | `BusinessDocumentIssued` | Domain Event | [Published events](../../01-shared/domain/events/published-events.md) | 1 | Issued history inmutable. |
| `Customer Buyer` | `Customer Buyer` | Actor | [Actors](../../01-shared/product/actors.md) | 5 | Buyer Relationship autorizada. |
| `Sales Representative` | `Supplier Tenant: Sales Representative` | Actor | [Actors](../../01-shared/product/actors.md) | 5 | Assisted commercial work. |
| `Warehouse Operator` | `Supplier Tenant: Warehouse Operator` | Actor | [Actors](../../01-shared/product/actors.md) | 5 | Receiving and fulfillment. |
| `Dispatch Coordinator` | `Supplier Tenant: Dispatch Coordinator` | Actor | [Actors](../../01-shared/product/actors.md) | 5 | Dispatch and handoff. |
| `Driver / Delivery Operator` | `Supplier Tenant: Driver / Delivery Operator` | Actor | [Actors](../../01-shared/product/actors.md) | 5 | Attempt and POD. |
| `SubmitPurchaseRequest` | `SubmitPurchaseRequest` | Command | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md) | 5 | Imperative intention. |
| `ConfirmSalesOrder` | `ConfirmSalesOrder` | Command | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md) | 5 | No Draft SO. |
| `RecordDeliveryOutcome` | `RecordDeliveryOutcome` | Command | [BC-06](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) | 5 | Can yield partial/failure. |
| `ReportPayment` | `ReportPayment` | Command | [BC-08](../../01-shared/domain/bounded-contexts/BC-08-payments/README.md) | 5 | Report != Confirmed. |
| `CreateContinuation` | `CreateContinuation` | Command | [BC-06](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) | 6 | Triggered by partial result. |
| `ApplyPayment` | `ApplyPayment` | Command | [BC-07](../../01-shared/domain/bounded-contexts/BC-07-credit-receivables/README.md) | 6 | Idempotent application. |
| `CommitmentAcceptancePolicy` | `CommitmentAcceptancePolicy` | Policy | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md) | 6 | Domain policy/design aid. |
| `PartialDeliveryPolicy` | `PartialDeliveryPolicy` | Policy | [BC-06](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) | 6 | Continuation semantics. |
| `Available Credit` | `Available Credit` | Read Model | [Glossary](../../01-shared/domain/ubiquitous-language/glossary.md) | 7 | Decision information, not table. |
| `Sellable Availability by SKU + Warehouse` | `Sellable Availability` | Read Model | [BC-05](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/README.md) | 7 | Physical authority projected. |
| `Delivery and POD Timeline` | `Business Traceability` projection | Read Model | [BC-11](../../01-shared/domain/bounded-contexts/BC-11-business-traceability/README.md) | 7 | Authorized projection. |
| `Payment Provider` | `Payment Provider` | External System | [C4](../../01-shared/architecture/c4/README.md) | 8 | Abstract external boundary. |
| `Email Delivery Service` | `Email Delivery Service` | External System | [C4](../../01-shared/architecture/c4/README.md) | 8 | Retryable delivery. |
| `Maps & Geolocation Provider` | `Maps & Geolocation Provider` | External System | [C4](../../01-shared/architecture/c4/README.md) | 8 | Provider decision remains open. |
| `PurchaseRequest` | `PurchaseRequest` | Aggregate | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md) | 9 | Accepted TARGET design aid. |
| `CommercialCommitment` | `CommercialCommitment` | Aggregate | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md) | 9 | No Warehouse/Lot selection. |
| `SalesOrder` | `SalesOrder` | Aggregate | [BC-04](../../01-shared/domain/bounded-contexts/BC-04-sales-commitment/README.md) | 9 | Confirmed obligation. |
| `InventoryReservation` | `InventoryReservation` | Aggregate | [BC-05](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/README.md) | 9 | Backing, not allocation. |
| `PhysicalAllocation` | `PhysicalAllocation` | Aggregate | [BC-05](../../01-shared/domain/bounded-contexts/BC-05-inventory-availability/README.md) | 9 | Selects lot(s). |
| `Fulfillment` | `Fulfillment` | Aggregate | [BC-06](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) | 9 | Pick/pack/stage. |
| `Delivery` | `Delivery` | Aggregate | [BC-06](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) | 9 | Attempts, POD, continuation. |
| `BC-04 Sales Commitment` | `BC-04 Sales Commitment` | Bounded Context | [Strategic DDD](../../01-shared/domain/strategic-ddd/README.md) | 10 | Core ownership. |
| `BC-05 Inventory Availability` | `BC-05 Inventory Availability` | Bounded Context | [Strategic DDD](../../01-shared/domain/strategic-ddd/README.md) | 10 | Core physical truth. |
| `BC-06 Fulfillment & Delivery` | `BC-06 Fulfillment & Delivery` | Bounded Context | [Strategic DDD](../../01-shared/domain/strategic-ddd/README.md) | 10 | Core execution/evidence. |
| `BC-11 Business Traceability` | `BC-11 Business Traceability` | Bounded Context | [Strategic DDD](../../01-shared/domain/strategic-ddd/README.md) | 10 | Separate from Notifications. |
| `Insufficient availability` | availability protection hotspot | Pain Point | [Current decisions](../../01-shared/product/current-decisions.md) | 3 | Explain commitment/backing/allocation distinction. |
| `Partial delivery` | remaining obligation hotspot | Pain Point | [Domain Stories](../../01-shared/domain/processes/domain-stories.md) | 3 | Continuation is explicit. |
| `Commercial intent -> confirmed obligation` | `PurchaseRequestSubmitted` / `SalesOrderConfirmed` | Pivotal Point | [Workflows](../../01-shared/domain/processes/workflows.md) | 4 | Do not equate with BC boundary. |
| `Physical execution -> terminal evidence` | `DeliveryCompleted` | Pivotal Point | [BC-06](../../01-shared/domain/bounded-contexts/BC-06-fulfillment-delivery/README.md) | 4 | POD remains immutable. |

## Checklist de revisión antes de entregar las capturas

- [ ] Hay exactamente diez capturas del mismo tablero.
- [ ] Los nombres son exactamente: `Unstructured Exploration`, `Timelines`,
  `Pain Points`, `Pivotal Points`, `Commands`, `Policies`, `Read Models`,
  `External Systems`, `Aggregates`, `Bounded Contexts`.
- [ ] Step 1 tiene eventos sin estructura impuesta; Step 2 añade cronología;
  Step 3 añade hotspots; Step 4 añade pivots; Steps 5–10 añaden sus capas.
- [ ] Cada evento de la historia está respaldado por Blueprint o está marcado
  `NOT ESTABLISHED / DO NOT INVENT`.
- [ ] Se conservan las ramas `APPROVAL_REQUIRED`, `DIRECT_ORDER`, financieras,
  shortage y partial delivery cuando sean necesarias para la explicación.
- [ ] No se derivó ningún `Bounded Context` desde implementación.
- [ ] Se mantiene la diferencia entre `Domain Event`, `Published Integration
  Event` y `Business Traceability` fact.
- [ ] Step 10 no reemplaza `Candidate Context Discovery`.
- [ ] `Domain Storytelling`, los 11 canvases y `Context Mapping` quedan como
  entregables separados.
- [ ] Las capturas no afirman que Mobile, IoT, SUNAT o proveedores productivos
  sean capacidades V1 implementadas.
- [ ] Los enlaces relativos de esta guía resuelven en el checkout que se vaya a
  entregar.

## Validación reproducible

Desde la raíz de Blueprint, ejecutar:

```bash
git diff --check
bash tooling/scripts/validate-blueprint.sh
```

El segundo comando debe conservar sus gates de links, metadata, publication
boundary, secretos, Structurizr, equivalencia semántica y cobertura táctica.
Si falla por Docker o por cambios concurrentes ajenos a esta guía, reportar el
resultado específico y no presentarlo como una falla semántica del tablero.

## Evidencia de verificación de esta guía

La identidad remota verificada fue `https://github.com/nexa-suite/blueprint.git`.
La fuente remota consultada después de `git fetch origin` fue
`origin/main` en `1daf6fa` (merge de `docs/tactical-ddd-data-models`). El
checkout local tenía cambios concurrentes no relacionados y por eso esta guía
no modifica los documentos existentes; sus referencias apuntan a los paths
canónicos del árbol Blueprint.

Si una futura fuente canónica cambia un nombre o una regla, actualiza primero
la fuente de `01-shared/` y luego esta proyección; no corrijas el dominio desde
la captura académica.
