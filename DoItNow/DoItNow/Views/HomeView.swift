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
                Text("Page1").tabItem{(Image(systemName: "house"))}
                Text("Page2").tabItem{(Image(systemName: "video"))}
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
