//

import Foundation

enum LoginError: Error {
    case emptyFields
    case invalidCredentials
    
    var errorMessage: String {
        switch self {
        case .emptyFields:
            return "Please fill in all fields."
        case .invalidCredentials:
            return "The credentials you entered are incorrect. Please check and try again."
        }
    }
}

