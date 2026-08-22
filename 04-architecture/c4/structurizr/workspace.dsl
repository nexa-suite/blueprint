workspace "Nexa Suite" "Nexa C4 L1/L2 V1 baseline and Architecture Runway" {
    !identifiers hierarchical
    model {
        !include model/people.dsl
        !include model/nexa.dsl
        !include model/external-systems.dsl
        !include model/relationships-v1.dsl
        !include model/relationships-runway.dsl
        !include model/relationships-components.dsl
    }

    views {
        !include views/v1.dsl
        !include views/runway.dsl
        !include views/components.dsl
        !include styles/styles.dsl
    }
}
