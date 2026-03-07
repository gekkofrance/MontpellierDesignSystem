import SwiftUI

// MARK: - DSTileGrid

/// A multi-column grid where every child is sized to the same width and height —
/// determined by the tallest and widest item. Use this instead of a raw `LazyVGrid`
/// whenever tiles must be visually uniform regardless of content length.
///
/// ```swift
/// DSTileGrid {
///     DSSummaryTile(title: "Score", value: "87")
///     DSSummaryTile(title: "Last sync", value: "2 hours ago")
///     DSSummaryTile(title: "Items", value: "1,204")
///     DSSummaryTile(title: "Rate", value: "94%")
/// }
/// ```
public struct DSTileGrid<Content: View>: View {

    private let columns: Int
    private let content: Content

    public init(columns: Int = 2, @ViewBuilder content: () -> Content) {
        self.columns = columns
        self.content = content()
    }

    public var body: some View {
        EqualSizeGridLayout(columns: columns, spacing: DSSpacing.md) {
            content
        }
    }
}

// MARK: - EqualSizeGridLayout

/// Custom `Layout` that measures all children, sizes every child to the largest
/// natural size, then places them in a grid. Single-pass — no state or preference keys.
struct EqualSizeGridLayout: Layout {

    var columns: Int
    var spacing: CGFloat

    struct Cache {
        var itemSize: CGSize = .zero
    }

    func makeCache(subviews: Subviews) -> Cache {
        Cache()
    }

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Cache
    ) -> CGSize {
        guard !subviews.isEmpty else { return .zero }

        let totalWidth = proposal.width ?? 0
        let columnWidth = (totalWidth - spacing * CGFloat(columns - 1)) / CGFloat(columns)

        // Measure each child at its column width; find the tallest natural height.
        let maxHeight = subviews
            .map { $0.sizeThatFits(ProposedViewSize(width: columnWidth, height: nil)).height }
            .max() ?? 0

        cache.itemSize = CGSize(width: columnWidth, height: maxHeight)

        let rows = Int(ceil(Double(subviews.count) / Double(columns)))
        let totalHeight = CGFloat(rows) * maxHeight + CGFloat(max(0, rows - 1)) * spacing

        return CGSize(width: totalWidth, height: totalHeight)
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Cache
    ) {
        let itemSize = cache.itemSize
        let itemProposal = ProposedViewSize(itemSize)

        for (index, subview) in subviews.enumerated() {
            let row = index / columns
            let col = index % columns
            let origin = CGPoint(
                x: bounds.minX + CGFloat(col) * (itemSize.width + spacing),
                y: bounds.minY + CGFloat(row) * (itemSize.height + spacing)
            )
            subview.place(at: origin, proposal: itemProposal)
        }
    }
}
