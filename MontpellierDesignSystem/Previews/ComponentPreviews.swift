import SwiftUI

// MARK: - Component Previews

#if os(iOS)

// MARK: DSCard

#Preview("DSCard") {
    DSScreen {
        DSSection(title: "DSCard — Simple") {
            DSCard {
                Text("Card content goes here")
                    .font(DSTypography.body)
            }
        }
        DSSection(title: "DSCard — Multi-line content") {
            DSCard {
                VStack(alignment: .leading, spacing: DSSpacing.sm) {
                    Text("Card with multiple lines")
                        .font(DSTypography.bodyBold)
                    Text("Supporting detail text that wraps across lines if needed.")
                        .font(DSTypography.caption)
                        .foregroundStyle(DSColor.slate)
                }
            }
        }
    }
}

// MARK: DSListItem

#Preview("DSListItem") {
    DSScreen {
        DSSection(title: "DSListItem") {
            DSCard {
                VStack(spacing: 0) {
                    DSListItem(title: "Title only")
                    Divider()
                    DSListItem(title: "With subtitle", subtitle: "Supporting detail")
                    Divider()
                    DSListItem(title: "Full row", subtitle: "Subtitle", trailing: "Value")
                    Divider()
                    DSListItem(title: "Trailing only", trailing: "42")
                }
            }
        }
    }
}

// MARK: DSSummaryTile

#Preview("DSSummaryTile") {
    DSScreen {
        DSSection(title: "DSSummaryTile") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: DSSpacing.md) {
                DSSummaryTile(title: "Score", value: "87")
                DSSummaryTile(title: "Issues", value: "3")
                DSSummaryTile(title: "Checks", value: "124")
                DSSummaryTile(title: "Last scan", value: "2 h ago")
            }
        }
    }
}

// MARK: DSPrimaryButton

#Preview("DSPrimaryButton") {
    DSScreen {
        DSSection(title: "DSPrimaryButton — Default") {
            DSPrimaryButton(title: "Continue") {}
        }
        DSSection(title: "DSPrimaryButton — With icon") {
            DSPrimaryButton(title: "Save changes", icon: "checkmark") {}
        }
        DSSection(title: "DSPrimaryButton — Loading") {
            DSPrimaryButton(title: "Processing", isLoading: true) {}
        }
    }
}

// MARK: DSSecondaryButton

#Preview("DSSecondaryButton") {
    DSScreen {
        DSSection(title: "DSSecondaryButton — Default") {
            DSSecondaryButton(title: "Cancel") {}
        }
        DSSection(title: "DSSecondaryButton — With icon") {
            DSSecondaryButton(title: "Share", icon: "square.and.arrow.up") {}
        }
    }
}

// MARK: DSBanner

#Preview("DSBanner") {
    DSScreen {
        DSSection(title: "DSBanner — Success") {
            DSBanner(title: "Success", message: "Your changes have been saved.", icon: "checkmark.circle.fill", style: .success)
        }
        DSSection(title: "DSBanner — Warning") {
            DSBanner(title: "Warning", message: "Battery is running low.", icon: "exclamationmark.triangle.fill", style: .warning)
        }
        DSSection(title: "DSBanner — Error") {
            DSBanner(title: "Error", message: "Something went wrong. Please try again.", icon: "xmark.circle.fill", style: .error)
        }
        DSSection(title: "DSBanner — Info") {
            DSBanner(title: "Info", message: "A new version is available.", icon: "info.circle.fill", style: .info)
        }
        DSSection(title: "DSBanner — Neutral") {
            DSBanner(title: "Neutral", message: "No changes detected since last scan.", icon: "minus.circle.fill", style: .neutral)
        }
        DSSection(title: "DSBanner — Title only") {
            DSBanner(title: "Title only", icon: "bell.fill", style: .info)
        }
    }
}

// MARK: DSIconTile

#Preview("DSIconTile") {
    DSScreen {
        DSSection(title: "DSIconTile — Colors") {
            DSCard {
                HStack(spacing: DSSpacing.lg) {
                    DSIconTile(symbol: "heart.fill")
                    DSIconTile(symbol: "bolt.fill", color: DSColor.warning)
                    DSIconTile(symbol: "shield.fill", color: DSColor.error)
                    DSIconTile(symbol: "star.fill", color: DSColor.scoreGood)
                }
            }
        }
        DSSection(title: "DSIconTile — Sizes") {
            DSCard {
                HStack(spacing: DSSpacing.lg) {
                    DSIconTile(symbol: "flame.fill", size: 32, cornerRadius: DSRadius.sm)
                    DSIconTile(symbol: "leaf.fill", size: 44)
                    DSIconTile(symbol: "drop.fill", size: 56, cornerRadius: DSRadius.md)
                }
            }
        }
    }
}

