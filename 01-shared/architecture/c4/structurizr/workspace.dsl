workspace "Nexa Suite" "Canonical Nexa C4 L1/L2 web baseline plus proposed Mobile projections" {
    !identifiers hierarchical
    model {
        !include model/people.dsl
        !include model/systems.dsl
        !include model/containers.dsl
        !include model/components.dsl
        !include model/relationships.dsl
    }
    views {
        !include l1/l1.dsl
        !include l2/l2.dsl
        !include l3/api.dsl
        !include l3/platform.dsl
        !include l3/portal.dsl
        !include l3/website.dsl
        !include l3/operations-mobile.dsl
        !include l3/buyer-mobile.dsl
        !include styles/styles.dsl
    }
}
