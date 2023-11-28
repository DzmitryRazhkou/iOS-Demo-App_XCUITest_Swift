import XCTest

class BaseTest: XCTestCase {
    var app = XCUIApplication()
    var loginPage = LoginPage(app: XCUIApplication())
    var greetingPage = GreetingPage(app: XCUIApplication())
    var examplePage = ExamplePage(app: XCUIApplication())

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
        if self.testRun?.hasSucceeded == false {
            takeScreenshot()
        }
        app.terminate()
    }

    func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval) {
            let existsPredicate = NSPredicate(format: "exists == true")
            expectation(for: existsPredicate, evaluatedWith: element, handler: nil)

            let result = XCTWaiter().wait(for: [expectation(description: "Element exists")], timeout: timeout)

            switch result {
            case .completed:
                break
            case .timedOut:
                XCTFail("Timed out waiting for element to appear: \(element)")
            default:
                break
            }
        }
    
    // Method to capture a screenshot
    func takeScreenshot() {
        let testName = self.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd_HH-mm-ss"
        let date = dateFormatter.string(from: Date())
        let screenshotName = "\(testName)_\(date).png"

        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        attachment.name = screenshotName
        add(attachment)
    }
}

