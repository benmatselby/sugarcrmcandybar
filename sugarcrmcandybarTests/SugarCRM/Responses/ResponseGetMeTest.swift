//
//  ResponseGetMe.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 06/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class ResponseGetMeTest: XCTestCase {

    var testJson: JSON!

    override func setUp() {

        super.setUp()

        if let file = Bundle(for:ResponseOAuthTokenTest.self).path(forResource: "GetMe", ofType: "json") {
            let data: Data! = try? Data(contentsOf: URL(fileURLWithPath: file))
            self.testJson = JSON(data: data, options: [], error: nil)
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetRawReturnsRawJson() {
        let response = ResponseGetMe(json: self.testJson)
        let raw = response.getRaw()
        XCTAssertEqual(raw, self.testJson)
    }

    func testGetUserIdReturnsId() {
        let response = ResponseGetMe(json: self.testJson)
        let userId = response.getUserId()
        XCTAssertEqual(userId, "123-41-12-31")
    }

    func testWasSuccessfulDefaultsToTrue() {
        let response = ResponseGetMe(json: self.testJson)
        let result = response.wasSuccessful()
        XCTAssertTrue(result)
    }

    func testWasSuccessfulReturnsFalseIfNoUserIdPresent()
    {
        let response = ResponseGetMe(json: "")
        let result = response.wasSuccessful()
        XCTAssertFalse(result)
    }
}
