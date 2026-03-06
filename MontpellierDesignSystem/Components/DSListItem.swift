import SwiftUI

public struct DSListItem: View {

    public var title: String
    public var subtitle: String?
    public var trailing: String?

    public init(title: String, subtitle: String? = nil, trailing: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.trailing = trailing
    }

    public var body: some View {

        HStack {

            VStack(alignment: .leading, spacing: DSSpacing.xs) {

                Text(title)
                    .font(DSTypography.body)

                if let subtitle {
                    Text(subtitle)
                        .font(DSTypography.caption)
                        .foregroundStyle(.secondary)
                }

            }

            Spacer()

            if let trailing {
                Text(trailing)
                    .font(DSTypography.body)
                    .foregroundStyle(.secondary)
            }

        }
        .padding(.vertical, DSSpacing.sm)
    }
}
