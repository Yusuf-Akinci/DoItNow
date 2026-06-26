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

        ScrollView {

            VStack(alignment: .leading, spacing: 16) {

                Text(title)
                    .font(.largeTitle.bold())
                    .padding(.horizontal)

                if items.isEmpty {

                    EmptyTaskView()

                } else {

                    LazyVStack(spacing: 14) {

                        ForEach(items) { item in

                            NavigationLink(value: NavPath.details(item)) {

                                ItemRowView(item: item)
                            }
                            .buttonStyle(.plain)
                            
                        }
                        
                        
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .background(Color(.systemGroupedBackground))
    }
    
}
