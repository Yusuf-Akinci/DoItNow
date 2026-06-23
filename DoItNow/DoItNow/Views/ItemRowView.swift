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

            Image(lvlImg(item: item))
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
        }
        .padding(.vertical, 8)
    }
}
private func lvlImg(item: Item)->ImageResource{
    if(item.taskRelevance == .low) {return ImageResource(name: "easy", bundle: .main)}
    if(item.taskRelevance == .medium) {return ImageResource(name: "medium", bundle: .main)}
    if(item.taskRelevance == .high) {return ImageResource(name: "hard", bundle: .main)}
    return ImageResource(name: "easy", bundle: .main)
}

#Preview (traits: .sizeThatFitsLayout){
    ItemRowView(item: Item(id: "abc23", authorId: "Yusuf", title: "fjdaslk", description: "jkfdl sdjfkl", startDate: .now, status: .todo, taskRelevance: .medium), height: 150)
}
