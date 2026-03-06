import SwiftUI

public struct DSSummaryTile: View {

    public var title: String
    public var value: String

    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }

    public var body: some View {

        DSCard {

            VStack(alignment: .leading, spacing: DSSpacing.sm) {

                Text(title)
                    .font(DSTypography.caption)
                    .foregroundStyle(.secondary)

                Text(value)
                    .font(DSTypography.title)

            }

        }
    }
}
