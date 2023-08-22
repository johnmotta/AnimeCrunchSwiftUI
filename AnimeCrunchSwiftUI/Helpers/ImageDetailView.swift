//

import SwiftUI

struct ImageDetailView: View {
    let image: Image
    let systemName: String
    let genre: String
    
    var body: some View {
        ZStack {
            image
                .resizable()
                //.frame(width: 170, height: 130)

            VStack {
                Image(systemName: systemName)
                    .font(.title)
                Text(genre)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(.secondary)
                    .background(.ultraThinMaterial.opacity(0.5))
                    .clipShape(Capsule())
            }
        }
    }
}


struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let browseViewModel = BrowseViewModel()
        ScrollView {
            ForEach(browseViewModel.xd, id: \.self) { index in
                HStack {
                    ImageDetailView(image: Image(index.image), systemName: index.systemImage, genre: index.genre)
                    ImageDetailView(image: Image(index.image), systemName: index.systemImage, genre: index.genre)
                }
                
            }
        }
    }
}
