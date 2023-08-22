//

import Foundation

struct GenreModel: Hashable {
    var id = UUID()
    var image: String
    var systemImage: String
    var genre: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
