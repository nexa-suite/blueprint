---
status: accepted
maturity: FROZEN
scope: cross-cutting
owner: product
last-reviewed: 2026-10-01
---

# Operations Mobile Owner decision closure — 2026-10-01

Provenance: explicit written Product/Owner responses supplied on 2026-10-01. These accepted decisions supersede conflicting earlier Product statements. They close Product meaning, not implementation, client acceptance, provider/device validation or production readiness. The 11 Bounded Contexts, ownership, server authority, Delivery outcome, Buyer Receipt, Inventory and financial semantics remain unchanged.

## Additional accepted bounded overview — MOB-US-004

The initial operational view is the authorized prepared-Fulfillment projection by Warehouse, with Tenant/Workspace, version, fact timestamp and limitations visible. It includes no totals for other processes. This coverage was explicitly accepted by Owner on 2026-10-01.

## 1. US-005 — EXCEPCIONES

Owner decision:

Una Operational Exception existe cuando un hecho:
- impide continuar normalmente un trabajo;
- introduce un riesgo material sobre el resultado;
- o requiere intervención/autorización adicional.

No crear Operational Exceptions para simples eventos informativos.

SEVERIDADES V1:

1. WARNING
Anomalía que no obliga a detener el proceso si todavía puede continuar de forma segura.

Ejemplos:
- discrepancy menor documentable;
- instrucción incompleta;
- demora;
- diferencia no bloqueante.

2. BLOCKING
La operación no puede continuar hasta resolver la condición.

Ejemplos:
- lote incorrecto;
- shortage;
- stock en HOLD;
- stock expirado/no vendible;
- delivery no ejecutable;
- picking discrepancy que impide continuar.

3. CRITICAL
Existe riesgo material grave, de integridad del producto, cold-chain o impacto empresarial significativo.

Ejemplos:
- temperature excursion relevante;
- producto potencialmente comprometido;
- incidente operacional severo;
- excepción de alto impacto que requiere BOM.

INFO no es severidad de Operational Exception.
Los hechos informativos pertenecen a Notification/Timeline/Traceability según corresponda.

HECHOS CANDIDATOS:

WAREHOUSE / INVENTORY
- Receiving discrepancy.
- SKU/Lot inesperado.
- Quantity mismatch.
- Expired/non-sellable Lot.
- FEFO conflict.
- Inventory HOLD/Quarantine.
- Stock shortage.
- Warehouse Transfer discrepancy.
- Temperature excursion.

FULFILLMENT
- Picking discrepancy.
- Allocated stock unavailable.
- Quantity shortage.
- Damage.
- Inability to complete preparation.

DISPATCH / DELIVERY
- Assignment issue.
- Customer unavailable.
- Access problem.
- Partial Delivery.
- Buyer/customer rejection.
- Damaged goods.
- Cold-chain incident.
- Delivery cannot continue.

RESPONSIBILITY:

Cualquier actor autorizado dentro del proceso puede tomar una excepción de su ámbito como responsable operativo.

Ejemplos:
- Warehouse Operator → Warehouse/Fulfillment exceptions.
- Dispatch Coordinator → Dispatch/Delivery coordination exceptions.
- Driver → Delivery execution exceptions que pueda resolver dentro de su autoridad.
- BOM → cross-functional exceptions y excepciones que requieren autoridad superior.

BOM puede reasignar Operational Exceptions entre responsables autorizados.

Company Owner interviene únicamente cuando la excepción realmente requiere su autoridad empresarial excepcional.

IMPORTANTE:
Detectar/reportar una excepción NO implica autoridad para resolverla.

Ejemplo:
Driver reports temperature excursion
!=
Driver authorizes RELEASE.

"ATENDER" NO significa solamente abrir una pantalla.

Atender implica lifecycle:

OPEN
→ CLAIMED / ASSIGNED
→ UNDER_REVIEW / IN_PROGRESS
→ RESOLVED
→ CLOSED

Debe conservarse:
- reporter/detector;
- responsible actor;
- timestamps;
- type;
- severity;
- affected business object;
- resolution/outcome;
- reason;
- evidence cuando aplique.

