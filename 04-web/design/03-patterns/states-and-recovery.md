---
status: accepted
maturity: DRAFT
scope: v1
owner: design-system
last-reviewed: 2026-08-19
---

# States and recovery

Success is terminal unless a specimen explicitly defines another path. Error is terminal until Retry or another recovery action. Cancelled is terminal. Visual tone and domain status are separate: a specific aborted-operation specimen may render Cancelled as danger, but all domain statuses named Cancelled do not become danger globally.

Temporal evidence is meaningful only for behaviors that have temporal change. Toggle, radio and checkbox pages do not receive generic process filler.
