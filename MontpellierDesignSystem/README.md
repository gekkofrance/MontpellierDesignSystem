# MontpellierDesignSystem

A reusable SwiftUI design system for consistent UI across all apps.

**Requirements:** iOS 18+, Swift 6.0+

## Structure

```
MontpellierDesignSystem/
├── Tokens/          # DSColor, DSSpacing, DSRadius, DSTypography, DSShadow
├── Components/      # Buttons, cards, banners, badges, chat, stepper, and more
├── Layout/          # DSScreen, DSSection, DSAccordionSection, DSTileGrid
├── Utilities/       # Color+Hex
├── PreviewData/     # Shared preview data
└── Previews/        # ComponentPreviews, LayoutPreviews, PatternPreviews
```

## Components

### Cards & Containers

| Component | Description |
|-----------|-------------|
| `DSCard` | Rounded card container with shadow |
| `DSHeroCard` | Full-bleed image card with gradient overlay and bottom text |
| `DSSummaryTile` | Metric tile with label and value; expands to fill its grid cell |
| `DSMetricCard` | Large percentage value with progress bar and supporting text |

### Lists & Data

| Component | Description |
|-----------|-------------|
| `DSListItem` | Row with title, optional subtitle, and trailing string or `@ViewBuilder` |
| `DSDocumentListItem` | File row with icon tile, type badge, and date |
| `DSStepperView` | Vertical timeline with completed / active / pending steps |

### Buttons

| Component | Description |
|-----------|-------------|
| `DSPrimaryButton` | Full-width primary CTA; supports icon and loading state |
| `DSSecondaryButton` | Outlined secondary action; supports icon |
| `DSSegmentedControl` | Horizontal pill-style tab picker with animated selection |

### Indicators & Labels

| Component | Description |
|-----------|-------------|
| `DSBanner` | Contextual status banner — success, warning, error, info, neutral |
| `DSBadge` | Pill label for tags, tier markers, and status; supports icon |
| `DSStatusDot` | Small filled circle for inline status indication |
| `DSIconTile` | Rounded SF Symbol icon container with tinted background |
| `DSProgressBar` | Horizontal animated progress bar |
| `DSProgressRing` | Circular progress ring with a `@ViewBuilder` centre label |

### Chat

| Component | Description |
|-----------|-------------|
| `DSChatBubble` | Message bubble — `.leading` (received) or `.trailing` (sent) |
| `DSMessageInputBar` | Sticky bottom text input with circular send button |

## Layout

| Component | Description |
|-----------|-------------|
| `DSScreen` | Root screen wrapper — scrollable, padded, system background |
| `DSSection` | Labelled content group with optional uppercased title |
| `DSAccordionSection` | Collapsible section with animated expand/collapse |
| `DSTileGrid` | Equal-size grid — all tiles share the height of the tallest item |

> Use `DSTileGrid` instead of `LazyVGrid` whenever tiles must be visually uniform regardless of content length. It uses the `Layout` protocol to measure all children in a single pass before placement.

## Tokens

| Token | Purpose |
|-------|---------|
| `DSColor` | Brand, surface, text, semantic, and score-status colours |
| `DSSpacing` | Padding and gap values — `xs` (4) · `sm` (8) · `md` (16) · `lg` (24) · `xl` (32) |
| `DSRadius` | Corner radii — `sm` (6) · `md` (12) · `lg` (20) · `xl` (32) |
| `DSTypography` | Font scale — `caption` · `body` · `bodyBold` · `title` · `hero` · `display` · `numeric` · `numericLarge` |
| `DSShadow` | Shadow presets — `subtle` · `card` · `elevated` |

### DSColor reference

| Token | Purpose |
|-------|---------|
| `primary` | Brand action colour — buttons, icons, progress |
| `secondary` | Pressed / selected state |
| `background` | Main screen background (adaptive) |
| `card` | Card surface (adaptive) |
| `cardRaised` | Elevated surface — modals, input fields (adaptive) |
| `surface` | Dark fixed surface — hero headers, dark nav bars |
| `ink` | Primary text (adaptive) |
| `slate` | Secondary / caption text (adaptive) |
| `info` | Informational blue — active step indicators |
| `success` / `warning` / `error` | Semantic status colours |
| `scoreExcellent` → `scoreCritical` | Score-banded status colours (≥85 → 0–19) |

## Usage

```swift
import MontpellierDesignSystem

// Equal-size metric tiles
DSTileGrid {
    DSSummaryTile(title: "Score", value: "87")
    DSSummaryTile(title: "Last sync", value: "2 hours ago")
    DSSummaryTile(title: "Items", value: "1,204")
    DSSummaryTile(title: "Rate", value: "94%")
}

// Progress timeline
DSCard {
    DSStepperView(steps: [
        DSStep(title: "Submitted", date: "12 Jan 2025", state: .completed),
        DSStep(title: "Under review", date: "19 Jan 2025", state: .active),
        DSStep(title: "Decision", state: .pending)
    ])
}

// Dashboard screen
struct DashboardView: View {
    @State private var tab = 0

    var body: some View {
        DSScreen {
            DSSegmentedControl(
                options: ["Progress", "Files", "Tasks"],
                selectedIndex: $tab
            )

            DSHeroCard(
                imageName: "heroImage",
                title: "Product Launch",
                subtitle: "Alex Johnson · Design Team"
            )

            DSSection(title: "Attachments") {
                DSCard {
                    VStack(spacing: 0) {
                        DSDocumentListItem(
                            fileName: "Q1 Report",
                            fileType: "PDF",
                            date: "12 Jan 2025",
                            iconSymbol: "doc.text.fill",
                            iconColor: DSColor.error
                        )
                        Divider()
                        DSDocumentListItem(
                            fileName: "Project Summary",
                            fileType: "PDF",
                            date: "9 Jan 2025"
                        )
                    }
                }
            }

            DSPrimaryButton(title: "Continue", icon: "arrow.right") {}
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
                    DSChatBubble(message: "Please upload the required files.", alignment: .leading)
                    DSChatBubble(message: "Done — attached the report.", alignment: .trailing)
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

See `DESIGN_RULES.md` for the full token reference and component conventions.