BLOCKING y CRITICAL requieren reason explícito para cierre.

WARNING puede cerrarse sin texto libre cuando el sistema ya conserva un resolution/reason code suficientemente explícito.

## 2. US-029 — UBICACIÓN

Owner decision:

DRIVER / DELIVERY OPERATOR:

El Driver debe mantener LOCATION CONTINUA OBLIGATORIA durante TODA SU JORNADA OPERATIVA cuando esté desempeñándose como Driver mediante Nexa Operations Mobile.

Esto SUPERCEDES cualquier decisión anterior que prohibiera permanent/continuous Driver location durante la jornada.

No debe reinterpretarse como seguimiento 24/7 fuera del trabajo.

La obligación aplica únicamente:
- mientras el actor se encuentra en jornada operativa como Driver;
- mientras utiliza Operations Mobile como herramienta operacional;
- dentro del Tenant/Workspace correspondiente.

Si el Driver desactiva/revoca el permiso requerido durante su jornada:
- Nexa debe detectar que ya no puede cumplir la política operacional;
- mostrar estado/error correspondiente;
- registrar la situación;
- y puede impedir continuar funciones Driver que requieran ubicación hasta restaurar el permiso.

No convertir esto en surveillance fuera de jornada.

SALES:

Sales puede compartir ubicación de forma VOLUNTARIA para casos concretos, por ejemplo una visita comercial.

Sales NO está sujeto al requisito continuo del Driver.

BUYER:

Cuando una Delivery correspondiente al Buyer:

READY_FOR_DISPATCH / DISPATCHED
y efectivamente sale a despacho,

Buyer Mobile debe poder visualizar en un MAPA EN VIVO el progreso/localización del Driver correspondiente a SU Delivery.

El Buyer:
- solo puede ver tracking relacionado con su propia Customer/Buyer Relationship;
- nunca puede ver otras Deliveries;
- nunca puede ver otros Drivers;
- nunca obtiene acceso general al workforce.

Cuando la Delivery termina/cancela y deja de existir necesidad operacional:
- el live tracking para Buyer termina.

VISIBILIDAD INTERNA:

Pueden visualizar la ubicación operacional del Driver cuando la responsabilidad lo requiera:
- Dispatch Coordinator;
- BOM;
- Driver sobre su propio contexto.

Warehouse, Sales, Tenant Administrator y otros roles NO reciben ubicación simplemente por existir.

CONSENT / POLICY:

Para Driver no es una acción voluntaria por Delivery.
Es una condición operacional conocida y aceptada para desempeñar el rol Driver en Nexa durante la jornada.

El sistema operativo igualmente administra el permiso técnico de ubicación.

Para Sales, compartir ubicación sí es voluntario/contextual.

RETENTION:

DIFERIR la duración exacta de retención de coordenadas/historial de ubicación a Privacy/Security/Data Governance.

Product sí congela:
- no conservar ubicación indefinidamente;
- separar ubicación operativa de Business Traceability;
- conservar únicamente el período necesario para operación, evidencia, seguridad y obligaciones legítimas;
- no reutilizar location data para finalidades no relacionadas sin una decisión posterior explícita.

## 3. US-030 — Communication scope, corrected by Owner

The direct Owner clarification on 2026-10-01 supersedes the earlier written Driver/Buyer chat proposal: **Nexa in-app chat is ONLY Sales ↔ Buyer** within an authorized Customer/Buyer relationship and current Tenant/Workspace. No Driver ↔ Buyer chat or other participant pairing is authorized by this decision.

This is contextual business communication, not a social messenger. Preserve thread/message ID, sender identity, authorized recipient/context, Tenant/Workspace, business reference, body, timestamp, applicable delivery/read states, permitted attachments and explicit edit/correction policy. Never silently erase/rewrite relevant business history. No personal phone disclosure is needed to enable chat. WhatsApp and SMS remain excluded from this V1 Mobile communication scope; direct telephone integration needs a separate decision.

Chat does not change Delivery result, Buyer Receipt, Purchase Request, Sales Order, stock, Payment or Credit. An instruction discussed in chat requires an explicit authorized business command to become active.

