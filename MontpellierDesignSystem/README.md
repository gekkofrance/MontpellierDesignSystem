# MontpellierDesignSystem

A reusable SwiftUI design system for consistent UI across all apps.

**Requirements:** iOS 18+, Swift 6.0+

## Structure

```
MontpellierDesignSystem/
├── Tokens/          # DSColor, DSSpacing, DSRadius, DSTypography, DSShadow
├── Components/      # Buttons, cards, banners, badges, chat, stepper, and more
├── Layout/          # DSScreen, DSSection, DSAccordionSection
├── Utilities/       # Color+Hex
├── PreviewData/     # Shared preview data
└── Previews/        # ComponentPreviews, LayoutPreviews, PatternPreviews
```

## Components

| Component | Description |
|-----------|-------------|
| `DSCard` | Rounded card container with shadow |
| `DSHeroCard` | Full-bleed image card with gradient overlay and text |
| `DSListItem` | Row with title, subtitle, and trailing string or custom view |
| `DSDocumentListItem` | Document row with icon tile, file-type badge, and date |
| `DSSummaryTile` | Metric tile with label and value, built on `DSCard` |
| `DSMetricCard` | Large percentage metric with progress bar and supporting text |
| `DSStepperView` | Vertical case timeline with completed / active / pending steps |
| `DSPrimaryButton` | Full-width primary CTA; supports icon and loading state |
| `DSSecondaryButton` | Outlined secondary action button; supports icon |
| `DSSegmentedControl` | Horizontal pill-style tab picker with animated selection |
| `DSBanner` | Contextual status banner — success, warning, error, info, neutral |
| `DSIconTile` | Rounded SF Symbol icon container with tinted background |
| `DSStatusDot` | Small filled circle for inline status indication |
| `DSBadge` | Pill label for tags, scores, and tier markers; supports icon |
| `DSProgressBar` | Horizontal animated progress bar |
| `DSProgressRing` | Circular progress ring with a `@ViewBuilder` centre label |
| `DSChatBubble` | Chat message bubble — leading (received) or trailing (sent) |
| `DSMessageInputBar` | Sticky bottom text input with a circular send button |

## Layout

| Component | Description |
|-----------|-------------|
| `DSScreen` | Root screen wrapper — scrollable, padded, system background |
| `DSSection` | Labelled content group with optional uppercased title |
| `DSAccordionSection` | Collapsible section with animated expand/collapse |

## Tokens

| Token | Purpose |
|-------|---------|
| `DSColor` | Brand, surface, text, semantic, score-status, and `surface`/`info` colours |
| `DSSpacing` | Padding and gap values (`xs` → `xl`) |
| `DSRadius` | Corner radii (`sm` → `xl`) |
| `DSTypography` | Font styles (`caption` → `display`, `bodyBold`, `numeric`, `numericLarge`) |
| `DSShadow` | Shadow presets (`subtle`, `card`, `elevated`) |

## Usage

```swift
import MontpellierDesignSystem

// Dashboard screen
struct DashboardView: View {
    @State private var tab = 0

    var body: some View {
        DSScreen {
            DSSegmentedControl(
                options: ["Progress", "Documents", "Tasks"],
                selectedIndex: $tab
            )

            DSHeroCard(
                imageName: "casePhoto",
                title: "Surgery Infection",
                subtitle: "Dr. Michael Johnson · Back 2002"
            )

            DSSection(title: "Case Files") {
                DSCard {
                    VStack(spacing: 0) {
                        DSDocumentListItem(
                            fileName: "Medical report",
                            fileType: "PDF",
                            date: "12 Jan 2025",
                            iconSymbol: "doc.text.fill",
                            iconColor: DSColor.error
                        )
                        Divider()
                        DSDocumentListItem(
                            fileName: "Hospital discharge",
                            fileType: "PDF",
                            date: "9 Jan 2025"
                        )
                    }
                }
            }

            DSPrimaryButton(title: "Run scan", icon: "magnifyingglass") {
                // action
            }
        }
    }
}

// Chat screen
struct ChatView: View {
    @State private var message = ""

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: DSSpacing.md) {
                    DSChatBubble(message: "Please upload your documents.", alignment: .leading)
                    DSChatBubble(message: "Done! I've attached the report.", alignment: .trailing)
                    DSMetricCard(
                        label: "Completion Rate",
                        value: 82,
                        supportingText: "Based on 1,245 data points"
                    )
                }
                .padding(DSSpacing.lg)
            }
            DSMessageInputBar(text: $message) { /* send */ }
        }
    }
}
```

## Rules

See `DESIGN_RULES.md` for the full token reference and UI rules to follow when generating code.
