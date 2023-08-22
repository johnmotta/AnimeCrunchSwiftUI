//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var login = LoginModel(userName: "", password: "", email: "")
    @Published var screen: ScreenState = .loading // change .loading
    @Published var isLogin = false
    var navigationLogin = false
    var createAccount = false
    @Published var showAlert = false
    @Published var error: LoginError? = .emptyFields
}

extension LoginViewModel {
    func autheticateUser() {
        if self.login.userName.lowercased() == "1234" && self.login.password.lowercased() == "1234" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLogin = true
            }
        } else {
            showAlert = true
        }
    }
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.screen = .startScreen
        }
    }
    
    func loginError() throws {
        guard !login.userName.isEmpty && !login.password.isEmpty else {
            throw LoginError.emptyFields
        }
        
        guard isLogin else {
            throw LoginError.invalidCredentials
        }
    }
}