MOB-US-030 Driver-to-Buyer contact and MOB-US-046 Buyer-to-Driver contact have no authorized chat/channel in this V1 scope. They remain unavailable/deferred; Sales/Buyer chat must not be exposed as a Driver capability.

## 4. US-059 — CARGAS Y PARADAS

Owner decision:

V1 utilizará agrupación deliberadamente simple.

No implementar todavía advanced fleet optimization ni automatic route optimization.

Dos o más Deliveries son candidatas a formar parte de la misma carga/ruta cuando:

- tienen el mismo origin Warehouse;
- están READY_FOR_DISPATCH;
- sus delivery windows son compatibles;
- pertenecen a una zona/ruta geográficamente razonable;
- requieren el mismo rango/condición de temperatura V1;
- sus handling requirements son compatibles;
- la capacidad de transporte es suficiente;
- ninguna posee una restricción que exija transporte separado.

NO necesitan pertenecer al mismo Customer.

Una carga puede contener:

Warehouse
→ Customer A
→ Customer B
→ Customer C

TEMPERATURE:

V1 NO mezcla Deliveries con diferentes temperature ranges dentro de una misma carga.

Aunque un vehículo futuro pudiera soportar compartments diferentes, esa complejidad se DIFERIRÁ.

DRIVER:

La carga tendrá un Driver asignado para su ejecución.

"Mismo Driver" no se usa como condición previa para descubrir compatibilidad antes de realizar la asignación.

STOP ORDER:

Dispatch Coordinator define el orden de las paradas.

V1:
manual / semi-assisted ordering.

No existe obligación de route optimizer automático.

RESTRICTIONS THAT BLOCK GROUPING:

- different origin Warehouse;
- incompatible delivery windows;
- insufficient vehicle/load capacity;
- different temperature ranges;
- incompatible handling requirements;
- Delivery BLOCKED;
- unresolved HOLD/cold-chain restriction;
- dedicated-transport requirement;
- explicit Customer/contract restriction;
- cualquier business constraint que haga inválida la agrupación.

REASSIGNMENT:

Una Delivery puede moverse entre cargas/rutas mientras permanezca antes del physical handoff y su estado lo permita.

Una vez realizado el handoff al Driver, Dispatch todavía puede reordenar paradas cuando exista necesidad operacional.

El cambio debe conservar:
- actor;
- timestamp;
- previous order;
- new order;
- reason.

## 5. US-060 — TRANSPORTISTA

Owner decision:

V1:

El Driver / Delivery Operator que usa Nexa Operations Mobile debe ser:

Human Identity
+
authorized Workforce Membership
+
appropriate Driver/Delivery capability

dentro del Tenant/Workspace correspondiente.

Operations Mobile no será una aplicación abierta a cualquier transportista externo.

EXTERNAL 3PL:

Una empresa puede físicamente trabajar con transportistas/3PL externos.

En V1:
- se puede registrar el transportista externo como referencia operacional;
- se puede registrar evidencia de handoff;
- pero no obtiene automáticamente acceso directo a Operations Mobile.

Un modelo formal Carrier/3PL con identity/access propio se DIFERIRÁ.

HANDOFF:

Dispatch prepara/ofrece la carga al Driver asignado.

El Driver debe revisar al menos:
- carga;
- Deliveries;
- cantidad/resumen relevante;
- restricciones/instrucciones críticas;
- condition/evidence cuando corresponda.

ACT OF RESPONSIBILITY:

Dispatch confirms handoff
+
Driver explicitly accepts load

→ Driver assumes operational responsibility.

Se requiere aceptación de AMBAS PARTES dentro de Nexa cuando ambas participan mediante Nexa.

No se necesita aceptación del Buyer en esta etapa.

Buyer Receipt ocurre posteriormente y es un hecho distinto.

LOAD ACCEPTANCE:

El Driver acepta la CARGA completa.

No necesita realizar una aceptación contractual individual de cada Delivery antes de iniciar, aunque debe poder revisar qué Deliveries contiene.

VEHICLE DATA:

Vehicle/plate data V1:
OPTIONAL / TENANT POLICY.

