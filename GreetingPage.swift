//
//  GreetingPage.swift
//  DemoUITests
//
//  Created by Dzmitry Razhkou on 11/1/23.
//  Copyright © 2023 TestProject. All rights reserved.
//

import Foundation
import XCTest

class GreetingPage: BasePage {
    
//    Locators:
    final private var greetingFullName: XCUIElement {
        return app.staticTexts.matching(NSPredicate(format: "identifier == 'greetings'")).element(boundBy: 0)
    }
    
    final private var countryInputField: XCUIElement {
        let countryNS = NSPredicate(format: "identifier == 'country'")
        return app.textFields.element(matching: countryNS)
    }
    
    final private var addressInputField: XCUIElement {
        let addressNS = NSPredicate(format: "label CONTAINS 'Address'")
        return app.textFields.element(matching: addressNS)
    }

//    Methods:
    public func checkGreetings(withTxt expectedTxt: String) -> Bool {
        guard greetingFullName.exists else {
            XCTFail("The Greting Not Found!!!")
            return false
        }
        
        let actualTxt = greetingFullName.label
        XCTAssertTrue(actualTxt == expectedTxt, "Expected greeting text: '\(expectedTxt)', Actual text: '\(actualTxt)'")
        log("THE GREETINGS MESSAGE IS MATCHED!!!")
        return true
    }
    
    public func doFillUp(country: String, address: String) {
        log("THE USER TAPS ON THE COUNTRY INPUT")
        countryInputField.tap()
        log("THE USER TYPES THE '\(country)'")
        countryInputField.typeText(country)
        
        log("THE USER TAPS ON THE ADDRESS INPUT")
        addressInputField.tap()
        log("THE USER TYPES THE '\(address)'")
        addressInputField.typeText(address)
    }
    
    
}
