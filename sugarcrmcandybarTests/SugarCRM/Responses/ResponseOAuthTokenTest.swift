//
//  ResponseOAuthTokenTest.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 06/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class ResponseOAuthTokenTest: XCTestCase {

    var testJson: JSON!

    override func setUp() {

        super.setUp()

        if let file = Bundle(for:ResponseOAuthTokenTest.self).path(forResource: "OAuthToken", ofType: "json") {
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
        let response = ResponseOAuthToken(json: self.testJson)
        let raw = response.getRaw()
        XCTAssertEqual(raw, self.testJson)
    }

    func testGetAccessTokenReturnsToken() {
        let response = ResponseOAuthToken(json: self.testJson)
        let token = response.getAccessToken()
        XCTAssertEqual(token, "0b86eb19-09f7-4559-911e-0e120fa217f5")
    }

    func testWasSuccessfulDefaultsToTrue() {
        let response = ResponseOAuthToken(json: self.testJson)
        let result = response.wasSuccessful()
        XCTAssertTrue(result)
    }

    func testWasSuccessfulReturnsFalseIfNoUserIdPresent()
    {
        let response = ResponseOAuthToken(json: "")
        let result = response.wasSuccessful()
        XCTAssertFalse(result)
    }
}
