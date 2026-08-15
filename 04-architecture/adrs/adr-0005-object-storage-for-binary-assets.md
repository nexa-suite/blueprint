---
status: accepted
maturity: BASELINED
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

## Alternatives considered for the baseline

- Store binary media in PostgreSQL: rejected for the V1 boundary because large-object lifecycle and streaming need a dedicated abstraction.
- Select a cloud vendor now: deferred because deployment and provider constraints are not yet accepted.

## Consequences

Tenant-specific product media remains private and is not treated as brand imagery. The API remains responsible for authorization and metadata while the storage provider stays replaceable.

## What remains open

Object Storage provider and detailed ownership/access design await later architecture work.

## Revisit trigger

A validated deployment or data decision selects a provider or changes binary asset ownership.
