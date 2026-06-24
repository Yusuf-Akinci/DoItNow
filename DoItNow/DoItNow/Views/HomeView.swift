//
//  HomeView.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 22.06.26.
//

import SwiftUI

struct HomeView: View {
    @State private var path: [NavPath] = [] //Alle navigations zustände werden schritt für schritt gespeichert
    @State private var toDoItems: [Item] = [Item(id: "abc23", authorId: "Yusuf", title: "fjdaslk", description: "jkfdl sdjfkl", startDate: .now, status: .todo, taskRelevance: .medium), Item(id: "fdas41", authorId: "Ahmet", title: "f32", description: "fjei vgg", startDate: .now, status: .todo, taskRelevance: .low)]
    @State private var inProgressItems: [Item] = [Item(id: "abc23", authorId: "Yusuf", title: "fjdaslk", description: "jkfdl sdjfkl", startDate: .now+4, status: .todo, taskRelevance: .medium), Item(id: "fdas41", authorId: "Ahmet", title: "f32", description: "fjei vgg", startDate: .now, status: .todo, taskRelevance: .medium)]
    @State private var doneItems: [Item] = [Item(id: "abc23", authorId: "Yusuf", title: "fjdaslk", description: "jkfdl sdjfkl", startDate: .now+6, status: .todo, taskRelevance: .medium), Item(id: "fdas41", authorId: "Ahmet", title: "f32", description: "fjei vgg", startDate: .now, status: .todo, taskRelevance: .medium)]

    var body: some View {
        NavigationStack(path: $path){ //aendert sich der path, so wird der untere navDestination aufgerufen
            TabView{
                ListView(title: "To Do", items: $toDoItems).tabItem({Image(systemName: "eye")})
                ListView(title: "In Progress", items: $inProgressItems).tabItem({Image(systemName: "nose")})
                ListView(title: "Done", items: $doneItems).tabItem({Image(systemName: "ear")})
            }
            .tabViewStyle(.tabBarOnly)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        print("Logout")
                    } label:{Image(systemName: "person.circle")}
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        path.append(.newItem)
                    } label:{Image(systemName: "plus")}
                }
            }
            .navigationDestination(for: NavPath.self){ path in
                switch path{
                case .newItem:
                    Text("New Item view!")
                
                case .details:
                    Text("Item details view")
                
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
