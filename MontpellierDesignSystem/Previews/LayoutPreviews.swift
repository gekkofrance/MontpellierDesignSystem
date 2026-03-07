import SwiftUI

// MARK: - Layout Previews

#if os(iOS)

// MARK: DSScreen

#Preview("DSScreen") {
    DSScreen {
        DSSection(title: "DSScreen") {
            Text("First section content")
                .font(DSTypography.body)
            Text("Second section content")
                .font(DSTypography.body)
            Text("Third section content")
                .font(DSTypography.body)
        }
    }
}

// MARK: DSSection

#Preview("DSSection") {
    DSScreen {
        DSSection(title: "DSSection — With title") {
            DSCard {
                VStack(spacing: 0) {
                    DSListItem(title: "Item A", subtitle: "Detail", trailing: "→")
                    Divider()
                    DSListItem(title: "Item B", subtitle: "Detail", trailing: "→")
                }
            }
        }

        DSSection(title: "DSSection — No title") {
            DSCard {
                VStack(spacing: 0) {
                    DSListItem(title: "Section without a title")
                    Divider()
                    DSListItem(title: "Another item")
                }
            }
        }

        DSSection(title: "DSSection — With grid content") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: DSSpacing.md) {
                DSSummaryTile(title: "Score", value: "91")
                DSSummaryTile(title: "Alerts", value: "0")
            }
        }
    }
}

// MARK: DSAccordionSection

private struct AccordionPreview: View {
    @State private var expandedA = true
    @State private var expandedB = false
    @State private var expandedC = false

    var body: some View {
        DSScreen {
            DSSection(title: "DSAccordionSection — Expanded") {
                DSAccordionSection(title: "Passing checks", itemCount: 3, isExpanded: $expandedA) {
                    DSListItem(title: "Check A", subtitle: "Passed")
                    DSListItem(title: "Check B", subtitle: "Passed")
                    DSListItem(title: "Check C", subtitle: "Passed")
                }
            }

            DSSection(title: "DSAccordionSection — Collapsed") {
                DSAccordionSection(title: "Warnings", itemCount: 1, isExpanded: $expandedB) {
                    DSListItem(title: "Low memory", subtitle: "Consider freeing space")
                }
            }

            DSSection(title: "DSAccordionSection — No item count") {
                DSAccordionSection(title: "No items", isExpanded: $expandedC) {
                    Text("Nothing to show here.")
                        .font(DSTypography.caption)
                        .foregroundStyle(DSColor.slate)
                }
            }
        }
    }
}

#Preview("DSAccordionSection") {
    AccordionPreview()
}

#endif
