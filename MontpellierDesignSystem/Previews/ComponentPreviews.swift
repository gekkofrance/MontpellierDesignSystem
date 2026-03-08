import SwiftUI

// MARK: - Component Previews

#if os(iOS)
#Preview("Design System Gallery") {
    ScrollView {
        VStack(spacing: DSSpacing.lg) {
           DSProgressRing(score: 76)
           DSProgressRing(score: 76, icon: "star.fill")
        
            
            // 1. DSCard
            DSSection(title: "DSCard") {
                DSCard { Text("Simple card").font(DSTypography.body) }
                DSCard {
                    VStack(alignment: .leading, spacing: DSSpacing.sm) {
                        Text("Multi-line content").font(DSTypography.bodyBold)
                        Text("Supporting detail text that wraps.").font(DSTypography.caption)
                    }
                }
            }
            
            // 2. DSIconCard
            DSSection(title: "DSIconCard") {
                DSIconCard(
                    title: "Icon Card",
                    subtitle: "Displays inline icon and test",
                    symbol: "wifi",
                    isActive: false,
                    action: {}
                )
            }
            
            // 2. DSListItem
            DSSection(title: "DSListItem") {
                DSCard {
                    VStack(spacing: 0) {
                        DSListItem(title: "Title only")
                        Divider()
                        DSListItem(title: "With subtitle", subtitle: "Supporting detail")
                        Divider()
                        DSListItem(title: "Full row", subtitle: "Subtitle", trailing: "Value")
                    }
                }
            }
            
            // 3. DSSummaryTile
            DSSection(title: "DSSummaryTile") {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: DSSpacing.md) {
                    DSSummaryTile(title: "Score", value: "87")
                    DSSummaryTile(title: "Issues", value: "3")
                }
            }
            
            // 4. DSPrimary & Secondary Buttons
            DSSection(title: "Buttons") {
                DSPrimaryButton(title: "Continue") {}
                DSSecondaryButton(title: "Cancel") {}
            }
            
            // 5. DSBanner
            DSSection(title: "DSBanner") {
                DSBanner(title: "Success", message: "Saved.", icon: "checkmark.circle.fill", style: .success)
                DSBanner(title: "Error", message: "Something went wrong.", icon: "xmark.circle.fill", style: .error)
            }
            
            // 6. DSIconTile
            DSSection(title: "DSIconTile") {
                HStack {
                    DSIconTile(symbol: "heart.fill")
                    DSIconTile(symbol: "bolt.fill", color: DSColor.warning)
                }
            }
            
            // 7. DSStatusDot
            DSSection(title: "DSStatusDot") {
                HStack {
                    DSStatusDot(color: DSColor.scoreExcellent)
                    Text("Excellent")
                }
            }
            
            // 8. DSBadge
            DSSection(title: "DSBadge") {
                HStack {
                    DSBadge(label: "Pro")
                    DSBadge(label: "New", color: DSColor.scoreGood)
                }
            }
            
            // 9. Progress Components
            DSSection(title: "Progress") {
                DSProgressBar(progress: 0.6, color: DSColor.primary)
                DSProgressRing(value: 87, total: 100) { Text("87") }.frame(width: 80, height: 80)
            }
            
            // 10. Navigation & Content
            DSSection(title: "Components") {
                DSStepperView(steps: [DSStep(title: "Done", state: .completed), DSStep(title: "Active", state: .active)])
                DSHeroCard(imageName: "placeholder", title: "Product Launch")
            }
            
            // 11. Chat & Lists
            DSSection(title: "Chat & Documents") {
                DSChatBubble(message: "Hello!", alignment: .leading)
                DSDocumentListItem(fileName: "Report", fileType: "PDF", date: "Jan 2025")
            }
            
            // 12. Metrics
            DSSection(title: "DSMetricCard") {
                DSMetricCard(label: "Completion Rate", value: 82)
            }
        }
        .padding()
    }
    .background(Color(uiColor: .systemGroupedBackground))
}
#endif

