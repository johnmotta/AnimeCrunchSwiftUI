//

import Foundation

struct LoginModel {
    var userName: String = ""
    var password: String = ""
    var email: String = ""
    var isLoggedIn = false
    var failedAttempts = 0
    
    // Checks if one or both of the username and password fields are empty
    func isBlankField(user: String, password: String) -> Bool {
        return user == "" || password == ""
    }
    
    // Checks that the password is at least 8 characters long
    func minCharactersPassword(password: String) -> Bool {
        return password.count >= 8
    }
    
    // Checks that the password is at least 8 characters long
    func minCharactersName(name: String) -> Bool {
        return name.count >= 8
    }
    
    // Checks if the username contains invalid special characters
    func checkSpecialCharacters(name: String) -> Bool {
        let test = "!@#$%^&*()_-+={}[]|\\:;\"'<>,.?/~`"
        for i in name {
            for j in test {
                if i == j {
                    print("Error! \(i)")
                    return true
                }
            }
        }
        return false
    }
    
    // Clears username and password fields
    mutating func clear() {
        self.password = ""
        self.userName = ""
    }
    
    // Checks if login is blocked due to too many failed attempts
    func isLoginLocked() -> Bool {
            let maxFailedAttempts = 5
            return failedAttempts >= maxFailedAttempts
        }
        
    // Log in with the provided username and password
    mutating func performLogin(username: String, password: String) -> Bool {
        // Verifica se o login está bloqueado
        if isLoginLocked() {
            return false
        }
        // Validates the supplied username and password
        let isValidLogin = validateLogin(username: username, password: password)
        
        if isValidLogin {
            isLoggedIn = true
            failedAttempts = 0 // resets the number of unsuccessful attempts
        } else {
            failedAttempts += 1 // increments the number of failed attempts
        }
        
        return isLoggedIn
    }
        
    // Logs out the current user
    mutating func logout() {
        isLoggedIn = false
    }
    
    // Checks if the user is currently logged in
    func isUserLoggedIn() -> Bool {
        return isLoggedIn
    }
        
    // Validates the supplied username and password
    private func validateLogin(username: String, password: String) -> Bool {
        let correctUsername = "myusername"
        let correctPassword = "mypassword"
        
        if username == correctUsername && password == correctPassword {
            return true
        } else {
            return false
        }
    }
}
