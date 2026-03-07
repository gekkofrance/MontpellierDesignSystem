import SwiftUI

// MARK: - DSBannerStyle

public enum DSBannerStyle {
    case success
    case warning
    case error
    case info
    case neutral

    var tint: Color {
        switch self {
        case .success: DSColor.scoreExcellent
        case .warning: DSColor.warning
        case .error:   DSColor.error
        case .info:    DSColor.primary
        case .neutral: DSColor.slate
        }
    }
}

// MARK: - DSBanner

/// Tinted contextual banner with an icon and optional supporting message.
/// Use for inline status messages, alerts, and debug indicators.
public struct DSBanner: View {

    public var title: String
    public var message: String?
    public var icon: String
    public var style: DSBannerStyle

    public init(
        title: String,
        message: String? = nil,
        icon: String,
        style: DSBannerStyle = .info
    ) {
        self.title   = title
        self.message = message
        self.icon    = icon
        self.style   = style
    }

    public var body: some View {
        HStack(alignment: message == nil ? .center : .top, spacing: DSSpacing.sm) {
            Image(systemName: icon)
                .font(DSTypography.body)
                .foregroundStyle(style.tint)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: DSSpacing.xs) {
                Text(title)
                    .font(DSTypography.bodyBold)
                    .foregroundStyle(DSColor.ink)

                if let message {
                    Text(message)
                        .font(DSTypography.caption)
                        .foregroundStyle(DSColor.slate)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            Spacer(minLength: 0)
        }
        .padding(DSSpacing.md)
        .background(style.tint.opacity(0.08), in: RoundedRectangle(cornerRadius: DSRadius.md))
        .overlay(
            RoundedRectangle(cornerRadius: DSRadius.md)
                .stroke(style.tint.opacity(0.2), lineWidth: 1)
        )
    }
}
