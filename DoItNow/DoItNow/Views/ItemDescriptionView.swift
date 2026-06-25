//
//  ItemDescriptionView.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 24.06.26.
//

import SwiftUI

struct ItemDescriptionView: View {
    let item: Item

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header

                VStack(spacing: 0) {
                    DetailRow(title: "Description", value: item.description)
                    Divider()
                    DetailRow(title: "Created", value: item.startDate.formatted(date: .abbreviated, time: .shortened))
                    Divider()
                    DetailRow(title: "Category", value: item.status.rawValue)
                    Divider()
                    DetailRow(title: "Difficulty", value: item.taskDifficulty.rawValue)
                }
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding()
        }
        .navigationTitle("Task Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.title2.bold())
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)

                Text(item.status.rawValue)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(relevanceImg.lvlImg(item: item))
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(8)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

private struct DetailRow: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
                .textCase(.uppercase)

            Text(value)
                .font(.body)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

#Preview {
    NavigationStack {
        ItemDescriptionView(item: Item(id: "abc123", authorId: "Yusuf", title: "Go Shopping", description: "Go shopping with mum", status: .todo, taskDifficulty: .medium))
    }
}
