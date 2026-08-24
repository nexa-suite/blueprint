# Nexa Operations Mobile — proposed

## Actors

Core: Business Operations Manager, Sales Representative, Warehouse Operator,
Dispatch Coordinator, Driver / Delivery Operator. Company Owner, Tenant
Administrator and Nexa Commercial & Onboarding Staff remain Web-first.

## Proposed capability set

- Sales: customer lookup, Buyer Relationship, catalog/SKU, pricing/terms,
  Sellable Availability, history, draft, Purchase Request/order capture,
  submission, relevant credit visibility and push.
- Warehouse: SKU lookup; receiving; lot/expiry/quantity; inventory lookup;
  picking; transfer receiving; cycle/count; evidence; authorized mutations.
  `SCAN-TO-INVENTORY` interprets only encoded EAN/UPC/QR/future GS1 data and
  asks for missing lot/expiry information.
- Dispatch: Fulfillment Ready verification, Driver assignment, mandatory
  Dispatch Handoff, photographic evidence and stable handoff identifier.
- Driver: assigned delivery, route/maps, active location, attempt, partial/
  rejected/failed outcome, incidents, evidence, recipient acknowledgement,
  QR/signature/POD, selective offline/sync, push and manual temperature evidence.

Dispatch Handoff is not POD. Full in-app realtime chat and permanent tracking
are future/out of scope.
