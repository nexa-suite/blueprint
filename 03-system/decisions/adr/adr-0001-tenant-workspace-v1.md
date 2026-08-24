---
status: accepted
maturity: BASELINED
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

## Alternatives considered for the baseline

- `Tenant 1:N Workspace`: deferred because no accepted V1 requirement needs multiple operational environments.
- Workspace as a separate C4 Container: rejected because it is an operational/domain concept, not a deployable runtime.

## Consequences

Workspace is not a C4 Container and must not shape V1 architecture as a separate product surface. Future multi-workspace work would affect identity, data isolation, provisioning and authorization.

## What remains open

Final IAM and data implementation will be revisited during DDD/Data Architecture.

## Revisit trigger

A future product version explicitly reconsiders `Tenant 1:N Workspace`.
