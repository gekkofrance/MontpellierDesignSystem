import SwiftUI

public enum DSTypography {

    // MARK: - Scale

    /// Extra-large display — greeting headlines, dashboard hero text.
    public static let display      = Font.system(size: 48, weight: .bold)

    /// Display — hero screens, onboarding headlines.
    public static let hero         = Font.system(size: 34, weight: .bold)

    /// Section titles, screen headings.
    public static let title        = Font.system(size: 22, weight: .semibold)

    /// Standard body copy.
    public static let body         = Font.system(size: 17)

    /// Emphasised body — card titles, button labels.
    public static let bodyBold     = Font.system(size: 17, weight: .semibold)

    /// Supporting / metadata text.
    public static let caption      = Font.system(size: 13)

    /// Emphasised caption — section headers, labels, badges.
    public static let captionBold  = Font.system(size: 13, weight: .semibold)

    // MARK: - Numeric

    /// Large rounded numerals — score display, counters.
    public static let numeric      = Font.system(size: 36, weight: .bold, design: .rounded)

    /// Extra-large rounded numerals — countdown timer.
    public static let numericLarge = Font.system(size: 56, weight: .bold, design: .rounded)

}
