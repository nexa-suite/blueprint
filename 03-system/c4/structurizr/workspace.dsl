workspace "Nexa Suite" "Canonical Nexa C4 L1/L2 web baseline plus proposed Mobile projections" {
    !identifiers hierarchical
    model {
        !include model/people.dsl
        !include model/systems.dsl
        !include model/containers.dsl
        !include model/relationships.dsl
    }
    views {
        !include levels/l1-system-context/views.dsl
        !include levels/l2-containers/views.dsl
        !include levels/l3-components/views.dsl
        !include styles/styles.dsl
    }
}
