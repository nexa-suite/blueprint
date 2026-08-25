---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: product
last-reviewed: 2026-08-24
---

# Nexa Problem Foundation

## Status

CURRENT PRODUCT PROBLEM BASELINE

DERIVED FROM APPROVED HISTORICAL WEB DISCOVERY

REFINEMENT EXPECTED AS NEW RESEARCH ARRIVES

## Product framing

Nexa is a generic B2B operations platform for importers, distributors and
wholesalers. It coordinates the commercial and operational order-to-delivery
lifecycle across suitable target-market tenants.

ICISA is a Reference Tenant, not the product definition. ICISA may provide
domain evidence, realistic examples, acceptance scenarios, reference data and
vocabulary discovery. Product requirements must remain meaningful for another
suitable importer, distributor or wholesaler without rewriting their semantics.

## Historical research baseline

The following passages recover the useful problem foundation from the approved
historical Web discovery report. They preserve the report's original
cold-chain/B2B framing; they are not current market statistics or a current
Product restriction.

### Antecedentes y problemática

The historical report describes a critical cold-chain context in which
temperature-sensitive products require control during storage, transport and
distribution. It then frames the operational problem as a fragmented B2B
order flow:

> Sobre esta base, es razonable inferir que una parte importante de la
> coordinación comercial entre empresas distribuidoras y clientes B2B del
> canal tradicional todavía se realiza mediante llamadas telefónicas,
> mensajes de WhatsApp y registros aislados, más que a través de plataformas
> transaccionales integradas. Esta forma de operar resulta particularmente
> problemática en el caso de productos refrigerados, donde el pedido no
> puede desvincularse de variables como disponibilidad real, rotación según
> fecha de vencimiento y conservación en frío.

The report continues:

> En términos operativos, el proceso actual de gestión de pedidos en muchas
> organizaciones puede describirse como un flujo manual y fragmentado: el
> cliente comercial comunica su pedido mediante texto libre, llamada o nota
> de voz; el personal administrativo interpreta y transcribe esa información
> a hojas de cálculo o sistemas aislados; y el área operativa prepara el
> pedido con base en información que no siempre refleja la disponibilidad
> actualizada ni los criterios óptimos de rotación.

It identifies the resulting problem as a failure to articulate the critical
information flow, affecting commercial coordination, operational execution,
traceability and customer confidence. This baseline is useful discovery
evidence, not a claim that every target-market tenant has the same workflow.

### Recovered Lean UX Problem Statements

The historical report states:

> El estado actual de la gestión de pedidos B2B de productos refrigerados se
> ha enfocado principalmente en empresas importadoras y distribuidoras
> medianas que coordinan clientes, solicitudes de compra, inventario,
> despacho, documentos, pagos y control de cadena de frío mediante flujos
> manuales o desconectados.

> Lo que los productos o servicios existentes no resuelven adecuadamente es
> la falta de un flujo simple y conectado que relacione la solicitud
> comercial, la validación del pedido, la disponibilidad de inventario, el
> estado del despacho, los documentos del negocio, las referencias de pago
> y la visibilidad de temperatura para productos refrigerados.

> Nuestro producto abordará esta brecha mediante una estrategia de
> experiencia digital B2B orientada a conectar el flujo comercial y
> operativo del pedido, incluyendo información de catálogo, solicitudes,
> órdenes, inventario, despacho, documentos, pagos y registros de
> temperatura asociados al control de cadena de frío.

> Nuestro foco inicial será los usuarios internos comerciales y operativos,
> porque ellos estructuran, validan y actualizan la información del pedido
> que luego consulta el comprador B2B.

> Sabremos que tenemos éxito cuando observemos usuarios comerciales
> registrando solicitudes con menor reinterpretación manual, usuarios
> operativos actualizando información de despacho y temperatura de forma
> consistente, y compradores B2B consultando estado del pedido, documentos,
> pagos e información de cadena de frío sin depender únicamente de WhatsApp,
> llamadas o hojas de cálculo.

These statements remain a historical Web discovery baseline. They may be
refined after new research. They do not validate Mobile users, personas or
Mobile journeys.

## Current canonical interpretation

Current distribution operations may be fragmented across:

- WhatsApp and calls.
- Spreadsheets and disconnected commercial tools.
- Inventory coordination.
- Warehouse coordination.
- Dispatch and delivery coordination.

Nexa addresses the fragmented B2B order-to-delivery lifecycle by coordinating:

1. Customer / Buyer
2. Commerce
3. Inventory
4. Fulfillment
5. Delivery
6. Financial visibility
7. Business Traceability

This interpretation aligns the recovered problem with the accepted generic Nexa
Product model. It does not claim measured percentages, universal workflow
behavior or a completed Mobile validation.

## Product boundary

The problem foundation does not create a Web, Mobile, Driver, Dashboard or
Barcode Bounded Context. Web and Mobile are product surfaces over the same
shared domain. The accepted 11 Bounded Contexts, DDD language, C4 model and
business rules remain canonical elsewhere in Blueprint.

## Provenance

- Source repository: [nexa-ecosystem-report](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report)
- Source commit: [e161fe522023bfe5929e76c4d7c66af211884b7e](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report/commit/e161fe522023bfe5929e76c4d7c66af211884b7e)
- Retrieval date: 2026-08-24
- Reused paths:
  - [1-2-solution-profile.md](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report/blob/e161fe522023bfe5929e76c4d7c66af211884b7e/report/10-chapter-1-introduction/1-2-solution-profile.md), sections 1.2.1 and 1.2.2.1.
  - [2-2-interviews.md](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report/blob/e161fe522023bfe5929e76c4d7c66af211884b7e/report/20-chapter-2-requirements-elicitation/2-2-interviews.md), section 2.2.3.
  - [2-3-needfinding.md](https://github.com/upc-pre-202610-1asi0730-12242-king/nexa-ecosystem-report/blob/e161fe522023bfe5929e76c4d7c66af211884b7e/report/20-chapter-2-requirements-elicitation/2-3-needfinding.md), As-Is Scenario Map and synthesis.
- Reuse method: selected problem and Lean UX passages copied faithfully;
  headings and formatting normalized; current Product framing and boundary
  added as explicit Blueprint interpretation; unrelated academic material
  omitted.
