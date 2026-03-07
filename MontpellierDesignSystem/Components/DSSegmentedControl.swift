import SwiftUI

/// Horizontal pill-style segmented tab control.
/// Active segment slides to the selected option with a spring animation.
public struct DSSegmentedControl: View {

    public var options: [String]
    @Binding public var selectedIndex: Int

    public init(options: [String], selectedIndex: Binding<Int>) {
        self.options       = options
        self._selectedIndex = selectedIndex
    }

    @Namespace private var selectionNamespace

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id: \.self) { index in
                let isSelected = index == selectedIndex

                Button {
                    withAnimation(.spring(duration: 0.3)) {
                        selectedIndex = index
                    }
                } label: {
                    Text(options[index])
                        .font(DSTypography.captionBold)
                        .foregroundStyle(isSelected ? DSColor.ink : DSColor.slate)
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background {
                            if isSelected {
                                Capsule()
                                    .fill(.white)
                                    .shadow(
                                        color: DSShadow.subtle.color,
                                        radius: DSShadow.subtle.radius,
                                        y: DSShadow.subtle.y
                                    )
                                    .matchedGeometryEffect(id: "selection", in: selectionNamespace)
                            }
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(DSSpacing.xs)
        .background(DSColor.cardRaised, in: Capsule())
    }
}
