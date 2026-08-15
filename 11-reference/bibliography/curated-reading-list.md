---
status: reference
maturity: BASELINED
scope: cross-cutting
owner: research
last-reviewed: 2026-08-15
---

# Curated public research guidance

Safe research index, not Product authority, architecture decision or license for private books. Prefer primary/recognized sources. Reverify current versions when decision work starts.

| Topic | Primary/recognized authority | Why relevant to Nexa | When to consult | Limitation / caveat |
|---|---|---|---|---|
| Capability discovery | [EventStorming](https://www.eventstorming.com/) | Prepare collaborative business-flow discovery | Before Big Picture and Process-Level EventStorming | Method input, not completed discovery |
| Domain storytelling | [Domain Storytelling](https://domainstorytelling.org/) | Capture actors, work objects and interactions | After Capability Mapping | Does not produce accepted BCs automatically |
| Architecture | [C4 model](https://c4model.com/) and [Structurizr DSL](https://docs.structurizr.com/dsl/language) | Preserve L1/L2 semantics and validate source | C4 maintenance | C4 is not Strategic DDD |
| Modular monolith | [Spring Modulith](https://docs.spring.io/spring-modulith/reference/index.html) | Verify implementation module structure and documentation | AS-IS engineering review | Modules are not Bounded Contexts |
| SaaS isolation | [AWS SaaS Lens](https://docs.aws.amazon.com/wellarchitected/latest/saas-lens/saas-lens.html) | Compare tenant-isolation and operating-model patterns | Tenant/Provisioning and Security Architecture | Vendor guidance, not Nexa topology |
| Security verification | [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/) and [OWASP API Security](https://owasp.org/API-Security/) | Security requirements and API threat review | Security Architecture and API review | Does not replace threat modeling or evidence |
| Identity protocols | [OAuth 2.0 RFC 6749](https://www.rfc-editor.org/rfc/rfc6749.html) and [OpenID Connect Core](https://openid.net/specs/openid-connect-core-1_0.html) | Ground global identity and provider integration terms | IAM/Security Architecture | Protocol references do not choose providers |
| PostgreSQL RLS | [PostgreSQL Row Security Policies](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) | Understand policy, `USING`, `WITH CHECK` and bypass concerns | Data/Security Architecture | Current AS-IS does not equal final RLS design |
| Supply-chain traceability | [GS1 Global Traceability Standard](https://www.gs1.org/docs/traceability/Global_Traceability_Standard.pdf) | Traceability vocabulary and supply-chain evidence | Cold-chain/Data discovery | External standard; validate fit and licensing |
| HTTP API semantics | [HTTP Semantics RFC 9110](https://www.rfc-editor.org/rfc/rfc9110.html) and [Problem Details RFC 9457](https://www.rfc-editor.org/rfc/rfc9457.html) | Stable API behavior and machine-readable errors | API/contract review | Does not invent Nexa endpoints |
| OpenAPI | [OpenAPI Specification](https://spec.openapis.org/oas/latest.html) | Contract/documentation validation | API evidence review | Generated contract still needs runtime verification |
| Observability | [OpenTelemetry](https://opentelemetry.io/docs/) | Trace, metric and log interoperability | Observability/Runtime Architecture | Instrumentation does not define domain ownership |
| Frontend | [Angular](https://angular.dev/) and [Angular Material](https://material.angular.dev/) | Implementation substrate/reference for target web surfaces | Frontend Architecture and design implementation | Framework defaults are not Nexa design decisions |
| Accessibility | [WCAG 2.2](https://www.w3.org/TR/WCAG22/) | Keyboard, focus, contrast and semantic acceptance | Design and browser validation | Goal requires product-context testing |
| Design systems | [Material 3](https://m3.material.io/) and [Design Tokens Community Group](https://www.w3.org/community/design-tokens/) | Foundations and token vocabulary | Future Design System task | Reference only; no final Nexa identity selected |

Private commercial references may inform local research subject to license. Their files, copied content, local paths and exact private filenames do not belong in Blueprint.
