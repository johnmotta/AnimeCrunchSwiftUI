//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var viewModel: HomeViewModel
        
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    AppBarView(image: "logo", name: "animecrunch")
                    ScrollView {
                        HStack {
                            Image("home2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        HStack {
                            TagLineView()
                                .padding()
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.popular, id: \.self) { index in
                                    NavigationLink  {
                                        DetailScreen(id: index.id, name: index.name, classification: index.classification, image: Image(index.imageName), description: index.description, genre: index.genre, addWatchList: index.addWatchList, addToAnimeList: index.addToAnimeList, rating: index.starCount)
                                    } label: {
                                        ProductCardView(image: Image(index.imageName), name: index.name, classification: index.classification, width: 170, height: 240)
                                    }
                                    .toolbar(.hidden)
                                }
                                .padding(.trailing, 5)
                            }
                        }
                        
                        HStack {
                            Text("JUST UPDATED ON ANIMECRUNCH")
                                .foregroundColor(Color("colorSet"))
                                .font(.title3)
                                .padding()
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.updates, id: \.self) { index in
                                    NavigationLink {
                                        DetailScreen(id: index.id, name: index.name, classification: index.classification, image: Image(index.imageName), description: index.description, genre: index.genre, addWatchList: index.addWatchList, addToAnimeList: index.addToAnimeList, rating: index.starCount)
                                        
                                    } label : {
                                        ProductCardView(image: Image(index.imageName), name: index.name, classification: index.classification, width: 170, height: 240)
                                        
                                    }
                                    .padding(.trailing, 5)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


struct TagLineView: View {
    var body: some View {
        Text("MOST POPULAR")
            .foregroundColor(Color("colorSet"))
            .font(.title3)
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(HomeViewModel())
    }
}
