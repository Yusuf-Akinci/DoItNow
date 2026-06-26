//
//  CreateItemView.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 24.06.26.
//

import SwiftUI

struct CreateItemView: View{
    let onCreate: (Item)->Void // Wir wollen später OnCreate(newItem) einfügen
    @State private var title = ""
    @State private var description = ""
    @State private var item = Item(id: "abc", authorId: "123", title: "Risale Oku (10dk)", description: "Her gün on dakika risalei nur oku ve not al.", status: .todo, taskDifficulty: .low)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 6) {
                    Image(systemName: "sparkle.magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(.teal)

                    Text("Create a focused task")
                        .font(.title2.weight(.bold))

                    Text("Keep it short, clear, and ready to start.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 12)

                VStack(spacing: 14) {
                    inputRow(
                        icon: "checkmark.circle",
                        title: "Title",
                        placeholder: "What do you want to do?",
                        text: $title
                    )

                    Divider()

                    VStack(alignment: .leading, spacing: 8) {
                        Label("Description", systemImage: "text.alignleft")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.secondary)

                        TextField("Add useful details", text: $description, axis: .vertical)
                            .lineLimit(4...7)
                            .textFieldStyle(.plain)
                    }
                }
                .padding(16)
                .background(.background)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: .black.opacity(0.06), radius: 12, y: 5)

                VStack(spacing: 4) {
                    StatusPicker(category: .status, difficulty: $item.taskDifficulty, status: $item.status)
                    Divider()
                    StatusPicker(category: .difficulty, difficulty: $item.taskDifficulty, status: $item.status)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(.background)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: .black.opacity(0.05), radius: 10, y: 4)

                Button {
                    let newItem: Item = Item(
                        id: UUID().uuidString,
                        authorId: "123",
                        title: title,
                        description: description,
                        status: item.status,
                        taskDifficulty: item.taskDifficulty)
                    onCreate(newItem) //This view does not save the item itself. It hands the item to whoever opened it.
                } label: {
                    Label("Create Task", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .foregroundStyle(.white)
                        .background(
                            LinearGradient(
                                colors: [.teal, .blue, .orange],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: .teal.opacity(0.25), radius: 10, y: 4)
                }
                .buttonStyle(.plain)
                .disabled(!canCreateTask)
                .opacity(canCreateTask ? 1 : 0.45)
            }
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("New Task")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var canCreateTask: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private func inputRow(
        icon: String,
        title: String,
        placeholder: String,
        text: Binding<String>
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: icon)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)

            TextField(placeholder, text: text)
                .font(.title3.weight(.semibold))
                .textFieldStyle(.plain)
        }
    }
}

#Preview {
    CreateItemView{_ in}
}

//service@ayyildiz.de
