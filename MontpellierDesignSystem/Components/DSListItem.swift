import SwiftUI

public struct DSListItem: View {

    public var title: String
    public var subtitle: String?
    public var trailing: String?
    private let trailingView: AnyView?

    /// Standard row with an optional trailing string value.
    public init(title: String, subtitle: String? = nil, trailing: String? = nil) {
        self.title       = title
        self.subtitle    = subtitle
        self.trailing    = trailing
        self.trailingView = nil
    }

    /// Row with an arbitrary trailing view (badge, icon, toggle, etc.).
    public init<Trailing: View>(
        title: String,
        subtitle: String? = nil,
        @ViewBuilder trailingContent: () -> Trailing
    ) {
        self.title        = title
        self.subtitle     = subtitle
        self.trailing     = nil
        self.trailingView = AnyView(trailingContent())
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

            if let trailingView {
                trailingView
            } else if let trailing {
                Text(trailing)
                    .font(DSTypography.body)
                    .foregroundStyle(.secondary)
            }

        }
        .padding(.vertical, DSSpacing.sm)
    }
}
