#!/usr/bin/env python3
"""Generate deterministic TARGET master SQL and PlantUML ERD projections."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

BC_SQL = sorted(
    ROOT.glob(
        "01-shared/domain/bounded-contexts/BC-*/data/target-relational-model.sql"
    )
)
MASTER_SQL = ROOT / "01-shared/data/master-target-relational-model.sql"
SHARED_SQL = ROOT / "01-shared/data/shared-technical-target-relational-model.sql"

MASTER_HEADER = """-- NEXA TARGET V1 MASTER RELATIONAL MODEL
-- TARGET / shared PostgreSQL / logical BC ownership / no schema-per-BC assumption
-- Generated from the reviewed per-BC SQL lenses plus shared technical infrastructure.
"""


def parse_sql(path: Path) -> tuple[list[dict], list[tuple[str, str, str]]]:
    text = path.read_text(encoding="utf-8")
    tables: list[dict] = []
    relationships: list[tuple[str, str, str]] = []
    pattern = re.compile(
        r"(?ims)^\s*CREATE\s+TABLE\s+([a-z][a-z0-9_]*)\s*\((.*?)^\s*\);"
    )
    for match in pattern.finditer(text):
        table_name = match.group(1)
        body = match.group(2)
        columns: list[dict] = []
        primary_keys: set[str] = set()
        foreign_key_columns: set[str] = set()
        column_lines: dict[str, str] = {}
        for raw_line in body.splitlines():
            line = raw_line.strip().rstrip(",")
            if not line or line.startswith("--"):
                continue
            if re.match(
                r"(?i)^(CONSTRAINT|PRIMARY KEY|UNIQUE|CHECK|FOREIGN KEY|REFERENCES)\b",
                line,
            ):
                pk = re.search(r"(?i)PRIMARY KEY\s*\(([^)]+)\)", line)
                if pk:
                    primary_keys.update(c.strip() for c in pk.group(1).split(","))
                continue
            column = re.match(r"^([a-z][a-z0-9_]*)\s+(.+)$", line, re.I)
            if not column:
                continue
            name, definition = column.groups()
            column_lines[name] = definition
            if re.search(r"(?i)\bPRIMARY KEY\b", definition):
                primary_keys.add(name)

            foreign_key = re.search(
                r"(?i)\bREFERENCES\s+([a-z][a-z0-9_]*)\s*\(\s*([a-z][a-z0-9_]*)\s*\)",
                definition,
            )
            if foreign_key:
                relationships.append((table_name, foreign_key.group(1), name))
                foreign_key_columns.add(name)

        for foreign_key in re.finditer(
            r"(?is)FOREIGN\s+KEY\s*\(([^)]+)\)\s*REFERENCES\s+([a-z][a-z0-9_]*)\s*\(([^)]+)\)",
            body,
        ):
            local_columns = [column.strip() for column in foreign_key.group(1).split(",")]
            relationships.append((table_name, foreign_key.group(2), ", ".join(local_columns)))
            foreign_key_columns.update(local_columns)

        for name, definition in column_lines.items():
            type_match = re.match(
                r"(?i)(uuid|varchar(?:\([^)]*\))?|char(?:\([^)]*\))?|numeric(?:\([^)]*\))?|timestamptz|timestamp|boolean|integer|bigint|text|jsonb|decimal(?:\([^)]*\))?)",
                definition,
            )
            data_type = type_match.group(1) if type_match else "value"
            markers = []
            if name in primary_keys:
                markers.append("PK")
            if name in foreign_key_columns or re.search(r"(?i)\bREFERENCES\b", definition):
                markers.append("FK")
            if re.search(r"(?i)\bNOT NULL\b", definition):
                markers.append("required")
            columns.append({"name": name, "type": data_type, "markers": markers})
        tables.append({"name": table_name, "columns": columns})
    return tables, relationships


def safe_alias(name: str) -> str:
    return f"t_{name}"


def render(title: str, scope: str, tables: list[dict], relationships: list[tuple[str, str, str]]) -> str:
    names = {table["name"] for table in tables}
    lines = [
        "@startuml",
        f"title {title}",
        "left to right direction",
        "hide methods",
        "skinparam shadowing false",
        "skinparam linetype ortho",
        "skinparam entity {",
        "  BackgroundColor #F8FAFC",
        "  BorderColor #334155",
        "  FontColor #0F172A",
        "}",
        "",
    ]
    for table in tables:
        lines.append(f'entity "{table["name"]}" as {safe_alias(table["name"])} {{')
        for column in table["columns"]:
            markers = f" <<{', '.join(column['markers'])}>>" if column["markers"] else ""
            prefix = "* " if "PK" in column["markers"] or "required" in column["markers"] else "  "
            lines.append(f"  {prefix}{column['name']} : {column['type']}{markers}")
        lines.append("}")
        lines.append("")
    for source, target, column in relationships:
        if source in names and target in names:
            lines.append(
                f"{safe_alias(source)} }}o--|| {safe_alias(target)} : {column}"
            )
    lines.extend(
        [
            "",
            "legend right",
            f"TARGET / {scope} / SQL is the authority",
            "PK = primary key | FK = same-owner foreign key",
            "required = NOT NULL | cross-BC IDs are deliberately not FK",
            "This PlantUML file is a visual projection for review.",
            "endlegend",
            "@enduml",
            "",
        ]
    )
    return "\n".join(lines)


def write_projection(sql_path: Path, output: Path, title: str, scope: str) -> None:
    tables, relationships = parse_sql(sql_path)
    output.write_text(render(title, scope, tables, relationships), encoding="utf-8")


def render_master_sql() -> str:
    sources = [*BC_SQL, SHARED_SQL]
    return MASTER_HEADER + "\n\n".join(
        source.read_text(encoding="utf-8").strip() for source in sources
    ) + "\n"


def main() -> None:
    check = "--check" in sys.argv[1:]
    unexpected = set(sys.argv[1:]) - {"--check"}
    if unexpected:
        raise SystemExit(f"unsupported argument(s): {', '.join(sorted(unexpected))}")

    expected_master = render_master_sql()
    if not MASTER_SQL.is_file() or MASTER_SQL.read_text(encoding="utf-8") != expected_master:
        if check:
            raise SystemExit(
                "master TARGET SQL diverges from deterministic per-BC + shared sources; "
                "run tooling/scripts/generate-target-database-diagrams.py"
            )
        MASTER_SQL.write_text(expected_master, encoding="utf-8")

    if check:
        return

    for sql_path in BC_SQL:
        bc_dir = sql_path.parent.parent
        bc_code = bc_dir.name[:5]
        output = bc_dir / "data/database-diagram.puml"
        write_projection(
            sql_path,
            output,
            f"{bc_code} Target Database Diagram",
            f"{bc_code} logical relational ownership",
        )

    write_projection(
        MASTER_SQL,
        ROOT / "01-shared/data/master-database-diagram.puml",
        "Nexa Target Master Database Diagram",
        "shared PostgreSQL / 11 BC + Shared Technical",
    )


if __name__ == "__main__":
    main()
