import Foundation
import XCTest

class Logger {
    func log(_ message: String) {
        NSLog(message)
    }
}

// EXTENTIONS:
extension XCUIElement {
    func hasTextEqual(_ expectedText: String) -> Bool {
        guard self.exists else {
            XCTFail("Element does not exist")
            return false
        }

        let actualText = self.label // You can adjust this based on how the text is stored in your element

        if actualText == expectedText {
            return true
        } else {
            XCTFail("Element text '\(actualText)' does not match the expected text '\(expectedText)'")
            return false
        }
    }
}


// BASE PAGE CLASS:
class BasePage {
    public let app: XCUIApplication
    public let log = Logger().log
    
    public init(app: XCUIApplication) {
        self.app = app
    }
    
    public func dismissAlertIfPresent() {
        let alert = app.alerts.firstMatch
        if alert.exists {
            alert.buttons["OK"].tap()
        }
    }
        
    // Add common methods and properties that are used across multiple pages
    public func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval = 10) {
        let predicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssert(result == .completed, "Element \(element) not found within \(timeout) seconds.")
    }
    
    public func waitForElementToDisappear(_ element: XCUIElement, timeout: TimeInterval = 10) {
        let predicate = NSPredicate(format: "exists == false")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssert(result == .completed, "Element \(element) still exists after \(timeout) seconds.")
    }
    
    // Add common navigation or interaction methods here
    public func tapBackButton() {
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        if backButton.exists {
            backButton.tap()
        } else {
            XCTFail("Back button does not exist on the current screen.")
        }
    }
    
    // Function to tap an element
    public func tapElement(_ element: XCUIElement) {
        waitForElementToAppear(element)
        element.tap()
    }
    
    // Function to enter text into a text field
    public func enterText(_ text: String, into element: XCUIElement) {
        waitForElementToAppear(element)
        element.tap()
        element.typeText(text)
    }
    
    // Function to check if element is exist
    public func elementExists(_ element: XCUIElement) -> Bool {
        return element.exists
    }

    // Example: Verify if an element contains a specific text
    public func elementContainsText(_ element: XCUIElement, text: String) -> Bool {
        return element.label.contains(text)
    }
    
    // Logger:
//    public func log(_ message: String) {
//        NSLog(message)
//    }
//    
}

