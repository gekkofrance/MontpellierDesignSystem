import SwiftUI

// MARK: - Pattern Previews

#if os(iOS)

// MARK: Dashboard pattern — summary tiles + sectioned list

#Preview("Dashboard") {
    DSScreen {
        DSSection(title: "DSSummaryTile — Grid") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: DSSpacing.md) {
                DSSummaryTile(title: "Health Score", value: "87")
                DSSummaryTile(title: "Open Issues", value: "3")
                DSSummaryTile(title: "Checks Run", value: "124")
                DSSummaryTile(title: "Last Scan", value: "2 h ago")
            }
        }

        DSSection(title: "DSListItem — In card") {
            DSCard {
                VStack(spacing: 0) {
                    DSListItem(title: "Scan completed", subtitle: "All checks passed", trailing: "09:14")
                    Divider()
                    DSListItem(title: "Issue resolved", subtitle: "Memory pressure", trailing: "Yesterday")
                    Divider()
                    DSListItem(title: "Score improved", subtitle: "+4 points", trailing: "Mon")
                }
            }
        }

        DSSection(title: "DSBanner — Warning") {
            DSBanner(
                title: "Disk usage high",
                message: "84 GB of 128 GB used. Consider removing unused apps.",
                icon: "exclamationmark.triangle.fill",
                style: .warning
            )
        }
    }
}

// MARK: Detail screen pattern — icon tile + list rows inside a card

#Preview("Detail Screen") {
    DSScreen {
        DSSection(title: "DSIconTile + DSStatusDot + DSBadge + DSProgressBar") {
            DSCard {
                VStack(alignment: .leading, spacing: DSSpacing.md) {
                    HStack(spacing: DSSpacing.md) {
                        DSIconTile(symbol: "shield.fill", color: DSColor.scoreExcellent, size: 48)
                        VStack(alignment: .leading, spacing: DSSpacing.xs) {
                            Text("Security").font(DSTypography.title)
                            HStack(spacing: DSSpacing.xs) {
                                DSStatusDot(color: DSColor.scoreExcellent)
                                Text("All clear").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                            }
                        }
                        Spacer()
                        DSBadge(label: "Excellent", icon: "checkmark", color: DSColor.scoreExcellent)
                    }
                    DSProgressBar(progress: 0.87, color: DSColor.scoreExcellent)
                }
            }
        }

        DSSection(title: "DSListItem — Check results") {
            DSCard {
                VStack(spacing: 0) {
                    DSListItem(title: "Firewall enabled", subtitle: "macOS firewall is active", trailing: "✓")
                    Divider()
                    DSListItem(title: "FileVault on", subtitle: "Disk is encrypted", trailing: "✓")
                    Divider()
                    DSListItem(title: "Auto-lock set", subtitle: "5 minutes", trailing: "✓")
                }
            }
        }
    }
}

// MARK: Accordion list pattern — collapsible grouped results

private struct AccordionPatternPreview: View {
    @State private var passingExpanded = true
    @State private var failingExpanded = true
    @State private var skippedExpanded = false

    var body: some View {
        DSScreen {
            DSSection(title: "DSBanner — Scan result") {
                DSBanner(
                    title: "Scan complete",
                    message: "8 checks passed, 2 failed, 1 skipped.",
                    icon: "checkmark.circle.fill",
                    style: .success
                )
            }

            DSSection(title: "DSAccordionSection — Passing") {
                DSAccordionSection(title: "Passing", itemCount: 8, isExpanded: $passingExpanded) {
                    DSListItem(title: "Firewall", subtitle: "Enabled", trailing: "✓")
                    DSListItem(title: "FileVault", subtitle: "Active", trailing: "✓")
                    DSListItem(title: "Screen lock", subtitle: "5 min", trailing: "✓")
                    DSListItem(title: "Auto-updates", subtitle: "On", trailing: "✓")
                }
            }

            DSSection(title: "DSAccordionSection — Failed (DSStatusDot in rows)") {
                DSAccordionSection(title: "Failed", itemCount: 2, isExpanded: $failingExpanded) {
                    HStack(spacing: DSSpacing.sm) {
                        DSStatusDot(color: DSColor.error)
                        DSListItem(title: "Gatekeeper", subtitle: "Disabled — re-enable in Security settings")
                    }
                    HStack(spacing: DSSpacing.sm) {
                        DSStatusDot(color: DSColor.error)
                        DSListItem(title: "SIP", subtitle: "System Integrity Protection is off")
                    }
                }
            }

            DSSection(title: "DSAccordionSection — Collapsed") {
                DSAccordionSection(title: "Skipped", itemCount: 1, isExpanded: $skippedExpanded) {
                    DSListItem(title: "Remote login", subtitle: "Not applicable on this device")
                }
            }
        }
    }
}

#Preview("Accordion Results") {
    AccordionPatternPreview()
}

