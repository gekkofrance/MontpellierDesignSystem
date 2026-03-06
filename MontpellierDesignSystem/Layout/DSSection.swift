import SwiftUI

public struct DSSection<Content: View>: View {

    let title: String?
    let content: Content

    public init(title: String? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    public var body: some View {

        VStack(alignment: .leading, spacing: DSSpacing.sm) {

            if let title {
                Text(title)
                    .font(DSTypography.caption)
                    .foregroundStyle(.secondary)
                    .textCase(.uppercase)
            }

            content

        }
    }
}
