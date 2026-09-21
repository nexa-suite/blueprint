#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

python3 - "$ROOT" <<'PY'
import json
import re
import subprocess
import sys
from pathlib import Path

root = Path(sys.argv[1])
paths = subprocess.check_output(
    ["git", "ls-files", "-co", "--exclude-standard"], text=True
).splitlines()
files = [root / p for p in paths]
failures = []
warnings = []
existing_paths = [p for p in paths if (root / p).exists()]

academic_source_pattern = re.compile(
    r"(?:enunciado|original[-_]?rubric|course[-_]?source|source[-_]?statement)",
    re.IGNORECASE,
)
academic_paths = set(path for path in paths if path.startswith("90-academic/"))
academic_paths.update(
    str(path.relative_to(root))
    for path in (root / "90-academic").rglob("*")
    if path.is_file()
)
for path in sorted(academic_paths):
    name = Path(path).name
    if academic_source_pattern.search(name) and Path(path).suffix.lower() not in {".pdf", ".epub"}:
        failures.append(f"academic source-like artifact must remain local-only: {path}")
    if path in paths and Path(path).suffix.lower() in {".pdf", ".epub"}:
        failures.append(f"academic source/rubric binary must not be present: {path}")
try:
    origin_main = subprocess.run(
        ["git", "rev-parse", "--verify", "origin/main"],
        cwd=root,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    if origin_main.returncode == 0 and subprocess.run(
        ["git", "diff", "--quiet", "origin/main...HEAD", "--", "AGENTS.md"],
        cwd=root,
    ).returncode != 0:
        failures.append("AGENTS.md has a committed PR diff; owner-local guidance must remain uncommitted")
    elif origin_main.returncode != 0:
        warnings.append("origin/main is unavailable in this checkout; committed AGENTS.md diff check skipped")
except Exception as exc:
    failures.append(f"could not verify committed AGENTS.md diff: {exc}")

required_roots = {"00-start-here", "01-shared", "02-web", "03-mobile", "04-delivery", "90-academic", "91-reference", "tooling"}
missing_roots = sorted(name for name in required_roots if not (root / name).is_dir())
if missing_roots:
    failures.append(f"missing canonical roots: {missing_roots}")
for stale_root in ("01-product", "02-domain", "03-system", "04-web", "05-mobile", "06-delivery", "07-engineering", "08-operations"):
    if (root / stale_root).exists():
        failures.append(f"stale conceptual root remains: {stale_root}")

tracked_dirs = {str(Path(rel).parent) for rel in existing_paths if "/" in rel}
for directory in sorted(tracked_dirs):
    if directory.startswith((".git", "10-repositories", "11-reference")):
        continue
    if not any(rel.startswith(directory + "/") for rel in existing_paths):
        failures.append(f"empty canonical directory: {directory}")

for directory in root.rglob("*"):
    if directory.is_dir() and ".git" not in directory.parts and not any(directory.iterdir()):
        if directory.relative_to(root).parts and directory.relative_to(root).parts[0] == ".tmp":
            continue
        failures.append(f"empty filesystem directory: {directory.relative_to(root)}")

for duplicate in (
    "01-shared/domain/strategic-ddd-index.md",
    "01-shared/domain/bounded-contexts/canonical-catalog.md",
    "01-shared/domain/bounded-contexts/canonical-canvases.md",
    "01-shared/architecture/c4/level-1-system-context.md",
    "01-shared/architecture/c4/level-2-containers.md",
):
    if (root / duplicate).exists():
        failures.append(f"duplicate or generated canonical path remains: {duplicate}")

expected_c4_files = [
    "01-shared/architecture/c4/structurizr/workspace.dsl",
    "01-shared/architecture/c4/structurizr/model/people.dsl",
    "01-shared/architecture/c4/structurizr/model/systems.dsl",
    "01-shared/architecture/c4/structurizr/model/containers.dsl",
    "01-shared/architecture/c4/structurizr/model/components.dsl",
    "01-shared/architecture/c4/structurizr/model/relationships.dsl",
    "01-shared/architecture/c4/structurizr/model/deployment.dsl",
    "01-shared/architecture/c4/structurizr/l1/l1.dsl",
    "01-shared/architecture/c4/structurizr/l2/l2.dsl",
    "01-shared/architecture/c4/structurizr/l3/api.dsl",
    "01-shared/architecture/c4/structurizr/l3/platform.dsl",
    "01-shared/architecture/c4/structurizr/l3/portal.dsl",
    "01-shared/architecture/c4/structurizr/l3/website.dsl",
    "01-shared/architecture/c4/structurizr/l3/operations-mobile.dsl",
    "01-shared/architecture/c4/structurizr/l3/buyer-mobile.dsl",
    "01-shared/architecture/c4/structurizr/l3/dynamic.dsl",
    "01-shared/architecture/c4/structurizr/deployment/deployment.dsl",
    "01-shared/architecture/c4/structurizr/styles/styles.dsl",
    "01-shared/architecture/c4/structurizr/generated/workspace.json",
]
for expected in expected_c4_files:
    if not (root / expected).is_file():
        failures.append(f"missing canonical C4 file: {expected}")

for stale_compose in (
    "01-shared/architecture/c4/structurizr/docker-compose.yml",
    "tooling/structurizr/compose.yml",
):
    if (root / stale_compose).exists():
        failures.append(f"Structurizr runtime must remain local-only under complementary/structurizr: {stale_compose}")

for rel in paths:
    if not (root / rel).exists():
        continue
    parts = Path(rel).parts
    if any(part == ".git" for part in parts):
        failures.append(f"nested Git metadata: {rel}")
    if parts[:2] in [("10-repositories", "active"), ("10-repositories", "runway"), ("10-repositories", "legacy")]:
        failures.append(f"excluded repository tree: {rel}")
    if Path(rel).suffix.lower() in {".pdf", ".epub", ".pem", ".key", ".p12", ".pfx", ".sqlite", ".sqlite3", ".db", ".dump", ".bak", ".zip"}:
        failures.append(f"prohibited candidate file type: {rel}")
    if any(token in Path(rel).name.lower() for token in ("credential", "secret", "private-key")):
        failures.append(f"secret-sensitive filename: {rel}")

    if not rel.endswith((".md", ".dsl", ".yml", ".yaml", ".json", ".sh", ".gitignore", "AGENTS.md")):
        continue
    try:
        text = (root / rel).read_text(encoding="utf-8")
    except UnicodeDecodeError:
        failures.append(f"non-text authored file requires review: {rel}")
        continue

    for bad in ("/" + "Users/", "/" + "Volumes/", "/" + "private/", "file:" + "//"):
        if bad in text:
            failures.append(f"machine-local path {bad!r}: {rel}")
    if "structurizr/structurizr:" + "latest" in text:
        failures.append(f"unpinned Structurizr image: {rel}")

    secret_patterns = [
        r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----",
        r"\bAKIA[0-9A-Z]{16}\b",
        r"\bgh[pousr]_[A-Za-z0-9_]{ twenty,}\b".replace("{ twenty,}", "{20,}"),
        r"\b(?:xox[baprs]-)[A-Za-z0-9-]{20,}\b",
        r"(?i)\b(?:password|passwd|secret|api[_-]?key|access[_-]?token)\s*[:=]\s*[\"'][^\"']{12,}[\"']",
    ]
    for pattern in secret_patterns:
        if re.search(pattern, text):
            failures.append(f"secret-like content: {rel}")
            break

    if rel.endswith(".md") and text.startswith("---\n"):
        end = text.find("\n---\n", 4)
        if end < 0:
            failures.append(f"unterminated frontmatter: {rel}")
        else:
            front = text[4:end]
            values = {}
            for line in front.splitlines():
                if ":" in line and not line.startswith(" "):
                    key, value = line.split(":", 1)
                    values[key.strip()] = value.strip()
            required = {"status", "scope", "owner", "last-reviewed"}
            missing = required - values.keys()
            if missing:
                failures.append(f"frontmatter missing {sorted(missing)}: {rel}")
            if "status" in values and values["status"] not in {"accepted", "draft", "planned", "reference", "deprecated"}:
                failures.append(f"invalid status {values['status']!r}: {rel}")
            if "scope" in values and values["scope"] not in {"v1", "runway", "v2", "cross-cutting"}:
                failures.append(f"invalid scope {values['scope']!r}: {rel}")
            if "maturity" in values and values["maturity"] not in {
                "NOT STARTED", "DISCOVERY", "DRAFT", "BASELINED", "FROZEN", "BLOCKED",
                "SUPERSEDED", "HISTORICAL", "VERIFIED", "CLOSED WITH CAVEAT", "NOT DEFINED",
            }:
                failures.append(f"invalid maturity {values['maturity']!r}: {rel}")

    if rel.endswith(".md"):
        for match in re.finditer(r"\[[^\]]+\]\(([^)]+)\)", text):
            target = match.group(1).strip().strip("<>")
            if not target or target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            target = target.split("#", 1)[0].split("?", 1)[0]
            candidate = (root / Path(rel).parent / target).resolve()
            if not candidate.exists() or (root not in candidate.parents and candidate != root):
                failures.append(f"broken relative Markdown link {target!r}: {rel}")

c4 = root / "01-shared/architecture/c4/structurizr/generated/workspace.json"
try:
    workspace = json.loads(c4.read_text(encoding="utf-8"))
    manual_workspace = root / "01-shared/architecture/c4/structurizr/workspace.json"
    if manual_workspace.exists():
        manual = json.loads(manual_workspace.read_text(encoding="utf-8"))
        if manual != workspace:
            failures.append("manual C4 workspace mirror differs from generated canonical representation")
    views = workspace["views"]
    actual_views = sorted(
        [v["key"] for v in views.get("systemContextViews", [])]
        + [v["key"] for v in views.get("containerViews", [])]
        + [v["key"] for v in views.get("componentViews", [])]
        + [v["key"] for v in views.get("dynamicViews", [])]
        + [v["key"] for v in views.get("deploymentViews", [])]
    )
    expected_views = sorted([
        "Nexa-SystemContext-ASIS", "Nexa-SystemContext-V1-TARGET",
        "Nexa-SystemContext-Future-Runway",
        "Nexa-Containers-ASIS", "Nexa-Containers-V1-TARGET",
        "Nexa-Deployment-Local-ASIS", "Nexa-Deployment-V1-TARGET",
        "Nexa-API-Overall-ASIS", "Nexa-API-TechnicalArchitecture-TARGET",
        "Nexa-API-DomainOwnershipMapping-TARGET", "Nexa-API-IdentityTenantCustomer-TARGET",
        "Nexa-API-CommercialInventory-TARGET", "Nexa-API-FulfillmentDelivery-TARGET",
        "Nexa-API-CreditPaymentDocuments-TARGET", "Nexa-API-IntegrationReliability-ASIS",
        "Nexa-Platform-Frontend-TARGET", "Nexa-Portal-Frontend-TARGET",
        "Nexa-Website-Frontend-ASIS", "Nexa-Operations-Mobile-TARGET",
        "Nexa-Buyer-Mobile-TARGET",
        "Nexa-Workflow-SubmitPurchaseRequest", "Nexa-Workflow-ConfirmDirectOrder",
        "Nexa-Workflow-ConvertPurchaseRequestToSalesOrder",
        "Nexa-Workflow-FulfillmentPickDispatchHandoff",
        "Nexa-Workflow-DeliveryPartialOutcomeContinuation",
        "Nexa-Workflow-BuyerHandoffReceiptDiscrepancy",
        "Nexa-Workflow-PaymentConfirmationReceivableApplication",
    ])
    if actual_views != expected_views:
        failures.append(f"unexpected C4 views: {actual_views}")

    model = workspace["model"]
    people = model.get("people", [])
    systems = model.get("softwareSystems", [])
    nexa_systems = [system for system in systems if system.get("name") == "Nexa"]
    if len(nexa_systems) != 1:
        failures.append(f"expected exactly one Nexa software system, found {len(nexa_systems)}")
        system = nexa_systems[0] if nexa_systems else {"containers": []}
    else:
        system = nexa_systems[0]

    expected_people = {
        "Interested Company / Prospect",
        "Nexa Commercial & Onboarding Staff",
        "Company Owner",
        "Business Operations Manager",
        "Tenant Administrator",
        "Sales Representative",
        "Warehouse Operator",
        "Dispatch Coordinator",
        "Driver / Delivery Operator",
        "Customer Buyer",
    }
    people_by_id = {str(person["id"]): person for person in people}
    actual_people = {person.get("name") for person in people}
    if actual_people != expected_people:
        failures.append(f"unexpected canonical C4 people: {sorted(actual_people)}")
    if "Tenant Workforce" in actual_people:
        failures.append("generic Tenant Workforce must not replace granular C4 actors")
    driver = next((person for person in people if person.get("name") == "Driver / Delivery Operator"), None)
    if not driver or not {"TARGET V1", "OWNER-ACCEPTED"} <= set(driver.get("tags", "").split(",")):
        failures.append("Driver / Delivery Operator must remain an owner-accepted TARGET V1 actor")

    systems_by_id = {str(item["id"]): item for item in systems}
    container_name_by_id = {}
    for item in systems:
        for container in item.get("containers", []):
            container_name_by_id[str(container["id"])] = container.get("name")

    def find_view(group, key):
        return next(view for view in views.get(group, []) if view.get("key") == key)

    def element_ids(view):
        return {str(element["id"]) for element in view.get("elements", [])}

    def people_in(view):
        return {people_by_id[element_id].get("name") for element_id in element_ids(view) if element_id in people_by_id}

    def containers_in(view):
        return {container_name_by_id[element_id] for element_id in element_ids(view) if element_id in container_name_by_id}

    def external_systems_in(view):
        return {
            systems_by_id[element_id].get("name")
            for element_id in element_ids(view)
            if element_id in systems_by_id and systems_by_id[element_id].get("name") != "Nexa"
        }

    expected_as_is = {
        "Nexa Website", "Nexa Platform", "Nexa Buyer Portal",
        "Nexa API", "PostgreSQL", "Object Storage",
    }
    expected_target = expected_as_is | {"Nexa Operations Mobile", "Nexa Buyer Mobile"}
    expected_v1_external = {
        "Payment Provider", "Email Delivery Service", "Maps & Geolocation Provider",
    }
    as_is_l1 = find_view("systemContextViews", "Nexa-SystemContext-ASIS")
    target_l1 = find_view("systemContextViews", "Nexa-SystemContext-V1-TARGET")
    future_l1 = find_view("systemContextViews", "Nexa-SystemContext-Future-Runway")
    as_is_l2 = find_view("containerViews", "Nexa-Containers-ASIS")
    target_l2 = find_view("containerViews", "Nexa-Containers-V1-TARGET")

    if people_in(as_is_l1) != expected_people - {"Driver / Delivery Operator"}:
        failures.append("AS-IS L1 people must exclude only the TARGET Driver / Delivery Operator")
    if people_in(target_l1) != expected_people:
        failures.append("TARGET V1 L1 people differ from the accepted granular actor set")
    if external_systems_in(as_is_l1) != expected_v1_external:
        failures.append("AS-IS L1 external systems must be Payment, Email and Maps")
    if external_systems_in(target_l1) != expected_v1_external:
        failures.append("TARGET V1 L1 external systems must be Payment, Email and Maps")
    if "Push Delivery Service" not in external_systems_in(future_l1):
        failures.append("Push Delivery Service must appear in Future/OPEN L1 runway")

    as_is = containers_in(as_is_l2)
    if as_is != expected_as_is:
        failures.append(f"unexpected AS-IS C4 containers: {sorted(as_is)}")
    target = containers_in(target_l2)
    if target != expected_target:
        failures.append(f"unexpected V1 TARGET C4 containers: {sorted(target)}")
    if external_systems_in(as_is_l2) != expected_v1_external:
        failures.append("AS-IS L2 external systems must be Payment, Email and Maps")
    if external_systems_in(target_l2) != expected_v1_external:
        failures.append("TARGET V1 L2 external systems must be Payment, Email and Maps")

    mobile_by_name = {container.get("name"): container for container in system.get("containers", [])}
    for mobile_name in ("Nexa Operations Mobile", "Nexa Buyer Mobile"):
        mobile = mobile_by_name.get(mobile_name)
        if not mobile:
            failures.append(f"missing {mobile_name} C4 container")
            continue
        tags = set(mobile.get("tags", "").split(","))
        if not {"TARGET V1", "OWNER-ACCEPTED"} <= tags or {"PLANNED", "PROPOSED"} & tags:
            failures.append(f"{mobile_name} must be TARGET V1 / OWNER-ACCEPTED, not a planned/proposed tag")
    operations_mobile = mobile_by_name.get("Nexa Operations Mobile", {})
    buyer_mobile = mobile_by_name.get("Nexa Buyer Mobile", {})
    operations_description = f"{operations_mobile.get('description', '')} {operations_mobile.get('technology', '')}".lower()
    buyer_description = f"{buyer_mobile.get('description', '')} {buyer_mobile.get('technology', '')}".lower()
    if operations_mobile.get("technology") != "Android / Kotlin / Jetpack Compose":
        failures.append("Operations Mobile technology must be Android / Kotlin / Jetpack Compose")
    if buyer_mobile.get("technology") != "Flutter / Dart / Android + iOS":
        failures.append("Buyer Mobile technology must be Flutter / Dart / Android + iOS")
    if "partial unmerged android/kotlin/compose" not in operations_description or "accepted" not in operations_description:
        failures.append("Operations Mobile must retain partial unmerged AS-IS evidence and accepted construction technology")
    if "not implemented" not in buyer_description or "accepted" not in buyer_description:
        failures.append("Buyer Mobile must retain not-implemented evidence and accepted construction technology")
    operations_components = operations_mobile.get("components", [])
    if {component.get("name") for component in operations_components} != {
        "Operations Presentation", "Operations Application / Use Cases",
        "Operations Repositories", "Nexa API Remote Data Source",
        "Operations Local State & Staging", "Device Capability Adapters",
        "Background Retry / Work Coordinator",
    }:
        failures.append("Operations Mobile component decomposition differs from the canonical construction set")
    buyer_components = buyer_mobile.get("components", [])
    if {component.get("name") for component in buyer_components} != {
        "Buyer Presentation", "Buyer Application / Use Cases", "Buyer Repositories",
        "Nexa API Remote Services", "Buyer Local State & Drafts", "Buyer Platform Adapters",
    }:
        failures.append("Buyer Mobile component decomposition differs from the canonical construction set")
    if not any("no generic offline synchronization" in component.get("description", "").lower() for component in operations_components):
        failures.append("Operations Mobile must explicitly reject generic offline synchronization")
    if not any(
        "optional" in component.get("description", "").lower()
        and "policy-authorized" in component.get("description", "").lower()
        for component in operations_components
    ):
        failures.append("Operations Mobile capture must remain optional and policy-authorized")
    if any("policy-required camera evidence" in component.get("description", "").lower() for component in operations_components):
        failures.append("Operations Mobile must not make camera evidence universally mandatory")

    api_components = {component.get("name"): component for component in mobile_by_name.get("Nexa API", {}).get("components", [])}
    expected_api_technical_components = {
        "API Presentation", "Application Use Cases", "Domain Policies / Invariants",
        "Tenant Access Context", "Persistence Adapters", "External Integration Adapters",
        "Reliability / Outbox / Inbox / Projections",
    }
    if not expected_api_technical_components <= set(api_components):
        failures.append("API technical L3 components differ from the canonical construction set")
    mapping_components = {
        "Sales Commitment", "Inventory Availability", "Fulfillment and Delivery",
        "Credit and Receivables", "Payments and Business Documents Lens",
        "Notifications and Business Traceability Lens",
    }
    if any(api_components.get(name, {}).get("technology") != "Domain ownership mapping" for name in mapping_components):
        failures.append("API domain mapping components must remain a separate logical ownership lens")

    expected_dynamic_views = {
        "Nexa-Workflow-SubmitPurchaseRequest",
        "Nexa-Workflow-ConfirmDirectOrder",
        "Nexa-Workflow-ConvertPurchaseRequestToSalesOrder",
        "Nexa-Workflow-FulfillmentPickDispatchHandoff",
        "Nexa-Workflow-DeliveryPartialOutcomeContinuation",
        "Nexa-Workflow-BuyerHandoffReceiptDiscrepancy",
        "Nexa-Workflow-PaymentConfirmationReceivableApplication",
    }
    actual_dynamic_views = {view.get("key") for view in views.get("dynamicViews", [])}
    if actual_dynamic_views != expected_dynamic_views:
        failures.append(f"dynamic view keys differ: {sorted(actual_dynamic_views)}")
    for view in views.get("dynamicViews", []):
        if not view.get("relationships"):
            failures.append(f"dynamic view has no ordered workflow relationships: {view.get('key')}")

    c4_source_text = "\n".join((root / path).read_text(encoding="utf-8") for path in expected_c4_files if path.endswith(".dsl"))
    for stale in ("PRE-V1 target logical component", "Mobile client technology — final selection open"):
        if stale in c4_source_text:
            failures.append(f"active C4 source retains stale technology label: {stale}")

    push = next((item for item in systems if item.get("name") == "Push Delivery Service"), None)
    if not push or not {"Future", "Open"} <= set(push.get("tags", "").split(",")):
        failures.append("Push Delivery Service must be tagged Future and Open")
    else:
        push_id = str(push["id"])
        view_membership = {
            view.get("key")
            for group in ("systemContextViews", "containerViews", "componentViews", "dynamicViews", "deploymentViews")
            for view in views.get(group, [])
            if push_id in element_ids(view)
        }
        if view_membership != {"Nexa-SystemContext-Future-Runway"}:
            failures.append(f"Push Delivery Service view membership must be Future-only: {sorted(view_membership)}")

    def walk_deployment(nodes):
        for node in nodes:
            yield node
            yield from walk_deployment(node.get("children", []))

    deployment_nodes = list(walk_deployment(model.get("deploymentNodes", [])))
    v1_nodes = [node for node in deployment_nodes if node.get("environment") == "V1 TARGET"]
    v1_by_name = {node.get("name"): node for node in v1_nodes}
    for node_name, technology, container_name in (
        ("Operations Android Device", "Android device", "Nexa Operations Mobile"),
        ("Buyer Android Device", "Android device", "Nexa Buyer Mobile"),
        ("Buyer iOS Device", "iOS device", "Nexa Buyer Mobile"),
    ):
        node = v1_by_name.get(node_name)
        if not node or node.get("technology") != technology:
            failures.append(f"V1 deployment requires {node_name} with {technology} technology")
            continue
        instances = {
            container_name_by_id.get(str(instance.get("containerId")))
            for instance in node.get("containerInstances", [])
        }
        if instances != {container_name}:
            failures.append(f"{node_name} must contain only {container_name}")
    buyer_nodes = [v1_by_name.get(name) for name in ("Buyer Android Device", "Buyer iOS Device")]
    buyer_container_ids = {
        str(instance.get("containerId"))
        for node in buyer_nodes
        if node
        for instance in node.get("containerInstances", [])
    }
    if len(buyer_container_ids) != 1 or {
        container_name_by_id.get(container_id) for container_id in buyer_container_ids
    } != {"Nexa Buyer Mobile"}:
        failures.append("Buyer Android and Buyer iOS must deploy the same Nexa Buyer Mobile C4 Container")
    if any("structurizr" in f"{node.get('name', '')} {node.get('technology', '')}".lower() for node in v1_nodes):
        failures.append("Structurizr tooling must not appear in the Nexa V1 deployment model")
    v1_external_instances = {
        systems_by_id.get(str(instance.get("softwareSystemId")), {}).get("name")
        for node in v1_nodes
        for instance in node.get("softwareSystemInstances", [])
    }
    if v1_external_instances != expected_v1_external:
        failures.append(f"V1 deployment external systems differ: {sorted(v1_external_instances)}")
    v1_deployment_view = find_view("deploymentViews", "Nexa-Deployment-V1-TARGET")
    if v1_deployment_view.get("environment") != "V1 TARGET":
        failures.append("V1 deployment view must select the V1 TARGET environment")
except Exception as exc:
    failures.append(f"workspace.json inspection failed: {exc}")

bc_root = root / "01-shared/domain/bounded-contexts"
bc_dirs = sorted(p.name for p in bc_root.iterdir() if p.is_dir() and p.name.startswith("BC-"))
expected_bc_dirs = [
    "BC-01-tenant-access-governance",
    "BC-02-customer-buyer-relationships",
    "BC-03-catalog-commercial-policy",
    "BC-04-sales-commitment",
    "BC-05-inventory-availability",
    "BC-06-fulfillment-delivery",
    "BC-07-credit-receivables",
    "BC-08-payments",
    "BC-09-business-documents",
    "BC-10-notifications",
    "BC-11-business-traceability",
]
if bc_dirs != expected_bc_dirs:
    failures.append(f"expected exactly the 11 accepted Bounded Context directories, found {bc_dirs}")

context_map = root / "01-shared/domain/strategic-ddd/context-map.md"
if context_map.is_file():
    context_codes = set(re.findall(r"\bBC-\d{2}\b", context_map.read_text(encoding="utf-8")))
    expected_context_codes = {directory[:5] for directory in expected_bc_dirs}
    if not context_codes <= expected_context_codes:
        failures.append(f"context map references non-canonical Bounded Context IDs: {sorted(context_codes - expected_context_codes)}")

event_file = root / "01-shared/domain/events/published-events.md"
event_text = event_file.read_text(encoding="utf-8")
published_events = re.findall(r"^\| `[^`]+\.v1` \|", event_text, re.MULTILINE)
if len(published_events) != 14:
    failures.append(f"expected 14 Published Integration Events, found {len(published_events)}")

context_map_text = context_map.read_text(encoding="utf-8") if context_map.is_file() else ""
context_rows = [
    [cell.strip() for cell in line.strip().strip("|").split("|")]
    for line in context_map_text.splitlines()
    if line.startswith("|") and not line.startswith("|---")
]
payment_acl_rows = [row for row in context_rows if row and row[0] == "Payment Provider (external)"]
if len(payment_acl_rows) != 1:
    failures.append(f"expected exactly one Payment Provider (external) ACL row, found {len(payment_acl_rows)}")
else:
    payment_acl = payment_acl_rows[0]
    if len(payment_acl) < 5 or payment_acl[1] != "Payments" or payment_acl[2] != "Anti-Corruption Layer":
        failures.append("Payment Provider (external) must be upstream of Payments through an Anti-Corruption Layer")
    for marker in (
        "provider requests/responses/webhooks",
        "provider-neutral Payment facts and commands",
        "idempotency",
        "verification",
        "reconciliation",
        "deduplication",
    ):
        if marker not in " | ".join(payment_acl):
            failures.append(f"Payment ACL row missing semantic marker {marker!r}")

event_rows = [
    [cell.strip() for cell in line.strip().strip("|").split("|")]
    for line in event_text.splitlines()
    if line.startswith("|") and not line.startswith("|---")
]
payment_confirmed_rows = [
    row for row in event_rows
    if row and row[0].strip("`") == "PaymentConfirmed.v1"
]
if len(payment_confirmed_rows) != 1:
    failures.append(f"expected exactly one PaymentConfirmed.v1 row, found {len(payment_confirmed_rows)}")
elif "Business Documents" not in " | ".join(payment_confirmed_rows[0]):
    failures.append("PaymentConfirmed.v1 must list Business Documents as a consumer")
for forbidden_event in (
    "PaymentReceiptRequested.v1",
    "PaymentReconciled.v1",
    "PaymentDocumentRequested.v1",
    "FinancialAdjustmentCreated.v1",
):
    if forbidden_event in event_text:
        failures.append(f"Wave 2.1 must not introduce {forbidden_event}")

current_authority_markers = {
    "01-shared/domain/ubiquitous-language/glossary.md": (
        "canonical for the accepted current V1 baseline",
        "PRE-V1\nremains provenance for the decision history",
    ),
    "01-shared/domain/events/published-events.md": (
        "# Integration and Event Architecture — Current V1 Baseline",
        "last-reviewed: 2026-09-19",
    ),
    "01-shared/data/README.md": (
        "accepted current\nV1/Post-AV1 TARGET Data Architecture",
        "baselined for the current V1/Post-AV1 baseline",
    ),
    "01-shared/domain/README.md": (
        "accepted\nMobile V1 target projections",
        "partial/unmerged AS-IS",
        "Buyer is not implemented",
    ),
    "01-shared/architecture/model-authority.md": (
        "separate C4 Software System",
        "explicit device deployment nodes",
    ),
    "01-shared/architecture/c4/component-rubric-coverage.md": (
        "No new Software System",
        "separate logical Operations Mobile Device",
    ),
}
for relative, markers in current_authority_markers.items():
    path = root / relative
    if not path.is_file():
        failures.append(f"missing current-authority source {relative}")
        continue
    text = path.read_text(encoding="utf-8")
    for marker in markers:
        if marker not in text:
            failures.append(f"{relative} missing current-authority marker {marker!r}")

stale_current_phrases = {
    "01-shared/data/README.md": ("accepted PRE-V1 TARGET Data Architecture",),
    "01-shared/domain/README.md": ("future Mobile experiences",),
    "01-shared/architecture/model-authority.md": (
        "Mobile does not create a Bounded Context, C4 System, deployment unit",
    ),
    "01-shared/architecture/c4/component-rubric-coverage.md": (
        "No new C4 Container, deployment unit or strategic context",
    ),
}
for relative, phrases in stale_current_phrases.items():
    path = root / relative
    if not path.is_file():
        continue
    text = path.read_text(encoding="utf-8")
    for phrase in phrases:
        if phrase in text:
            failures.append(f"{relative} retains stale current-authority phrase {phrase!r}")

adr_count = len(list((root / "01-shared/architecture/decisions/adr").glob("adr-*.md")))
if adr_count != 21:
    failures.append(f"expected 21 ADRs, found {adr_count}")

web_requirements = "\n".join(
    p.read_text(encoding="utf-8")
    for p in (root / "02-web/requirements/user-stories").glob("*.md")
)
web_story_ids = re.findall(r"^## (WEB-US-\d{3}) —", web_requirements, re.MULTILINE)
expected_web_story_ids = [f"WEB-US-{i:03d}" for i in range(1, 134)]
if len(web_story_ids) != len(set(web_story_ids)):
    failures.append("Web catalog contains duplicated User Story IDs")
if sorted(web_story_ids, key=lambda item: int(item[-3:])) != expected_web_story_ids:
    failures.append(f"Web catalog is not the contiguous WEB-US-001..WEB-US-133 set: {web_story_ids}")

web_epic_ids = re.findall(r"^# (WEB-EPIC-\d{2}) —", web_requirements, re.MULTILINE)
expected_web_epic_ids = [f"WEB-EPIC-{i:02d}" for i in range(1, 16)]
if sorted(web_epic_ids, key=lambda item: int(item[-2:])) != expected_web_epic_ids:
    failures.append(f"Web catalog is not the contiguous 15-Epic set: {web_epic_ids}")

mobile_requirements = "\n".join(
    p.read_text(encoding="utf-8") for p in (root / "03-mobile/requirements").rglob("*.md")
)
mobile_story_ids = re.findall(r"^## (MOB-US-\d{3}) —", mobile_requirements, re.MULTILINE)
if len(mobile_story_ids) != len(set(mobile_story_ids)):
    failures.append("Mobile catalog contains duplicated User Story IDs")
mobile_story_numbers = sorted(int(item[-3:]) for item in mobile_story_ids)
if (
    not mobile_story_numbers
    or mobile_story_numbers[0] != 1
    or mobile_story_numbers != list(range(1, mobile_story_numbers[-1] + 1))
):
    failures.append(f"Mobile catalog IDs are not contiguous from MOB-US-001: {mobile_story_ids}")

mobile_epic_index = (root / "03-mobile/requirements/epics/README.md").read_text(encoding="utf-8")
mobile_epic_ids = re.findall(r"^\| (MOBILE-EPIC-\d{2}) \|", mobile_epic_index, re.MULTILINE)
expected_mobile_epic_ids = [f"MOBILE-EPIC-{i:02d}" for i in range(1, 13)]
if sorted(mobile_epic_ids, key=lambda item: int(item[-2:])) != expected_mobile_epic_ids:
    failures.append(f"Mobile catalog is not the contiguous 12-Epic set: {mobile_epic_ids}")

mobile_catalog_path = root / "03-mobile/requirements/mobile-v1-catalog.md"
mobile_catalog = mobile_catalog_path.read_text(encoding="utf-8")
mobile_catalog_blocks = {
    match.group(1): match.group(0)
    for match in re.finditer(
        r"^## (MOB-US-\d{3}) — .*?(?=^## MOB-US-|\Z)",
        mobile_catalog,
        re.MULTILINE | re.DOTALL,
    )
}
mobile_generation_ids = {f"MOB-US-{i:03d}" for i in range(1, 74)}
mobile_all_ids = set(mobile_catalog_blocks)
mobile_catalog_numbers = sorted(int(item[-3:]) for item in mobile_all_ids)
if (
    not mobile_catalog_numbers
    or mobile_catalog_numbers[0] != 1
    or mobile_catalog_numbers != list(range(1, mobile_catalog_numbers[-1] + 1))
    or not {f"MOB-US-{i:03d}" for i in range(1, 50)} <= mobile_all_ids
):
    failures.append(f"Mobile canonical catalog must retain contiguous historical IDs from MOB-US-001: found {len(mobile_catalog_blocks)}")
mobile_catalog_order = [
    match.group(1)
    for match in re.finditer(r"^## (MOB-US-\d{3}) —", mobile_catalog, re.MULTILINE)
]
if mobile_catalog_order != [f"MOB-US-{number:03d}" for number in range(1, 74)]:
    failures.append("Mobile canonical story sections must be physically ordered MOB-US-001..073")
for story_id, block in mobile_catalog_blocks.items():
    if re.search(
        r"V1 candidate|V2\s*/\s*deferred|V2 refinement-ready|V3 roadmap-ready|"
        r"no V1 commitment|outside V1|^\| Target Release \||^- Scenario: Deferral —",
        block,
        re.IGNORECASE | re.MULTILINE,
    ):
        failures.append(f"Mobile {story_id} contains obsolete release administration in its current story body")
global_mobile_docs = [
    root / "03-mobile/actors/README.md",
    root / "03-mobile/product/README.md",
    root / "03-mobile/product/applications/README.md",
    root / "03-mobile/product/applications/operations-mobile.md",
    root / "03-mobile/product/applications/buyer-mobile.md",
    root / "03-mobile/capabilities/README.md",
    root / "03-mobile/capabilities/operations/README.md",
    root / "03-mobile/architecture/README.md",
    root / "03-mobile/architecture/technical/README.md",
    root / "03-mobile/architecture/technical/application-architecture.md",
    root / "03-mobile/ux/README.md",
    root / "03-mobile/ux/design/README.md",
    root / "03-mobile/ux/discovery/README.md",
    root / "03-mobile/ux/discovery/research-plan.md",
    root / "03-mobile/ux/discovery/findings.md",
]
global_research_regressions = re.compile(
    r"research\s*[:=]\s*`?PENDING|Product definition is proposed|"
    r"Empty discovery scaffold|add real evidence as it becomes available|"
    r"waits for discovery|no interviews performed|no findings yet",
    re.IGNORECASE,
)
for path in global_mobile_docs:
    if not path.is_file():
        failures.append(f"missing canonical Mobile leaf document: {path.relative_to(root)}")
        continue
    text = path.read_text(encoding="utf-8")
    if global_research_regressions.search(text):
        failures.append(f"global Mobile research regression in {path.relative_to(root)}")

current_mobile_technology_docs = {
    "03-mobile/product/applications/README.md": (
        "ADR-0018", "ADR-0019", "Android/Kotlin/Jetpack Compose TARGET", "Flutter/Dart for Android+iOS TARGET",
    ),
    "03-mobile/product/applications/operations-mobile.md": (
        "ADR-0018", "Android/Kotlin/Jetpack Compose", "does not turn the partial AS-IS evidence into implementation proof",
    ),
    "03-mobile/product/applications/buyer-mobile.md": (
        "ADR-0019", "Flutter/Dart for Android+iOS", "does not prove implementation",
    ),
    "03-mobile/requirements/requirements-status.md": (
        "Client technology", "ACCEPTED TARGET", "Operations = Android/Kotlin/Jetpack Compose", "Buyer = Flutter/Dart for Android+iOS",
    ),
    "03-mobile/requirements/mobile-spike-reconciliation.md": (
        "SPIKE-002", "CLOSED / SUPERSEDED", "unrelated device/provider research remains OPEN",
    ),
    "03-mobile/requirements/mobile-technical-reconciliation.md": (
        "Client technology is already accepted", "framework assignment is closed by ADR-0018/ADR-0019",
    ),
    "03-mobile/requirements/story-to-design-readiness.md": (
        "Client technology is already accepted by ADR-0018", "Accepted client technology does not prove",
    ),
}
academic_mobile_technology_docs = {
    "90-academic/mobile/course-1acc0238/README.md": (
        "Operations Android / Kotlin / Jetpack Compose accepted TARGET by ADR-0018",
        "Flutter/Dart accepted TARGET by ADR-0019",
        "CLOSED / SUPERSEDED",
        "unrelated device/provider research remains OPEN",
    ),
    "90-academic/mobile/course-1acc0238/architecture-projection.md": (
        "Operations Mobile is the accepted TARGET Android/Kotlin/Jetpack Compose",
        "Buyer Mobile is the accepted TARGET Flutter/Dart Android+iOS",
        "CLOSED / SUPERSEDED",
        "Technology selection is not implementation proof",
    ),
    "90-academic/mobile/course-1acc0238/rubric-compliance.md": (
        "Operations Android/Kotlin/Jetpack Compose is accepted TARGET by ADR-0018",
        "Buyer Mobile uses Flutter/Dart for Android+iOS by ADR-0019",
        "Framework selection is closed by ADR-0018",
    ),
    "90-academic/mobile/course-1acc0238/implementation-evidence-plan.md": (
        "Operations Android/Kotlin/Jetpack Compose is accepted TARGET by ADR-0018",
        "Buyer Flutter/Dart Android+iOS is accepted TARGET by ADR-0019",
        "CLOSED / SUPERSEDED",
    ),
    "90-academic/mobile/course-1acc0238/milestone-plan.md": (
        "Operations Android/Kotlin/Jetpack Compose is accepted TARGET by ADR-0018",
        "Buyer Flutter/Dart baselines",
        "CLOSED / SUPERSEDED",
    ),
    "90-academic/mobile/course-1acc0238/bibliography-evidence-plan.md": (
        "Kotlin/Android/Jetpack Compose for Operations",
        "Flutter/Dart for Buyer",
        "historical evaluated provenance only",
    ),
}
construction_document_contracts = {
    "01-shared/architecture/technology-baseline.md": (
        "Kotlin `2.4.x`", "Compose BOM `2026.09.00`", "Hilt", "Navigation 3",
        "CameraX", "ML Kit Barcode Scanning", "bundled model", "manual",
        "WorkManager", "provider", "go_router", "Swift Package Manager", "CocoaPods",
    ),
    "03-mobile/capabilities/operations/camera.md": (
        "TARGET DEFINED", "IMPLEMENTATION NOT YET VERIFIED", "CameraX",
        "ML Kit Barcode Scanning bundled model", "manual", "EAN", "UPC", "QR",
    ),
    "03-mobile/architecture/technical/dependency-injection-and-navigation.md": (
        "Hilt", "Navigation", "provider", "go_router",
    ),
    "03-mobile/architecture/technical/local-storage.md": (
        "Android Keystore", "DataStore", "Room", "WorkManager",
    ),
    "03-mobile/architecture/technical/performance-and-observability.md": (
        "Baseline Profiles", "Macrobenchmark", "profile/release mode", "Flutter DevTools",
    ),
}
stale_mobile_framework_patterns = (
    r"\bno framework (?:is )?selected\b",
    r"\bframework open\b",
    r"\bProduct architecture choice remains OPEN\b",
    r"\bfinal canonical cross-platform framework\b",
    r"\bnot a final canonical framework assignment\b",
    r"\bunresolved client strategy\b",
    r"\bframework selection (?:remains )?OPEN\b",
    r"\bfinal framework choice remains OPEN\b",
    r"\bEvaluate Flutter/Dart vs KMP\b",
    r"\bFlutter/Dart\s+or\s+Kotlin Multiplatform/Kotlin.*(?:choice|selection)\s+OPEN\b",
)
for relative, markers in {**current_mobile_technology_docs, **academic_mobile_technology_docs}.items():
    source = root / relative
    if not source.is_file():
        failures.append(f"missing current Mobile technology source: {relative}")
        continue
    text = source.read_text(encoding="utf-8")
    normalized_text = re.sub(r"\s+", " ", text)
    for marker in markers:
        if marker not in normalized_text:
            failures.append(f"{relative} missing accepted Mobile technology marker {marker!r}")
    for pattern in stale_mobile_framework_patterns:
        if re.search(pattern, normalized_text, re.IGNORECASE):
            failures.append(f"{relative} reopens accepted Mobile framework selection: {pattern}")
for relative, markers in construction_document_contracts.items():
    source = root / relative
    if not source.is_file():
        failures.append(f"missing construction-readiness primary file: {relative}")
        continue
    normalized_text = re.sub(r"\s+", " ", source.read_text(encoding="utf-8"))
    for marker in markers:
        if marker not in normalized_text:
            failures.append(f"{relative} missing accepted construction marker {marker!r}")
research_plan = (root / "03-mobile/ux/discovery/research-plan.md").read_text(encoding="utf-8")
findings = (root / "03-mobile/ux/discovery/findings.md").read_text(encoding="utf-8")
for required in ("9/9", "n=3", "77895a8950676ccdaec520a61c41107852268606", "SOLUTION", "OPEN"):
    present = required in research_plan.upper() if required in {"SOLUTION", "OPEN"} else required in research_plan
    if not present:
        failures.append(f"Needfinding research plan missing boundary: {required}")
for required in ("Warehouse & Dispatch Operations", "Driver Delivery Execution", "B2B Buyers", "3/3", "2/3", "1/3"):
    if required not in findings:
        failures.append(f"Needfinding findings missing source-supported segment evidence: {required}")
mobile_master = (root / "03-mobile/requirements/master-mobile-backlog.md").read_text(encoding="utf-8")
mobile_master_rows = [
    [cell.strip() for cell in line.strip("|").split("|")]
    for line in mobile_master.splitlines()
    if re.match(r"^\| MOB-US-\d{3} \|", line)
]
mobile_v4_ids = {
    row[0] for row in mobile_master_rows
    if len(row) > 5 and row[5] == "V4_FUTURE"
}
mobile_band_by_id = {
    row[0]: row[5] for row in mobile_master_rows if len(row) > 5
}
for story_id, block in mobile_catalog_blocks.items():
    status = re.search(r"^\| Status \|\s*([^|]+?)\s*\|$", block, re.MULTILINE)
    status_value = status.group(1).strip() if status else ""
    if status_value not in {"DEFERRED", "PLANNED"}:
        failures.append(f"Mobile story has invalid baseline status: {story_id}")
mobile_epic_map = {}
for line in mobile_epic_index.splitlines():
    if line.startswith("| MOBILE-EPIC-"):
        cells = [cell.strip() for cell in line.strip("|").split("|")]
        if len(cells) >= 8:
            mobile_epic_map[cells[0]] = set(re.findall(r"MOB-US-\d{3}", cells[7]))
for story_id, block in mobile_catalog_blocks.items():
    epic_match = re.search(r"^\| Epic \|\s*(MOBILE-EPIC-\d{2})", block, re.MULTILINE)
    epic_id = epic_match.group(1) if epic_match else ""
    if story_id not in mobile_epic_map.get(epic_id, set()):
        failures.append(f"Mobile {story_id} has incorrect outcome Epic mapping")
    if story_id in mobile_generation_ids:
        functional = " ".join(
            value.group(1) for value in re.finditer(
                r"^\| (?:Title|Goal / Outcome) \|\s*(.*?)\s*\|$", block, re.MULTILINE
            )
        )
        if re.search(r"\b(?:api|http|endpoint|database|table|schema|ui|ux|screen|component|client|server|idempotenc\w*|synchron\w*|sync)\b", functional, re.IGNORECASE):
            failures.append(f"Mobile {story_id} functional fields contain engineering language")
    if story_id == "MOB-US-044" and "Push Subscription" in block:
        failures.append("MOB-US-044 must expose a human delivery-attention need, not Push Subscription")

def validate_story_blocks(label, text, prefix, mobile=False):
    blocks = list(re.finditer(
        rf"^## ({prefix}-\d{{3}}) — .*?(?=^## {prefix}-|\Z)",
        text,
        re.MULTILINE | re.DOTALL,
    ))
    required_fields = (
        "ID", "Status", "Product", "Surface", "Actor", "Epic",
        "Priority", "Title", "Owning Bounded Context",
    )
    internal_only_actors = {
        "Nexa Commercial & Onboarding Staff",
        "Company Owner",
        "Business Operations Manager",
        "Tenant Administrator",
        "Sales Representative",
        "Warehouse Operator",
        "Dispatch Coordinator",
        "Authorized Workforce Actor",
        "Authorized Commercial Actor",
        "Authorized Financial Actor",
        "Authorized Payment Actor",
        "Authorized Actor",
        "Privileged Actor",
    }
    for match in blocks:
        story_id, block = match.group(1), match.group(0)
        for field in required_fields:
            field_match = re.search(
                rf"^\| {re.escape(field)} \|\s*(.*?)\s*\|$",
                block,
                re.MULTILINE,
            )
            if not field_match or not field_match.group(1).strip():
                failures.append(f"{label} {story_id} missing required field: {field}")

        statement = re.search(
            r"^### User Story\s*\n\s*"
            r"As (?:a|an) .+?,\s*\n"
            r"I want .+?,\s*\n"
            r"so that .+?\s*$",
            block,
            re.MULTILINE,
        )
        if not statement:
            failures.append(f"{label} {story_id} missing complete User Story statement")
        if re.search(r"^As a Authorized\b", block, re.MULTILINE):
            failures.append(f"{label} {story_id} has invalid grammatical prefix: As a Authorized")

        if mobile:
            acceptance = re.search(
                r"^### Acceptance Criteria\s*\n(?P<criteria>.*?)(?=^## MOB-US-|\Z)",
                block,
                re.MULTILINE | re.DOTALL,
            )
            criteria_count = (
                len(re.findall(r"^- ", acceptance.group("criteria"), re.MULTILINE))
                if acceptance
                else 0
            )
            band = mobile_band_by_id.get(story_id)
            if band == "V1":
                if not acceptance or criteria_count < 3:
                    failures.append(f"Historical V1 story requires at least three acceptance criteria: {story_id}")
            elif story_id in mobile_v4_ids:
                if not re.search(r"^### Outcome Conditions\s*$", block, re.MULTILINE):
                    failures.append(f"Mobile V4/Future story requires outcome conditions: {story_id}")
            elif not acceptance or criteria_count < 1:
                failures.append(f"Historical roadmap story requires acceptance criteria: {story_id}")

        surface_match = re.search(r"^\| Surface \|\s*(.*?)\s*\|$", block, re.MULTILINE)
        actor_match = re.search(r"^\| Actor \|\s*(.*?)\s*\|$", block, re.MULTILINE)
        if surface_match and actor_match:
            surface = surface_match.group(1).strip()
            actor = actor_match.group(1).strip()
            if (
                not mobile
                and "Buyer Portal" in surface
                and actor in internal_only_actors
            ):
                failures.append(
                    f"{label} {story_id} assigns Buyer Portal to internal-only actor: {actor}"
                )

        if mobile and not re.search(
            r"^\| Research status \|\s*(?:NOT_REQUIRED|PENDING|RESEARCHING|RESEARCH EVIDENCE AVAILABLE)\s*\|$",
            block,
            re.MULTILINE,
        ):
            failures.append(f"Mobile story lacks a controlled research status: {story_id}")

validate_story_blocks("Web", web_requirements, "WEB")
validate_story_blocks("Mobile", mobile_requirements, "MOB-US", mobile=True)

technical_text = (root / "01-shared/product/requirements/technical-stories.md").read_text(encoding="utf-8")
technical_ids = re.findall(r"^## (TS-\d{3}) —", technical_text, re.MULTILINE)
expected_technical_ids = [f"TS-{i:03d}" for i in range(1, 21)]
if technical_ids != expected_technical_ids:
    failures.append(f"Technical catalog is not the contiguous TS-001..TS-020 set: {technical_ids}")

spike_text = (root / "01-shared/product/requirements/spike-stories.md").read_text(encoding="utf-8")
spike_ids = re.findall(r"^## (SPIKE-\d{3}) —", spike_text, re.MULTILINE)
expected_spike_ids = [f"SPIKE-{i:03d}" for i in range(1, 7)]
if spike_ids != expected_spike_ids:
    failures.append(f"Spike catalog is not the contiguous SPIKE-001..SPIKE-006 set: {spike_ids}")

total_items = len(web_story_ids) + len(mobile_story_ids) + len(technical_ids) + len(spike_ids)
if total_items <= 0:
    failures.append("requirement inventory is empty")

accepted_contexts = {
    "BC-01 — Tenant & Access Governance",
    "BC-02 — Customer & Buyer Relationships",
    "BC-03 — Catalog & Commercial Policy",
    "BC-04 — Sales Commitment",
    "BC-05 — Inventory Availability",
    "BC-06 — Fulfillment & Delivery",
    "BC-07 — Credit & Receivables",
    "BC-08 — Payments",
    "BC-09 — Business Documents",
    "BC-10 — Notifications",
    "BC-11 — Business Traceability",
}
context_values = re.findall(
    r"^\| (?:Owning Bounded Context|Relevant Bounded Contexts) \| (.+?) \|$",
    web_requirements + "\n" + mobile_requirements,
    re.MULTILINE,
)
for value in context_values:
    for context in value.split(";"):
        context = context.strip()
        if context not in accepted_contexts:
            failures.append(f"requirement references non-canonical Bounded Context: {context}")

if failures:
    print("BLUEPRINT VALIDATION: FAIL")
    for item in failures:
        print(f"- {item}")
    sys.exit(1)
print("BLUEPRINT VALIDATION: PASS")
print(f"- candidate files inspected: {len(paths)}")
print("- links, metadata, publication boundary, secret heuristics and C4 workspace: PASS")
for warning in warnings:
    print(f"- WARNING: {warning}")
PY

bash tooling/scripts/validate-mobile-master-backlog.sh

bash tooling/scripts/validate-academic-mobile.sh

docker run --rm \
  -v "$ROOT/01-shared/architecture/c4/structurizr:/usr/local/structurizr:ro" \
  structurizr/structurizr:2026.06.28 validate \
  -workspace /usr/local/structurizr/workspace.dsl

echo "STRUCTURIZR DSL VALIDATION: PASS"

GENERATED_DIR="$(mktemp -d)"
# Docker image writes generated JSON as its container user; grant access only to
# this ephemeral validation directory.
chmod 777 "$GENERATED_DIR"
docker run --rm \
  -v "$ROOT/01-shared/architecture/c4/structurizr:/usr/local/structurizr:ro" \
  -v "$GENERATED_DIR:/generated" \
  structurizr/structurizr:2026.06.28 export \
  -workspace /usr/local/structurizr/workspace.dsl \
  -format json \
  -output /generated

python3 tooling/scripts/compare-structurizr-semantic.py \
  "$GENERATED_DIR/workspace.json" \
  "$ROOT/01-shared/architecture/c4/structurizr/generated/workspace.json"

bash tooling/scripts/validate-tactical-data-model.sh
