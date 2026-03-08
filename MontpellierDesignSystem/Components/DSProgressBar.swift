import SwiftUI

/// Horizontal progress bar. Used in fix wizard step flow and scan progress.
public struct DSProgressBar: View {

    public var progress: Double
    public var color: Color
    public var height: CGFloat

    public init(
        progress: Double,
        color: Color = DSColor.primary,
        height: CGFloat = DSSpacing.md
    ) {
        self.progress = progress
        self.color    = color
        self.height   = height
    }

    public var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(color.opacity(0.15))
                Rectangle()
                    .fill(color)
                    .frame(width: geo.size.width * max(0, min(1, progress)))
                    .animation(.spring(duration: 0.4), value: progress)
            }
        }
        .frame(height: height)
        .clipShape(Capsule())
        .padding(.vertical, DSSpacing.md)
    }
}
