import SwiftUI

/// A rounded-rectangle icon container. The standard pattern for
/// SF Symbol icons in list rows, cards, and symptom pickers.
public struct DSIconTile: View {

    public var symbol: String
    public var color: Color
    public var size: CGFloat
    public var cornerRadius: CGFloat

    public init(
        symbol: String,
        color: Color = DSColor.primary,
        size: CGFloat = 44,
        cornerRadius: CGFloat = DSRadius.sm
    ) {
        self.symbol       = symbol
        self.color        = color
        self.size         = size
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(color.opacity(0.12))
                .frame(width: size, height: size)
            Image(systemName: symbol)
                .font(DSTypography.body)
                .foregroundStyle(color)
        }
        .accessibilityHidden(true)
    }
}
