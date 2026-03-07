import SwiftUI

public struct Shadow: Sendable {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat

    public init(color: Color, radius: CGFloat, x: CGFloat = 0, y: CGFloat) {
        self.color  = color
        self.radius = radius
        self.x      = x
        self.y      = y
    }
}

public enum DSShadow {

    /// Standard card shadow.
    public static let card = Shadow(
        color: .black.opacity(0.06),
        radius: 8,
        y: 3
    )

    /// Subtle shadow for inline rows and secondary surfaces.
    public static let subtle = Shadow(
        color: .black.opacity(0.04),
        radius: 4,
        y: 2
    )

    /// Elevated shadow for sheets and floating elements.
    public static let elevated = Shadow(
        color: .black.opacity(0.12),
        radius: 16,
        y: 8
    )

}
