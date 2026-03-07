import SwiftUI

/// A small filled circle used to indicate status in list rows and metric tables.
public struct DSStatusDot: View {

    public var color: Color
    public var size: CGFloat

    public init(color: Color, size: CGFloat = 8) {
        self.color = color
        self.size  = size
    }

    public var body: some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
            .accessibilityHidden(true)
    }
}
