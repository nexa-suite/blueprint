---
status: accepted
maturity: DRAFT
scope: v1
owner: design-system
last-reviewed: 2026-08-19
---

# Component contracts

Every reusable candidate documents native element/role, inputs and outputs, keyboard path, focus behavior, disabled/loading behavior, semantic tokens, geometry aliases and test contract. Buttons preserve link safety when disabled/loading; Text Field connects label, help and error; Action Menu preserves its frozen presentation and keyboard ownership; Segmented Control updates selection immediately.

State layers must preserve base radius and padding. Component APIs do not expose documentation renderer state, fake backend outcomes or Lab timing concerns.
