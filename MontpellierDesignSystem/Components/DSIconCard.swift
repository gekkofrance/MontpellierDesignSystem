//
//  SwiftUIView.swift
//  MontpellierDesignSystem
//
//  Created by Don Reed on 08/03/2026.
//

import SwiftUI

public struct DSIconCard: View {
    
    public var title: String
    public var subtitle: String
    public var symbol: String
    public var color: Color
    public var size: CGFloat
    public var cornerRadius: CGFloat
    public var isActive: Bool
    
    let action:    () -> Void

    public init(
        title: String,
        subtitle: String,
        symbol: String,
        color: Color = DSColor.primary,
        size: CGFloat = 44,
        cornerRadius: CGFloat = DSRadius.sm,
        isActive: Bool,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.symbol = symbol
        self.color = color
        self.size = size
        self.cornerRadius = cornerRadius
        self.isActive = isActive
        self.action = action
    }
    
    
    public var body: some View {
        Button(action: action) {
            DSCard {
                VStack(alignment: .leading, spacing: DSSpacing.sm) {
                    
                    DSIconTile(symbol: symbol, color: color, size: size, cornerRadius: cornerRadius)
                    Text(title)
                        .font(DSTypography.body)
                        .bold()
                        .foregroundStyle(DSColor.ink)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2, reservesSpace: true)
                        .multilineTextAlignment(.leading)
                    
                    Text(subtitle)
                        .font(DSTypography.caption)
                        .foregroundStyle(DSColor.slate)
                        .lineLimit(2)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(isActive ? 0.5 : 1.0)
            }
        }
        .disabled(isActive)
        .buttonStyle(DSButtonStyle())
        .accessibilityLabel(subtitle)
        .accessibilityHint(isActive ? "Action is running" : subtitle)
    }

}

#Preview {
    VStack {
        DSIconCard(
            title: "No Internet at all",
            subtitle: "Nothing working - apps, browser, everything",
            symbol: "wifi",
            color: .green,
            size: 40,
            isActive: false,
            action: {
            }
        )
        DSIconCard(
            title: "No Internet at all",
            subtitle: "Nothing working - apps, browser, everything",
            symbol: "wifi",
            color: .green,
            size: 40,
            isActive: true,
            action: {
            }
        )
    }
}
