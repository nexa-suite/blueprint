---
status: accepted
maturity: DRAFT
scope: v1
owner: platform
last-reviewed: 2026-08-19
---

# Token pipeline

Token source follows primitive → semantic → component/data-visualization. Generated SCSS/CSS is an artifact, not an editing surface. Gates detect stale generation, unknown references, duplicates, cycles, raw reusable colors and undocumented visualization roles. Component aliases are introduced only for repeated design decisions.
