//
//  StatusPicker.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 25.06.26.
//

import SwiftUI

struct StatusPicker: View {
    var category: CategoryToPick
    @Binding var difficulty: TaskDifficulty
    @Binding var status: Status

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: iconName)
                .font(.headline)
                .foregroundStyle(iconColor)
                .frame(width: 28, height: 28)
                .background(iconColor.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            switch category {
            case .status:
                Text("Status")
                    .font(.subheadline.weight(.semibold))

                Spacer()

                Picker("Status", selection: $status) {
                    ForEach(Status.allCases.filter { $0 != .unknown }, id: \.self) { status in
                        Text(status.rawValue)
                    }
                }
                .tint(.primary)

            case .difficulty:
                Text("Difficulty")
                    .font(.subheadline.weight(.semibold))

                Spacer()

                Picker("Difficulty", selection: $difficulty) {
                    ForEach(TaskDifficulty.allCases.filter { $0 != .unknown }, id: \.self) { difficulty in
                        Text(difficulty.rawValue)
                    }
                }
                .tint(.primary)
            }
        }
        .padding(.vertical, 8)
    }

    private var iconName: String {
        switch category {
        case .status:
            "list.bullet.circle"
        case .difficulty:
            "flag.checkered"
        }
    }

    private var iconColor: Color {
        switch category {
        case .status:
            .blue
        case .difficulty:
            .orange
        }
    }
}

#Preview {
    StatusPicker(category: CategoryToPick.difficulty, difficulty: .constant(.high), status: .constant(.todo))
}

enum CategoryToPick{
    case status
    case difficulty
}
