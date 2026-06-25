//
//  HomeView.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 22.06.26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = ListVM()
    @State private var path: [NavPath] = [] //Alle navigations zustände werden schritt für schritt gespeichert
    @State private var showLogout: Bool = false

    var body: some View {
        NavigationStack(path: $path){ //aendert sich der path, so wird der untere navDestination aufgerufen
            TabView{
                ListView(title: "To Do", items: $vm.todoItems).tabItem({Image(systemName: "eye")})
                ListView(title: "In Progress", items: $vm.inProgressItems).tabItem({Image(systemName: "nose")})
                ListView(title: "Done", items: $vm.doneItems).tabItem({Image(systemName: "ear")})
            }
            .tabViewStyle(.tabBarOnly)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        showLogout = true;
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
                    CreateItemView()
                
                case .details(let item):
                    ItemDescriptionView(item: item)
                
                }
            }
            .confirmationDialog("Continue signing out?", isPresented: $showLogout) {
                Button("Confirm", role: .destructive) {}
            } message: { Text("Continue signing out?")}
        }
        
    }
}

#Preview {
    HomeView()
}