// MARK: Action screen pattern — progress ring + buttons

#Preview("Action Screen") {
    DSScreen {
        DSSection(title: "DSProgressRing — Score") {
            DSCard {
                VStack(spacing: DSSpacing.lg) {
                    DSProgressRing(value: 62, total: 100, color: DSColor.scoreFair) {
                        VStack(spacing: DSSpacing.xs) {
                            Text("62").font(DSTypography.numeric)
                            Text("Fair").font(DSTypography.caption).foregroundStyle(DSColor.slate)
                        }
                    }
                    .frame(width: 140, height: 140)
                    .frame(maxWidth: .infinity)

                    Text("3 issues need attention")
                        .font(DSTypography.bodyBold)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.vertical, DSSpacing.sm)
            }
        }

        DSSection(title: "DSBanner — Info") {
            DSBanner(
                title: "Quick fix available",
                message: "Tap below to resolve 2 issues automatically.",
                icon: "wand.and.stars",
                style: .info
            )
        }

        DSSection(title: "DSPrimaryButton + DSSecondaryButton") {
            DSPrimaryButton(title: "Fix automatically", icon: "wand.and.stars") {}
            DSSecondaryButton(title: "Review manually") {}
        }
    }
}

// MARK: Screen 1 — Progress tracker

#Preview("Progress Screen") {
    DSScreen {
        DSSection(title: "DSStepperView — Progress timeline") {
            DSCard {
                DSStepperView(steps: [
                    DSStep(title: "Submitted", date: "12 Jan 2025", state: .completed),
                    DSStep(title: "Under review", date: "19 Jan 2025", state: .active),
                    DSStep(title: "Decision", state: .pending)
                ])
            }
        }

        DSSection(title: "DSDocumentListItem — Attachments") {
            DSCard {
                VStack(spacing: 0) {
                    DSDocumentListItem(fileName: "Q1 Report", fileType: "PDF", date: "12 Jan 2025", iconSymbol: "doc.text.fill", iconColor: DSColor.error)
                    Divider()
                    DSDocumentListItem(fileName: "Project Summary", fileType: "PDF", date: "9 Jan 2025", iconSymbol: "doc.fill", iconColor: DSColor.info)
                    Divider()
                    DSDocumentListItem(fileName: "Team Photos", fileType: "JPG", date: "15 Jan 2025", iconSymbol: "photo.fill", iconColor: DSColor.scoreFair)
                }
            }
        }
    }
}

// MARK: Screen 2 — Dashboard

private struct DashboardScreenPreview: View {
    @State private var tab = 0

    var body: some View {
        VStack(spacing: 0) {
            // Dark hero header (app-level pattern — not a DS layout)
            ZStack(alignment: .bottomLeading) {
                DSColor.surface.ignoresSafeArea(edges: .top)
                VStack(alignment: .leading, spacing: DSSpacing.xs) {
                    Text("Hello, Alex!")
                        .font(DSTypography.caption)
                        .foregroundStyle(.white.opacity(0.7))
                    Text("Good morning.")
                        .font(DSTypography.display)
                        .foregroundStyle(.white)
                }
                .padding(DSSpacing.lg)
            }
            .frame(height: 160)

            DSScreen {
                DSSection(title: "DSSegmentedControl — Navigation tabs") {
                    DSSegmentedControl(
                        options: ["Progress", "Files", "Tasks"],
                        selectedIndex: $tab
                    )
                }

                DSSection(title: "DSHeroCard — Featured item") {
                    DSHeroCard(
                        imageName: "placeholder",
                        title: "Product Launch",
                        subtitle: "Alex Johnson · Design Team"
                    )
                }
            }
        }
    }
}

#Preview("Dashboard Screen") {
    DashboardScreenPreview()
}

// MARK: Screen 3 — Chat

private struct ChatScreenPreview: View {
    @State private var message = ""

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: DSSpacing.md) {
                    DSSection(title: "DSChatBubble — Conversation") {
                        DSChatBubble(message: "Reminder: please upload the required files.", alignment: .leading)
                        DSChatBubble(message: "We've received your submission. Thank you.", alignment: .leading)
                        DSChatBubble(message: "Great, thank you!", alignment: .trailing)
                    }

                    DSSection(title: "DSMetricCard") {
                        DSMetricCard(
                            label: "Completion Rate",
                            value: 82,
                            supportingText: "Based on 1,245 data points"
                        )
                    }

                    DSSection(title: "DSBadge — Tags") {
                        HStack(spacing: DSSpacing.sm) {
                            DSBadge(label: "Data quality", color: DSColor.info)
                            DSBadge(label: "348", color: DSColor.slate)
                        }
                    }
                }
                .padding(DSSpacing.lg)
            }
            .background(DSColor.background)

            DSMessageInputBar(text: $message) {}
        }
    }
}

#Preview("Chat Screen") {
    ChatScreenPreview()
}

#endif
