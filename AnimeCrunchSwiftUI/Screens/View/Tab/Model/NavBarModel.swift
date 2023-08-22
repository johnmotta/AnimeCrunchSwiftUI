//

import Foundation

struct NavBarModel: Hashable {
    let id = UUID()
    let name: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
