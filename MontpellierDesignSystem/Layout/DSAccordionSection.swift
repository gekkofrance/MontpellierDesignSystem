import SwiftUI

/// Collapsible section with a tappable header. Replaces custom accordion
/// implementations — previously a noted DS gap in PassingChecksSection.
public struct DSAccordionSection<Content: View>: View {

    public var title: String
    public var itemCount: Int?
    @Binding public var isExpanded: Bool
    let content: Content

    public init(
        title: String,
        itemCount: Int? = nil,
        isExpanded: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) {
        self.title      = title
        self.itemCount  = itemCount
        self._isExpanded = isExpanded
        self.content    = content()
    }

    private var headerLabel: String {
        if let n = itemCount { return "\(title) (\(n))" }
        return title
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.spring(duration: 0.3)) { isExpanded.toggle() }
            } label: {
                HStack {
                    Text(headerLabel)
                        .font(DSTypography.body)
                        .foregroundStyle(DSColor.ink)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(DSTypography.caption)
                        .foregroundStyle(DSColor.slate)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .accessibilityHidden(true)
                }
                .padding(DSSpacing.md)
            }
            .buttonStyle(.plain)
            .accessibilityLabel("\(headerLabel). \(isExpanded ? "Collapse" : "Expand")")
            .accessibilityAddTraits(.isButton)

            VStack(spacing: DSSpacing.sm) {
                content
            }
            .padding([.horizontal, .bottom], DSSpacing.md)
            .frame(height: isExpanded ? nil : 0, alignment: .top)
            .opacity(isExpanded ? 1 : 0)
            .clipped()
        }
        .background(DSColor.card, in: RoundedRectangle(cornerRadius: DSRadius.md))
        .shadow(
            color: DSShadow.subtle.color,
            radius: DSShadow.subtle.radius,
            y: DSShadow.subtle.y
        )
    }
}
