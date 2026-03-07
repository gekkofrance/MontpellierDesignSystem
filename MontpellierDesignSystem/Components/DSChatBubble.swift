import SwiftUI

public enum DSChatBubbleAlignment: Sendable {
    case leading    // AI / received — light surface, ink text
    case trailing   // User / sent — primary green, white text
}

/// A single chat message bubble. Compose multiple bubbles inside a
/// scrollable `VStack` to build a conversation view.
public struct DSChatBubble: View {

    public var message: String
    public var alignment: DSChatBubbleAlignment

    public init(message: String, alignment: DSChatBubbleAlignment = .leading) {
        self.message   = message
        self.alignment = alignment
    }

    private var isLeading: Bool { alignment == .leading }

    public var body: some View {
        HStack {
            if !isLeading { Spacer(minLength: 60) }

            Text(message)
                .font(DSTypography.body)
                .foregroundStyle(isLeading ? DSColor.ink : .white)
                .padding(.horizontal, DSSpacing.md)
                .padding(.vertical, DSSpacing.sm)
                .background(
                    isLeading ? DSColor.cardRaised : DSColor.primary,
                    in: RoundedRectangle(cornerRadius: DSRadius.md)
                )

            if isLeading { Spacer(minLength: 60) }
        }
    }
}