No hacerlo universalmente obligatorio.

Cuando el Tenant lo requiera puede registrarse:
- vehicle identifier;
- plate;
- other operational reference.

## 6. US-063 — INSTRUCCIONES

Owner decision:

Existen dos grupos conceptuales:

A. CUSTOMER DELIVERY INSTRUCTIONS

Pueden originarse desde:
- Buyer;
- authorized Customer contact;
- Sales registrando fielmente una instrucción comunicada por Customer/Buyer.

Ejemplos:
- deliver at reception;
- use loading dock B;
- call/use Nexa chat before arrival;
- entrance through specific access;
- alternate authorized recipient;
- unloading instruction.

Sales puede registrar una instrucción recibida externamente, pero debe quedar trazado:

recorded_by = Sales

y nunca aparentar que fue creada directamente por Buyer.

B. OPERATIONAL DISPATCH INSTRUCTIONS

Pueden crearlas/modificarlas:
- Dispatch Coordinator;
- BOM cuando corresponda.

Ejemplos:
- handoff requirement;
- special unloading instruction;
- route/operational note;
- access/safety requirement.

BUYER EDIT WINDOW:

Buyer puede modificar sus Delivery Instructions hasta que la Delivery alcance:

READY_FOR_DISPATCH.

Después de READY_FOR_DISPATCH:
- el Buyer no modifica directamente la instrucción operacional activa;
- debe coordinar el cambio mediante Nexa;
- Dispatch decide cómo incorporar el cambio de manera segura.

CHAT:

Decision 030 applies.

Nexa in-app chat is limited to Sales ↔ Buyer. Driver ↔ Buyer and other chat pairings are excluded; instruction coordination must respect that boundary.

Un mensaje de chat NO modifica automáticamente Delivery Instructions.

Debe existir una acción explícita que actualice la instrucción.

DRIVER VISIBILITY:

El Driver asignado solo puede ver los datos mínimos necesarios para ejecutar sus Deliveries:

- Customer/delivery destination;
- authorized recipient/contact identity where needed;
- Delivery window;
- relevant goods/load summary;
- Customer Delivery Instructions;
- Operational Dispatch Instructions;
- cold-chain requirements;
- critical handling/safety information.

NO debe ver:
- Customer Credit Limit;
- Receivables;
- payment history;
- pricing;
- Purchase Request negotiation;
- unrelated Customer information.

ACCESS WINDOW:

Puede ver la información mientras:
- permanece assigned;
- y la Delivery sigue operacionalmente activa.

Si:
- reassigned;
- cancelled;
- completed/closed;

pierde el acceso operacional que ya no necesita.

ACKNOWLEDGEMENT:

Normal instructions:
no mandatory acknowledgment.

Critical instructions:
mandatory acknowledgment before relevant Delivery execution.

CRITICAL V1 SET:

- cold-chain handling instruction;
- access restriction;
- special unloading requirement;
- customer-specific safety instruction;
- handling instruction whose omission could compromise goods, people or Delivery validity.

Preservar:
- instruction version/content;
- acknowledged_by;
- timestamp.

## 7. US-073 — AUTOMATIZACIÓN

Owner decision:

AUTOMATED IoT / SENSOR INTEGRATION:
DIFERIR / FUTURE.

V1 NO seleccionará:
- IoT sensor vendor;
- Bluetooth thermometer integration;
- telemetry provider;
- automatic gateway;
- continuous automated cold-chain telemetry.

V1 utiliza:

MANUAL TEMPERATURE EVIDENCE

capturada por un actor autorizado.

DEVICE:

Termómetro externo apropiado para la operación del Tenant.

Nexa V1 no controla ni certifica el hardware.

UNIT:

Celsius — °C.

TEMPERATURE RECORD:

Debe conservar como mínimo:
- measured value;
- unit = °C;
- timestamp;
- actor;
- Tenant/Workspace;
- business context;
- affected Delivery/Receiving/inventory context según corresponda.

PHOTO EVIDENCE:

Normal in-range reading:
photo optional.

Out-of-range / excursion:
photo of thermometer/display/evidence REQUIRED V1.

