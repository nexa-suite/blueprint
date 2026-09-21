---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-09-20
---

# ADR-0019: Buyer Mobile Flutter

## Status

Accepted TARGET.

## Context

Buyer Mobile is one client projection for authorized Buyer relationships on
Android and iOS. It must not duplicate the Buyer Portal as a new Web surface or
become a second Nexa authority.

## Decision

Use Flutter and Dart for Android+iOS only. Baseline: Flutter 3.47.x, Dart
3.13.x, Android min SDK 24, compile SDK 37, target SDK construction baseline 36
and iOS minimum 15. Android API 37 target compatibility becomes an acceptance
hardening gate once toolchain and plugins are verified.

## Consequences

Buyer Android and Buyer iOS deploy instances of the same C4 Container. Flutter
Web, macOS, Windows and Linux are not V1 surfaces. Secure-storage/local-database
package selection remains implementation-level.

## Alternatives

Rejected leaving client technology open and using Flutter multiplatform support
to authorize extra Nexa product surfaces.

## Evidence

[Current decisions](../../../product/current-decisions.md) and
[Technology baseline](../../technology-baseline.md).

## Supersedes / Superseded by

Supersedes the open Buyer client-framework choice. No superseding ADR.
