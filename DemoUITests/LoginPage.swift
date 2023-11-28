//
//  LoginPage.swift
//  DemoUITests
//
//  Created by Dzmitry Razhkou on 10/11/23.
//  Copyright © 2023 TestProject. All rights reserved.
//

import Foundation
import XCTest

class LoginPage: BasePage {
    
//    Locators:
    final private var fullNameInputField: XCUIElement {
        return app.textFields["name"]
    }
    
    final private var passwordInputField: XCUIElement {
        return app.secureTextFields["Password"]
    }
    
    final private var loginBtn: XCUIElement {
        return app.buttons["login"]
    }
    
    final private var errorPopUp: XCUIElement {
        return app.staticTexts["This password is incorrect"]
    }
    
//    Methods:
    public func doLogin(fullName: String, psw: String) {
        log("THE USER TAPS ON THE FULL NAME INPUT")
        fullNameInputField.tap()
        log("THE USER TYPES THE '\(fullName)'")
        fullNameInputField.typeText(fullName)
        
        log("THE USER TAPS ON THE PASSWORD INPUT")
        passwordInputField.tap()
        log("THE USER TYPES THE '\(psw)'")
        passwordInputField.typeText(psw)
        
        log("THE USER CLICKS IN THE 'LOGIN BUTTON'")
        loginBtn.tap()
    }
    
    public func verifyPopUpError() -> Bool {
        guard errorPopUp.exists else {
            XCTFail("The Error Not Exist!!!")
            return false
        }
        return true
    }
    
    public func errorPopUpMsg(_ msg: String) -> Bool {
        log("THE ERROR MESSAGE '\(msg)' POPS UP!!!")
        return errorPopUp.hasTextEqual(msg)
    }
    
    
    
    
    
    
    
    
    
    
    
    
        
    let countryInputQuery = XCUIApplication().textFields.matching(NSPredicate(format: "identifier == 'country'"))
    let addressNS = NSPredicate(format: "label CONTAINS 'Address'")
    let emailNS = NSPredicate(format: "label == 'Email'")
    
    func fillUpForm(ctry: String, address: String) {
        countryInputQuery.element.tap()
        countryInputQuery.element.typeText(ctry)
        XCUIApplication().textFields.matching(addressNS).element.tap()
        XCUIApplication().textFields.matching(addressNS).element.typeText(address)

        let txt = XCUIApplication().textFields.matching(addressNS).element.value as? String ?? ""
        
        sleep(3)
        XCUIApplication().textFields.matching(emailNS).element.tap()
        XCUIApplication().textFields.matching(emailNS).element.typeText(txt)
        
//        _ = XCUIApplication().textFields.matching(addressNS).element.waitForExistence(timeout: 3)
    }
        

    

    
//    func clearAndEnterText(text: String) {
//
//        guard let stringValue = self.value as? String else {
//            XCTFail("Tried to clear and enter text into a non-string value")
//            return
//        }
//
//        // Calculate the deleteString only if the existing text is non-empty
//        let deleteString = stringValue.isEmpty ? "" : String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
//
//        // Tap and clear existing text
//        self.tap()
//        self.typeText(deleteString)
//
//        // Enter the new text
//        self.typeText(text)
//    }

    
}
