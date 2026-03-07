import SwiftUI

public enum DSColor {

    // MARK: - Brand

    /// Primary brand action colour — CTAs, buttons, icons, progress indicators.
    public static let primary   = Color(hex: 0x3DB87A)

    /// Pressed / selected state of primary.
    public static let secondary = Color(hex: 0x2A9060)

    // MARK: - Surfaces

    /// Main screen background — adaptive for light/dark.
    public static let background = Color(.systemGroupedBackground)

    /// Card / sheet surface — adaptive for light/dark.
    public static let card       = Color(.secondarySystemGroupedBackground)

    /// Elevated card surface (modals, popovers).
    public static let cardRaised = Color(.tertiarySystemGroupedBackground)

    // MARK: - Text

    /// Primary text — fully adaptive (near-black in light, near-white in dark).
    public static let ink   = Color(.label)

    /// Secondary / caption text — adaptive.
    public static let slate = Color(.secondaryLabel)

    // MARK: - Surfaces (fixed)

    /// Dark navy surface — hero header backgrounds, bottom tab bar.
    public static let surface = Color(hex: 0x1C2438)

    // MARK: - Semantic

    public static let success = Color(hex: 0x3DB87A)
    public static let warning = Color(hex: 0xF59E0B)
    public static let error   = Color(hex: 0xEF4444)

    /// Informational blue — active stepper step, info indicators.
    public static let info    = Color(hex: 0x3B82F6)

    // MARK: - Score status

    public static let scoreExcellent = Color(hex: 0x3DB87A)  // ≥ 85
    public static let scoreGood      = Color(hex: 0x60B8F0)  // 65–84
    public static let scoreFair      = Color(hex: 0xF59E0B)  // 45–64
    public static let scorePoor      = Color(hex: 0xF97316)  // 20–44
    public static let scoreCritical  = Color(hex: 0xEF4444)  //  0–19

}
