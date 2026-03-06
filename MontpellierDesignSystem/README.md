# MontpellierDesignSystem

A reusable SwiftUI design system for consistent UI across all apps.

## Structure

```
MontpellierDesignSystem/
├── Tokens/          # DSColor, DSSpacing, DSRadius, DSTypography, DSShadow
├── Components/      # DSCard, DSPrimaryButton, DSSummaryTile, DSListItem
├── Layout/          # DSScreen, DSSection
├── Utilities/       # Color+Hex
├── PreviewData/     # Shared preview data
└── Previews/        # SwiftUI previews per category
```

## Usage

```swift
import SwiftUI

struct DashboardView: View {
    var body: some View {
        DSScreen {
            Text("Overview")
                .font(DSTypography.hero)

            HStack {
                DSSummaryTile(title: "Spent", value: "£640")
                DSSummaryTile(title: "Remaining", value: "£360")
            }

            DSPrimaryButton(title: "Add Transaction") {
                // action
            }
        }
    }
}
```

## Rules

See `DESIGN_RULES.md` for the full set of UI rules Claude must follow when generating code.
