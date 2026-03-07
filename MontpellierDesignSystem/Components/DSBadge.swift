import SwiftUI

/// Compact pill label — score status, Pro tier marker, category tags.
public struct DSBadge: View {

    public var label: String
    public var icon: String?
    public var color: Color

    public init(label: String, icon: String? = nil, color: Color = DSColor.primary) {
        self.label = label
        self.icon  = icon
        self.color = color
    }

    public var body: some View {
        HStack(spacing: 4) {
            if let icon {
                Image(systemName: icon)
                    .font(DSTypography.captionBold)
                    .accessibilityHidden(true)
            }
            Text(label)
                .font(DSTypography.captionBold)
        }
        .foregroundStyle(color)
        .padding(.horizontal, DSSpacing.sm)
        .padding(.vertical, DSSpacing.xs)
        .background(color.opacity(0.12), in: Capsule())
    }
}
