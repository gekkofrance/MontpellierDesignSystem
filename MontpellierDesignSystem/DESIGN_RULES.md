# Montpellier Design System

This design system ensures consistent UI across all applications.

## Design Principles

- Clean and modern
- Card-based layout
- Generous whitespace
- Clear hierarchy
- Accessible typography
- Minimal visual noise

## UI Rules

1. Screens must use `DSScreen`
2. Group content using `DSCard`
3. Use `DSSpacing` tokens for spacing
4. Use `DSTypography` tokens for fonts
5. Use `DSColor` tokens for colours
6. Primary actions use `DSPrimaryButton`
7. Avoid hardcoded styling
8. Extract reusable components

## Layout Pattern

Typical screen layout:

```
Header
Summary Cards
Primary Actions
List Content
```

## Token Reference

### DSColor

| Token | Value | Purpose |
|-------|-------|---------|
| `primary` | #3DB87A | Brand CTAs, buttons, icons |
| `secondary` | #2A9060 | Pressed / selected state |
| `background` | System | Main screen background |
| `card` | System | Card surface |
| `cardRaised` | System | Elevated surface (modals, input fields) |
| `ink` | System | Primary text |
| `slate` | System | Secondary / caption text |
| `surface` | #1C2438 | Dark navy — hero headers, tab bars |
| `success` | #3DB87A | Semantic success |
| `warning` | #F59E0B | Semantic warning |
| `error` | #EF4444 | Semantic error |
| `info` | #3B82F6 | Informational blue — active stepper steps |
| `scoreExcellent` | #3DB87A | Score ≥ 85 |
| `scoreGood` | #60B8F0 | Score 65–84 |
| `scoreFair` | #F59E0B | Score 45–64 |
| `scorePoor` | #F97316 | Score 20–44 |
| `scoreCritical` | #EF4444 | Score 0–19 |

### DSTypography

| Token | Size / Weight | Purpose |
|-------|--------------|---------|
| `display` | 48pt bold | Dashboard greeting headlines |
| `hero` | 34pt bold | Hero screens, onboarding |
| `title` | 22pt semibold | Section titles, screen headings |
| `body` | 17pt regular | Standard body copy |
| `bodyBold` | 17pt semibold | Card titles, button labels |
| `caption` | 13pt regular | Supporting / metadata text |
| `captionBold` | 13pt semibold | Section headers, labels, badges |
| `numeric` | 36pt bold rounded | Score display, counters |
| `numericLarge` | 56pt bold rounded | Probability %, countdown timers |

### Other Tokens

| Token | File | Purpose |
|-------|------|---------|
| `DSSpacing` | Tokens/DSSpacing.swift | Padding & gaps (`xs`=4 → `xl`=32) |
| `DSRadius` | Tokens/DSRadius.swift | Corner radii (`sm`=6 → `xl`=32) |
| `DSShadow` | Tokens/DSShadow.swift | Shadow presets (`subtle`, `card`, `elevated`) |

## Component Reference

### Layout

| Component | File | Usage |
|-----------|------|-------|
| `DSScreen` | Layout/DSScreen.swift | Root scrollable screen wrapper |
| `DSSection` | Layout/DSSection.swift | Labelled content group |
| `DSAccordionSection` | Layout/DSAccordionSection.swift | Collapsible section with animated expand/collapse |

### Buttons

| Component | File | Usage |
|-----------|------|-------|
| `DSPrimaryButton` | Components/DSPrimaryButton.swift | Full-width primary CTA; supports icon and loading state |
| `DSSecondaryButton` | Components/DSSecondaryButton.swift | Outlined secondary action |

### Cards & Containers

| Component | File | Usage |
|-----------|------|-------|
| `DSCard` | Components/DSCard.swift | Grouped content container |
| `DSHeroCard` | Components/DSHeroCard.swift | Full-bleed image card with gradient text overlay |
| `DSSummaryTile` | Components/DSSummaryTile.swift | Metric tile — label + value |
| `DSMetricCard` | Components/DSSuccessProbabilityCard.swift | Large percentage metric with progress bar |

### List & Data

| Component | File | Usage |
|-----------|------|-------|
| `DSListItem` | Components/DSListItem.swift | Row with title, subtitle, and optional trailing string or `@ViewBuilder` |
| `DSDocumentListItem` | Components/DSDocumentListItem.swift | Document row with icon tile, type badge, and date |
| `DSStepperView` | Components/DSStepperView.swift | Vertical timeline stepper with completed/active/pending states |

### Indicators & Labels

| Component | File | Usage |
|-----------|------|-------|
| `DSBadge` | Components/DSBadge.swift | Pill label — tags, tier markers, score status |
| `DSStatusDot` | Components/DSStatusDot.swift | Small filled circle for inline status |
| `DSIconTile` | Components/DSIconTile.swift | Rounded SF Symbol icon container |
| `DSBanner` | Components/DSBanner.swift | Contextual status banner — success/warning/error/info/neutral |
| `DSProgressBar` | Components/DSProgressBar.swift | Horizontal animated progress bar |
| `DSProgressRing` | Components/DSProgressRing.swift | Circular progress ring with centre label |

### Navigation

| Component | File | Usage |
|-----------|------|-------|
| `DSSegmentedControl` | Components/DSSegmentedControl.swift | Horizontal pill-style tab picker |

### Chat

| Component | File | Usage |
|-----------|------|-------|
| `DSChatBubble` | Components/DSChatBubble.swift | Single chat message bubble — leading (received) or trailing (sent) |
| `DSMessageInputBar` | Components/DSMessageInputBar.swift | Sticky bottom text input with send button |
