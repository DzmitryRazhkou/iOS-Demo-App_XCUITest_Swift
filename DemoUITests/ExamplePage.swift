//
//  ExamplePage.swift
//  Demo
//
//  Created by Dzmitry Razhkou on 10/24/23.
//  Copyright © 2023 TestProject. All rights reserved.
//

import XCTest

class ExamplePage: BasePage {

    // Elements on the Example Screen
    lazy var titleLabel: XCUIElement = {
        return app.staticTexts["TitleLabel"]
    }()

    lazy var descriptionLabel: XCUIElement = {
        return app.staticTexts["DescriptionLabel"]
    }()

    var actionButton: XCUIElement {
        return app.buttons["ActionButton"]
    }
    
    var usernameField: XCUIElement {
        return app.textFields["ActionButton"]
    }
    
    var passwordField: XCUIElement {
        return app.textFields["ActionButton"]
    }
    
    var loginButton: XCUIElement {
        return app.buttons["ActionButton"]
    }

    // Actions for the Example Screen
    func tapActionButton() {
        actionButton.tap()
    }

    // Verifications for the Example Screen
    func isExamplePageLoaded() -> Bool {
        return elementExists(titleLabel) && elementExists(descriptionLabel) && elementExists(actionButton)
    }
    
    
    
    func login(withUsername username: String, password: String) {
        enterText(username, into: usernameField)
        enterText(password, into: passwordField)
        tapElement(loginButton)
    }
}

