import SwiftUI

/// A card displaying a large percentage value with a progress bar and optional supporting text.
/// Useful for completion rates, scores, or any 0–100 metric.
public struct DSMetricCard: View {

    public var label: String
    public var value: Int
    public var supportingText: String?
    public var color: Color

    public init(
        label: String,
        value: Int,
        supportingText: String? = nil,
        color: Color = DSColor.primary
    ) {
        self.label          = label
        self.value          = value
        self.supportingText = supportingText
        self.color          = color
    }

    public var body: some View {
        DSCard {
            VStack(alignment: .leading, spacing: DSSpacing.sm) {
                Text(label)
                    .font(DSTypography.captionBold)
                    .foregroundStyle(DSColor.slate)

                Text("\(value)%")
                    .font(DSTypography.numericLarge)
                    .foregroundStyle(color)

                DSProgressBar(
                    progress: Double(max(0, min(100, value))) / 100.0,
                    color: color,
                    height: 6
                )

                if let supportingText {
                    Text(supportingText)
                        .font(DSTypography.caption)
                        .foregroundStyle(DSColor.slate)
                }
            }
        }
    }
}
