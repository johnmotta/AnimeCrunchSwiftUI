//

import SwiftUI

struct MyListView: View {
    @State private var newsSelection = 0
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("My lists")
                        .font(.title2)
                        .foregroundColor(Color("colorSet"))
                        .padding()
                    Spacer()
                }
                
                HStack {
                    VStack {
                        Button(action: { newsSelection = 0 }) {
                            Text("WATCHLIST")
                                .foregroundColor(Color("colorSet"))
                                .font(.footnote)
                        }
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(newsSelection == 0 ? Color.orange : Color.gray)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button(action: { newsSelection = 1 }) {
                            Text("HISTORY")
                                .foregroundColor(Color("colorSet"))
                                .font(.footnote)
                        }
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(newsSelection == 1 ? Color.orange : Color.gray)
                    }
                    Spacer()
                    VStack {
                        Button(action: { newsSelection = 2 }) {
                            Text("OFFLINE")
                                .foregroundColor(Color("colorSet"))
                                .font(.footnote)
                        }
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(newsSelection == 2 ? Color.orange : Color.gray)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom)
                
                TabView(selection: $newsSelection) {
                    WatchListView()
                        .tag(0)
                    
                    HistoryView()
                        .tag(1)
                    
                    OfflineView()
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.top, -8)
                
                Spacer()
            }
        }
    }
}

struct WatchListView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @State private var testHeart = false
    
    var body: some View {
        
        ScrollView {
            RecentActivityView()
            let columns = [GridItem(), GridItem()]
            LazyVGrid(columns: columns, content: {
                ForEach(homeViewModel.popular, id: \.self) { index in
                    if index.addToAnimeList || index.addWatchList {
                        NavigationLink  {
                            DetailScreen(id: index.id, name: index.name, classification: index.classification, image: Image(index.imageName), description: index.description, genre: index.genre, addWatchList: index.addWatchList, addToAnimeList: index.addToAnimeList, rating: index.starCount)
                        } label: {
                            ProductCardView(image: Image(index.imageName), name: index.name, classification: index.classification, width: 170, height: 240)
                        }
                        .toolbar(.hidden)
                    }
                }
                ForEach(homeViewModel.updates, id: \.self) { index in
                    if index.addToAnimeList || index.addWatchList {
                        NavigationLink  {
                            DetailScreen(id: index.id, name: index.name, classification: index.classification, image: Image(index.imageName), description: index.description, genre: index.genre, addWatchList: index.addWatchList, addToAnimeList: index.addToAnimeList, rating: index.starCount)
                        } label: {
                            ProductCardView(image: Image(index.imageName), name: index.name, classification: index.classification, width: 170, height: 240)
                        }
                        .toolbar(.hidden)
                    }
                }
                
            })
        }
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
            .environmentObject(HomeViewModel())
    }
}

struct HistoryView: View {
    var body: some View {
        Text("History")
            .foregroundColor(.secondary)
    }
}

struct OfflineView: View {
    var body: some View {
        Text("Offline")
            .foregroundColor(.secondary)
    }
}


struct RecentActivityView: View {
    var body: some View {
        HStack {
            Text("Recent Activity")
                .font(.system(size: 21))
            Spacer()
            Image(systemName: "increase.indent")
            Image(systemName: "slider.horizontal.3")
        }
        .font(.system(size: 24))
        .padding(.horizontal)
        .foregroundColor(Color("colorSet"))
    }
}
