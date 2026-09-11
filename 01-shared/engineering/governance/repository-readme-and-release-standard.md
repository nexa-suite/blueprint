---
status: accepted
maturity: BASELINED
scope: cross-cutting
owner: governance
last-reviewed: 2026-09-10
---

# Organization-wide README and Release standard

This is the Nexa documentation standard for repository READMEs and GitHub
Releases. It governs communication structure; it does not grant Product,
System or Production Acceptance.

## Repository README order

Every organization-wide Nexa repository README should preserve this section
order. A repository may add scoped detail inside a section, but must not hide a
required boundary by deleting the section.

1. Overview
2. Responsibility Boundary
3. Nexa Ecosystem Role
4. Current Status
5. Architecture / Technology
6. Getting Started
7. Project Structure
8. Contracts and Dependencies
9. Validation
10. Release Model
11. Documentation
12. Security and Contribution

Avoid manually hardcoding a “latest release” badge. Use an automated mechanism
that stays correct, or omit the badge. A README status statement must identify
its evidence date and distinguish implementation from acceptance.

## GitHub Release order

Every GitHub Release description should preserve all of these sections:

1. Summary
2. Release identity
3. Scope
4. Included work
5. Changed
6. Fixed
7. Contracts and compatibility
8. Security and tenant impact
9. Verification
10. Acceptance state
11. Known limitations and open evidence
12. Migration / upgrade notes
13. Provenance
14. Links

Use explicit `No material change` or `Not applicable` when a section has no
content. Do not silently remove a required section.

## Evidence boundary

A release tag proves only that the release ref exists. It does not by itself
prove `TECHNICALLY VERIFIED`, `PRODUCT ACCEPTED`, `System Acceptance` or
`PRODUCTION READY`. Release notes must name the checks and acceptance evidence
actually available, with gaps left open.

## Public boundary

Public READMEs and reports may state canonical Nexa semantics when useful, but
must not present Blueprint as a public-facing facilitator, selling point or
runtime dependency. Internal provenance belongs in Blueprint and maintainer
records. The desired future flow is:

`Blueprint canonical model -> controlled/automated derivation -> public artifact`.

Existing public references that describe Blueprint as a facilitator remain a
later cleanup item; this standard does not authorize edits to application
repositories or public reports in this wave.
