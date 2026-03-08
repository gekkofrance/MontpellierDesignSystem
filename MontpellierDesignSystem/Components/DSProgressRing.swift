import SwiftUI

/// Animated circular progress ring with an optional centre label.
///
/// Use for any score or progress value expressed as a fraction of a total.
/// The label content is provided via a `@ViewBuilder` closure, keeping
/// domain-specific text out of the design system.
///
/// ```swift
/// DSProgressRing(value: score, total: 100, color: .appGreen, isAnimating: true) {
///     Text("\(score)")
/// }
/// ```
//public struct DSProgressRing<Label: View>: View {
//
//    public var value: Int
//    public var total: Int
//    public var color: Color
//    public var isAnimating: Bool
//    private let label: Label
//
//    public init(
//        value: Int,
//        total: Int,
//        color: Color = DSColor.primary,
//        isAnimating: Bool = false,
//        @ViewBuilder label: () -> Label
//    ) {
//        self.value       = value
//        self.total       = total
//        self.color       = color
//        self.isAnimating = isAnimating
//        self.label       = label()
//    }
//
//    @State private var pulse = false
//
//    public var body: some View {
//        ZStack {
//            if isAnimating {
//                Circle()
//                    .stroke(color.opacity(0.25), lineWidth: 6)
//                    .scaleEffect(pulse ? 1.18 : 1.0)
//                    .opacity(pulse ? 0 : 1)
//                    .animation(.easeOut(duration: 1.1).repeatForever(autoreverses: false), value: pulse)
//                    .onAppear { pulse = true }
//                    .onDisappear { pulse = false }
//            }
//
//            Circle()
//                .stroke(color.opacity(0.12), lineWidth: 10)
//
//            Circle()
//                .trim(from: 0, to: total > 0 ? CGFloat(value) / CGFloat(total) : 0)
//                .stroke(color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
//                .rotationEffect(.degrees(-90))
//                .animation(.spring(duration: 1.0), value: value)
//
//            label
//        }
//    }
//}

//import SwiftUI
//
//struct ProgressRing: View {
//    let score: Double // 0 to 100
//    let size: CGFloat
//    
//    // Derived values
//    private var normalizedScore: Double { min(max(score / 100, 0), 1) }
//    private var color: Color {
//        switch score {
//        case 0..<40: return .red
//        case 40..<70: return .orange
//        default: return .green
//        }
//    }
//    private var comment: String {
//        switch score {
//        case 0..<40: return "Low"
//        case 40..<70: return "Medium"
//        default: return "High"
//        }
//    }
//
//    var body: some View {
//        ZStack {
//            // Background track
//            Circle()
//                .stroke(lineWidth: size * 0.1)
//                .opacity(0.2)
//                .foregroundColor(.gray)
//            
//            // Progress arc
//            Circle()
//                .trim(from: 0, to: normalizedScore)
//                .stroke(style: StrokeStyle(lineWidth: size * 0.1, lineCap: .round))
//                .foregroundColor(color)
//                .rotationEffect(.degrees(-90))
//                .animation(.easeInOut, value: normalizedScore)
//            
//            // Text labels
//            VStack {
//                Image(systemName: "star.fill")
//                    .font(.system(size: size * 0.125))
//                Text("\(Int(score))")
//                    .font(.system(size: size * 0.25, weight: .bold))
//                Text(comment)
//                    .font(.system(size: size * 0.15))
//                    .foregroundColor(.secondary)
//            }
//        }
//        .frame(width: size, height: size)
//    }
//}

import SwiftUI

struct DSProgressRing: View {
    
    let score: Double
    var icon: String = ""
    
    private var normalizedScore: Double { min(max(score / 100, 0), 1) }
    private var color: Color { score < 40 ? .red : score < 70 ? .orange : .green }
    private var label: String { score < 40 ? "Low" : score < 70 ? "Medium" : "High" }

    var body: some View {
        // We use a ZStack as our canvas.
        // The .containerRelativeFrame determines the master size.
        ZStack {
            // Using a circle with a fixed stroke ratio via overlay or
            // a custom shape can remove the need for GeometryReader.
            Circle()
                .stroke(lineWidth: 20) // We can make this dynamic if needed
                .opacity(0.2)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0, to: normalizedScore)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .foregroundColor(color)
                .rotationEffect(.degrees(-90))
            
            VStack {
                if !icon.isEmpty {
                    Image(systemName: icon)
                        .font(.system(size: 20))
                }
                
                Text("\(Int(score))")
                    .font(.system(size: 40, weight: .bold))
                Text(label)
                    .font(.system(size: 20))
                    .foregroundColor(.secondary)
            }
        }
        .containerRelativeFrame(.horizontal) { length, _ in length * 0.5 }
        .aspectRatio(1, contentMode: .fit)
    }
}
