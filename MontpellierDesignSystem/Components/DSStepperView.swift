import SwiftUI

// MARK: - DSStepState

public enum DSStepState: Sendable {
    case completed
    case active
    case pending
}

// MARK: - DSStep

public struct DSStep: Identifiable, Sendable {

    public let id: UUID
    public let title: String
    public let date: String?
    public let state: DSStepState

    public init(title: String, date: String? = nil, state: DSStepState) {
        self.id    = UUID()
        self.title = title
        self.date  = date
        self.state = state
    }
}

// MARK: - DSStepperView

/// Vertical timeline stepper for sequential case or process steps.
public struct DSStepperView: View {

    public var steps: [DSStep]

    public init(steps: [DSStep]) {
        self.steps = steps
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(steps.enumerated()), id: \.element.id) { index, step in
                HStack(alignment: .top, spacing: DSSpacing.md) {
                    // Indicator column
                    VStack(spacing: 0) {
                        stepCircle(for: step.state)
                        if index < steps.count - 1 {
                            Rectangle()
                                .fill(DSColor.slate.opacity(0.25))
                                .frame(width: 2, height: 40)
                        }
                    }

                    // Content column
                    VStack(alignment: .leading, spacing: DSSpacing.xs) {
                        HStack(spacing: DSSpacing.sm) {
                            Text(step.title)
                                .font(DSTypography.bodyBold)
                                .foregroundStyle(DSColor.ink)
                            stepBadge(for: step.state)
                        }

                        if let date = step.date {
                            Text(date)
                                .font(DSTypography.caption)
                                .foregroundStyle(DSColor.slate)
                        }
                    }
                    .padding(.bottom, index < steps.count - 1 ? DSSpacing.sm : 0)
                }
            }
        }
    }

    @ViewBuilder
    private func stepCircle(for state: DSStepState) -> some View {
        switch state {
        case .completed:
            Circle()
                .fill(DSColor.success)
                .frame(width: 24, height: 24)
                .overlay {
                    Image(systemName: "checkmark")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(.white)
                }
        case .active:
            Circle()
                .fill(DSColor.info)
                .frame(width: 24, height: 24)
                .overlay {
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                }
        case .pending:
            Circle()
                .stroke(DSColor.slate.opacity(0.4), lineWidth: 2)
                .frame(width: 24, height: 24)
        }
    }

    @ViewBuilder
    private func stepBadge(for state: DSStepState) -> some View {
        switch state {
        case .completed:
            DSBadge(label: "Done", icon: "checkmark", color: DSColor.success)
        case .active:
            DSBadge(label: "In Progress", color: DSColor.info)
        case .pending:
            DSBadge(label: "Pending", color: DSColor.slate)
        }
    }
}
