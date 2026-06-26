import SwiftUI

struct ItemRowView: View {

    let item: Item

    var body: some View {
        HStack(spacing: 16) {

            Circle()
                .fill(color.opacity(0.15))
                .frame(width: 52, height: 52)
                .overlay {
                    Image(systemName: symbol)
                        .font(.title3)
                        .foregroundStyle(color)
                }

            VStack(alignment: .leading, spacing: 6) {

                Text(item.title)
                    .font(.headline)
                    .lineLimit(1)

                Text(item.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.tertiary)
        }
        .padding(18)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private var symbol: String {
        switch item.taskDifficulty {
        case .low:
            return "leaf.fill"
        case .medium:
            return "flame.fill"
        case .high:
            return "bolt.fill"
        case .unknown:
            return "questionmark"
        }
    }

    private var color: Color {
        switch item.taskDifficulty {
        case .low:
            return .green
        case .medium:
            return .orange
        case .high:
            return .red
        case .unknown:
            return .gray
        }
    }
}
