//
//  RecordEmailTest.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 20/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordEmailTest: XCTestCase {

    let jsonStructure:JSON = [
        "id": "007-001-002-006",
        "name": "Record Name",
        "description": "Shaken, not stirred",
        "_module": "Emails",
        ]

    func testGetIdReturnsIdSetInDictionary() {
        let record = RecordEmail(rawRecord: self.jsonStructure)
        XCTAssertEqual("007-001-002-006", record.getId())
    }

    func testGetNameReturnsNameSetInDictionary() {
        let record = RecordEmail(rawRecord: self.jsonStructure)
        XCTAssertEqual("Record Name", record.getName())
    }

    func testGetDescriptionReturnsDescriptionSetInDictionary() {
        let record = RecordEmail(rawRecord: self.jsonStructure)
        XCTAssertEqual("Shaken, not stirred", record.getDescription())
    }

    func testGetModuleReturnModuleSetInDictionary() {
        let record = RecordEmail(rawRecord: self.jsonStructure)
        XCTAssertEqual("Emails", record.getModule())
    }

    func testGetModuleIconTextReturnsCl() {
        let record = RecordEmail(rawRecord: self.jsonStructure)
        XCTAssertEqual("AE", record.getModuleIconText())
    }
}