// MARK: DSStatusDot

#Preview("DSStatusDot") {
    DSScreen {
        DSSection(title: "DSStatusDot — Score states") {
            DSCard {
                VStack(alignment: .leading, spacing: DSSpacing.md) {
                    HStack(spacing: DSSpacing.sm) {
                        DSStatusDot(color: DSColor.scoreExcellent)
                        Text("Excellent").font(DSTypography.body)
                    }
                    HStack(spacing: DSSpacing.sm) {
                        DSStatusDot(color: DSColor.scoreGood)
                        Text("Good").font(DSTypography.body)
                    }
                    HStack(spacing: DSSpacing.sm) {
                        DSStatusDot(color: DSColor.scoreFair)
                        Text("Fair").font(DSTypography.body)
                    }
                    HStack(spacing: DSSpacing.sm) {
                        DSStatusDot(color: DSColor.scorePoor)
                        Text("Poor").font(DSTypography.body)
                    }
                    HStack(spacing: DSSpacing.sm) {
                        DSStatusDot(color: DSColor.scoreCritical)
                        Text("Critical").font(DSTypography.body)
                    }
                }
            }
        }
        DSSection(title: "DSStatusDot — Large (size: 12)") {
            DSCard {
                HStack(spacing: DSSpacing.sm) {
                    DSStatusDot(color: DSColor.slate, size: 12)
                    Text("Large dot").font(DSTypography.body)
                }
            }
        }
    }
}

// MARK: DSBadge

#Preview("DSBadge") {
    DSScreen {
        DSSection(title: "DSBadge — Colors") {
            DSCard {
                HStack(spacing: DSSpacing.sm) {
                    DSBadge(label: "Pro")
                    DSBadge(label: "New", color: DSColor.scoreGood)
                    DSBadge(label: "Warning", color: DSColor.warning)
                    DSBadge(label: "Error", color: DSColor.error)
                }
            }
        }
        DSSection(title: "DSBadge — With icons") {
            DSCard {
                HStack(spacing: DSSpacing.sm) {
                    DSBadge(label: "Verified", icon: "checkmark", color: DSColor.scoreExcellent)
                    DSBadge(label: "Starred", icon: "star.fill", color: DSColor.scoreFair)
                    DSBadge(label: "Flagged", icon: "flag.fill", color: DSColor.scoreCritical)
                }
            }
        }
    }
}

// MARK: DSProgressBar

#Preview("DSProgressBar") {
    DSScreen {
        DSSection(title: "DSProgressBar — Progress values") {
            DSCard {
                VStack(alignment: .leading, spacing: DSSpacing.md) {
                    Text("25% — Critical").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                    DSProgressBar(progress: 0.25, color: DSColor.scoreCritical)

                    Text("50% — Fair").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                    DSProgressBar(progress: 0.50, color: DSColor.scoreFair)

                    Text("75% — Good").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                    DSProgressBar(progress: 0.75, color: DSColor.scoreGood)

                    Text("100% — Excellent").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                    DSProgressBar(progress: 1.0, color: DSColor.scoreExcellent)
                }
            }
        }
        DSSection(title: "DSProgressBar — Tall track (height: 12)") {
            DSCard {
                DSProgressBar(progress: 0.6, color: DSColor.primary, height: 12)
            }
        }
    }
}

// MARK: DSProgressRing

#Preview("DSProgressRing") {
    DSScreen {
        DSSection(title: "DSProgressRing") {
            DSCard {
                HStack(spacing: DSSpacing.xl) {
                    VStack(spacing: DSSpacing.xs) {
                        DSProgressRing(value: 87, total: 100, color: DSColor.scoreExcellent) {
                            VStack(spacing: 2) {
                                Text("87").font(DSTypography.title)
                                Text("Score").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                            }
                        }
                        .frame(width: 100, height: 100)
                        Text("Excellent").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                    }

                    VStack(spacing: DSSpacing.xs) {
                        DSProgressRing(value: 3, total: 10, color: DSColor.scoreFair) {
                            Text("3/10").font(DSTypography.bodyBold)
                        }
                        .frame(width: 100, height: 100)
                        Text("Fair").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                    }

                    VStack(spacing: DSSpacing.xs) {
                        DSProgressRing(value: 2, total: 10, color: DSColor.scoreCritical, isAnimating: true) {
                            Text("2/10").font(DSTypography.bodyBold)
                        }
                        .frame(width: 100, height: 100)
                        Text("Animating").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                    }
                }
                .padding(.vertical, DSSpacing.sm)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#endif
