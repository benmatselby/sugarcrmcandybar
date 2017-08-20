//
//  RecordMapperTest.swift
//  sugarcandybar
//
//  Created by Ben Selby on 22/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import XCTest
@testable import sugarcrmcandybar

class RecordMapperTest: XCTestCase {
    func testGetRecordReturnsRecordContactIfModuleIsContacts() {
        let jsonStructure:JSON = [
            "_module": "Contacts"
        ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordContact", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordEmployeeIfModuleIsEmployees() {
        let jsonStructure:JSON = [
            "_module": "Employees",
        ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordEmployee", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordLeadIfModuleIsLeads() {
        let jsonStructure:JSON = [
            "_module": "Leads",
        ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordLead", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordDocumentIfModuleIsDocuments() {
        let jsonStructure:JSON = [
            "_module": "Documents",
            ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordDocument", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordCallIfModuleIsCalls() {
        let jsonStructure:JSON = [
            "_module": "Calls",
            ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordCall", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordCaseIfModuleIsCases() {
        let jsonStructure:JSON = [
            "_module": "Cases",
            ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordCase", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordEmailIfModuleIsEmails() {
        let jsonStructure:JSON = [
            "_module": "Emails",
            ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordEmail", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordNoteIfModuleIsNotes() {
        let jsonStructure:JSON = [
            "_module": "Notes",
            ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordNote", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordTaskIfModuleIsTasks() {
        let jsonStructure:JSON = [
            "_module": "Tasks",
            ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordTask", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordRevenueLineItemIfModuleIsRevenueLineItems() {
        let jsonStructure:JSON = [
            "_module": "RevenueLineItems",
            ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordRevenueLineItem", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordBaseIfNoOtherModuleIsMapped() {
        let jsonStructure:JSON = [
            "_module": "Accounts",
        ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordBase", String(describing: type(of: record)))
    }

    func testGetRecordReturnsRecordBaseIfNoModuleIsSetInJsonResponse() {
        let jsonStructure:JSON = [
            "id": "111",
        ]

        let record = RecordMapper().getRecord(record: jsonStructure)
        XCTAssertEqual("RecordBase", String(describing: type(of: record)))
    }
}
