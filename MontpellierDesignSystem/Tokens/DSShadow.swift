import SwiftUI

public struct Shadow: Sendable {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat

    public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}

public enum DSShadow {

    public static let card = Shadow(
        color: .black.opacity(0.08),
        radius: 8,
        x: 0,
        y: 4
    )

}
