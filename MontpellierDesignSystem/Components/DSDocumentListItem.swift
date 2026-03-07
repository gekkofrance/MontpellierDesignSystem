import SwiftUI

/// A document row with a leading icon tile, file name, file-type badge, and optional date.
/// Use inside a `DSCard` with `Divider()`s between items.
public struct DSDocumentListItem: View {

    public var fileName: String
    public var fileType: String
    public var date: String?
    public var iconSymbol: String
    public var iconColor: Color

    public init(
        fileName: String,
        fileType: String,
        date: String? = nil,
        iconSymbol: String = "doc.fill",
        iconColor: Color = DSColor.primary
    ) {
        self.fileName   = fileName
        self.fileType   = fileType
        self.date       = date
        self.iconSymbol = iconSymbol
        self.iconColor  = iconColor
    }

    public var body: some View {
        HStack(spacing: DSSpacing.md) {
            DSIconTile(symbol: iconSymbol, color: iconColor, size: 40, cornerRadius: DSRadius.sm)

            VStack(alignment: .leading, spacing: DSSpacing.xs) {
                Text(fileName)
                    .font(DSTypography.body)
                    .foregroundStyle(DSColor.ink)

                HStack(spacing: DSSpacing.xs) {
                    DSBadge(label: fileType, color: DSColor.slate)

                    if let date {
                        Text(date)
                            .font(DSTypography.caption)
                            .foregroundStyle(DSColor.slate)
                    }
                }
            }

            Spacer()
        }
        .padding(.vertical, DSSpacing.sm)
    }
}
