import SwiftUI

public struct DSPrimaryButton: View {

    public var title: String
    public var icon: String?
    public var isLoading: Bool
    public var action: () -> Void

    public init(
        title: String,
        icon: String? = nil,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title     = title
        self.icon      = icon
        self.isLoading = isLoading
        self.action    = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: DSSpacing.sm) {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                        .scaleEffect(0.85)
                } else if let icon {
                    Image(systemName: icon)
                        .accessibilityHidden(true)
                }
                Text(title)
                    .font(DSTypography.bodyBold)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(DSSpacing.md)
        }
        .buttonStyle(DSButtonStyle())
        .background(isLoading ? DSColor.primary.opacity(0.65) : DSColor.primary)
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.md))
        .disabled(isLoading)
    }
}

struct DSButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Shrink to 95%
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
