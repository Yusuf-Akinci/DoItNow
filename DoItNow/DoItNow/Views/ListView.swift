//
//  ListView.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 22.06.26.
//

import SwiftUI

struct ListView: View {
    let title: String
    @Binding var items: [Item]
    var body: some View {
        VStack{
            Text(title).font(.headline)
            List(items) { item in
                NavigationLink(value: NavPath.details(item)){
                    ItemRowView(item: item, height: 100)
                }
            }
        }
    }
}

#Preview {
    ListView(title: "ToDo",items: .constant(
                [Item(id: "abc123", authorId: "Yusuf", title: "Go Shopping", description: "Go shopping with mum", status: .todo, taskDifficulty: .medium)]))
}
