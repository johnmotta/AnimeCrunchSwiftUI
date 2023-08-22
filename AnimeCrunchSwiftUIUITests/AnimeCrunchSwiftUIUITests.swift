//

import XCTest

final class AnimeCrunchSwiftUIUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testLoginFieldsAndSuccessNavigation() throws {
        let loginTextField = app.textFields["username"]
        let passwordTextField = app.secureTextFields["passwordSecureField"]
        let initialButton = app.buttons["Login"]
        let loginButton = app.buttons["Entrar"]
        
        // Checks if the home button is present and enabled
        initialButton.tap()
        
        // Check if email and password fields are present
        XCTAssertTrue(loginTextField.exists)
        XCTAssertTrue(passwordTextField.exists)
        
        // Insert email and password values into the corresponding fields
        loginTextField.tap()
        loginTextField.typeText("1234")
        
        passwordTextField.tap()
        passwordTextField.typeText("1234")
        
        // Check if login button is present and enabled
        XCTAssertTrue(loginButton.exists)
        XCTAssertTrue(loginButton.isEnabled)
        
        // Pressionar o botão de login
        loginButton.tap()
        
        // From here you should check if the next screen (success screen) is displayed.
        // Suppose the next screen contains "Welcome" text with accessibility identifier "welcomeText".
        let welcomeText = app.staticTexts["animecrunch"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: welcomeText, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(welcomeText.exists)
    }
}
