import SwiftUI

public struct DSScreen<Content: View>: View {

    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: DSSpacing.lg) {

                content

            }
            .padding(DSSpacing.lg)
        }
        .background(DSColor.background)
    }
}
