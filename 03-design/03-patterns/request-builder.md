---
status: accepted
maturity: DRAFT
scope: v1
owner: ordering
last-reviewed: 2026-08-19
---

# Request builder

Cart intent, editable quantity, draft request, documents and delivery context compose into a reviewable request builder. Cart != Purchase Request != Sales Order. A cart never reserves inventory, and creating a draft does not imply an order or domain transition.
