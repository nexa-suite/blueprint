---
status: accepted
maturity: BASELINED
scope: v1
owner: architecture
last-reviewed: 2026-08-23
---

# ADR-0003: Single Internal Web Platform

## Status

Accepted.

## Context

Tenant internal roles need distinct experiences without separate applications.

## Decision

Use one Internal Web Platform with role/capability-based experiences for Tenant Administrator, Company Owner, Business Operations Manager, Sales Representative, Warehouse Operator and Dispatch Coordinator.

## Alternatives considered for the baseline

- One application per internal role: rejected for V1 because roles share the internal operational surface and security boundary.
- Merge workforce and Buyer experiences: rejected because actors, permissions, navigation and workflows differ.

## Consequences

Authorization and capability design shape experiences inside one web application. The decision does not define Bounded Contexts or prevent a future product decision from adding a separate surface.

## What remains open

Detailed capability and domain boundaries are accepted in Strategic DDD; technical surface refinement remains construction work.

## Revisit trigger

A future accepted product decision requires a distinct application boundary.
