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
    entities = {"people": [], "softwareSystems": [], "containers": [], "components": []}

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

    relation_signature = []
    for source_id, relation in relationships:
        source = nodes.get(source_id, ("unknown", source_id))[1]
        destination = nodes.get(str(relation["destinationId"]), ("unknown", str(relation["destinationId"])))[1]
        relation_signature.append({
            "source": source,
            "destination": destination,
            "description": relation.get("description", ""),
            "technology": relation.get("technology", ""),
            "tags": sorted(relation.get("tags", "").split(",")),
        })
    entities["relationships"] = sorted(relation_signature, key=lambda x: tuple(x.values()))

    views = {}
    view_groups = ("systemContextViews", "containerViews", "componentViews")
    for group in view_groups:
        for view in workspace.get("views", {}).get(group, []):
            view_signature = {
                "group": group,
                "elements": sorted(nodes.get(str(e["id"]), ("unknown", str(e["id"])))[1] for e in view.get("elements", [])),
                "relationships": [],
            }
            for rel in view.get("relationships", []):
                source = nodes.get(str(rel.get("sourceId")), ("unknown", str(rel.get("sourceId"))))[1]
                destination = nodes.get(str(rel.get("destinationId")), ("unknown", str(rel.get("destinationId"))))[1]
                view_signature["relationships"].append({
                    "source": source,
                    "destination": destination,
                    "description": rel.get("description", ""),
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
