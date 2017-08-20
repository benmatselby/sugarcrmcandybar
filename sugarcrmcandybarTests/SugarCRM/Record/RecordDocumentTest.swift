//
//  RecordDocumentTest.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 13/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordDocumentTest: XCTestCase {

    var jsonStructure:JSON = [
        "id": "007-001-002-006",
        "document_name": "Classified.doc",
        "description": "Top secret document",
        "_module": "Documents",
    ]

    func testGetIdReturnsIdSetInDictionary() {
        let record = RecordDocument(rawRecord: self.jsonStructure)
        XCTAssertEqual("007-001-002-006", record.getId())
    }

    func testGetNameReturnsNameSetInDictionary() {
        let record = RecordDocument(rawRecord: self.jsonStructure)
        XCTAssertEqual("Classified.doc", record.getName())
    }

    func testGetDescriptionReturnsDescriptionSetInDictionary() {
        let record = RecordDocument(rawRecord: self.jsonStructure)
        XCTAssertEqual("Top secret document", record.getDescription())
    }

    func testGetModuleReturnModuleSetInDictionary() {
        let record = RecordDocument(rawRecord: self.jsonStructure)
        XCTAssertEqual("Documents", record.getModule())
    }
}
