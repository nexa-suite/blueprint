#!/usr/bin/env python3
"""Compare semantic Structurizr content while ignoring generated IDs/layout."""

import json
import sys
from pathlib import Path


def load(path: str):
    return json.loads(Path(path).read_text(encoding="utf-8"))


def signature(workspace):
    model = workspace["model"]
    nodes = {}
    entities = {
        "people": [],
        "softwareSystems": [],
        "containers": [],
        "components": [],
        "deploymentNodes": [],
    }

    for person in model.get("people", []):
        nodes[str(person["id"])] = ("person", person["name"])
        entities["people"].append({
            "name": person["name"],
            "description": person.get("description", ""),
            "tags": sorted(person.get("tags", "").split(",")),
        })

    for system in model.get("softwareSystems", []):
        nodes[str(system["id"])] = ("softwareSystem", system["name"])
        entities["softwareSystems"].append({
            "name": system["name"],
            "description": system.get("description", ""),
            "tags": sorted(system.get("tags", "").split(",")),
        })
        for container in system.get("containers", []):
            nodes[str(container["id"])] = (
                "container", f"{system['name']}::{container['name']}"
            )
            entities["containers"].append({
                "system": system["name"],
                "name": container["name"],
                "description": container.get("description", ""),
                "technology": container.get("technology", ""),
                "tags": sorted(container.get("tags", "").split(",")),
            })
            for component in container.get("components", []):
                nodes[str(component["id"])] = (
                    "component", f"{system['name']}::{container['name']}::{component['name']}"
                )
                entities["components"].append({
                    "system": system["name"],
                    "container": container["name"],
                    "name": component["name"],
                    "description": component.get("description", ""),
                    "technology": component.get("technology", ""),
                    "tags": sorted(component.get("tags", "").split(",")),
                })

    relationships = []
    for person in model.get("people", []):
        relationships.extend((str(person["id"]), r) for r in person.get("relationships", []))
    for system in model.get("softwareSystems", []):
        relationships.extend((str(system["id"]), r) for r in system.get("relationships", []))
        for container in system.get("containers", []):
            relationships.extend((str(container["id"]), r) for r in container.get("relationships", []))
            for component in container.get("components", []):
                relationships.extend((str(component["id"]), r) for r in component.get("relationships", []))

    def node_name(node_id):
        return nodes.get(str(node_id), ("unknown", str(node_id)))[1]

    relation_by_id = {}

    def relation_value(source_id, relation):
        value = {
            "source": node_name(source_id),
            "destination": node_name(relation.get("destinationId")),
            "description": relation.get("description", ""),
            "technology": relation.get("technology", ""),
            "tags": sorted(relation.get("tags", "").split(",")),
        }
        if relation.get("id") is not None:
            relation_by_id[str(relation["id"])] = value
        return value

    relation_signature = [
        relation_value(source_id, relation)
        for source_id, relation in relationships
    ]
    entities["relationships"] = sorted(relation_signature, key=lambda x: tuple(x.values()))

    deployment_relationships = []

    def deployment_path(path, name):
        return " / ".join((*path, name))

    def visit_deployment(node, path=()):
        name = node.get("name", "")
        current_path = deployment_path(path, name)
        environment = node.get("environment", "")
        node_label = f"deploymentNode::{environment}::{current_path}::{node.get('technology', '')}"
        if node.get("id") is not None:
            nodes[str(node["id"])] = ("deploymentNode", node_label)

        containers = []
        for instance in node.get("containerInstances", []):
            label = f"containerInstance::{environment}::{current_path}::{node_name(instance.get('containerId'))}"
            if instance.get("id") is not None:
                nodes[str(instance["id"])] = ("containerInstance", label)
            containers.append({
                "container": node_name(instance.get("containerId")),
                "instanceId": instance.get("instanceId"),
                "tags": sorted(instance.get("tags", "").split(",")),
            })

        systems = []
        for instance in node.get("softwareSystemInstances", []):
            label = f"softwareSystemInstance::{environment}::{current_path}::{node_name(instance.get('softwareSystemId'))}"
            if instance.get("id") is not None:
                nodes[str(instance["id"])] = ("softwareSystemInstance", label)
            systems.append({
                "softwareSystem": node_name(instance.get("softwareSystemId")),
                "instanceId": instance.get("instanceId"),
                "tags": sorted(instance.get("tags", "").split(",")),
            })

        infrastructure = []
        for item in node.get("infrastructureNodes", []):
            label = f"infrastructureNode::{environment}::{current_path}::{item.get('name', '')}::{item.get('technology', '')}"
            if item.get("id") is not None:
                nodes[str(item["id"])] = ("infrastructureNode", label)
            infrastructure.append({
                "name": item.get("name", ""),
                "description": item.get("description", ""),
                "technology": item.get("technology", ""),
                "tags": sorted(item.get("tags", "").split(",")),
            })

        children = [visit_deployment(child, (*path, name)) for child in node.get("children", [])]
        return {
            "name": name,
            "description": node.get("description", ""),
            "technology": node.get("technology", ""),
            "environment": environment,
            "containerInstances": sorted(containers, key=lambda item: tuple(item.values())),
            "softwareSystemInstances": sorted(systems, key=lambda item: tuple(item.values())),
            "infrastructureNodes": sorted(infrastructure, key=lambda item: tuple(item.values())),
            "children": sorted(children, key=lambda item: (item["name"], item["technology"])),
        }

    deployment_signatures = [visit_deployment(node) for node in model.get("deploymentNodes", [])]
    entities["deploymentNodes"] = sorted(
        deployment_signatures,
        key=lambda item: (item["environment"], item["name"], item["technology"]),
    )

    def collect_deployment_relationships(node):
        for collection in ("containerInstances", "softwareSystemInstances", "infrastructureNodes"):
            for item in node.get(collection, []):
                for relation in item.get("relationships", []):
                    deployment_relationships.append(relation_value(item.get("id"), relation))
        for child in node.get("children", []):
            collect_deployment_relationships(child)

    for node in model.get("deploymentNodes", []):
        collect_deployment_relationships(node)
    entities["deploymentRelationships"] = sorted(
        deployment_relationships,
        key=lambda item: tuple(item.values()),
    )

    views = {}
    view_groups = (
        "systemContextViews",
        "containerViews",
        "componentViews",
        "deploymentViews",
    )
    for group in view_groups:
        for view in workspace.get("views", {}).get(group, []):
            view_signature = {
                "group": group,
                "name": view.get("name", ""),
                "description": view.get("description", ""),
                "environment": view.get("environment", ""),
                "elements": sorted(nodes.get(str(e["id"]), ("unknown", str(e["id"])))[1] for e in view.get("elements", [])),
                "relationships": [],
            }
            for rel in view.get("relationships", []):
                if rel.get("sourceId") is None and rel.get("id") is not None:
                    view_signature["relationships"].append(
                        relation_by_id.get(str(rel["id"]), {"id": str(rel["id"])})
                    )
                else:
                    view_signature["relationships"].append({
                        "source": node_name(rel.get("sourceId")),
                        "destination": node_name(rel.get("destinationId")),
                        "description": rel.get("description", ""),
                        "technology": rel.get("technology", ""),
                    })
            view_signature["relationships"].sort(key=lambda x: tuple(x.values()))
            views[view["key"]] = view_signature
    entities["views"] = views
    return entities


if len(sys.argv) != 3:
    print("usage: compare-structurizr-semantic.py GENERATED.json COMMITTED.json", file=sys.stderr)
    sys.exit(2)

generated = signature(load(sys.argv[1]))
committed = signature(load(sys.argv[2]))
if generated != committed:
    print("STRUCTURIZR SEMANTIC EQUIVALENCE: FAIL")
    for key in generated:
        if generated[key] != committed.get(key):
            print(f"- semantic difference: {key}")
    sys.exit(1)

print("STRUCTURIZR SEMANTIC EQUIVALENCE: PASS")
