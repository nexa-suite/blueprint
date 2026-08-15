---
status: accepted
scope: v1
owner: architecture
last-reviewed: 2026-08-12
---

# ADR-0005: Object Storage for tenant-owned binary assets

## Status

Accepted.

## Context

Tenant-owned catalog media and future binary documents need an explicit target boundary.

## Decision

Store metadata/reference data in the database. Keep binary media, documents and evidence behind an Object Storage abstraction in TARGET. Do not assert a cloud vendor yet.

## Alternatives currently known

No alternatives were recorded as accepted decisions.

## Consequences

Tenant-specific product media remains private and is not treated as brand imagery.

## What remains open

Object Storage provider and detailed ownership/access design await later architecture work.

## Revisit trigger

A validated deployment or data decision selects a provider or changes binary asset ownership.
