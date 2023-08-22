//

import SwiftUI

class NavBarViewModel: ObservableObject {
    @Published var categories = [
        NavBarModel(name: "Home"),
        NavBarModel(name: "My Lists"),
        NavBarModel(name: "Browse"),
        NavBarModel(name: "Simulcasts"),
        NavBarModel(name: "Settings")
    ]
    
    @Published var selectTab: Tab = .home
    
    
    enum Tab: String, CaseIterable {
        case home = "house"
        case myList = "bookmark"
        case browse = "square.grid.3x3"
        case simulcasts = "star.square.on.square"
        case settings = "person"
        
        var description: String {
            switch self {
            case .home:
                return "Home"
            case .myList:
                return "My Lists"
            case .browse:
                return "Browse"
            case .simulcasts:
                return "Simulcasts"
            case .settings:
                return "Settings"
            }
        }
    }
}

