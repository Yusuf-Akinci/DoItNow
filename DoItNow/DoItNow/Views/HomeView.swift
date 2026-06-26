import SwiftUI

struct HomeView: View {
    @StateObject private var vm = ListVM()
    @State private var path: [NavPath] = [] // Alle Navigationszustände werden Schritt für Schritt gespeichert
    @State private var showLogout: Bool = false

    var body: some View {
        NavigationStack(path: $path) {
            // Ändert sich der Path, wird die navigationDestination aufgerufen
            TabView {
                ListView(title: "To Do",items: $vm.todoItems).tabItem {Image(systemName: "eye")}
                ListView(title: "In Progress",items: $vm.inProgressItems).tabItem {Image(systemName: "nose")}
                ListView(title: "Done",items: $vm.doneItems).tabItem {Image(systemName: "ear")}
            }
            .tabViewStyle(.tabBarOnly)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showLogout = true
                    } label: {
                        Image(systemName: "person.circle")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        path.append(.newItem)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: NavPath.self) { path in
                switch path {
                case .newItem:
                    CreateItemView { generatedItem in
                        vm.addItem(item: generatedItem)
                        self.path.removeLast()
                    }

                case .details(let item):
                    ItemDescriptionView(item: item, vm: vm)
                }
            }
           
        }
    }
}

#Preview {
    HomeView()
}
