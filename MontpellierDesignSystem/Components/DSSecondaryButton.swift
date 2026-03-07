import SwiftUI

/// Outlined secondary action button. Use for actions that complement
/// but don't replace the primary CTA on a screen.
public struct DSSecondaryButton: View {

    public var title: String
    public var icon: String?
    public var action: () -> Void

    public init(title: String, icon: String? = nil, action: @escaping () -> Void) {
        self.title  = title
        self.icon   = icon
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: DSSpacing.sm) {
                if let icon {
                    Image(systemName: icon)
                        .accessibilityHidden(true)
                }
                Text(title)
                    .font(DSTypography.bodyBold)
            }
            .foregroundStyle(DSColor.primary)
            .frame(maxWidth: .infinity)
            .padding(DSSpacing.md)
            .background(DSColor.card)
            .clipShape(RoundedRectangle(cornerRadius: DSRadius.md))
            .overlay(
                RoundedRectangle(cornerRadius: DSRadius.md)
                    .stroke(DSColor.primary.opacity(0.35), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}
