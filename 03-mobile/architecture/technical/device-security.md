# Mobile device security

Status: ACCEPTED TARGET BOUNDARY. Shared Security remains canonical. Clients
protect session references and local evidence, minimize PII, clear revoked
scope, fail closed without active Tenant/Workspace context and never log tokens
or payment data. Operations uses an Android Keystore boundary; Buyer uses a
secure platform-storage abstraction.

Attestation, jailbreak/root posture, screenshot policy, encryption settings,
retention and remote wipe remain implementation/acceptance gates. No statement
here proves a client security implementation or Product Acceptance.
