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

| Token | File | Purpose |
|-------|------|---------|
| `DSColor` | Tokens/DSColor.swift | All colours |
| `DSSpacing` | Tokens/DSSpacing.swift | Padding & gaps |
| `DSRadius` | Tokens/DSRadius.swift | Corner radii |
| `DSTypography` | Tokens/DSTypography.swift | Font styles |
| `DSShadow` | Tokens/DSShadow.swift | Shadow styles |

## Component Reference

| Component | File | Usage |
|-----------|------|-------|
| `DSScreen` | Layout/DSScreen.swift | Root screen wrapper |
| `DSSection` | Layout/DSSection.swift | Labelled content group |
| `DSCard` | Components/DSCard.swift | Grouped content container |
| `DSPrimaryButton` | Components/DSPrimaryButton.swift | Primary CTA |
| `DSSummaryTile` | Components/DSSummaryTile.swift | Metric display |
| `DSListItem` | Components/DSListItem.swift | Row in a list |
