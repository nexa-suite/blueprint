---
status: accepted
scope: cross-cutting
owner: architecture
last-reviewed: 2026-08-12
---

# ADR-0002: Global Nexa identity with Tenant-scoped Buyer relationships

## Status

Accepted.

## Context

A human may have independent authorized commercial relationships with multiple Tenants.

## Decision

Use one global Nexa human identity with independent authorized Tenant relationships. Elena may relate to ICISA and Laive; commercial data remains isolated.

## Alternatives currently known

No alternatives were recorded as accepted decisions.

## Consequences

Buyer authentication can select an authorized Tenant context without sharing tenant data.

## What remains open

IAM and data ownership details await Strategic DDD and Data Architecture.

## Revisit trigger

A validated identity or tenancy decision changes the global identity direction.
