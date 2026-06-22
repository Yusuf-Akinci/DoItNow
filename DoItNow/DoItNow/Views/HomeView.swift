//
//  HomeView.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 22.06.26.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack{
            TabView{
                ListView(title: "To Do").tabItem({Image(systemName: "eye")})
                ListView(title: "In Progress").tabItem({Image(systemName: "nose")})
                ListView(title: "Done").tabItem({Image(systemName: "ear")})
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
                        print("Navigate to new Item")
                    } label:{Image(systemName: "plus")}
                }
            }
        }
        .navigationDestination(for: String.self){ _ in
            Text("New view")
        }
        
    }
}

#Preview {
    HomeView()
}
