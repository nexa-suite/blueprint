---
status: accepted
maturity: BASELINED
scope: v1
owner: domain
last-reviewed: 2026-08-12
---

# Known domain rules

- Tenant isolation is mandatory.
- Tenant:Workspace is 1:1 in V1.
- One physical Inventory Lot belongs to one Warehouse.
- A source batch may be split into multiple physical Inventory Lots.
- Sales may modify a Purchase Request before order creation.
- Buyer reconfirmation is not mandatory after Sales adjustments.
- Sales cannot arbitrarily edit authoritative prices.
- Confirmed Sales Orders cannot be silently edited.
- Tenant-specific product media is private.
- Sellable product presentations/SKUs may have independent images.

No additional invariants are inferred here.
