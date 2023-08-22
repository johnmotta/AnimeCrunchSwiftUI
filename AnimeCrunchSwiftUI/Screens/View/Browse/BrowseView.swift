//

import SwiftUI

struct BrowseView: View {
//    @StateObject var navBarViewModel = NavBarViewModel()
    @State var newsSelection = 0
    
    var body: some View {
        ZStack {
//            Color.black
//                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Browse")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                        Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("colorSet"))
                }
                
                HStack {
                    VStack {
                        Button(action: { newsSelection = 0 }) {
                            Text("ANIME")
                                .foregroundColor(Color("colorSet"))
                        }
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(newsSelection == 0 ? Color.orange : Color.gray)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button(action: { newsSelection = 1 }) {
                            Text("GENDER")
                                .foregroundColor(Color("colorSet"))
                        }
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(newsSelection == 1 ? Color.orange : Color.gray)
                    }
                    Spacer()
                    VStack {
                        Button(action: { newsSelection = 2 }) {
                            Text("MUSIC")
                                .foregroundColor(Color("colorSet"))
                        }
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(newsSelection == 2 ? Color.orange : Color.gray)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom)
                
                
                TabView(selection: $newsSelection) {
                    AnimeView()
                        .tag(0)
                    
                    GenreView()
                        .tag(1)
                    
                    MusicView()
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.top, -8)
                
                Spacer()
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}


struct GenreBarView: View {
    @State var selectGenre = true
    @State var selectAll = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    if !selectGenre {
                        selectGenre.toggle()
                        selectAll.toggle()
                    }
                } label: {
                    VStack {
                        Text("GENRES")
                        Text(selectGenre ? "_______" : "       ")
                            .foregroundColor(.orange)
                            .bold()
                            .padding(.top, -30)
                            .padding(.bottom, 10)
                    }
                }
                Spacer()
                Button {
                    if !selectAll {
                        selectAll.toggle()
                        selectGenre.toggle()
                    }
                } label: {
                    VStack {
                        Text("ALL")
                        Text(selectAll ? "_______" : "       ")
                            .foregroundColor(.orange)
                            .bold()
                            .padding(.top, -30)
                            .padding(.bottom, 10)
                    }
                }
            }
            .foregroundColor(.white)
            .font(.title3)
            .bold()
            .padding(.horizontal,70)
            .padding(.top,40)
            
            HStack {
                
            }
        }
    }
}

struct AnimeView: View {

    var body: some View {
       Text("Anime")
    }
}

struct GenreView: View {
    @StateObject var browseViewModel = BrowseViewModel()

    var body: some View {
        ScrollView {
            
            HStack {
                Text("More Popular")
                    Spacer()
                Image(systemName: "slider.horizontal.3")
            }
            .foregroundColor(Color("colorSet"))
            
            ForEach(browseViewModel.xd, id: \.self) { index in
                HStack {
                    ImageDetailView(image: Image(index.image), systemName: index.systemImage, genre: index.genre)
                    ImageDetailView(image: Image(index.image), systemName: index.systemImage, genre: index.genre)
                }

            }
        }
    }
}

struct MusicView: View {
    var body: some View {
        Text("Music")
            .foregroundColor(.white)
    }
}


           
