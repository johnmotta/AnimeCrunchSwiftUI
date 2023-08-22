//

import SwiftUI

struct AppBarView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    var image: String = ""
    var name: String
    @State var isSearchButton = true
    @State var isAirplay = true
    
    var body: some View {
        HStack {
            if isAirplay {
                Spacer()
                Spacer()
            }
            if image != "" {
                Image(image)
                    .resizable()
                    .frame(width: 40, height: 35)
            }
            Text(name)
                .foregroundColor(.orange)
                .font(.title2)
                .bold()
            
            if isAirplay {
                Spacer()
                Image(systemName: "airplayvideo")
                    .foregroundColor(Color("colorSet"))
                    .font(.system(size: 20))
                    .padding(.leading, 8)
            }
            if isSearchButton {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("colorSet"))
                    .font(.system(size: 25))
                    .padding(.leading, 8)
                    .onTapGesture {
                        withAnimation {
                            isSearching = true
                        }
                    }
            }
            if isSearching {
                TextField("Search", text: $searchText)
                    .padding(.horizontal, 8)
                    .background(.gray)
                    .onSubmit {
                        withAnimation {
                            isSearching = false
                        }
                    }
            }
        }
        .padding(.horizontal)
    }
}

struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView(name: "")
    }
}
