# Test strategy

Repository-specific test evidence remains in AS-IS records and independent application repositories. This index does not claim runtime certification.

## Mobile construction gates

### Every commit

- Unit tests.
- ViewModel/state/action tests.
- Mapper, repository and client-use-case tests where relevant.
- Static analysis, architecture checks and lint.

### Pull request

- All Every Commit checks.
- Adapter/contract tests for OpenAPI DTO translation and Problem Details.
- Idempotency/revision header behavior.
- Selected Compose/widget tests and feature/component integration tests.

### Sprint candidate

- Representative emulator/simulator workflows.
- Real API integration where available.
- Authentication and Tenant/Workspace or Buyer Relationship context cases.
- Stale/conflict, retry, timeout and unknown-result outcomes.
- Camera/manual fallback where relevant.

### V1 acceptance

- Physical Operations Android device.
- Physical Buyer Android device and Buyer iOS evidence when applicable.
- Scanner/camera hardware, real network/API and accessibility evidence.
- Security verification, measured performance and system E2E.

Coverage percentages, performance numbers and certification claims require
measured evidence; none are invented here. Technical Verification != Product
Acceptance != System Acceptance != Production Readiness.
