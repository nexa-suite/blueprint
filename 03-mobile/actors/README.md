# Mobile actors

The [shared actor catalog](../../01-shared/product/actors.md) is authoritative.
Mobile adds no domain actors; it projects existing actors into two surfaces.

| Application | Projected actors | Authority |
|---|---|---|
| Operations Mobile | Business Operations Manager; Sales Representative; Warehouse Operator; Dispatch Coordinator; Driver / Delivery Operator | BC-01 access plus owning BC command/query policy |
| Buyer Mobile | Customer Buyer | BC-01 access plus BC-02 Buyer Relationship policy |

Status: product direction `OWNER-ACCEPTED`; research
`PROPOSED / RESEARCH VALIDATION PENDING`; client `NOT STARTED`.

Driver is a delivery-work actor, not a new Driver BC. Finance is a capability
responsibility, not a new Finance actor/context. Mobile role visibility never
replaces server-side authorization.
