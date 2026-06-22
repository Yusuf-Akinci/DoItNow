//
//  ListView.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 22.06.26.
//

import SwiftUI

struct ListView: View {
    let title: String
    var body: some View {
        VStack{
            Text(title).font(.headline)
            List{
                Text("Item 1")
                Text("Item 1")
                Text("Item 1")
            }
        }
    }
}

#Preview {
    ListView(title: "ToDo")
}
