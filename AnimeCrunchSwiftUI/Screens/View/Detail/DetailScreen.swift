//

import SwiftUI

struct DetailScreen: View {
    @EnvironmentObject var viewModel: HomeViewModel
    public let id: UUID
    var name: String
    var classification: String
    var image: Image
    var description: String
    var genre: [Genre]
    @State var addWatchList: Bool
    @State var addToAnimeList: Bool
    @State var rating: Int
    
    @State private var isToggleDescription = false
    @State private var topExpanded = false
    @State private var isToggleStar = false
    @State private var isOnPlayer = false
        
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                //.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("colorSet"))
                        .padding(.top,20)
                    Button("Watch a preview") {
                        isOnPlayer.toggle()
                    }
                    .bold()
                    .foregroundColor(Color("colorSet"))
                    //.padding()
                    if isOnPlayer {
                        PlayView()
                    } else {
                        HStack {
                            switch classification {
                            case "A12":
                                Text(classification)
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .padding(3)
                                    .background(.yellow)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .stroke(Color("colorSet"), lineWidth: 1.3)
                                    )
                            case "A14":
                                Text(classification)
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .padding(3)
                                    .background(.orange)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .stroke(Color("colorSet"), lineWidth: 1.3)
                                    )
                            default:
                                Text(classification)
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .padding(3)
                                    .background(.red)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .stroke(Color("colorSet"), lineWidth: 1.3)
                                    )
                            }
                            
                            Text("•Sub | Dub")
                                .font(.caption)
                                .foregroundColor(Color("colorSet"))
                            
                        }
                        HStack(spacing: 0) {
                            ForEach(1..<6, id: \.self) { item in
                                Button(action: {
                                    rating = item
                                    viewModel.updateOrPopularStar(forID: id, count: item)
                                    isToggleStar.toggle()
                                }) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(rating >= item ? .orange : Color("colorSet"))
                                        .font(.system(size: 15))
                                        .rotationEffect(.degrees(isToggleStar ? 360 : 0))
                                        .animation(.easeIn(duration: 0.6), value: isToggleStar)
                                }
                                
                            }
                            
                            Text("| Average Rating: \(rating).0 (168.0k) | 3,402 Reviews")
                                .foregroundColor(Color("colorSet"))
                                .font(.system(size: 12.5))
                                .padding(.leading, 1)
                            //Spacer()
                        }
                        
                        HStack {
                            Button(action: {
                                
                                viewModel.popularOrUpdateAddWatch(forID: id)
                                withAnimation(.easeOut) {
                                    addWatchList.toggle()
                                }
                            }) {
                                Text(addWatchList ? "\(Image(systemName:  "bookmark.fill")) IN WATCHLIST" : "\(Image(systemName: "bookmark")) ADD TO WATCHLIST")
                                    .foregroundColor(.orange)
                                    .font(.system(size: addWatchList ? 13 : 12))
                                    .bold()
                                    .padding(8)
                                    .background(Color("colorDark"))
                                    .clipShape(Capsule())
                                    .overlay {
                                        Capsule()
                                            .stroke(Color.orange, lineWidth: 1)
                                    }
                            }
                            Button(action: {
                                viewModel.popularOrUpdateAddList(forID: id)
                                withAnimation(.easeOut) {
                                    addToAnimeList.toggle()
                                }
                            }) {
                                Text(addToAnimeList ? "\(Image(systemName: "checkmark")) ADDED TO LIST" :"\(Image(systemName: "plus")) ADD TO ANIMELIST")
                                    .foregroundColor(Color("colorSet"))
                                    .font(.system(size: addToAnimeList ? 13 : 12))
                                    .bold()
                                    .padding(8)
                            }
                        }
                        
                        VStack {
                            HStack {
                                DisclosureGroup(
                                    isExpanded: $topExpanded,
                                    content:  {
                                        Text(description)
                                            .lineSpacing(3)
                                            .foregroundColor(Color("colorSet"))
                                        HStack {
                                            BorderedView(textColor: .orange, backgroundColor: Color("colorDark"), borderColor: .orange, borderWidth: 1, font: .caption2) {
                                                ForEach(genre, id: \.self) { gen in
                                                    Text(gen.rawValue)
                                                }
                                            }
                                            .padding(.bottom)
                                            //.padding(.leading, 10)
                                            Spacer()
                                        }
                                    }, label: {
                                        HStack {
                                            Text("Description")
                                                .fontWeight(.medium)
                                                .padding(.vertical, 8)
                                                .foregroundColor(Color("colorSet"))
                                        }
                                    }
                                )
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .background(.ultraThinMaterial)
                .background(Color("colorSet").opacity(0.3))
                .cornerRadius(40)
                .offset(y: -50)
            }
         }
        .foregroundColor(Color("colorSet"))
        .toolbar {
            Button {
                print("About tapped!")
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(id: UUID(),
                     name: "Demon Slayer",
                     classification: "A16",
                     image: Image("kimestu_2nd"),
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                     genre: [Genre.action],
                     addWatchList: false,
                     addToAnimeList: false,
                     rating: 0)
            .environmentObject(HomeViewModel())
    }
}
