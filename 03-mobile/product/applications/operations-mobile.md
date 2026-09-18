# Nexa Operations Mobile

Product Generation direction is accepted as one of the two Mobile apps.
Needfinding is complete for problem/task evidence (`9/9`, three interviews per
segment); solution validation and Product Acceptance remain open. Backend
support is `PARTIAL`. Operations implementation evidence is also partial
`AS-IS` evidence on unmerged feature branches and is not an integrated,
accepted or production runtime. The observed branch evidence uses
Android/Kotlin/Jetpack Compose; this AS-IS choice is not a final canonical
framework assignment.

## Projection

Warehouse Operator receives product identification, lot/receiving, FEFO,
picking, discrepancy and temperature evidence work. Dispatch Coordinator
receives readiness, assignment, outgoing verification, handoff and dispatch
work. Driver / Delivery Operator receives assigned Delivery, Attempt, external
navigation, outcome, POD and bounded handoff-code work. The Master Mobile
Product Backlog remains the authority for lifecycle and historical planning
provenance; deferred Field Sales and coordination stories are not promoted by
this projection.

## Boundary

The app never owns Product/SKU, inventory, commitment, payment, Delivery or
traceability truth. Camera/scanner, external navigation, notification delivery
and secure storage are device or provider concerns. A handoff code is bounded
and is not Buyer acceptance. V1 does not store or continuously share Driver
location; permanent tracking, live maps and contact are deferred.