INSTRUMENT RELIABILITY:

El Tenant es responsable de utilizar instrumentos apropiados/calibrados conforme a su operación y políticas.

Nexa registra:
- quién realizó la lectura;
- qué valor;
- cuándo;
- dónde/en qué contexto empresarial;
- evidencia.

Nexa no afirma certificar el instrumento.

WHERE TEMPERATURE IS REQUIRED V1:

- Receiving;
- Delivery;

cuando el SKU/product requirement indique que cold-chain aplica.

No hacer temperatura obligatoria universal durante Fulfillment V1.

OUT-OF-RANGE BEHAVIOR:

Una lectura fuera del rango permitido debe:

1. registrar Temperature Evidence;
2. crear Cold-Chain / Operational Exception;
3. colocar preventivamente la cantidad/stock afectado en HOLD automáticamente.

Este HOLD preventivo sí está autorizado.

Sin embargo, NO automatizar:

- RELEASE;
- REJECT;
- WASTE;
- RETURN;
- Delivery acceptance;
- stock destruction.

La disposition requiere actor autorizado y evidencia.

Por tanto:

Out-of-range temperature
→ evidence
→ exception
→ preventive HOLD

pero nunca:

Out-of-range
→ automatic WASTE/RELEASE.

FINAL PRODUCT STATUS

Cerrar a nivel Product:

US-005 — ACCEPTED / CLOSED
US-029 — ACCEPTED / CLOSED
US-030 — ACCEPTED SCOPE CORRECTION: Sales ↔ Buyer chat only; Driver ↔ Buyer contact deferred
US-059 — ACCEPTED / CLOSED
US-060 — ACCEPTED / CLOSED
US-063 — ACCEPTED / CLOSED
US-073 — ACCEPTED WITH AUTOMATION DEFERRED

Explicitly deferred:

- any shorter raw-location retention window imposed by Privacy/Security;
- advanced route optimization;
- mixed-temperature vehicle compartments;
- external 3PL direct Nexa access;
- SMS;
- WhatsApp integration;
- automatic IoT/sensor integration;
- telemetry provider;
- sensor vendor.

## Implementation and contract boundary

Where an accepted decision needs an absent backend contract or data projection, record `BACKEND CONTRACT GAP` separately. Do not claim an API, runtime behavior, device/provider integration or business transition exists because this Product decision is accepted. The subsequent US-029 clarification below establishes a maximum raw-coordinate retention of 24 hours; Privacy/Security/Data Governance may shorten it. No indefinite retention or unrelated reuse is authorized. Contextual chat correction/edit rules remain to be made explicit before supporting those mutations. Automated IoT integration, route optimization, mixed-temperature compartments and direct external 3PL access remain FUTURE.

## 8. US-005 — Tipos explícitos de reportes Driver

Decisión Product/Owner aprobada el 2026-10-01: los nuevos reportes Driver admiten un tipo explícito. La severidad se deriva autoritativamente en el servidor; el cliente no la elige libremente.

| Tipo V1 | Severidad derivada |
| --- | --- |
| Demora | WARNING |
| Instrucción incompleta | WARNING |
| Acceso bloqueado | BLOCKING |
| Cliente ausente | BLOCKING |
| Delivery no ejecutable | BLOCKING |
| Excursión térmica | CRITICAL |
| Daño que pueda comprometer bienes o personas | CRITICAL |

Los reportes históricos ambiguos no se reclasifican retroactivamente sin evidencia suficiente. Cada excepción conserva como mínimo tipo, severidad, reporter/detector, responsable, objeto de negocio afectado, timestamps, resolution/outcome, reason y evidencia cuando corresponda.

Reportar, tomar responsabilidad o cerrar una excepción no amplía permisos ni autoriza por sí solo liberar stock, resolver una disposición cold-chain o ejecutar acciones fuera de las capacidades del actor. Claim/review no resuelve una excepción ni elimina su bloqueo operativo. La resolución y cierre siguen sujetos a la autoridad del proceso dueño y a las reglas previamente aceptadas.

## 9. US-029 — Operational capture and coordinate retention

