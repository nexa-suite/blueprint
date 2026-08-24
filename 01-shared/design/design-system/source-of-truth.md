# Design System Source of Truth

Blueprint owns shared policy. Design Lab owns executable visual evidence.

Current Design Lab reference: `d27e158569211a3afec171b1c9606f06906fc99a`;
repository: [nexa-suite/design-lab](https://github.com/nexa-suite/design-lab).
Design Lab v1.0.1 is Angular-focused and exposes `projects/nexa-ui` as its
public consumption boundary. It is not Product, domain or application runtime
authority.

Web and future Mobile implementations may use different renderers, but must
preserve shared semantic intent. A token or component becomes shared only when
documented here and exposed through an approved consumption boundary.

Contribution: propose policy in Blueprint, prove visual behavior in Design Lab,
review accessibility and responsive states, then record adoption status.
