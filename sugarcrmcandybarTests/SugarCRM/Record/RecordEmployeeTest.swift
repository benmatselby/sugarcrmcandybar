//
//  RecordEmployeeTest.swift
//  sugarcandybar
//
//  Created by Ben Selby on 22/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordEmployeeTest: XCTestCase {

    let jsonStructure: JSON = [
        "id": "007-001-002-006",
        "first_name": "Franz",
        "last_name": "Oberhauser",
        "description": "Cuckoo",
        "_module": "Employees",
    ]

    func testGetIdReturnsIdSetInDictionary() {
        let record = RecordEmployee(rawRecord: self.jsonStructure)
        XCTAssertEqual("007-001-002-006", record.getId())
    }

    func testGetNameReturnsNameSetInDictionary() {
        let record = RecordEmployee(rawRecord: self.jsonStructure)
        XCTAssertEqual("Franz Oberhauser", record.getName())
    }

    func testGetDescriptionReturnsDescriptionSetInDictionary() {
        let record = RecordEmployee(rawRecord: self.jsonStructure)
        XCTAssertEqual("Cuckoo", record.getDescription())
    }

    func testGetModuleReturnModuleSetInDictionary() {
        let record = RecordEmployee(rawRecord: self.jsonStructure)
        XCTAssertEqual("Employees", record.getModule())
    }
}
