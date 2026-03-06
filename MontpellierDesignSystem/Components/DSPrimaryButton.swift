import SwiftUI

public struct DSPrimaryButton: View {

    public var title: String
    public var action: () -> Void

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {

        Button(action: action) {

            Text(title)
                .font(DSTypography.body)
                .frame(maxWidth: .infinity)
                .padding(DSSpacing.md)

        }
        .background(DSColor.primary)
        .foregroundColor(.white)
        .cornerRadius(DSRadius.md)
    }
}
