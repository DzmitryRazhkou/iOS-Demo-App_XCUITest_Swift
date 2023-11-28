import XCTest

final class TestMain: BaseTest {
    func testLoginCorrectCredentials() {
        let (fullName, psw, msg, country, address) = (AppConstants.fullName, AppConstants.correctPsw, AppConstants.txtMsg, AppConstants.country, AppConstants.address)
        
        loginPage.doLogin(fullName: fullName, psw: psw)
        XCTAssertTrue(greetingPage.checkGreetings(withTxt: msg))

        greetingPage.doFillUp(country: country, address: address)
    }
    
    func testLoginIncorrectCredentials() {
        let (fullName, psw, errorMsg) = (AppConstants.fullName, AppConstants.incorrectPsw, AppConstants.errorMsg)
        
        loginPage.doLogin(fullName: fullName, psw: psw)
        XCTAssertTrue(loginPage.verifyPopUpError())
        XCTAssertTrue(loginPage.errorPopUpMsg(errorMsg))
    }
    
    func testTextInputs() {
        let fullName = "Gans"
        let psw = "12345"
        _ = "Greetings"
        let country = "USA"
        let address = "3608 Barham Blvd, Los Angeles, CA, 90068"
        
        loginPage.doLogin(fullName: fullName, psw: psw)
        loginPage.fillUpForm(ctry: country, address: address)        
    }
    
    func testDifferentLocators() {
        let predicateFullName = NSPredicate(format: "label CONTAINS 'Full Name'")
        let fullName = app.staticTexts.matching(predicateFullName).firstMatch
        print("GO GET EM THIS: "+fullName.label)
        
        let psw = app.staticTexts.element(matching: .staticText, identifier: "Password")
        print("GO GET EM THIS: "+psw.label.uppercased())
        
        let loginPredicate = NSPredicate(format: "label CONTAINS 'Login'")
        let loginBtn = app.buttons.matching(loginPredicate).firstMatch
        loginBtn.tap()
        
        let pleaseProvideYourNamePredicate = NSPredicate(format: "label CONTAINS 'your name'")
        let pleaseProvideYourName = app.staticTexts.matching(pleaseProvideYourNamePredicate).firstMatch
        print(pleaseProvideYourName.label)
        
        let pswIsIncorrect = app.staticTexts.element(matching: .staticText, identifier: "This password is incorrect")
        print(pswIsIncorrect.label)
    }
    
    func testSystemSettings() {
        let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        settingsApp.launch()
        
        settingsApp.tables.cells.staticTexts["Maps"].tap()
        settingsApp.switches["Background App Refresh"].tap()
        settingsApp.buttons["Settings"].tap()
        settingsApp.tables.staticTexts["Translate"].tap()
        settingsApp.switches["On-Device Mode"].tap()
        
//        settingsApp.tables.cells.staticTexts["Notifications"].tap()
//        settingsApp.switches["Allow Notifications"].tap()
//        
//        XCTAssertTrue(settingsApp.waitForExistence(timeout: 5))
//        
//        let generalCell = settingsApp.tables.cells["General"]
//        generalCell.tap()
//        
//        let aboutDevice = settingsApp.tables.cells.staticTexts["About"]
//        aboutDevice.tap()
 
    }
}
