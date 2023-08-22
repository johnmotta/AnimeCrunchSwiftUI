//

import Foundation

class BrowseViewModel: ObservableObject {
    @Published var xd = [
        GenreModel(image: "drama", systemImage: "heart.slash", genre: "Drama"),
        GenreModel(image: "adventure", systemImage: "map", genre: "Adventure"),
        GenreModel(image: "comedy", systemImage: "theatermask.and.paintbrush", genre: "Comedy"),
        GenreModel(image: "romance", systemImage: "heart", genre: "Romance")
    ]
    @Published var isBrowseOn = false
    
}