//// MARK: DSCard
//
//#Preview("DSCard") {
//    DSScreen {
//        DSSection(title: "DSCard — Simple") {
//            DSCard {
//                Text("Card content goes here")
//                    .font(DSTypography.body)
//            }
//        }
//        DSSection(title: "DSCard — Multi-line content") {
//            DSCard {
//                VStack(alignment: .leading, spacing: DSSpacing.sm) {
//                    Text("Card with multiple lines")
//                        .font(DSTypography.bodyBold)
//                    Text("Supporting detail text that wraps across lines if needed.")
//                        .font(DSTypography.caption)
//                        .foregroundStyle(DSColor.slate)
//                }
//            }
//        }
//    }
//}
//
//// MARK: DSListItem
//
//#Preview("DSListItem") {
//    DSScreen {
//        DSSection(title: "DSListItem") {
//            DSCard {
//                VStack(spacing: 0) {
//                    DSListItem(title: "Title only")
//                    Divider()
//                    DSListItem(title: "With subtitle", subtitle: "Supporting detail")
//                    Divider()
//                    DSListItem(title: "Full row", subtitle: "Subtitle", trailing: "Value")
//                    Divider()
//                    DSListItem(title: "Trailing only", trailing: "42")
//                }
//            }
//        }
//    }
//}
//
//// MARK: DSSummaryTile
//
//#Preview("DSSummaryTile") {
//    DSScreen {
//        DSSection(title: "DSSummaryTile") {
//            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: DSSpacing.md) {
//                DSSummaryTile(title: "Score", value: "87")
//                DSSummaryTile(title: "Issues", value: "3")
//                DSSummaryTile(title: "Checks", value: "124")
//                DSSummaryTile(title: "Last scan", value: "2 h ago")
//            }
//        }
//    }
//}
//
//// MARK: DSPrimaryButton
//
//#Preview("DSPrimaryButton") {
//    DSScreen {
//        DSSection(title: "DSPrimaryButton — Default") {
//            DSPrimaryButton(title: "Continue") {}
//        }
//        DSSection(title: "DSPrimaryButton — With icon") {
//            DSPrimaryButton(title: "Save changes", icon: "checkmark") {}
//        }
//        DSSection(title: "DSPrimaryButton — Loading") {
//            DSPrimaryButton(title: "Processing", isLoading: true) {}
//        }
//    }
//}
//
//// MARK: DSSecondaryButton
//
//#Preview("DSSecondaryButton") {
//    DSScreen {
//        DSSection(title: "DSSecondaryButton — Default") {
//            DSSecondaryButton(title: "Cancel") {}
//        }
//        DSSection(title: "DSSecondaryButton — With icon") {
//            DSSecondaryButton(title: "Share", icon: "square.and.arrow.up") {}
//        }
//    }
//}
//
//// MARK: DSBanner
//
//#Preview("DSBanner") {
//    DSScreen {
//        DSSection(title: "DSBanner — Success") {
//            DSBanner(title: "Success", message: "Your changes have been saved.", icon: "checkmark.circle.fill", style: .success)
//        }
//        DSSection(title: "DSBanner — Warning") {
//            DSBanner(title: "Warning", message: "Battery is running low.", icon: "exclamationmark.triangle.fill", style: .warning)
//        }
//        DSSection(title: "DSBanner — Error") {
//            DSBanner(title: "Error", message: "Something went wrong. Please try again.", icon: "xmark.circle.fill", style: .error)
//        }
//        DSSection(title: "DSBanner — Info") {
//            DSBanner(title: "Info", message: "A new version is available.", icon: "info.circle.fill", style: .info)
//        }
//        DSSection(title: "DSBanner — Neutral") {
//            DSBanner(title: "Neutral", message: "No changes detected since last scan.", icon: "minus.circle.fill", style: .neutral)
//        }
//        DSSection(title: "DSBanner — Title only") {
//            DSBanner(title: "Title only", icon: "bell.fill", style: .info)
//        }
//    }
//}
//
//// MARK: DSIconTile
//
//#Preview("DSIconTile") {
//    DSScreen {
//        DSSection(title: "DSIconTile — Colors") {
//            DSCard {
//                HStack(spacing: DSSpacing.lg) {
//                    DSIconTile(symbol: "heart.fill")
//                    DSIconTile(symbol: "bolt.fill", color: DSColor.warning)
//                    DSIconTile(symbol: "shield.fill", color: DSColor.error)
//                    DSIconTile(symbol: "star.fill", color: DSColor.scoreGood)
//                }
//            }
//        }
//        DSSection(title: "DSIconTile — Sizes") {
//            DSCard {
//                HStack(spacing: DSSpacing.lg) {
//                    DSIconTile(symbol: "flame.fill", size: 32, cornerRadius: DSRadius.sm)
//                    DSIconTile(symbol: "leaf.fill", size: 44)
//                    DSIconTile(symbol: "drop.fill", size: 56, cornerRadius: DSRadius.md)
//                }
//            }
//        }
//    }
//}
//
//// MARK: DSStatusDot
//
//#Preview("DSStatusDot") {
//    DSScreen {
//        DSSection(title: "DSStatusDot — Score states") {
//            DSCard {
//                VStack(alignment: .leading, spacing: DSSpacing.md) {
//                    HStack(spacing: DSSpacing.sm) {
//                        DSStatusDot(color: DSColor.scoreExcellent)
//                        Text("Excellent").font(DSTypography.body)
//                    }
//                    HStack(spacing: DSSpacing.sm) {
//                        DSStatusDot(color: DSColor.scoreGood)
//                        Text("Good").font(DSTypography.body)
//                    }
//                    HStack(spacing: DSSpacing.sm) {
//                        DSStatusDot(color: DSColor.scoreFair)
//                        Text("Fair").font(DSTypography.body)
//                    }
//                    HStack(spacing: DSSpacing.sm) {
//                        DSStatusDot(color: DSColor.scorePoor)
//                        Text("Poor").font(DSTypography.body)
//                    }
//                    HStack(spacing: DSSpacing.sm) {
//                        DSStatusDot(color: DSColor.scoreCritical)
//                        Text("Critical").font(DSTypography.body)
//                    }
//                }
//            }
//        }
//        DSSection(title: "DSStatusDot — Large (size: 12)") {
//            DSCard {
//                HStack(spacing: DSSpacing.sm) {
//                    DSStatusDot(color: DSColor.slate, size: 12)
//                    Text("Large dot").font(DSTypography.body)
//                }
//            }
//        }
//    }
//}
//
//// MARK: DSBadge
//
//#Preview("DSBadge") {
//    DSScreen {
//        DSSection(title: "DSBadge — Colors") {
//            DSCard {
//                HStack(spacing: DSSpacing.sm) {
//                    DSBadge(label: "Pro")
//                    DSBadge(label: "New", color: DSColor.scoreGood)
//                    DSBadge(label: "Warning", color: DSColor.warning)
//                    DSBadge(label: "Error", color: DSColor.error)
//                }
//            }
//        }
//        DSSection(title: "DSBadge — With icons") {
//            DSCard {
//                HStack(spacing: DSSpacing.sm) {
//                    DSBadge(label: "Verified", icon: "checkmark", color: DSColor.scoreExcellent)
//                    DSBadge(label: "Starred", icon: "star.fill", color: DSColor.scoreFair)
//                    DSBadge(label: "Flagged", icon: "flag.fill", color: DSColor.scoreCritical)
//                }
//            }
//        }
//    }
//}
//
//// MARK: DSProgressBar
//
//#Preview("DSProgressBar") {
//    DSScreen {
//        DSSection(title: "DSProgressBar — Progress values") {
//            DSCard {
//                VStack(alignment: .leading, spacing: DSSpacing.md) {
//                    Text("25% — Critical").font(DSTypography.caption).foregroundStyle(DSColor.slate)
//                    DSProgressBar(progress: 0.25, color: DSColor.scoreCritical)
//
//                    Text("50% — Fair").font(DSTypography.caption).foregroundStyle(DSColor.slate)
//                    DSProgressBar(progress: 0.50, color: DSColor.scoreFair)
//
//                    Text("75% — Good").font(DSTypography.caption).foregroundStyle(DSColor.slate)
//                    DSProgressBar(progress: 0.75, color: DSColor.scoreGood)
//
//                    Text("100% — Excellent").font(DSTypography.caption).foregroundStyle(DSColor.slate)
//                    DSProgressBar(progress: 1.0, color: DSColor.scoreExcellent)
//                }
//            }
//        }
//        DSSection(title: "DSProgressBar — Tall track (height: 12)") {
//            DSCard {
//                DSProgressBar(progress: 0.6, color: DSColor.primary, height: 12)
//            }
//        }
//    }
//}
//
//// MARK: DSProgressRing
//
//#Preview("DSProgressRing") {
//    DSScreen {
//        DSSection(title: "DSProgressRing") {
//            DSCard {
//                HStack(spacing: DSSpacing.xl) {
//                    VStack(spacing: DSSpacing.xs) {
//                        DSProgressRing(value: 87, total: 100, color: DSColor.scoreExcellent) {
//                            VStack(spacing: 2) {
//                                Text("87").font(DSTypography.title)
//                                Text("Score").font(DSTypography.caption).foregroundStyle(DSColor.slate)
//                            }
//                        }
//                        .frame(width: 100, height: 100)
//                        Text("Excellent").font(DSTypography.caption).foregroundStyle(DSColor.slate)
//                    }
//
//                    VStack(spacing: DSSpacing.xs) {
//                        DSProgressRing(value: 3, total: 10, color: DSColor.scoreFair) {
//                            Text("3/10").font(DSTypography.bodyBold)
//                        }
//                        .frame(width: 100, height: 100)
//                        Text("Fair").font(DSTypography.caption).foregroundStyle(DSColor.slate)
//                    }
//
//                    VStack(spacing: DSSpacing.xs) {
//                        DSProgressRing(value: 2, total: 10, color: DSColor.scoreCritical, isAnimating: true) {
//                            Text("2/10").font(DSTypography.bodyBold)
//                        }
//                        .frame(width: 100, height: 100)
//                        Text("Animating").font(DSTypography.caption).foregroundStyle(DSColor.slate)
//                    }
//                }
//                .padding(.vertical, DSSpacing.sm)
//                .frame(maxWidth: .infinity)
//            }
//        }
//    }
//}
//
//// MARK: DSStepperView
//
//#Preview("DSStepperView") {
//    DSScreen {
//        DSSection(title: "DSStepperView") {
//            DSCard {
//                DSStepperView(steps: [
//                    DSStep(title: "Submitted", date: "12 Jan 2025", state: .completed),
//                    DSStep(title: "Under review", date: "19 Jan 2025", state: .active),
//                    DSStep(title: "Decision", state: .pending)
//                ])
//            }
//        }
//    }
//}
//
//// MARK: DSSegmentedControl
//
//private struct SegmentedControlPreview: View {
//    @State private var selected = 0
//    var body: some View {
//        DSScreen {
//            DSSection(title: "DSSegmentedControl") {
//                DSSegmentedControl(
//                    options: ["Progress", "Documents", "Tasks"],
//                    selectedIndex: $selected
//                )
//            }
//            DSSection(title: "DSSegmentedControl — Two options") {
//                DSSegmentedControl(
//                    options: ["Active", "Resolved"],
//                    selectedIndex: $selected
//                )
//            }
//        }
//    }
//}
//
//#Preview("DSSegmentedControl") {
//    SegmentedControlPreview()
//}
//
//// MARK: DSHeroCard
//
//#Preview("DSHeroCard") {
//    DSScreen {
//        DSSection(title: "DSHeroCard — Default aspect ratio") {
//            DSHeroCard(
//                imageName: "placeholder",
//                title: "Product Launch",
//                subtitle: "Alex Johnson · Design Team"
//            )
//        }
//        DSSection(title: "DSHeroCard — Square") {
//            DSHeroCard(
//                imageName: "placeholder",
//                title: "Project Overview",
//                aspectRatio: 1
//            )
//        }
//    }
//}
//
//// MARK: DSChatBubble
//
//#Preview("DSChatBubble") {
//    DSScreen {
//        DSSection(title: "DSChatBubble — Received (.leading)") {
//            DSChatBubble(message: "Reminder: please upload the required files.", alignment: .leading)
//            DSChatBubble(message: "We've received your submission. Thank you.", alignment: .leading)
//        }
//        DSSection(title: "DSChatBubble — Sent (.trailing)") {
//            DSChatBubble(message: "Here is the report you requested.", alignment: .trailing)
//        }
//        DSSection(title: "DSChatBubble — Conversation") {
//            DSChatBubble(message: "Hello! How can I help you today?", alignment: .leading)
//            DSChatBubble(message: "I need to submit my project report.", alignment: .trailing)
//            DSChatBubble(message: "Of course. Please attach the file below.", alignment: .leading)
//        }
//    }
//}
//
//// MARK: DSMessageInputBar
//
//private struct MessageInputBarPreview: View {
//    @State private var text = ""
//    var body: some View {
//        VStack(spacing: 0) {
//            DSScreen {
//                DSSection(title: "DSMessageInputBar") {
//                    DSChatBubble(message: "Type something in the input below.", alignment: .leading)
//                }
//            }
//            DSMessageInputBar(text: $text) {}
//        }
//    }
//}
//
//#Preview("DSMessageInputBar") {
//    MessageInputBarPreview()
//}
//
//// MARK: DSMetricCard
//
//#Preview("DSMetricCard") {
//    DSScreen {
//        DSSection(title: "DSMetricCard — Default (primary)") {
//            DSMetricCard(
//                label: "Completion Rate",
//                value: 82,
//                supportingText: "Based on 1,245 data points"
//            )
//        }
//        DSSection(title: "DSMetricCard — Fair") {
//            DSMetricCard(
//                label: "Target Progress",
//                value: 54,
//                supportingText: "340 items reviewed",
//                color: DSColor.scoreFair
//            )
//        }
//        DSSection(title: "DSMetricCard — Critical") {
//            DSMetricCard(
//                label: "Approval Rate",
//                value: 18,
//                color: DSColor.scoreCritical
//            )
//        }
//    }
//}
//
//// MARK: DSDocumentListItem
//
//#Preview("DSDocumentListItem") {
//    DSScreen {
//        DSSection(title: "DSDocumentListItem") {
//            DSCard {
//                VStack(spacing: 0) {
//                    DSDocumentListItem(
//                        fileName: "Q1 Report",
//                        fileType: "PDF",
//                        date: "12 Jan 2025",
//                        iconSymbol: "doc.text.fill",
//                        iconColor: DSColor.error
//                    )
//                    Divider()
//                    DSDocumentListItem(
//                        fileName: "Project Summary",
//                        fileType: "PDF",
//                        date: "9 Jan 2025",
//                        iconSymbol: "doc.fill",
//                        iconColor: DSColor.info
//                    )
//                    Divider()
//                    DSDocumentListItem(
//                        fileName: "Team Photos",
//                        fileType: "JPG",
//                        date: "15 Jan 2025",
//                        iconSymbol: "photo.fill",
//                        iconColor: DSColor.scoreFair
//                    )
//                }
//            }
//        }
//    }
//}
//
//// MARK: DSListItem — ViewBuilder trailing
//
//#Preview("DSListItem — ViewBuilder trailing") {
//    DSScreen {
//        DSSection(title: "DSListItem — ViewBuilder trailing") {
//            DSCard {
//                VStack(spacing: 0) {
//                    DSListItem(title: "Status") {
//                        DSBadge(label: "Active", color: DSColor.success)
//                    }
//                    Divider()
//                    DSListItem(title: "Priority", subtitle: "Set by case manager") {
//                        DSStatusDot(color: DSColor.scoreCritical, size: 10)
//                    }
//                    Divider()
//                    DSListItem(title: "Notifications") {
//                        Image(systemName: "chevron.right")
//                            .font(DSTypography.caption)
//                            .foregroundStyle(DSColor.slate)
//                    }
//                }
//            }
//        }
//    }
//}
//
//#endif
