//
//  RecordViewAllTest.swift
//  sugarcrmcandybar
//
//  Created by Ben Selby on 18/11/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordViewAllTest: XCTestCase {

    let jsonStructure: JSON = [
        "id": "",
        "name": "View all records",
        "description": "View the search result in SugarCRM",
        "_module": "",
    ]

    func testInitSetsUpTheObject() {
        let record = RecordViewAll()
        XCTAssertEqual("View all records", record.getName())
        XCTAssertEqual("View the search result in SugarCRM", record.getDescription())
        XCTAssertEqual("", record.getModule())
        XCTAssertEqual("", record.getId())
    }

    func testGetUrlReturnsUrlBasedOnModuleAndId() {
        let record = RecordViewAll()
        record.setSearchTerm(term: "Unobtainium")
        XCTAssertEqual("#search/Unobtainium", record.getUrl())
    }
}
