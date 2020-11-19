//
//  UnitTestProjectUITests.swift
//  UnitTestProjectUITests
//
//  Created by Prabhdeep Singh on 19/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import XCTest

class UnitTestProjectUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        super.tearDown()
    }

    func testFieldsAreNotEmpty() {
        
        let loginButton = app.buttons["LogIn"]
        let emailField = app.textFields["Enter Login Email here"]
        let passwordField = app.secureTextFields["Enter password here"]
        let backButton = app.navigationBars["UnitTestProject.LogInView"].buttons["Back"]
        
        let scrollViewsQuery = app.alerts["Message"].scrollViews
        let messageElement = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Message").element
        
        let elementsQuery = scrollViewsQuery.otherElements
        let okayButton = elementsQuery.buttons["Okay"]
        
        
        XCTAssert(emailField.exists, "Email field does not exist")
        XCTAssert(passwordField.exists, "Password field does not exist")
        XCTAssert(loginButton.exists, "Login Button does not exist")
        XCTAssert(backButton.exists, "Back Button is absent")
        
        emailField.tap()
        emailField.typeText("yolo")
        
        passwordField.tap()
        passwordField.typeText("456")
        
        loginButton.tap()
        
        //checking for placeholder because field.value will just give placeholder text when textfield is empty
        XCTAssertNotEqual(emailField.value as! String, emailField.placeholderValue!, "Email field shoud not be empty")
        XCTAssertNotEqual(passwordField.value as! String, passwordField.placeholderValue!, "Password field must not be empty")
        
        //waitoing for alert to appear
        XCTAssert(messageElement.waitForExistence(timeout: 2))
        okayButton.tap()
        //checking if alert dismissed on clicking okay
        XCTAssertFalse(messageElement.exists)
        
        
    }

}
