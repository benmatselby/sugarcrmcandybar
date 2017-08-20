//
//  RequestGetMeTest.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 06/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RequestGetMeTest: XCTestCase {

    var testData: Data!

    override func setUp() {

        super.setUp()

        if let file = Bundle(for:RequestGetMeTest.self).path(forResource: "GetMe", ofType: "json") {
            self.testData = try? Data(contentsOf: URL(fileURLWithPath: file))
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetHttpRequestBuildsUrlRequest() {
        class MockSugarCrmInstance: SugarCrmInstance {
            override func getRestUrl() -> String {
                return "http://crm.example.com"
            }
        }
        let crmInstance: SugarCrmInstance = MockSugarCrmInstance()
        let request = RequestGetMe(crmInstance: crmInstance)
        let httpRequest = request.getHttpRequest()

        XCTAssertEqual("http://crm.example.com/me", "\(httpRequest)")
    }

    func testGetResponseReturnsReponseGetMe() {
        let crmInstance: SugarCrmInstance = SugarCrmInstance()
        let request = RequestGetMe(crmInstance: crmInstance)
        let response = request.getResponse(data: self.testData as Data, response: HTTPURLResponse())
        XCTAssertEqual("ResponseGetMe", String(describing: type(of: response)))
    }
}