Accepted Product/Owner clarification on 2026-10-01: continuous Driver location capture and transmission are required only during an active operational Driver workday. Starting that workday requires location availability. Ending or closing the workday stops capture and transmission. Tracking outside the operational workday is prohibited.

Buyer live location is limited to the Buyer's own Delivery, from actual departure to terminal completion or cancellation. This visibility does not grant workforce-location access.

Raw coordinates expire no later than 24 hours after capture; Privacy/Security may impose a shorter window. Capture duration and retention duration are separate constraints. Business Traceability retains operational facts without coordinates. No indefinite coordinate history or unrelated reuse is authorized.

## 10. US-059 — Explicit Dispatch compatibility assessment

Accepted Product/Owner clarification on 2026-10-01: V1 permits Dispatch to explicitly attest `capacitySufficient`, `handlingCompatible`, `zoneReasonable` and `noExclusiveTransportRestriction`. Each must be true to group the evaluated Deliveries. Preserve the authenticated actor, timestamp, evaluated Deliveries/load, assessment result and reason or observation where applicable.

This assessment cannot override server checks for origin Warehouse, compatible states, delivery windows, temperature ranges, HOLD/cold-chain restrictions or other structured domain restrictions. It does not mutate stock, Delivery results or other business authority. A fleet-capacity catalog is not required for V1; richer structured modeling remains future work.

## 11. US-059 — Explicit planning when the delivery window is absent

Accepted Product/Owner decision on 2026-10-01: Dispatch may establish an operational delivery window for a compatible READY Preparation/Delivery only when no valid window exists. Preserve `windowStart`, `windowEnd`, authenticated actor, timestamp and reason. Require `windowStart < windowEnd`, current Tenant/Workspace, compatible planning state and every known temporal restriction.

An existing commercial or Delivery window is preserved. Changing it requires a separate explicit, traceable rescheduling workflow; this mechanism cannot silently overwrite it. Operational planning does not rewrite the Sales Order or a historical commercial promise. US-059 compatibility uses the effective delivery window and rejects incompatible windows.

## 12. US-061 — In-transit temperature excursion and execution HOLD

Accepted Product/Owner decision on 2026-10-01: after handover, an out-of-range reading records TemperatureEvidence, requires photo evidence, creates a CRITICAL exception and places the affected quantity/SKU under an execution HOLD owned by BC-06 Fulfillment & Delivery. Normal delivery, successful POD and Buyer acceptance of that quantity remain blocked until an authorized disposition.

Allowed dispositions are `RELEASE`, `CONTINUE_HOLD`, `REJECT` and `WASTE`. Driver reporting does not grant disposition authority. RELEASE permits execution to resume; CONTINUE_HOLD preserves the stop; REJECT and WASTE record authorized outcomes and require any subsequent operational handling to follow its explicit workflow.

Preserve Delivery, Delivery Attempt when applicable, quantity/SKU, temperature/unit, reporting actor, capture and recording timestamps, evidence, exception, disposition, authorizing actor and reason. Do not recreate available stock or model additional in-transit inventory as a prerequisite. Returns and other physical consequences remain explicit subsequent workflows. This decision does not automatically modify Sales Order, Receivable, Payment, Buyer Receipt or Delivery result.

## 13. US-005 — Explicit BOM coordination authority

Accepted Product/Owner decision on 2026-10-01: provide an explicit BOM role with capabilities to view cross-functional exceptions, assume responsibility, assign/reassign to authorized actors, change responsibility, record follow-up and administrative/operational resolution, and close only after the underlying workflow has a valid resolution.

Exception coordination authority is separate from underlying domain authority. BOM does not implicitly release stock, lift Inventory HOLD, authorize cold-chain RELEASE/REJECT/WASTE, modify Physical Allocation, Sales Order or Delivery result, resolve Financial Adjustment, or gain other capabilities. Where BC-05 or BC-06 owns the decision, an authorized actor must first record the authoritative outcome. Administrative closure never releases goods automatically.

Preserve `assignedTo`, `assignedBy`, timestamps, reason, resolution/outcome and each reassignment/closure fact. Accepted Product scope is distinct from implementation or verification status.
