//

import Foundation

struct Item: Hashable {
    let id = UUID()
    let name: String
    let classification: String
    let imageName: String
    var description: String
    var genre: [Genre]
    var starCount: Int
    
    var addWatchList: Bool = false
    var addToAnimeList: Bool = false
    
    init(name: String, classification: String, imageName: String, description: String = "", genre: [Genre], starCount: Int = 0, addWatchList: Bool = false, addToAnimeList: Bool = false) {
        self.name = name
        self.classification = classification
        self.imageName = imageName
        self.description = description
        self.genre = genre
        self.starCount = starCount
        self.addWatchList = addWatchList
        self.addToAnimeList = addToAnimeList
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

enum Genre: String, Equatable {
    case action = "Action"
    case adventure = "Adventure"
    case comedy = "Comedy"
    case drama = "Drama"
    case romance = "Romance"
    case thriller = "Thriller"
    case horror = "Horror"
    case fantasy = "Fantasy"
    case scienceFiction = "Science Fiction"
    case crime = "Crime"
    case mystery = "Mystery"
    case animation = "Animation"
    case family = "Family"
    case western = "Western"
    case shounen = "Shounen"
    case seinen = "Seinen"
    case suspense = "Suspense"
    case supernatural = "Supernatural"
    case historical = "Historical"
    case psychological = "Psychological"
    case mecha = "Mecha"
    case military = "Military"
}
