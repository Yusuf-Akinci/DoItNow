//
//  ItemRowView.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 23.06.26.
//

import SwiftUI

struct ItemRowView: View{
    let item: Item
    let height: CGFloat
    var body: some View{
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(relevanceImg.lvlImg(item: item))
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
        }
        .padding(.vertical, 8)
    }
}


#Preview (traits: .sizeThatFitsLayout){
    ItemRowView(item: Item(id: "abc23", authorId: "Yusuf", title: "fjdaslk", description: "jkfdl sdjfkl", startDate: .now, status: .todo, taskDifficulty: .medium), height: 150)
}
