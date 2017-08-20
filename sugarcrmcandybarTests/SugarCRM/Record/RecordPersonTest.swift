//
//  RecordPersonTest.swift
//  sugarcandybar
//
//  Created by Ben Selby on 22/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordPersonTest: XCTestCase {

    var jsonStructure:JSON = [
        "id": "007-001-002-006",
        "first_name": "Xenia",
        "last_name": "Onatopp",
        "description": "Xenia Sergeyevna Onatopp",
        "_module": "Irrelevant",
    ]

    func testGetIdReturnsIdSetInDictionary() {
        let record = RecordPerson(rawRecord: self.jsonStructure)
        XCTAssertEqual("007-001-002-006", record.getId())
    }

    func testGetNameReturnsNameSetInDictionary() {
        let record = RecordPerson(rawRecord: self.jsonStructure)
        XCTAssertEqual("Xenia Onatopp", record.getName())
    }

    func testGetDescriptionReturnsDescriptionSetInDictionary() {
        let record = RecordPerson(rawRecord: self.jsonStructure)
        XCTAssertEqual("Xenia Sergeyevna Onatopp", record.getDescription())
    }

    func testGetModuleReturnModuleSetInDictionary() {
        let record = RecordPerson(rawRecord: self.jsonStructure)
        XCTAssertEqual("Irrelevant", record.getModule())
    }

    func testGetNameReturnsJustLastNameIfNoFirstDefined() {
        let jsonStructure:JSON = [
            "id": "007-001-002-006",
            "last_name": "Onatopp",
            "description": "Xenia Sergeyevna Onatopp",
            "_module": "Irrelevant",
        ]

        let record = RecordPerson(rawRecord: jsonStructure)
        XCTAssertEqual("Onatopp", record.getName())
    }

    func testGetNameReturnsJustFirstNameIfNoLastDefined() {
        let jsonStructure:JSON = [
            "id": "007-001-002-006",
            "first_name": "Xenia",
            "description": "Xenia Sergeyevna Onatopp",
            "_module": "Irrelevant",
        ]

        let record = RecordPerson(rawRecord: jsonStructure)
        XCTAssertEqual("Xenia", record.getName())
    }

    func testGetNameReturnsUnknownIfNoNamesDefined() {
        let jsonStructure:JSON = [
            "_module": "Irrelevant",
        ]

        let record = RecordPerson(rawRecord: jsonStructure)
        XCTAssertEqual("Unknown", record.getName())
    }
}
