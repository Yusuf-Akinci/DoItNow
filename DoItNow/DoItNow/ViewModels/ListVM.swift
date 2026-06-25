//
//  ListVM.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 24.06.26.
//

import Foundation
import Combine

final class ListVM: ObservableObject{ // Observable = Änderungen werden sofort gemeldet, damit die Benutzeroberfläche automatisch aktualisiert wird
    @Published var todoItems: [Item] = [
        Item(id: "todo-1", authorId: "Yusuf", title: "Buy groceries", description: "Pick up vegetables, milk, bread, and coffee after class.", startDate: .now, status: .todo, taskDifficulty: .low),
        Item(id: "todo-2", authorId: "Mina", title: "Plan project outline", description: "Write the first structure for the SwiftUI task app presentation.", startDate: .now.addingTimeInterval(3600), status: .todo, taskDifficulty: .medium),
        Item(id: "todo-3", authorId: "Ahmet", title: "Clean desk", description: "Organize notebooks, chargers, and old receipts before starting work.", startDate: .now.addingTimeInterval(7200), status: .todo, taskDifficulty: .low),
        Item(id: "todo-4", authorId: "Yusuf", title: "Prepare exam notes", description: "Summarize the important chapters and mark open questions.", startDate: .now.addingTimeInterval(10800), status: .todo, taskDifficulty: .high)
    ]

    @Published var inProgressItems: [Item] = [
        Item(id: "progress-1", authorId: "Yusuf", title: "Build create item screen", description: "Add text fields, difficulty picker, and save button for new tasks.", startDate: .now.addingTimeInterval(-1800), status: .inProgress, taskDifficulty: .high),
        Item(id: "progress-2", authorId: "Betül", title: "Review pull request", description: "Check layout changes and make sure navigation still works.", startDate: .now.addingTimeInterval(-5400), status: .inProgress, taskDifficulty: .medium)
    ]

    @Published var doneItems: [Item] = [
        Item(id: "done-1", authorId: "Yusuf", title: "Rename difficulty model", description: "Replace old task relevance naming with task difficulty.", startDate: .now.addingTimeInterval(-86400), status: .done, taskDifficulty: .medium),
        Item(id: "done-2", authorId: "Ahmet", title: "Fix detail navigation", description: "Connect list rows to the item detail screen using NavigationLink values.", startDate: .now.addingTimeInterval(-172800), status: .done, taskDifficulty: .high),
        Item(id: "done-3", authorId: "Zafer", title: "Choose task icons", description: "Select easy, medium, and hard images for difficulty display.", startDate: .now.addingTimeInterval(-259200), status: .done, taskDifficulty: .low)
    ]

    @Published var unknownItems: [Item] = [
        Item(id: "unknown-1", authorId: "System", title: "Imported task", description: "This task came from old data and still needs a category.", startDate: .now.addingTimeInterval(-3600), status: .unknown, taskDifficulty: .unknown)
    ]
}
