import SwiftUI

/// Sticky bottom input bar for chat screens. Pair with a `ScrollView`
/// of `DSChatBubble` rows above it.
public struct DSMessageInputBar: View {

    @Binding public var text: String
    public var placeholder: String
    public var onSend: () -> Void

    public init(
        text: Binding<String>,
        placeholder: String = "Type your message...",
        onSend: @escaping () -> Void
    ) {
        self._text       = text
        self.placeholder = placeholder
        self.onSend      = onSend
    }

    public var body: some View {
        VStack(spacing: 0) {
            Divider()

            HStack(spacing: DSSpacing.sm) {
                TextField(placeholder, text: $text)
                    .font(DSTypography.body)
                    .padding(.horizontal, DSSpacing.md)
                    .padding(.vertical, DSSpacing.sm)
                    .background(DSColor.cardRaised, in: Capsule())

                Button(action: onSend) {
                    Image(systemName: "arrow.up")
                        .font(DSTypography.bodyBold)
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(DSColor.primary, in: Circle())
                }
                .disabled(text.isEmpty)
                .opacity(text.isEmpty ? 0.4 : 1)
                .buttonStyle(.plain)
            }
            .padding(.horizontal, DSSpacing.md)
            .padding(.vertical, DSSpacing.sm)
        }
        .background(DSColor.background)
    }
}
