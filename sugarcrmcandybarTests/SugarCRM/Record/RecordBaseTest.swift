//
//  RecordBaseTest.swift
//  sugarcandybar
//
//  Created by Ben Selby on 22/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordBaseTest: XCTestCase {

    let jsonStructure: JSON = [
        "id": "123123-3213213-3213123-3213",
        "name": "Apple Inc.",
        "description": "Sell all the apple things",
        "_module": "Accounts",
    ]

    func testGetIdReturnsIdSetInDictionary() {
        let record = RecordBase(rawRecord: self.jsonStructure)
        XCTAssertEqual("123123-3213213-3213123-3213", record.getId())
    }

    func testGetNameReturnsNameSetInDictionary() {
        let record = RecordBase(rawRecord: self.jsonStructure)
        XCTAssertEqual("Apple Inc.", record.getName())
    }

    func testGetDescriptionReturnsDescriptionSetInDictionary() {
        let record = RecordBase(rawRecord: self.jsonStructure)
        XCTAssertEqual("Sell all the apple things", record.getDescription())
    }

    func testGetModuleReturnModuleSetInDictionary() {
        let record = RecordBase(rawRecord: self.jsonStructure)
        XCTAssertEqual("Accounts", record.getModule())
    }

    func testGetModuleAsIconReturnsTwoCharacters() {
        let record = RecordBase(rawRecord: self.jsonStructure)
        XCTAssertEqual("Ac", record.getModuleIconText())
    }

    func testGetModuleAsIconReturnsEmptyStringIfNoModuleSet() {
        let record = RecordBase(rawRecord: ["_module":""])
        XCTAssertEqual("", record.getModuleIconText())
    }

    func testGetUrlReturnsUrlBasedOnModuleAndId() {
        let record = RecordBase(rawRecord: self.jsonStructure)
        XCTAssertEqual("/#Accounts/123123-3213213-3213123-3213", record.getUrl())
    }
}
