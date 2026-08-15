---
status: accepted
scope: v1
owner: architecture
last-reviewed: 2026-08-12
---

# ADR-0001: Tenant and Workspace relationship in V1

## Status

Accepted.

## Context

Tenant is the maximum SaaS isolation boundary. Workspace represents the complete operational environment of that Tenant.

## Decision

Use `Tenant 1:1 Workspace` in V1. Future multiple workspaces are explicitly deferred.

## Alternatives currently known

No alternatives were recorded as accepted decisions.

## Consequences

Workspace is not a C4 Container and must not shape V1 architecture as a separate product surface.

## What remains open

Final IAM and data implementation will be revisited during DDD/Data Architecture.

## Revisit trigger

A future product version explicitly reconsiders `Tenant 1:N Workspace`.
