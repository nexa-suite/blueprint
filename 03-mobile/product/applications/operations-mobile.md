# Nexa Operations Mobile

Product direction: `OWNER-ACCEPTED`. Research: `PROPOSED / RESEARCH VALIDATION
PENDING`. Client: `NOT STARTED`. Backend: `PARTIAL`, with selected contracts in
API v0.17.0.

## Projection

Sales Representative receives Customer/Buyer Relationship, catalog, price,
availability, draft and PR work. Warehouse Operator receives identifier/lot,
receiving, FEFO, picking, discrepancy and temperature evidence work. Dispatch
Coordinator receives readiness, assignment, outgoing verification, handoff and
dispatch work. Driver / Delivery Operator receives assigned Delivery, Attempt,
POD, Buyer handoff and selective evidence queue work.

## Boundary

The app never owns Product/SKU, inventory, commitment, payment, Delivery or
traceability truth. Camera/scanner, maps, push and secure storage are device or
provider integrations. QR is ephemeral. Location is bounded to an active
Delivery; permanent tracking and full chat are deferred.
