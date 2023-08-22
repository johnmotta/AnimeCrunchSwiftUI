//

import XCTest
@testable import AnimeCrunchSwiftUI

final class AnimeCrunchSwiftUITests: XCTestCase {

    // Tests whether the isBlankField() function returns true for all possible blank field combinations
    func testIsBlankField() {
        let testBlank = LoginModel(userName: "", password: "")
        
        XCTAssertTrue(testBlank.isBlankField(user: "", password: ""))
        XCTAssertTrue(testBlank.isBlankField(user: "", password: "1"))
        XCTAssertTrue(testBlank.isBlankField(user: "1", password: ""))
        
    }
    
    func testMinPasswordAndLogin() {
        let loginModel = LoginModel(userName: "1234", password: "1234")
        
        // Tests whether the minCharactersName() and minCharactersPassword() functions
        // return true when inputs meet minimum character requirements
        XCTAssertTrue(loginModel.minCharactersName(name: "12345678"))
        XCTAssertTrue(loginModel.minCharactersPassword(password: "12345678"))
        
        // Tests whether the minCharactersName() and minCharactersPassword() functions
        // return false when inputs don't meet minimum character requirements
        XCTAssertFalse(loginModel.minCharactersName(name: "1"))
        XCTAssertFalse(loginModel.minCharactersPassword(password: "1"))
    }
    
    func testSpecialCharacters() {
        let testSpecialCharacters = LoginModel(userName: "", password: "")
        
        // Test whether the check Special Characters() function returns true when the input contains special characters
        XCTAssertTrue(testSpecialCharacters.checkSpecialCharacters(name: "1234567887656`56565"))
        XCTAssertTrue(testSpecialCharacters.checkSpecialCharacters(name: "1234/567887656`56565"))
        XCTAssertTrue(testSpecialCharacters.checkSpecialCharacters(name: "1234@567887656`56565"))
        XCTAssertTrue(testSpecialCharacters.checkSpecialCharacters(name: "1234,5678$87656`56565"))
        XCTAssertTrue(testSpecialCharacters.checkSpecialCharacters(name: "1234.567887656`56565"))
    }
    
    func testCleaning() {
        var testCleaning = LoginModel(userName: "asdhfjdaksfhkj", password: "aslkdjfldsakjfslakfj")
        testCleaning.clear()
        
        // Test if the clear() function resets the username and password fields to an empty string XCTAssertEqual(testCleaning.userName, "")
        XCTAssertEqual(testCleaning.password, "")
    }
    func testProtectsAgainstBruteForceAttacks() {
        
        // Simulates 5 unsuccessful login attempts and checks if performLogin() function returns false
        for i in 1...5 {
            var model = LoginModel()
            var result = model.performLogin(username: "wrong_username", password: "wrong_password")
            XCTAssertFalse(result, "\(i)")
        }
        
        // Attempts to login with valid credentials and checks that the performLogin() function returns true and isLoggedIn is true
        var model = LoginModel()
        var result = model.performLogin(username: "myusername", password: "mypassword")
        XCTAssertTrue(model.isLoggedIn)
    }
}

