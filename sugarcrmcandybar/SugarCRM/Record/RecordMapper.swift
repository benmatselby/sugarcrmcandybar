//
//  RecordMapper.swift
//  sugarcandybar
//
//  Created by Ben Selby on 22/10/2016.
//  Copyright © 2016 Ben Selby. All rights reserved.
//

import Foundation

/**
    Responsible for taking a SugarCRM search record result and mapping
    it to a Record* class
 */
class RecordMapper {
    /**
     Responsible for mapping a raw result record to a RecordBase class or child

     - parameter record: This is the raw record from the SugarCRM system

     - returns: A RecordBase object which knows how to build a human readible version
    */
    func getRecord(record: JSON) -> RecordBase {
        var module = ""
        if (record["_module"].string != nil) {
            module = record["_module"].string!
        }

        switch module {
        case "Contacts":
            return RecordContact(rawRecord: record)
        case "Employees":
            return RecordEmployee(rawRecord: record)
        case "Leads":
            return RecordLead(rawRecord: record)
        case "Documents":
            return RecordDocument(rawRecord: record)
        case "Calls":
            return RecordCall(rawRecord: record)
        case "Cases":
            return RecordCase(rawRecord: record)
        case "Emails":
            return RecordEmail(rawRecord: record)
        case "Notes":
            return RecordNote(rawRecord: record)
        case "Tasks":
            return RecordTask(rawRecord: record)
        case "RevenueLineItems":
            return RecordRevenueLineItem(rawRecord: record)
        default:
            return RecordBase(rawRecord: record)
        }
    }
}
