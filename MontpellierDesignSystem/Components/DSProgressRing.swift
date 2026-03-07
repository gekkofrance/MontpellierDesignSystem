import SwiftUI

/// Animated circular progress ring with an optional centre label.
///
/// Use for any score or progress value expressed as a fraction of a total.
/// The label content is provided via a `@ViewBuilder` closure, keeping
/// domain-specific text out of the design system.
///
/// ```swift
/// DSProgressRing(value: score, total: 100, color: .appGreen, isAnimating: true) {
///     Text("\(score)")
/// }
/// ```
public struct DSProgressRing<Label: View>: View {

    public var value: Int
    public var total: Int
    public var color: Color
    public var isAnimating: Bool
    private let label: Label

    public init(
        value: Int,
        total: Int,
        color: Color = DSColor.primary,
        isAnimating: Bool = false,
        @ViewBuilder label: () -> Label
    ) {
        self.value       = value
        self.total       = total
        self.color       = color
        self.isAnimating = isAnimating
        self.label       = label()
    }

    @State private var pulse = false

    public var body: some View {
        ZStack {
            if isAnimating {
                Circle()
                    .stroke(color.opacity(0.25), lineWidth: 6)
                    .scaleEffect(pulse ? 1.18 : 1.0)
                    .opacity(pulse ? 0 : 1)
                    .animation(.easeOut(duration: 1.1).repeatForever(autoreverses: false), value: pulse)
                    .onAppear { pulse = true }
                    .onDisappear { pulse = false }
            }

            Circle()
                .stroke(color.opacity(0.12), lineWidth: 10)

            Circle()
                .trim(from: 0, to: total > 0 ? CGFloat(value) / CGFloat(total) : 0)
                .stroke(color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.spring(duration: 1.0), value: value)

            label
        }
    }
}
