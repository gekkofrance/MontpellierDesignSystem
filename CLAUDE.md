# Claude Instructions

This project uses the MontpellierDesignSystem for all UI.

When generating SwiftUI code:

1. Import MontpellierDesignSystem
2. Never hardcode colors, spacing, fonts, or radius
3. Always use tokens from MontpellierDesignSystem/Tokens
4. Use layout containers from MontpellierDesignSystem/Layout
5. Use reusable components from MontpellierDesignSystem/Components
6. Screens must use DSScreen
7. Prefer cards for grouped content
8. Maintain generous spacing
9. Avoid nested stacks deeper than 3 levels

Before generating UI code, read:
`design-system/MontpellierDesignSystem/DESIGN_RULES.md`

This ensures Claude consistently applies the design system.
