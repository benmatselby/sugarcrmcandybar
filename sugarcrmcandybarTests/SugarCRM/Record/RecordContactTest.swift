//
//  RecordContactTest.swift
//  sugarcandybar
//
//  Created by Ben Selby on 22/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordContactTest: XCTestCase {

    let jsonStructure:JSON = [
        "id": "007-001-002-006",
        "first_name": "James",
        "last_name": "Bond",
        "description": "Shaken, not stirred",
        "_module": "Contacts",
    ]

    func testGetIdReturnsIdSetInDictionary() {
        let record = RecordContact(rawRecord: self.jsonStructure)
        XCTAssertEqual("007-001-002-006", record.getId())
    }

    func testGetNameReturnsNameSetInDictionary() {
        let record = RecordContact(rawRecord: self.jsonStructure)
        XCTAssertEqual("James Bond", record.getName())
    }

    func testGetDescriptionReturnsDescriptionSetInDictionary() {
        let record = RecordContact(rawRecord: self.jsonStructure)
        XCTAssertEqual("Shaken, not stirred", record.getDescription())
    }

    func testGetModuleReturnModuleSetInDictionary() {
        let record = RecordContact(rawRecord: self.jsonStructure)
        XCTAssertEqual("Contacts", record.getModule())
    }
}
