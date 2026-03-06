import SwiftUI

public struct DSCard<Content: View>: View {

    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {

        content
            .padding(DSSpacing.md)
            .background(DSColor.card)
            .cornerRadius(DSRadius.md)
            .shadow(color: .black.opacity(0.06), radius: 6, y: 3)
    }
}
