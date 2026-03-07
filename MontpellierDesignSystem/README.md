# MontpellierDesignSystem

A reusable SwiftUI design system for consistent UI across all apps.

**Requirements:** iOS 18+, Swift 6.0+

## Structure

```
MontpellierDesignSystem/
├── Tokens/          # DSColor, DSSpacing, DSRadius, DSTypography, DSShadow
├── Components/      # Buttons, cards, banners, badges, progress indicators
├── Layout/          # DSScreen, DSSection, DSAccordionSection
├── Utilities/       # Color+Hex
├── PreviewData/     # Shared preview data
└── Previews/        # ComponentPreviews, LayoutPreviews, PatternPreviews
```

## Components

| Component | Description |
|-----------|-------------|
| `DSCard` | Rounded card container with shadow |
| `DSListItem` | Row with title, optional subtitle and trailing value |
| `DSSummaryTile` | Metric tile with label and value, built on `DSCard` |
| `DSPrimaryButton` | Full-width primary CTA; supports icon and loading state |
| `DSSecondaryButton` | Outlined secondary action button; supports icon |
| `DSBanner` | Contextual status banner — success, warning, error, info, neutral |
| `DSIconTile` | Rounded SF Symbol icon container with tinted background |
| `DSStatusDot` | Small filled circle for inline status indication |
| `DSBadge` | Pill label for tags, scores, and tier markers; supports icon |
| `DSProgressBar` | Horizontal animated progress bar |
| `DSProgressRing` | Circular progress ring with a `@ViewBuilder` centre label |

## Layout

| Component | Description |
|-----------|-------------|
| `DSScreen` | Root screen wrapper — scrollable, padded, system background |
| `DSSection` | Labelled content group with optional uppercased title |
| `DSAccordionSection` | Collapsible section with animated expand/collapse and sticky header |

## Tokens

| Token | Purpose |
|-------|---------|
| `DSColor` | Brand, surface, text, semantic, and score-status colours |
| `DSSpacing` | Padding and gap values (`xs` → `xl`) |
| `DSRadius` | Corner radii (`xs` → `lg`) |
| `DSTypography` | Font styles (`caption` → `largeTitle`, `bodyBold`, `numeric`) |
| `DSShadow` | Shadow presets (`subtle`) |

## Usage

```swift
import MontpellierDesignSystem

struct DashboardView: View {
    var body: some View {
        DSScreen {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                DSSummaryTile(title: "Score", value: "87")
                DSSummaryTile(title: "Issues", value: "3")
            }

            DSSection(title: "Alerts") {
                DSBanner(
                    title: "Disk usage high",
                    message: "84 GB of 128 GB used.",
                    icon: "exclamationmark.triangle.fill",
                    style: .warning
                )
            }

            DSPrimaryButton(title: "Run scan", icon: "magnifyingglass") {
                // action
            }
        }
    }
}
```

## Rules

See `DESIGN_RULES.md` for the full set of UI rules to follow when generating code.
