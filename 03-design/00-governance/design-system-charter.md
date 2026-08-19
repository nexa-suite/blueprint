---
status: accepted
maturity: BASELINED
scope: v1
owner: design
last-reviewed: 2026-08-19
---

# Design system charter

Nexa Design System v1 is a shared language for the Website, Internal Web Platform and Buyer Portal. It reduces avoidable variation while allowing each surface to preserve its task hierarchy, density and business context.

## Authority

The Blueprint owns normative design truth. The Design Lab is executable evidence. Product applications consume approved public contracts; they do not import documentation renderers or Lab utilities.

## Laws

- Use primitive → semantic → component tokens.
- Do not introduce an undocumented UI color, radius, shadow or spacing decision.
- Status meaning is never conveyed by color alone.
- One component owns its divider, selected geometry and focus geometry.
- Loading, error, empty, disabled, read-only and permission states are explicit where applicable.
- Preserve product vocabulary: catalog browsing, cart, draft request, Purchase Request, Sales Order and delivery proof are distinct.
- Legacy/Vue evidence can inspire revalidation but cannot establish a target contract.

## Scope

The baseline covers foundations, reusable web components, product-safe web patterns, quality evidence and Angular consumption. Mobile native, IoT, provider selection, backend authentication and production domain transitions are deferred or runway items.
