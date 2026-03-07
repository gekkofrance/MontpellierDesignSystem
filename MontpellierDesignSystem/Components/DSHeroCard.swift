import SwiftUI

/// Full-bleed image card with a gradient overlay and bottom-anchored text.
/// The consuming app is responsible for providing the image asset name.
public struct DSHeroCard: View {

    public var imageName: String
    public var title: String
    public var subtitle: String?
    public var aspectRatio: CGFloat

    public init(
        imageName: String,
        title: String,
        subtitle: String? = nil,
        aspectRatio: CGFloat = 16 / 9
    ) {
        self.imageName   = imageName
        self.title       = title
        self.subtitle    = subtitle
        self.aspectRatio = aspectRatio
    }

    public var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .scaledToFill()

            LinearGradient(
                colors: [.clear, .black.opacity(0.65)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: DSSpacing.xs) {
                Text(title)
                    .font(DSTypography.bodyBold)
                    .foregroundStyle(.white)

                if let subtitle {
                    Text(subtitle)
                        .font(DSTypography.caption)
                        .foregroundStyle(.white.opacity(0.8))
                }
            }
            .padding(DSSpacing.md)
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.lg))
        .shadow(
            color: DSShadow.card.color,
            radius: DSShadow.card.radius,
            y: DSShadow.card.y
        )
    }
}
