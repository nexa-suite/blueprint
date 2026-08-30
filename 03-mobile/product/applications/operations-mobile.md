# Nexa Operations Mobile

Product direction: `OWNER-ACCEPTED`. Research: `PROPOSED / RESEARCH VALIDATION
PENDING`. Client: `NOT STARTED`. Backend: `PARTIAL`, with selected contracts in
API v0.17.0.

## Projection

Warehouse Operator receives product identification, lot/receiving, FEFO,
picking, discrepancy and temperature evidence work. Dispatch Coordinator
receives readiness, assignment, outgoing verification, handoff and dispatch
work. Driver / Delivery Operator receives assigned Delivery, Attempt, external
navigation, outcome, POD and bounded handoff-code work. Field Sales work is
deferred from Mobile V1.

## Boundary

The app never owns Product/SKU, inventory, commitment, payment, Delivery or
traceability truth. Camera/scanner, external navigation, notification delivery
and secure storage are device or provider concerns. A handoff code is bounded
and is not Buyer acceptance. V1 does not store or continuously share Driver
location; permanent tracking, live maps and contact are deferred.
