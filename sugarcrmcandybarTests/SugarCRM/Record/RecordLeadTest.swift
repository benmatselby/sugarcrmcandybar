//
//  RecordLeadTest.swift
//  sugarcandybar
//
//  Created by Ben Selby on 22/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordLeadTest: XCTestCase {

    let jsonStructure: JSON = [
        "id": "007-001-002-006",
        "first_name": "Alec",
        "last_name": "Trevelyan",
        "description": "For England James?",
        "_module": "Contacts",
    ]

    func testGetIdReturnsIdSetInDictionary() {
        let record = RecordLead(rawRecord: self.jsonStructure)
        XCTAssertEqual("007-001-002-006", record.getId())
    }

    func testGetNameReturnsNameSetInDictionary() {
        let record = RecordLead(rawRecord: self.jsonStructure)
        XCTAssertEqual("Alec Trevelyan", record.getName())
    }

    func testGetDescriptionReturnsDescriptionSetInDictionary() {
        let record = RecordLead(rawRecord: self.jsonStructure)
        XCTAssertEqual("For England James?", record.getDescription())
    }

    func testGetModuleReturnModuleSetInDictionary() {
        let record = RecordLead(rawRecord: self.jsonStructure)
        XCTAssertEqual("Contacts", record.getModule())
    }
}
