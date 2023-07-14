//
//  ContentViewUITest.swift
//  Practice-CICD-AppCenterUITests
//
//  Created by Rahul Yadav on 11/07/23.
//

import XCTest

final class ContentViewUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let monthlyInvestmentTextfield = app.textFields["Monthly investment"]
        monthlyInvestmentTextfield.tap()
        monthlyInvestmentTextfield.typeText("5000")
        
        let currentAgeTextfield = app.textFields["Current age"]
        currentAgeTextfield.tap()
        currentAgeTextfield.typeText("38")
        
        let retirementAgeTextfield = app.textFields["Retirement age"]
        retirementAgeTextfield.tap()
        retirementAgeTextfield.typeText("60")
        
        let interestTextfield = app.textFields["Interest"]
        interestTextfield.tap()
        interestTextfield.typeText("8")
        
        let currentSavingsTextfield = app.textFields["Current savings"]
        currentSavingsTextfield.tap()
        currentSavingsTextfield.typeText("400000")
        
        let calculateButton = app.buttons["Calculate"]
        calculateButton.tap()
        
        let messageLabel = app.staticTexts["message"]
        XCTAssertEqual(messageLabel.label, "You are investing Rs. 400000 and Rs. 5000 monthly till attainment of 60 years. You will be having Rs. 13760000.0 as retirement amount.")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
