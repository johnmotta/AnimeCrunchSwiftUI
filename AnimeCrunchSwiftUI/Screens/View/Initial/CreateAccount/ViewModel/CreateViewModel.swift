//

import Foundation

class CreateViewModel: ObservableObject {
    @Published var uiState: CreateUIState = .none
    @Published var createAccount = CreateAccountModel(email: "", name: "", password: "")
}
