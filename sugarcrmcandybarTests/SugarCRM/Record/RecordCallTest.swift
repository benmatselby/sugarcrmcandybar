//
//  RecordCallTest.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 20/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordCallTest: XCTestCase {

    let jsonStructure:JSON = [
        "id": "007-001-002-006",
        "name": "Record Name",
        "description": "Shaken, not stirred",
        "_module": "Calls",
        ]

    func testGetIdReturnsIdSetInDictionary() {
        let record = RecordCall(rawRecord: self.jsonStructure)
        XCTAssertEqual("007-001-002-006", record.getId())
    }

    func testGetNameReturnsNameSetInDictionary() {
        let record = RecordCall(rawRecord: self.jsonStructure)
        XCTAssertEqual("Record Name", record.getName())
    }

    func testGetDescriptionReturnsDescriptionSetInDictionary() {
        let record = RecordCall(rawRecord: self.jsonStructure)
        XCTAssertEqual("Shaken, not stirred", record.getDescription())
    }

    func testGetModuleReturnModuleSetInDictionary() {
        let record = RecordCall(rawRecord: self.jsonStructure)
        XCTAssertEqual("Calls", record.getModule())
    }

    func testGetModuleIconTextReturnsCl() {
        let record = RecordCall(rawRecord: self.jsonStructure)
        XCTAssertEqual("Cl", record.getModuleIconText())
    }
}
