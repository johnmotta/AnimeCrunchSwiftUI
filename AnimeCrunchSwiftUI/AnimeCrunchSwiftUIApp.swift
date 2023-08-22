//

import SwiftUI

@main
struct AnimeCrunchSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            InitialView()
                .environmentObject(LoginViewModel())
                .environmentObject(HomeViewModel())
        }
    }
}
