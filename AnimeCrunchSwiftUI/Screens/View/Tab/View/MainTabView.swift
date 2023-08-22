//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel = NavBarViewModel()
    
    @State private var isAnimation = false
    
    var body: some View {
        ZStack {
            TabView {
                HomeScreen()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .toolbarBackground(.black.opacity(0.8), for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                
                MyListView()
                    .tabItem {
                        Label("My List", systemImage: "bookmark")
                    }
                    .toolbarBackground(.black.opacity(0.8), for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                
                BrowseView()
                    .badge("!")
                    .tabItem {
                        Label("Browse", systemImage: "square.grid.3x3")
                    }
                    .toolbarBackground(.black.opacity(0.8), for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                
                Text("Simulcasts")
                    .tabItem {
                        Label("Simulcasts", systemImage: "star.square.on.square")
                    }
                    .toolbarBackground(.black.opacity(0.8), for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)

                SettingsView()
                    .badge(2)
                    .tabItem {
                        Label("Settings", systemImage: "person")
                    }
                    .toolbarBackground(.black.opacity(0.8), for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
            }
            .accentColor(.orange)
        }
        .opacity(isAnimation ? 1 : 0)
        .onAppear {
            withAnimation(.easeOut) {
                isAnimation = true
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(HomeViewModel())
    }
}

