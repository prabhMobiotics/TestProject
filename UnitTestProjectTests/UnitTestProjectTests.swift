//
//  UnitTestProjectTests.swift
//  UnitTestProjectTests
//
//  Created by Prabhdeep Singh on 18/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import XCTest
@testable import UnitTestProject


class UnitTestProjectTests: XCTestCase {
    
    var sut: URLSession!
    
    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .default)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAsynchronousRetrieval() {
        
        let urlString = Constants.configUrl
        
        guard let url = URL(string: urlString) else {
            XCTFail("Invalid Url")
            return
        }
        
        let testExpectation = expectation(description: "Status code should be 200")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                XCTFail("Error \(error?.localizedDescription ?? "")")
                return
            }
            
            guard data != nil else {
                XCTFail("No Data available")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                XCTFail("Invalid response")
                return
            }
            
            guard response.statusCode == 200 else {
                XCTFail("Status Code \(response.statusCode) which should be 200")
                return
            }
            
            testExpectation.fulfill()
            
        }.resume()
        
        wait(for: [testExpectation], timeout: 20)
    }
    
    //Another way to avoid wait time
    func testAsyncRetrieval() {
        
        let urlString = Constants.configUrl
        let url = URL(string: urlString)
        let testExpectation = expectation(description: "test expectation")
        var statusCode: Int?
        var responseError: Error?
        
        //not working
        XCTAssertNotNil(url, "Url must not be nil")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            responseError = error
            statusCode = (response as? HTTPURLResponse)?.statusCode
            testExpectation.fulfill()
            
        }.resume()
        
        //Here it will not keep test running for 20 sec because expectation will always be fullfilled
        wait(for: [testExpectation], timeout: 20)
        
        XCTAssertNil(responseError, "Error : \(responseError!)")
        XCTAssertEqual(statusCode, 200, "Status code \(statusCode ?? -1)")
        
    }
}

